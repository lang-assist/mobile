import 'package:assist_app/src/pages/content/quiz_builder.dart';
import 'package:assist_utils/assist_utils.dart';
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

  final Fragment$DetailedMaterial material;

  final Future<void> Function(Map<String, dynamic> answer) onSubmit;

  final OnValid onValid;

  final void Function()? onDontUnderstand;

  final bool showDontUnderstand;

  @override
  State<MaterialBuilder> createState() => _MaterialBuilderState();
}

class _MaterialBuilderState extends State<MaterialBuilder> {
  final valid = Signal<bool>(false);

  final answer = Signal<dynamic>(null);

  Enum$MaterialType get type => widget.material.details.type;

  @override
  Widget build(BuildContext context) {
    Widget child;

    switch (type) {
      case Enum$MaterialType.QUIZ:
        child = QuizBuilder(
          onAnswer: (answer) {
            this.answer.value = answer;
          },
          onValid: (valid) {
            this.valid.value = valid;
          },
          onSubmit: (answer) async {
            await widget.onSubmit(answer);
          },
          quiz: widget.material.details as Fragment$QuizDetails,
        );
      case Enum$MaterialType.CONVERSATION:
        child = ConversationBuilder(
          onSubmit: () async {
            await widget.onSubmit({"__END__": "__END__"});
          },
          material: widget.material,
          conversation: widget.material.details as Fragment$ConversationDetails,
        );
      default:
        child = Center(child: Text("Unimplemented content type: $type"));
    }

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          if (widget.showDontUnderstand)
            AppButton(
              variant: AppButtonVariant.text,
              onPressed: () {
                widget.onDontUnderstand?.call();
              },
              title: const Text("I don't understand"),
            ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
