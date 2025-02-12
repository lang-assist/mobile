import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/pages/content/quiz_builder.dart';
import 'package:assist_app/src/widgets/audio_player.dart';
import 'package:assist_app/src/widgets/components/item_picture.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:user_data/user_data.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.material});

  final MaterialController material;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  Fragment$StoryDetails get story =>
      widget.material.details as Fragment$StoryDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: responsive.pagePadding,
      child: Column(
        spacing: 8,
        children: [
          for (final part in story.parts)
            if (part.type == Enum$StoryPartType.PICTURE)
              ItemPicture(pictureId: part.pictureId!)
            else if (part.type == Enum$StoryPartType.AUDIO)
              Row(
                children: [
                  AudioPlayerWidget(audioId: part.audioId!),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      getTextFromSsml(part.ssml!),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            else if (part.type == Enum$StoryPartType.QUESTION)
              QuestionBuilder(
                onAnswer: (answer) {
                  print(answer);
                },
                aiFeedbacks: [],
                question: part.question!,
                onValid: (valid) {},
              ),
        ],
      ),
    );
  }
}
