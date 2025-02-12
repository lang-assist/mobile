import 'package:api/api.dart';
import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/widgets/audio_player.dart';
import 'package:assist_app/src/widgets/components/item_picture.dart';
import 'package:assist_app/src/widgets/components/term_text.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:user_data/user_data.dart';

class DocumentationBottomSheet extends StatefulWidget {
  const DocumentationBottomSheet({
    super.key,
    required this.title,
    required this.searchTerm,
  });

  final String title;
  final String searchTerm;

  static Future<void> show(
    BuildContext context,
    String title,
    String searchTerm,
  ) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder:
          (context) =>
              DocumentationBottomSheet(title: title, searchTerm: searchTerm),
    );
  }

  @override
  State<DocumentationBottomSheet> createState() =>
      _DocumentationBottomSheetState();
}

EdgeInsets get horPadding =>
    EdgeInsets.symmetric(horizontal: responsive.pagePadding.horizontal);

class _DocumentationBottomSheetState extends State<DocumentationBottomSheet> {
  Fragment$UserDoc? documentation;

  Future<void> fetch() async {
    final res = await Api.queries.documentation(
      Input$DocumentationInput(
        title: widget.title,
        searchTerm: widget.searchTerm,
        journeyId: journeyController.journey.id,
      ),
    );
    setState(() {
      documentation = res;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  Fragment$UserDocTemplate get template => documentation!.template;

  @override
  Widget build(BuildContext context) {
    if (documentation == null) {
      return Center(child: AIIndicator(size: 40));
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: responsive.pagePadding.vertical),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32,
          children: [
            SizedBox(height: 32),
            Padding(
              padding: horPadding,
              child: TermsText.fromString(
                template.title,
                style: typo.displaySmall,
              ),
            ),

            Padding(padding: horPadding, child: Text(template.description)),

            Column(
              spacing: 16,
              children: [
                for (var explanation in template.explanations)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsive.pagePadding.horizontal,
                    ),
                    child: DocumentationExplanation(explanation: explanation),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DocumentationExplanation extends StatelessWidget {
  const DocumentationExplanation({super.key, required this.explanation});

  final Fragment$UserDocExplanation explanation;

  @override
  Widget build(BuildContext context) {
    switch (explanation.type) {
      case Enum$UserDocExplanationType.text:
        return HtmlWidget("<html><body>${explanation.text}</body></html>");
      case Enum$UserDocExplanationType.picture:
        return ClipRRect(
          borderRadius: AppDimensions.borderRadiusMedium,
          child: ItemPicture(pictureId: explanation.pictureId!),
        );
      case Enum$UserDocExplanationType.audio:
        return Row(
          spacing: 16,
          children: [
            if (explanation.audioId != null)
              SizedBox(
                height: 40,
                child: AudioPlayerWidget(audioId: explanation.audioId!),
              ),
            Expanded(child: HtmlWidget(explanation.text ?? "")),
          ],
        );
      default:
        return Text(explanation.type.name);
    }
  }
}
