import 'dart:async';

import 'package:api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:gql_data/gql_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_flutter/sign_flutter.dart';

final journeyController = _JourneyController();

// enum AIModels {
//   gpt4oAssistant("gpt-4o-assistant"),
//   gpt4oMiniAssistant("gpt-4o-mini-assistant"),
//   gpt4o("gpt-4o"),
//   gptO1("gpt-o1"),
//   gptO1Mini("gpt-o1-mini"),
//   claudeSonnet("claude-sonnet"),
//   deepseekReasoner("DeepSeek-R1");

//   const AIModels(this.dbName);
//   final String dbName;
// }

class _JourneyController extends VoidSignal {
  _JourneyController._();
  static final _JourneyController _instance = _JourneyController._();
  factory _JourneyController() => _instance;

  bool _fetchingJourney = false;

  bool get fetchingJourney => _fetchingJourney;

  Fragment$Journey? _journey;

  Fragment$Journey get journey => _journey!;

  final SignalList<Fragment$Stage> stages = SignalList<Fragment$Stage>([]);

  final Signal<bool> fetchingStages = Signal(false);

  Fragment$PageInfo _stagesPageInfo = Fragment$PageInfo(hasNextPage: true);

  Input$PaginationInput _stagesPagination = Input$PaginationInput(
    limit: 10,
    sort: "createdAt:desc",
  );

  bool get hasMoreStages => _stagesPageInfo.hasNextPage;

  Future<void> fetchStages() async {
    if (!hasMoreStages) return;
    if (fetchingStages.value) return;
    fetchingStages.value = true;
    final res = await Api.queries.journeyStages(journey.id, _stagesPagination);
    stages.addAll(res.items);
    _stagesPageInfo = res.pageInfo;
    _stagesPagination = _stagesPagination.copyWith(
      cursor: _stagesPageInfo.nextCursor,
    );
    fetchingStages.value = false;
  }

  // PathController? _pathController;

  // PathController get pathController => _pathController!;

  bool _initialized = false;

  bool get initialized => _initialized;

  // void _setPath(Fragment$Stage path) {
  //   _pathController = PathController(path);
  //   emit();
  // }

  Future<void> setJourneyNormal(Fragment$Journey journey) async {
    final detailedJourney = await Api.queries.journey(journey.id);
    _journey = detailedJourney;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lastJourneyId", journey.id);
    // final activePaths =
    //     detailedJourney!.paths.where((path) => path.isActive).toList();

    // if (activePaths.isNotEmpty) {
    //   _setPath(activePaths.first);
    // }
    emit();
  }

  // Future<void> setJ(Fragment$DetailedJourney journey) async {
  //   _journey = journey;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString("lastJourneyId", journey.id);
  //   final activePaths = _journey!.paths.where((path) => path.isActive).toList();

  //   if (activePaths.isNotEmpty) {
  //     _setPath(activePaths.first);
  //   }
  //   emit();
  // }

  void setJourneyWithId(String id, {Completer? completer}) {
    _fetchingJourney = true;
    Api.queries.journey(id).then((journey) {
      _journey = journey;
      _fetchingJourney = false;
      completer?.complete();
      emit();
    });
  }

  bool get hasJourney => _journey != null;

  void clearJourney() {
    _journey = null;
    // _pathController = null;
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove("lastJourneyId");
    });
    emit();
  }

  Future<void> refresh() async {
    final journey = await Api.queries.journey(this.journey.id);
    _journey = journey;
    // if (journey!.paths.isNotEmpty) {
    //   _pathController = PathController(journey.paths.first);
    // }
    emit();
  }

  Future<void> init() async {
    if (_initialized) return;

    _initialized = true;
    try {
      final journey = await getLastJourney();
      if (journey != null) {
        await setJourneyNormal(journey);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      clearJourney();
    }
    emit();
  }

  Future<Fragment$Journey?> getLastJourney() async {
    final prefs = await SharedPreferences.getInstance();
    final lastJourneyId = prefs.getString("lastJourneyId");

    if (lastJourneyId == null) return null;

    try {
      final journey = await Api.queries.journey(lastJourneyId);
      return journey;
    } catch (e) {
      await prefs.remove("lastJourneyId");
      return null;
    }
  }

  Future<Fragment$Journey?> createJourney({
    required String to,
    required String from,
    required String name,
    required Avatar avatar,
    required String modelSetId,
    required String referenceText,
    required String? description,
    required String? introduction,
    required Uint8List? recording,
    required String? repating,
  }) async {
    String? audioId;
    if (recording != null) {
      audioId = await uploadAudio(recording, "audio/wav");
    }

    final journey = await Api.mutations.createJourney(
      CreateJourneyInput(
        input: Input$CreateJourneyInput(
          to: to,
          from: from,
          name: name,
          avatar: avatar.asHslInput!,
          modelSet: modelSetId,
          referenceText: referenceText,
          description: description,
          introduction: introduction,
          recording: audioId,
          repating: repating,
        ),
      ),
    );

    await setJourneyNormal(journey);

    return journey;
  }

  Future<Fragment$Material> waitMaterial(String id) async {
    final material = await Api.queries.detailedMaterial(id);

    return material;
  }
}
