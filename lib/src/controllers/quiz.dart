import 'package:flutter/cupertino.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class QuizController extends VoidSignal with Slot<void> {
  final List<Fragment$QuizQuestion> questions;
  final List<Fragment$AIFeedback> aiFeedbacks;
  final dynamic answer;

  QuizController({
    required this.questions,
    required this.aiFeedbacks,
    required this.answer,
  }) {
    _init();
  }

  final List<QuestionController> controllers = [];

  void _init() {
    for (final question in questions) {
      dynamic answer = this.answer?.answers;
      final aiFeedbacks =
          this.aiFeedbacks
              .where((feedback) => feedback.feedback.question == question.id)
              .toList();

      if (answer != null) {
        answer = answer[question.id];
      }

      final controller = QuestionController(
        question: question,
        aiFeedbacks: aiFeedbacks,
        existingAnswer: answer,
      );

      controller.addSlot(this);

      controllers.add(controller);
    }
  }

  void dispose() {
    for (final controller in controllers) {
      controller.removeSlot(this);
    }
  }

  late final Signal<String> currentQuestion = Signal<String>(
    controllers.first.question.id,
  );

  int get currentQuestionIndex => controllers.indexWhere(
    (question) => question.question.id == currentQuestion.value,
  );

  void lifecyleChange(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        for (final controller in controllers) {
          controller.stopActivity();
        }
        break;
      case AppLifecycleState.resumed:
        for (final controller in controllers) {
          controller.setActivity();
        }
        break;
      case AppLifecycleState.inactive:
        for (final controller in controllers) {
          controller.stopActivity();
        }
        break;
      case AppLifecycleState.hidden:
        for (final controller in controllers) {
          controller.stopActivity();
        }
        break;
      case AppLifecycleState.paused:
        for (final controller in controllers) {
          controller.stopActivity();
        }
        break;
    }
  }

  @override
  void onValue(void value) {}

  QuestionController get currentQuestionController =>
      controllers[currentQuestionIndex];

  void nextQuestion() {
    currentQuestion.value = controllers[currentQuestionIndex + 1].question.id;
  }

  void previousQuestion() {
    currentQuestion.value = controllers[currentQuestionIndex - 1].question.id;
  }

  bool get allIsValid => controllers.every((question) => question.valid);

  bool isQuestionValid(String questionId) =>
      controllers
          .firstWhere((question) => question.question.id == questionId)
          .valid;

  Map<String, dynamic> buildAnswer() {
    final answers =
        controllers
            .map((e) => MapEntry(e.question.id, e.buildAnswer()))
            .toList();

    return Map.fromEntries(answers);
  }
}

class QuestionController extends VoidSignal {
  final Fragment$QuizQuestion question;
  final List<Fragment$AIFeedback> aiFeedbacks;
  final dynamic existingAnswer;

  QuestionController({
    required this.question,
    required this.aiFeedbacks,
    this.existingAnswer,
  });

  final List<String> behaviors = [];

  void addBehavior(String behavior) {
    behaviors.add(behavior);
    setActivity();
  }

  DateTime? _lastActivity;
  Duration? _duration;

  void _calculateDuration() {
    if (_lastActivity == null) {
      _lastActivity = DateTime.now();
      return;
    }

    final now = DateTime.now();
    final add = now.difference(_lastActivity!);
    _duration = (_duration ?? Duration.zero) + add;
    _lastActivity = now;
  }

  void setActivity() {
    _calculateDuration();
  }

  void stopActivity() {
    _calculateDuration();
    _lastActivity = null;
  }

  bool _valid = false;

  bool get valid => _valid;

  set valid(bool value) {
    _valid = value;
    setActivity();
    emit();
  }

  dynamic _answer;

  dynamic get answer => _answer;

  set answer(dynamic value) {
    _answer = value;
    setActivity();
    emit();
  }

  Map<String, dynamic> buildAnswer() {
    return {
      "answer": _answer,
      "behaviors": behaviors,
      "answeredIn": (_duration ?? Duration.zero).inSeconds,
    };
  }
}
