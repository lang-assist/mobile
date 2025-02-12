import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:user_data/user_data.dart';

class AIFeedbackWidget extends StatefulWidget {
  const AIFeedbackWidget({super.key, required this.feedback});

  final Fragment$AIFeedback feedback;

  @override
  State<AIFeedbackWidget> createState() => _AIFeedbackWidgetState();
}

class _AIFeedbackWidgetState extends State<AIFeedbackWidget> {
  Fragment$AIFeedback get feedback => widget.feedback;

  Color get color => switch (feedback.feedback.type) {
    Enum$AIFeedbackType.EXPLANATION => AppColors.primary,
    Enum$AIFeedbackType.OTHER => AppColors.primary,
    Enum$AIFeedbackType.CORRECTION => AppColors.error,
    Enum$AIFeedbackType.RECOMMENDATION => AppColors.accent,
    Enum$AIFeedbackType.PRACTICE_TIP => AppColors.accent,
    Enum$AIFeedbackType.GENERAL_FEEDBACK => AppColors.primary,
    Enum$AIFeedbackType.$unknown => Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: AppDimensions.borderRadiusMedium,
        border: Border.all(color: color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppDimensions.spacing2,
        children: [
          Row(
            children: [
              Icon(switch (feedback.feedback.type) {
                Enum$AIFeedbackType.EXPLANATION => Icons.info,
                Enum$AIFeedbackType.OTHER => Icons.info,
                Enum$AIFeedbackType.CORRECTION => Icons.close,
                Enum$AIFeedbackType.RECOMMENDATION => Icons.check,
                Enum$AIFeedbackType.PRACTICE_TIP => Icons.lightbulb,
                Enum$AIFeedbackType.GENERAL_FEEDBACK => Icons.info,
                Enum$AIFeedbackType.$unknown => Icons.info,
              }, color: color),
              Text(feedback.feedback.type.name),
            ],
          ),
          for (var item in feedback.feedback.parts)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: AppDimensions.borderRadiusMedium,
                color: switch (item.type) {
                  Enum$AIFeedbackPartType.RIGHT => AppColors.accent,
                  Enum$AIFeedbackPartType.WRONG => AppColors.error,
                  Enum$AIFeedbackPartType.OTHER => AppColors.primary,
                  Enum$AIFeedbackPartType.TIP => AppColors.primary,
                  Enum$AIFeedbackPartType.EXPLANATION => AppColors.primary,
                  Enum$AIFeedbackPartType.$unknown => AppColors.primary,
                },
              ),
              child: Text(
                item.text,
                style: typo.bodyMedium.copyWith(color: AppColors.onPrimary),
              ),
            ),
        ],
      ),
    );
  }
}

class _Feedback extends StatefulWidget {
  const _Feedback({
    super.key,
    required this.icon,
    required this.color,
    required this.text,
  });

  final Widget icon;
  final Color color;
  final String text;

  @override
  State<_Feedback> createState() => __FeedbackState();
}

class __FeedbackState extends State<_Feedback> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [widget.icon, Text(widget.text)]),
    );
  }
}
