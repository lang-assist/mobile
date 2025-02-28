import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/pages/content/quiz_builder.dart';
import 'package:assist_app/src/pages/content/story_page.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

import 'conversation.dart';

typedef OnProgress = void Function(double progress);
typedef OnValid = void Function(bool valid);
typedef OnSubmit = Future<void> Function(Map<String, dynamic> answer);

class MaterialBuilder extends StatefulWidget {
  const MaterialBuilder({
    super.key,
    required this.material,
    required this.onSubmit,
    required this.onValid,
    this.showDontUnderstand = false,
    this.onDontUnderstand,
  });

  final MaterialController material;

  final Future<void> Function(Map<String, dynamic> answer) onSubmit;

  final OnValid onValid;

  final void Function()? onDontUnderstand;

  final bool showDontUnderstand;

  @override
  State<MaterialBuilder> createState() => _MaterialBuilderState();
}

class _MaterialBuilderState extends State<MaterialBuilder> with Slot {
  final valid = Signal<bool>(false);

  // final answer = Signal<dynamic>(null);

  Enum$MaterialType get type => widget.material.details.type;

  bool showDebugButtons = true;

  @override
  void onValue(value) {
    setState(() {});
  }

  @override
  void initState() {
    widget.material.addSlot(this);
    if (!widget.material.isDetailed) {
      widget.material.fetchDetailed();
    }
    super.initState();
  }

  @override
  void dispose() {
    widget.material.removeSlot(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.material.isDetailed) {
      return Center(child: AIIndicator());
    }

    Widget child;

    switch (type) {
      case Enum$MaterialType.QUIZ:
        child = QuizBuilder(
          onValid: (valid) {
            this.valid.value = valid;
          },
          onSubmit: (answer) async {
            await widget.onSubmit(answer);
          },
          material: widget.material,
          padding:
              ResponsiveConfig.of(context).pagePadding +
              EdgeInsets.only(
                top:
                    (widget.showDontUnderstand ||
                            (kDebugMode && showDebugButtons))
                        ? 24
                        : 0,
              ),
        );
      case Enum$MaterialType.CONVERSATION:
        child = ConversationBuilder(
          onSubmit: () async {
            await widget.onSubmit({"__END__": "__END__"});
          },
          material: widget.material,
        );
      case Enum$MaterialType.STORY:
        child = StoryPage(
          material: widget.material,
          onSubmit: (answer) async {
            await widget.onSubmit(answer);
          },
        );

      default:
        child = Center(child: Text("Unimplemented content type: $type"));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned.fill(child: child),
              if (widget.showDontUnderstand || (kDebugMode && showDebugButtons))
                Positioned(
                  top: 0,
                  right: 0,
                  child: PopupIconButton(
                    icon: Icon(Icons.info),
                    itemSpacing: 8,
                    position: PopupPosition.bottomCenter,
                    items: [
                      if (widget.showDontUnderstand)
                        AppButton(
                          onPressed: () {
                            widget.onDontUnderstand?.call();
                          },
                          title: const Text("I don't understand"),
                        ),
                      if (kDebugMode && showDebugButtons) ...[
                        AppButton(
                          onPressed: () async {
                            // await Api.mutations.prepareMaterial(widget.material.id);
                          },
                          title: const Text("Prepare Material"),
                        ),
                        AppButton(
                          onPressed: () async {
                            // await Api.mutations.regenerateMaterial(
                            //   widget.material.id,
                            // );
                          },
                          title: const Text("Regenerate Material"),
                        ),
                        AppButton(
                          onPressed: () async {
                            // await Api.mutations.resetJourney(
                            //   journeyController.journey.id,
                            // );
                          },
                          title: const Text("Reset Journey"),
                        ),
                        AppButton(
                          onPressed: () async {
                            // await Api.mutations.deleteTemp(1);
                          },
                          title: const Text("Delete Temp 1"),
                        ),
                        AppButton(
                          onPressed: () async {
                            // await Api.mutations.deleteTemp(2);
                          },
                          title: const Text("Delete Temp 2"),
                        ),
                        AppButton(
                          onPressed: () async {
                            // await Api.mutations.deleteTemp(3);
                          },
                          title: const Text("Delete Temp 3"),
                        ),
                      ],
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
