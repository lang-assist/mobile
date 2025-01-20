import 'dart:async';
import 'dart:collection';
import 'package:api/api.dart';
import 'package:http/http.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';
import 'package:just_audio/just_audio.dart';

enum ConversationState { none, waiting, active, done, error }

class AudioState extends Signal<bool> {
  final String audioId;
  String? error;
  final Completer<Uint8List?> completer;

  AudioState({required this.audioId, this.error, required this.completer})
    : super(true);
}

// Feed your own stream of bytes into the player
class BytesSource extends StreamAudioSource {
  final Uint8List bytes;
  BytesSource(this.bytes);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= bytes.length;
    return StreamAudioResponse(
      sourceLength: bytes.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(bytes.sublist(start, end)),
      contentType: 'audio/wav',
    );
  }
}

class ConversationController {
  final Fragment$DetailedMaterial material;

  ConversationController(this.material) {
    _listenPlayerState();
    if (material.turns.items.isNotEmpty) {
      for (final turn in material.turns.items) {
        _fetchAudio(turn: turn);
      }
    }
  }

  Fragment$ConversationDetails get conversation =>
      material.details as Fragment$ConversationDetails;

  late final SignalList<Fragment$ConversationTurn> turns = SignalList([
    ...material.turns.items.reversed,
  ]);

  late final AudioPlayer player = AudioPlayer();

  bool get isStarted =>
      turns.isNotEmpty ||
      state.value == ConversationState.active ||
      state.value == ConversationState.waiting;

  final Signal<String?> playingTurnId = Signal<String?>(null);

  bool get isPlaying => playingTurnId.value != null;

  int? get playingTurnIndex =>
      playingTurnId.value != null
          ? turns.indexWhere((turn) => turn.id == playingTurnId.value)
          : null;

  bool isTurnPlaying(String turnId) => playingTurnId.value == turnId;

  Future<void> playTurn(String turnId) async {
    try {
      playingTurnId.value = turnId;
      final turn = turns.firstWhere((turn) => turn.id == turnId);
      final id = turn.audio_ID;

      if (id != null) {
        final state = audioStates[turnId]!;
        if (state.error != null) {
          return;
        }
        final bytes = await state.completer.future;
        if (bytes == null) {
          return;
        }
        await player.setAudioSource(BytesSource(bytes));
      } else {
        _whenEndPlaying(turnId);
        return;
      }

      _onEndPlayingCompleter = Completer<void>();

      await player.play();

      await _onEndPlayingCompleter?.future;

      _whenEndPlaying(turnId);
    } catch (_) {}
  }

  // Signal<Duration> position = Signal<Duration>(Duration.zero);

  Signal<double> progress = Signal<double>(0);

  _listenPlayerState() {
    final subscription = player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        if (_onEndPlayingCompleter != null) {
          _onEndPlayingCompleter?.complete();
          _onEndPlayingCompleter = null;
        }
      }
    });
    final sub2 = player.positionStream.listen((position) {
      if (player.duration != null) {
        progress.value =
            position.inMilliseconds / player.duration!.inMilliseconds;
      }
    });
    subscription.onDone(() {
      subscription.cancel();
      sub2.cancel();
    });
  }

  Completer<void>? _onEndPlayingCompleter;

  void _whenEndPlaying(String turnId) {
    progress.value = 0;
    if (playingTurnId.value != turnId) {
      return;
    }

    playingTurnId.value = null;

    final index = turns.indexWhere((turn) => turn.id == turnId);
    if (index != -1) {
      if (index + 1 < turns.length) {
        final nextTurn = turns[index + 1];
        playTurn(nextTurn.id);
      } else {
        pauseTurn();
      }
    }
  }

  void pauseTurn() {
    playingTurnId.value = null;
    player.pause();
  }

  Stream<Fragment$ConversationUpdate>? _stream;

  StreamSubscription<Fragment$ConversationUpdate>? _subscription;

  Signal<ConversationState> state = Signal<ConversationState>(
    ConversationState.none,
  );

  Signal<Object?> error = Signal<Object?>(null);

  late bool _isCompleted = material.status == Enum$MaterialStatus.COMPLETED;

  bool get isCompleted => _isCompleted;

  Future<void> listen() async {
    print("LISTENING ${isCompleted} ${isEnded}");
    if (isCompleted || isEnded) {
      return;
    }

    if (_subscription != null) {
      return;
    }

    _stream = Api.subs.startConversation(material.id);

    final completer = Completer<void>();

    state.value = ConversationState.waiting;

    _subscription = _stream?.listen((event) {
      if (state.value == ConversationState.waiting) {
        state.value = ConversationState.active;
        print("STREAM LISTENING");
        completer.complete();
      }

      if (event.turn != null) {
        _addTurn(event.turn!);
      }
    });

    _subscription?.onDone(() {
      _unlisten();
      state.value = ConversationState.done;
      _isCompleted = true;
    });

    _subscription?.onError((error, stackTrace) {
      state.value = ConversationState.error;
      this.error.value = error;
      _isCompleted = true;
    });

    return completer.future;
  }

  void _unlisten() {
    _subscription?.cancel();
    _subscription = null;
    _stream = null;
  }

  final HashMap<String, AudioState> audioStates = HashMap<String, AudioState>();

  void dispose() {
    _unlisten();
    player.dispose();
    audioStates.clear();
  }

  String? get nextTurn => turns.lastOrNull?.nextTurn;

  bool get isUserTurn => nextTurn == "\$user";

  Future<void> send(String? text, Uint8List? audio) async {
    sending.value = true;
    if (_subscription == null) {
      await listen();
    }
    final turn = await Api.mutations.addConversationTurn(
      material.id,
      text,
      audio,
    );
    _addTurn(turn);
    sending.value = false;
  }

  void _fetchAudio({required Fragment$ConversationTurn turn}) {
    if (audioStates.containsKey(turn.id) && audioStates[turn.id] != null) {
      return;
    }

    final turnId = turn.id;

    if (turn.audio_ID == null) {
      audioStates[turnId] = AudioState(
        audioId: "",
        error: "No audio",
        completer: Completer<Uint8List?>.sync()..complete(null),
      );
      return;
    }

    final completer = Completer<Uint8List?>();

    audioStates[turnId] = AudioState(
      audioId: turn.audio_ID!,
      completer: completer,
    );
    audioStates[turnId]!.value = true;

    Future(() async {
      final url = audioIdToUrl(turn.audio_ID!);
      final response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        completer.complete(response.bodyBytes);
      } else {
        completer.complete(null);
        audioStates[turnId]!.error = "Failed to load audio";
      }
      audioStates[turnId]!.value = false;
    });
  }

  void _addTurn(Fragment$ConversationTurn turn) {
    _fetchAudio(turn: turn);

    turns.add(turn);

    if (!isPlaying && turn.character != "\$user") {
      playTurn(turn.id);
    }
  }

  bool get waitingAI {
    final lastTurn = turns.lastOrNull;
    if (lastTurn == null) {
      if (state.value == ConversationState.waiting ||
          state.value == ConversationState.active) {
        return true;
      }
      return false;
    }

    if (lastTurn.character == "\$user") {
      return true;
    }

    if (lastTurn.nextTurn == "\$user") {
      return false;
    }
    if (lastTurn.nextTurn == null) {
      return false;
    }
    return true;
  }

  bool get isEnded {
    final lastTurn = turns.lastOrNull;
    if (lastTurn == null) {
      return false;
    }
    if (lastTurn.character == "\$user") {
      return false;
    }
    return lastTurn.nextTurn == null;
  }

  Signal<bool> sending = Signal<bool>(false);
}
