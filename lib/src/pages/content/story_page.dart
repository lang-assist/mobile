import 'dart:async';

import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/controllers/quiz.dart';
import 'package:assist_app/src/pages/content/quiz_builder.dart';
import 'package:assist_app/src/widgets/audio_player.dart';
import 'package:assist_app/src/widgets/components/item_picture.dart';
import 'package:flutter/material.dart';
import 'package:gql_data/gql_data.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.material, required this.onSubmit});

  final MaterialController material;
  final Function(Map<String, dynamic>) onSubmit;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> with TickerProviderStateMixin {
  Fragment$StoryDetails get story =>
      widget.material.details as Fragment$StoryDetails;

  // Current visible parts index
  int _currentPartIndex = 0;
  List<Fragment$StoryPart> get _visibleParts =>
      story.parts.sublist(0, _currentPartIndex + 1);

  // ScrollController for auto-scrolling
  late final ScrollController _scrollController;

  // Timer for picture parts
  Timer? _pictureTimer;

  // Map to track animation controllers for each part
  final Map<int, AnimationController> _animationControllers = {};

  // Global keys for each part widget
  final Map<int, GlobalKey> _partKeys = {};

  late final quizController = QuizController(
    questions:
        story.parts
            .where((part) => part.type == Enum$StoryPartType.QUESTION)
            .map((part) => part.question!)
            .toList(),
    aiFeedbacks: widget.material.feedbacks,
    answer: widget.material.userAnswer,
  );

  @override
  void initState() {
    super.initState();

    // Initialize scroll controller
    _scrollController = ScrollController();

    // Show first part
    if (story.parts.isNotEmpty) {
      setState(() {
        _currentPartIndex = 0;
      });

      // If first part is a picture, start timer
      _handlePartDisplay(story.parts[0]);
    }
  }

  @override
  void dispose() {
    _pictureTimer?.cancel();
    _scrollController.dispose();

    // Dispose all animation controllers
    for (final controller in _animationControllers.values) {
      controller.dispose();
    }

    super.dispose();
  }

  void _handlePartDisplay(Fragment$StoryPart part) {
    switch (part.type) {
      case Enum$StoryPartType.PICTURE:
        _pictureTimer?.cancel();
        _pictureTimer = Timer(const Duration(milliseconds: 3), () {
          _showNextPart();
        });
        break;
      case Enum$StoryPartType.AUDIO:
        // Audio will be auto-played and will call _showNextPart when complete
        break;
      case Enum$StoryPartType.QUESTION:
        // Question will call _onValidAnswer when answered
        break;
      case Enum$StoryPartType.NARRATIVE:
        // Narrative will call _showNextPart when complete
        break;
      case Enum$StoryPartType.$unknown:
      // For any other type, show next part after a short delay
    }
  }

  // Get a global key for a specific part index
  GlobalKey _getKeyForPart(int index) {
    if (!_partKeys.containsKey(index)) {
      _partKeys[index] = GlobalKey(debugLabel: 'part_$index');
    }
    return _partKeys[index]!;
  }

  // Scroll to center the widget with the given key
  void _scrollToCenter(GlobalKey key) {
    if (!_scrollController.hasClients) return;

    // Delay to ensure the widget is built and positioned
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!_scrollController.hasClients) return;

      final context = key.currentContext;
      if (context == null) return;
      if (!context.mounted) return;
      // Get the render box of the widget
      final RenderBox box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);

      // Calculate the center position
      final screenHeight = MediaQuery.of(context).size.height;
      final widgetHeight = box.size.height;
      final scrollPosition = _scrollController.position.pixels;

      // Calculate target position to center the widget
      final targetPosition =
          scrollPosition +
          position.dy -
          (screenHeight / 2) +
          (widgetHeight / 2);

      // Ensure we don't scroll beyond content
      final maxScroll = _scrollController.position.maxScrollExtent;
      final targetScroll = targetPosition.clamp(0.0, maxScroll);

      _scrollController.animateTo(
        targetScroll,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    });
  }

  void _showNextPart() {
    if (_currentPartIndex < story.parts.length - 1) {
      final nextIndex = _currentPartIndex + 1;
      final nextPart = story.parts[nextIndex];

      setState(() {
        _currentPartIndex = nextIndex;
      });

      // Handle the newly displayed part
      _handlePartDisplay(nextPart);

      // Scroll to the newly added part after a short delay to allow rendering
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Get the key for the new part
        final key = _getKeyForPart(nextIndex);

        // For images, use a longer delay to ensure they're loaded
        if (nextPart.type == Enum$StoryPartType.PICTURE) {
          Future.delayed(const Duration(milliseconds: 400), () {
            _scrollToCenter(key);
          });
        } else {
          Future.delayed(const Duration(milliseconds: 100), () {
            _scrollToCenter(key);
          });
        }
      });
    } else {
      widget.onSubmit(quizController.buildAnswer());
    }
  }

  // Get animation controller for a specific part index
  AnimationController _getAnimationController(int index) {
    if (!_animationControllers.containsKey(index)) {
      _animationControllers[index] = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 800),
      );

      // Start the animation if it's a new controller
      _animationControllers[index]!.forward();
    }

    return _animationControllers[index]!;
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(
      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: responsive.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (int i = 0; i < _visibleParts.length; i++) ...[
              if (i > 0) const SizedBox(height: 16),
              _buildAnimatedPartWidget(
                _visibleParts[i],
                i == _currentPartIndex,
                i,
              ),
            ],
            AppButton(
              onPressed: (_) {
                if (_currentPartIndex == story.parts.length - 1) {
                  widget.onSubmit(quizController.buildAnswer());
                } else {
                  setState(() {
                    _currentPartIndex = story.parts.length - 1;
                  });
                }
              },
              title: const Text("Open All"),
              variant: AppButtonVariant.primary,
              size: AppSizeVariant.large,
            ),
            // Add extra space at the bottom for better scrolling
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedPartWidget(
    Fragment$StoryPart part,
    bool isLatest,
    int index,
  ) {
    final animationController = _getAnimationController(index);
    final key = _getKeyForPart(index);

    return FadeTransition(
      key: key,
      opacity: animationController.drive(CurveTween(curve: Curves.easeIn)),
      child: SlideTransition(
        position: animationController.drive(
          Tween<Offset>(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeOut)),
        ),
        child: _buildPartWidget(part, isLatest),
      ),
    );
  }

  Widget _buildPartWidget(Fragment$StoryPart part, bool isLatest) {
    switch (part.type) {
      case Enum$StoryPartType.PICTURE:
        return AppCard(
          padding: EdgeInsets.zero,
          scaleOnHover: false,
          isInteractive: false,
          color: AppColors.surface,
          title: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: ItemPicture(pictureId: part.pictureId!),
          ),
        );

      case Enum$StoryPartType.AUDIO:
        return AudioPlayerWidget(
          audioId: part.audioId!,
          autoPlay: isLatest, // Auto play if it's the latest part
          onComplete:
              isLatest
                  ? _showNextPart
                  : null, // Only move to next if it's the latest
          horizontalExpanded: true,
          showProgressBar: true,
          color: AppColors.primary,
          backgroundColor: AppColors.surface,
        );

      case Enum$StoryPartType.QUESTION:
        final questionId = part.question!.id;
        final isLastQuestion = _isLastQuestion(part);

        final controller = quizController.controllers.firstWhere(
          (controller) => controller.question.id == questionId,
        );

        return controller.builder((_) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppCard(
                  isInteractive: false,
                  scaleOnHover: false,
                  padding: responsive.containerPadding,
                  color: AppColors.surface,
                  title: QuestionBuilder(
                    controller: quizController.controllers.firstWhere(
                      (controller) => controller.question.id == questionId,
                    ),
                  ),
                ),
                if (controller.valid.value && isLatest) ...[
                  const SizedBox(height: 16),
                  AppButton(
                    onPressed: (_) => _showNextPart(),
                    variant: AppButtonVariant.primary,
                    size: AppSizeVariant.large,
                    title: Text(isLastQuestion ? 'Submit' : 'Next'),
                  ),
                ],
              ],
            ),
          );
        });

      default:
        return const SizedBox.shrink();
    }
  }

  // Check if this is the last question in the story
  bool _isLastQuestion(Fragment$StoryPart part) {
    if (part.type != Enum$StoryPartType.QUESTION) return false;

    // Find the index of this part
    final index = story.parts.indexWhere(
      (p) =>
          p.type == Enum$StoryPartType.QUESTION &&
          p.question!.id == part.question!.id,
    );

    if (index == -1) return false;

    // Check if there are any more questions after this one
    for (int i = index + 1; i < story.parts.length; i++) {
      if (story.parts[i].type == Enum$StoryPartType.QUESTION) {
        return false;
      }
    }

    return true;
  }
}
