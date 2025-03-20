import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_app/src/scaffolds/app_scaffold.dart';
import 'package:assist_app/src/widgets/audio_player.dart';
import 'package:assist_app/src/widgets/components/item_picture.dart';
import 'package:assist_app/src/widgets/components/term_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:go_router/go_router.dart';
import 'package:gql_data/gql_data.dart';
import 'package:utils/utils.dart';

class JourneyDocsPage extends StatefulWidget {
  const JourneyDocsPage({super.key});

  @override
  State<JourneyDocsPage> createState() => _JourneyDocsPageState();
}

class _JourneyDocsPageState extends State<JourneyDocsPage> {
  @override
  Widget build(BuildContext context) {
    return UserScaffold(
      title: "Journey Docs",
      body: PaginationList(
        padding: responsive.pagePadding,
        options: JourneyDocsPaginationOptions(journeyController.journey.id),
        itemBuilder:
            (item) => AppCard(
              title: Text(item.template.title),
              subtitle: Text(
                item.template.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                context.doc(item);
              },
            ),
        separatorBuilder: (_, __) => const SizedBox(height: 16),
      ),
    );
  }
}

class DocumentationPage extends StatefulWidget {
  const DocumentationPage({super.key});

  @override
  State<DocumentationPage> createState() => _DocumentationPageState();
}

class _DocumentationPageState extends State<DocumentationPage> {
  @override
  Widget build(BuildContext context) {
    final documentation = context.parameterValueByName("documentation");
    return DocumentationContent.fromExisting(documentation);
  }
}

class DocumentationContent extends StatefulWidget {
  const DocumentationContent._({
    super.key,
    this.title,
    this.searchTerm,
    this.documentation,
  });

  final String? title;
  final String? searchTerm;
  final Fragment$UserDoc? documentation;

  const DocumentationContent.fromExisting(
    Fragment$UserDoc documentation, {
    Key? key,
  }) : this._(key: key, documentation: documentation);

  const DocumentationContent.fromNew(
    String title,
    String searchTerm, {
    Key? key,
  }) : this._(key: key, title: title, searchTerm: searchTerm);

  static Future<void> showAsBottomSheet(
    BuildContext context,
    String title,
    String searchTerm,
  ) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      builder: (context) => DocumentationContent.fromNew(title, searchTerm),
    );
  }

  @override
  State<DocumentationContent> createState() => _DocumentationContentState();
}

EdgeInsets get horPadding =>
    EdgeInsets.symmetric(horizontal: responsive.pagePadding.horizontal);

class _DocumentationContentState extends State<DocumentationContent> {
  Fragment$UserDoc? documentation;

  Future<void> fetch() async {
    final res = await Api.queries.documentation(
      Input$DocumentationInput(
        title: widget.title!,
        searchTerm: widget.searchTerm!,
        journeyId: journeyController.journey.id,
      ),
    );
    setState(() {
      documentation = res;
    });
  }

  @override
  void initState() {
    if (widget.documentation != null) {
      documentation = widget.documentation;
    } else {
      fetch();
    }

    super.initState();
  }

  Fragment$UserDocTemplate get template => documentation!.template;

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (documentation == null) {
      child = Center(child: AIIndicator(size: 40));
    } else {
      child = SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: responsive.pagePadding.vertical,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.documentation == null) ...[
                    AppButton(
                      variant: AppButtonVariant.icon,
                      onPressed: (_) {
                        context.doc(documentation!);
                      },
                      title: Icon(Icons.data_exploration_rounded),
                    ),
                    AppButton(
                      variant: AppButtonVariant.icon,
                      onPressed: (_) {
                        Navigator.pop(context);
                      },
                      title: Icon(Icons.close),
                    ),
                  ],
                ],
              ),
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

    if (widget.documentation == null) {
      return child;
    }

    return AppScaffold(
      onBackPressed: () {
        context.pop();
      },
      title: documentation!.template.title,
      body: child,
    );
  }
}

class DocumentationExplanation extends StatefulWidget {
  const DocumentationExplanation({super.key, required this.explanation});

  final Fragment$UserDocExplanation explanation;

  @override
  State<DocumentationExplanation> createState() =>
      _DocumentationExplanationState();
}

class _DocumentationExplanationState extends State<DocumentationExplanation> {
  @override
  Widget build(BuildContext context) {
    switch (widget.explanation.type) {
      case Enum$UserDocExplanationType.text:
        return CustomHtmlWidget(html: widget.explanation.text ?? "");
      case Enum$UserDocExplanationType.picture:
        return ClipRRect(
          borderRadius: AppSpacing.borderRadiusMedium,
          child: ItemPicture(pictureId: widget.explanation.pictureId!),
        );
      case Enum$UserDocExplanationType.audio:
        return Row(
          spacing: 16,
          children: [
            if (widget.explanation.audioId != null)
              AudioPlayerWidget(audioId: widget.explanation.audioId!),
            Expanded(
              child: CustomHtmlWidget(html: widget.explanation.text ?? ""),
            ),
          ],
        );
      default:
        return Text(widget.explanation.type.name);
    }
  }
}

class CustomHtmlWidget extends StatefulWidget {
  const CustomHtmlWidget({super.key, required this.html});

  final String html;

  @override
  State<CustomHtmlWidget> createState() => _CustomHtmlWidgetState();
}

class _CustomHtmlWidgetState extends State<CustomHtmlWidget> {
  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      selectionControls: materialTextSelectionHandleControls,
      contextMenuBuilder: (ctx, details) {
        final renderBox = context.findRenderObject() as RenderBox?;
        if (renderBox == null) {
          return Container();
        }

        final anchors = TextSelectionToolbarAnchors.fromSelection(
          renderBox: renderBox,
          startGlyphHeight: details.startGlyphHeight,
          endGlyphHeight: details.endGlyphHeight,
          selectionEndpoints: details.selectionEndpoints,
        );

        return TextSelectionToolbar(
          anchorAbove: anchors.primaryAnchor,
          anchorBelow: anchors.secondaryAnchor ?? anchors.primaryAnchor,
          children: [
            AppButton(
              variant: AppButtonVariant.icon,
              onPressed: (_) {
                details.hideToolbar();
              },
              title: Icon(Icons.copy),
            ),
          ],
        );
      },
      onSelectionChanged: (details) {},
      child: HtmlWidget(
        "<html><body>${widget.html}</body></html>",
        customWidgetBuilder: (t) {
          // if (t.innerHtml.isNotEmpty && t.children.isEmpty) {
          //   if (t.localName == "table" ||
          //       t.localName == "tbody" ||
          //       t.localName == "tr" ||
          //       t.localName == "td") {
          //     print(t.innerHtml);
          //   }
          //   return TermsText(LinguisticUnitSet.unresolved(t.innerHtml));
          // }

          return null;
        },
      ),
    );
  }
}
