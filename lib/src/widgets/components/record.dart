import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({
    super.key,
    this.maxDuration,
    this.minDuration,
    required this.onRecordComplete,
  });

  final Duration? maxDuration;
  final Duration? minDuration;
  final void Function(String path) onRecordComplete;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget>
    with SingleTickerProviderStateMixin {
  final _audioRecorder = AudioRecorder();
  bool _isRecording = false;
  String? _path;
  DateTime? _startTime;

  late final AnimationController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: widget.maxDuration ?? const Duration(minutes: 1),
    );

    _initRecorder();
  }

  Future<void> _initRecorder() async {
    final hasPermission = await _audioRecorder.hasPermission();
    if (!hasPermission) {
      throw Exception('Microphone permission not granted');
    }
  }

  Future<void> _startRecording() async {
    try {
      final tempDir = await getTemporaryDirectory();
      _path =
          '${tempDir.path}/record_${DateTime.now().millisecondsSinceEpoch}.wav';

      await _audioRecorder.start(
        RecordConfig(
          encoder: AudioEncoder.wav,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _path!,
      );

      setState(() {
        _isRecording = true;
        _startTime = DateTime.now();
      });

      _progressController.forward();
      HapticFeedback.heavyImpact();
    } catch (e) {
      print('Error starting recording: $e');
    }
  }

  Future<void> _stopRecording() async {
    try {
      final path = await _audioRecorder.stop();
      final now = DateTime.now();
      final duration = now.difference(_startTime!);

      setState(() {
        _isRecording = false;
        _startTime = null;
      });

      _progressController.reset();

      if (path != null) {
        if (widget.minDuration != null && duration < widget.minDuration!) {
          // Delete the file if recording is too short
          File(path).deleteSync();
          return;
        }
        widget.onRecordComplete(path);
      }
    } catch (e) {
      print('Error stopping recording: $e');
    }
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTapDown: (_) => _startRecording(),
        onTapUp: (_) => _stopRecording(),
        onTapCancel: _stopRecording,
        child: AnimatedBuilder(
          animation: _progressController,
          builder: (context, child) {
            return Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isRecording ? Colors.red : Colors.blue,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (_isRecording)
                    CircularProgressIndicator(
                      value: _progressController.value,
                      valueColor: const AlwaysStoppedAnimation(Colors.white),
                      strokeWidth: 4,
                    ),
                  Center(
                    child: Icon(
                      _isRecording ? Icons.mic : Icons.mic_none,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
