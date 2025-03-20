import 'dart:async';
import 'dart:math';
import 'package:assist_app/src/utils/audio_fetch/audio_fetch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:utils/utils.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({
    super.key,
    this.maxDuration,
    this.minDuration,
    required this.onRecordComplete,
    this.onRecordCancel,
    this.record,
    this.onRecordStart,
    this.onAmplitudeChanged,
    this.onCancellingStateChanged,
    this.size = 80,
    this.filled = false,
  });

  final Duration? maxDuration;
  final Duration? minDuration;
  final double size;
  final void Function(Uint8List? data) onRecordComplete;
  final void Function(bool cancelling)? onCancellingStateChanged;
  final void Function()? onRecordCancel;
  final void Function()? onRecordStart;
  final void Function(Amplitude)? onAmplitudeChanged;

  final AudioRecorder? record;
  final bool filled;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget>
    with SingleTickerProviderStateMixin {
  late AudioRecorder recorder = widget.record ?? AudioRecorder();

  StreamSubscription<Amplitude>? _subscription;

  bool cancelling = false;
  bool recording = false;

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    final hasPermission = await recorder.hasPermission();
    if (!hasPermission) {
      throw Exception('Microphone permission not granted');
    }
  }

  setCancelling(bool cancelling) {
    this.cancelling = cancelling;
    widget.onCancellingStateChanged?.call(cancelling);
  }

  setRecording(bool recording) {
    this.recording = recording;
    widget.onRecordStart?.call();
  }

  Future<Uint8List?> stopRecording() async {
    final path = await recorder.stop();

    setRecording(false);
    setCancelling(false);
    setState(() {});

    _subscription?.cancel();
    _subscription = null;

    if (path == null) {
      return null;
    }

    Uint8List buffer;

    buffer = await fetchAudio(path);

    widget.onRecordComplete(buffer);

    return buffer;

    // if (res == null) {
    //   throw Exception("Recording failed");
    // }

    // if (kIsWeb) {
    //   final blobRes = await get(Uri.parse(res));
    //   if (blobRes.statusCode != 200) {
    //     throw Exception("Recording failed: ${blobRes.statusCode}");
    //   }
    //   print("Recording blob: ${blobRes.bodyBytes.length}");
    //   return blobRes.bodyBytes;
    // } else {
    //   final path = (await getTemporaryDirectory()).path;
    //   final p = "$path/$res";
    //   throw Exception("Recording failed: $p");
    // }
  }

  Future<void> startRecording() async {
    if (await recorder.isRecording()) {
      await cancelRecording();
    }

    setRecording(true);
    setCancelling(false);
    widget.onRecordStart?.call();
    setState(() {});

    if (widget.onAmplitudeChanged != null) {
      _subscription = recorder
          .onAmplitudeChanged(Duration(milliseconds: 16))
          .listen((amplitude) {
            widget.onAmplitudeChanged?.call(amplitude);
          });
    }

    String path;

    if (kIsWeb) {
      path = "";
    } else {
      path =
          "${(await getTemporaryDirectory()).path}/${Random().nextInt(1000000)}.wav";
    }

    recorder.start(
      RecordConfig(
        encoder: AudioEncoder.wav,
        sampleRate: 16000,
        numChannels: 1,
      ),
      path: path,
    );

    setState(() {});
  }

  Future<void> cancelRecording() async {
    setRecording(false);
    setCancelling(false);
    widget.onRecordCancel?.call();
    setState(() {});
    if (await recorder.isRecording()) {
      await recorder.stop();
    }

    _subscription?.cancel();
    _subscription = null;
  }

  @override
  void dispose() {
    recorder.dispose();
    if (_subscription != null) {
      _subscription?.cancel();
      _subscription = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppButton(
        onPressed: (_) {},
        customBackgroundDecoration:
            widget.filled
                ? BoxDecoration(
                  borderRadius: BorderRadius.circular(800),
                  color: AppColors.primary,
                )
                : null,
        variant:
            widget.filled ? AppButtonVariant.primary : AppButtonVariant.text,
        size: AppSizeVariant.large,
        onTapUp: (details) async {
          cancelRecording();
        },

        onTapDown: (details) async {
          startRecording();
        },
        onTapCancel: () {
          if (cancelling) {
            cancelRecording();
          } else {
            stopRecording();
          }
        },
        onCancelling: (cancelling) {
          this.cancelling = cancelling;
        },
        title:
            recording
                ? cancelling
                    ? Icon(Icons.cabin, size: widget.size)
                    : Icon(Icons.stop, size: widget.size)
                : Icon(Icons.mic, size: widget.size),
      ),
    );
  }
}
