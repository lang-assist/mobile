import 'package:api/api.dart';
import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/pages/content/conversation.dart';
import 'package:assist_app/src/pages/content/material_builder.dart';
import 'package:assist_app/src/widgets/audio_player.dart';
import 'package:assist_app/src/widgets/components/feedback.dart';
import 'package:assist_app/src/widgets/components/item_picture.dart';
import 'package:assist_app/src/widgets/components/record.dart';
import 'package:assist_app/src/widgets/components/term_text.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class QuizBuilder extends StatefulWidget {
  const QuizBuilder({
    super.key,
    required this.material,
    required this.onAnswer,
    required this.onValid,
    required this.onSubmit,
    this.padding = EdgeInsets.zero,
  });

  final MaterialController material;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final OnSubmit onSubmit;

  final EdgeInsets padding;

  @override
  State<QuizBuilder> createState() => _QuizBuilderState();
}

typedef OnAnswer = void Function(dynamic answer);

typedef OnValid = void Function(bool valid);

typedef QuizBuilderConstructor =
    Widget Function({
      Key? key,
      required Fragment$QuizQuestion question,
      required OnAnswer onAnswer,
      required OnValid onValid,
      required List<Fragment$AIFeedback> aiFeedbacks,
      dynamic answer,
      EdgeInsets? padding,
    });

class _QuizBuilderState extends State<QuizBuilder> {
  final pageController = PageController();
  final currentQuestion = Signal<int>(0);

  Fragment$QuizDetails get quiz =>
      widget.material.details as Fragment$QuizDetails;

  @override
  void initState() {
    validStates.value = List.generate(
      quiz.questions.length,
      (_) => false || widget.material.userAnswer != null,
    );
    answers.value = {};
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final answers = SignalMap<String, dynamic>({});

  final validStates = SignalList<bool>([]);

  OnAnswer onAnswer(int index) {
    final q = quiz.questions[index];
    return (answer) {
      answers[q.id] = answer;
    };
  }

  OnValid onValid(int index) {
    return (valid) {
      validStates[index] = valid;
    };
  }

  List<Fragment$AIFeedback> aiFeedbacks(Fragment$QuizQuestion question) =>
      widget.material.feedbacks
          .where((e) => e.feedback.question == question.id)
          .toList();


  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    for (var i = 0; i < quiz.questions.length; i++) {
      final question = quiz.questions[i];
      final key = ValueKey("${quiz.hashCode}-${question.hashCode}");
      final aiFeedbacks = this.aiFeedbacks(question);

      children.add(
        QuestionBuilder(
          key: key,
          question: question,
          onAnswer: onAnswer(i),
          onValid: onValid(i),
          aiFeedbacks: aiFeedbacks,
          answer: widget.material.userAnswer?.answers[question.id],
          padding: widget.padding,
        ),
      );

    }

    for (var i = 0; i < quiz.questions.length; i++) {
      final q = quiz.questions[i];

      children[i] = AppForm(
        readOnly: widget.material.userAnswer != null,
        child: SingleChildScrollView(
          child: Column(
            children: [

              if (q.preludeID != null && q.preludeID!.isNotEmpty)
                Builder(
                  builder: (context) {
                    final preludeIndex = quiz.preludes!.indexWhere(
                      (e) => e.id == q.preludeID,
                    );

                    if (preludeIndex == -1) {
                      return const SizedBox.shrink();
                    }

                    final prelude = quiz.preludes![preludeIndex];

                    return Padding(
                      padding: ResponsiveConfig.of(context).pagePadding,
                      child: Column(
                        children: [
                          for (var part in prelude.parts)
                            if (part.type == Enum$QuizPreludeItemType.STORY)
                              TermsText(part.content!)
                            else if (part.type ==
                                Enum$QuizPreludeItemType.PICTURE)
                              SizedBox(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: AspectRatio(
                                    aspectRatio: 4 / 3,
                                    child: FadeInImage(
                                      fit: BoxFit.cover,
                                      placeholder: MemoryImage(Uint8List(0)),
                                      imageErrorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      placeholderErrorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      },
                                      image: itemPictureProvider(
                                        part.pictureId!,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            else if (part.type ==
                                Enum$QuizPreludeItemType.AUDIO)
                              AudioPlayerWidget(audioId: part.audioId!),
                        ],
                      ),
                    );
                  },
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: children[i]),
              ),
              if (aiFeedbacks(q).isNotEmpty) ...[
                for (var feedback in aiFeedbacks(q))
                  AIFeedbackWidget(feedback: feedback),
                SizedBox(height: 60),
              ],
            ],
          ),
        ),
      );
    }

    final pagePadding = ResponsiveConfig.of(context).pagePadding;

    return Stack(
      children: [
        Positioned.fill(
          top: 0,
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              currentQuestion.value = index;
            },
            children: children,
          ),
        ),
        MultiSignal([validStates, currentQuestion]).builder((_) {
          return Positioned(
            bottom: pagePadding.bottom,
            left: pagePadding.left,
            right: pagePadding.right,
            child: AppButton(
              isActive: validStates[currentQuestion.value],
              onPressed: () async {
                if (currentQuestion.value == validStates.value.length - 1) {
                  await widget.onSubmit(answers.value);
                } else {
                  pageController.nextPage(
                    duration: animationDuration,
                    curve: Curves.easeInOut,
                  );
                }
              },
              title: Text(
                currentQuestion.value == validStates.value.length - 1
                    ? "Submit"
                    : "Next",
              ),
            ),
          );
        }),
      ],
    );
  }
}

class QuestionBuilder extends StatefulWidget {
  const QuestionBuilder({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    required this.aiFeedbacks,
    this.answer,
    this.padding,
  });

  final Fragment$QuizQuestion question;
  final OnAnswer onAnswer;
  final OnValid onValid;
  final List<Fragment$AIFeedback> aiFeedbacks;
  final dynamic answer;
  final EdgeInsets? padding;

  @override
  State<QuestionBuilder> createState() => _QuestionBuilderState();
}

class _QuestionBuilderState extends State<QuestionBuilder> {
  static final Map<Enum$QuizQuestionType, QuizBuilderConstructor> constructors =
      {
        Enum$QuizQuestionType.TRUE_FALSE: _TrueFalseQuestion.new,
        Enum$QuizQuestionType.MATCHING: _MatchingQuestion.new,
        Enum$QuizQuestionType.MULTIPLE_CHOICE: _MultiChoiceQuestion.new,
        Enum$QuizQuestionType.FILL_WRITE: _FillWriteQuestion.new,
        Enum$QuizQuestionType.FILL_CHOICE: _FillWriteQuestion.new,
        Enum$QuizQuestionType.ORDERING: _OrderingQuestion.new,
        Enum$QuizQuestionType.TEXT_INPUT_WRITE: _TextInputWrite.new,
        Enum$QuizQuestionType.RECORD: _RecordQuestion.new,
        Enum$QuizQuestionType.CHOICE: _ChoiceQuestion.new,
      };

  @override
  Widget build(BuildContext context) {
    final constructor = constructors[widget.question.type];
    if (constructor == null) {
      return Text("Question type not supported: ${widget.question.type}");
    }

    return constructor(
      question: widget.question,
      onAnswer: widget.onAnswer,
      onValid: widget.onValid,
      aiFeedbacks: widget.aiFeedbacks,
      answer: widget.answer,
      padding: widget.padding,
    );
  }
}

class _TrueFalseQuestion extends AppFormField<bool?> {
  _TrueFalseQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    required this.aiFeedbacks,
    this.padding,
    this.answer,
  }) : super(
         validator: (value) {
           if (value == null) {
             return "Please select an answer";
           }

           return null;
         },
       );

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final EdgeInsets? padding;

  final List<Fragment$AIFeedback> aiFeedbacks;

  final dynamic answer;

  @override
  AppFormFieldState<bool?, _TrueFalseQuestion> createState() =>
      __TrueFalseQuestionState();
}

class __TrueFalseQuestionState
    extends AppFormFieldState<bool?, _TrueFalseQuestion> {
  late final selectedChoices = SignalList<String>(
    widget.answer == null ? [] : [widget.answer],
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationDuration,
      padding: showError ? const EdgeInsets.all(8) : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: showError ? Colors.red : Colors.transparent,
        ),
      ),
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TermsText(widget.question.question),
          Row(
            spacing: 16,
            children: [
              Expanded(
                child: _ChoiceCard(
                  readOnly: readOnly,
                  onTap: () {
                    if (selectedChoices.value.isEmpty) {
                      widget.onAnswer(null);
                      widget.onValid(false);
                    } else {
                      widget.onAnswer("true");
                      widget.onValid(true);
                    }
                  },
                  item: Fragment$QuestionItem(
                    id: "true",
                    text: LinguisticUnitSet.unresolved("True"),
                    hasPicture: false,
                  ),
                  selectedChoices: selectedChoices,
                  multiSelect: false,
                ),
              ),
              Expanded(
                child: _ChoiceCard(
                  readOnly: readOnly,
                  onTap: () {
                    if (readOnly) {
                      return;
                    }

                    if (selectedChoices.value.isEmpty) {
                      widget.onAnswer(null);
                      widget.onValid(false);
                    } else {
                      widget.onAnswer("false");
                      widget.onValid(true);
                    }
                  },
                  item: Fragment$QuestionItem(
                    id: "false",
                    text: LinguisticUnitSet.unresolved("False"),
                    hasPicture: false,
                  ),
                  selectedChoices: selectedChoices,
                  multiSelect: false,
                ),
              ),
            ],
          ),
          if (showError) ...[
            const SizedBox(height: 8),
            Text(error!, style: const TextStyle(color: Colors.red)),
          ],
        ],
      ),
    );
  }

  @override
  String get name => widget.key.toString();
}

List<Matched> _parseMatchingAnswer(String answer) {
  int selectedIndex = 0;

  return answer
      .split("\n")
      .map((e) => e.split("->").map((e) => int.parse(e)).toList())
      .toList()
      .map<Matched>((e) {
        final color = _colors.keys.toList()[(selectedIndex++) % _colors.length];
        return (e, color);
      })
      .toList();
}

final _colors = {
  Colors.blue: Colors.white,
  Colors.green: Colors.white,
  Colors.red: Colors.white,
  Colors.yellow: Colors.black,
  Colors.purple: Colors.white,
  Colors.orange: Colors.white,
  Colors.pink: Colors.white,
  Colors.teal: Colors.white,
  Colors.indigo: Colors.white,
  Colors.lime: Colors.white,
  Colors.amber: Colors.black,
  Colors.deepOrange: Colors.white,
  Colors.blueGrey: Colors.white,
  Colors.deepPurple: Colors.white,
  Colors.lightGreen: Colors.white,
  Colors.lightBlue: Colors.white,
  Colors.deepOrange.shade500: Colors.white,
  Colors.brown: Colors.white,
  Colors.cyan: Colors.white,
};

class _MatchingQuestion extends AppFormField<List<Matched>?> {
  _MatchingQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    this.padding,
    required this.aiFeedbacks,
    this.answer,
  }) : super(
         validator: (value) {
           if (value == null) {
             return "Please select an answer";
           }

           if (value.length != question.items!.length) {
             return "Please match all items";
           }

           return null;
         },
       );

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final EdgeInsets? padding;

  final List<Fragment$AIFeedback> aiFeedbacks;

  final dynamic answer;

  @override
  AppFormFieldState<List<Matched>?, _MatchingQuestion> createState() =>
      __MatchingQuestionState();
}

typedef Matched = (List<int>, Color);

class __MatchingQuestionState
    extends AppFormFieldState<List<Matched>?, _MatchingQuestion> {
  @override
  String get name => widget.key.toString();

  final currentSelectedLeft = Signal<(int, Color)?>(null);
  final currentSelectedRight = Signal<(int, Color)?>(null);

  late final SignalList<Matched> matches;

  @override
  void initState() {
    matches = SignalList(
      widget.answer == null
          ? []
          : _parseMatchingAnswer(widget.answer as String),
    );
    super.initState();
  }

  bool get isFinished => matches.value.length == items.length;

  void onTap(int index, bool isLeft) {
    if (hasMatched(index, isLeft)) {
      matches.removeWhere((match) => match.$1[isLeft ? 0 : 1] == index);
    } else {
      if (isLeft) {
        if (currentSelectedLeft.value != null) {
          currentSelectedLeft.value = null;
          return;
        }

        final color = currentSelectedRight.value?.$2 ?? getNextColor();

        currentSelectedLeft.value = (index, color);
      } else {
        if (currentSelectedRight.value != null) {
          currentSelectedRight.value = null;
          return;
        }

        final color = currentSelectedLeft.value?.$2 ?? getNextColor();

        currentSelectedRight.value = (index, color);
      }

      if (currentSelectedLeft.value != null &&
          currentSelectedRight.value != null) {
        matches.add((
          [currentSelectedLeft.value!.$1, currentSelectedRight.value!.$1],
          currentSelectedLeft.value!.$2,
        ));
        currentSelectedLeft.value = null;
        currentSelectedRight.value = null;
        value = matches.value;

        final answer = StringBuffer();

        for (var i = 0; i < matches.value.length; i++) {
          answer.writeln(
            "${secondItems[matches.value[i].$1[1]].id} -> ${items[matches.value[i].$1[0]].id}",
          );
        }

        widget.onAnswer(answer.toString());
        widget.onValid(matches.value.length == items.length);
      }
    }
  }

  bool hasMatched(int index, bool isLeft) {
    final matches = this.matches.value;

    if (matches.any((match) => match.$1[isLeft ? 0 : 1] == index)) {
      return true;
    }

    return false;
  }

  int lastColorIndex = -1;

  static final colorsList = _colors.keys.toList();

  Color getNextColor() {
    lastColorIndex = (lastColorIndex + 1) % colorsList.length;
    final color = colorsList[lastColorIndex];

    if (matches.value.any((match) => match.$2 == color)) {
      return getNextColor();
    }

    return color;
  }

  bool get hasPicture => leftHasPicture || rightHasPicture;

  bool get leftHasPicture => items.any((e) => e.hasPicture);

  bool get rightHasPicture => secondItems.any((e) => e.hasPicture);

  Widget withAspectRatio(bool left, Widget child) {
    if ((left && leftHasPicture) || (!left && rightHasPicture)) {
      return SizedBox(height: 130 / 0.8, width: 130, child: child);
    }
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 130, maxHeight: 100),
      child: child,
    );
  }

  Color? getColor(int index, bool isLeft) {
    if (hasMatched(index, isLeft)) {
      return matches.value
          .firstWhere((match) => match.$1[isLeft ? 0 : 1] == index)
          .$2;
    }

    if (currentSelectedLeft.value?.$1 == index && isLeft) {
      return currentSelectedLeft.value!.$2;
    }

    if (currentSelectedRight.value?.$1 == index && !isLeft) {
      return currentSelectedRight.value!.$2;
    }

    return null;
  }

  Color? getTextColor(Color? color) {
    if (color == null) {
      return null;
    }

    return _colors[color];
  }

  late List<Fragment$QuestionItem> items = widget.question.items!..shuffle();
  late List<Fragment$QuestionItem> secondItems =
      widget.question.secondItems!..shuffle();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TermsText(widget.question.question),
        matches.builder((_) {
          return SizedBox(
            width: double.infinity,
            child: CustomPaint(
              painter: _MatchesPainter(
                matches:
                    matches.value
                        .map(
                          (match) => (
                            left: match.$1[0],
                            right: match.$1[1],
                            color: match.$2,
                          ),
                        )
                        .toList(),
                spacing: 16,
                strokeWidth: 4,
                itemCount: items.length,
              ),
              child: Column(
                spacing: 16,
                children: [
                  for (var i = 0; i < items.length; i++)
                    Row(
                      children: [
                        withAspectRatio(
                          true,
                          currentSelectedLeft.builder((currentLeft) {
                            return withAspectRatio(
                              true,
                              AppCard(
                                onTap: () => onTap(i, true),
                                color: getColor(i, true),
                                image:
                                    leftHasPicture
                                        ? FadeInImage(
                                          placeholderErrorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator.adaptive(),
                                            );
                                          },
                                          placeholder: MemoryImage(
                                            Uint8List(0),
                                          ),
                                          image: itemPictureProvider(
                                            items[i].pictureId!,
                                          ),
                                        )
                                        : null,
                                title: SizedBox(
                                  width: 130,
                                  child: DefaultTextStyle.merge(
                                    style: TextStyle(
                                      color:
                                          leftHasPicture
                                              ? null
                                              : getTextColor(getColor(i, true)),
                                    ),
                                    child: TermsText(items[i].text),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        Spacer(flex: 4),
                        withAspectRatio(
                          false,
                          currentSelectedRight.builder((currentRight) {
                            return withAspectRatio(
                              false,
                              AppCard(
                                onTap: () => onTap(i, false),

                                color: getColor(i, false),
                                image:
                                    rightHasPicture
                                        ? FadeInImage(
                                          placeholderErrorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator.adaptive(),
                                            );
                                          },
                                          fit: BoxFit.cover,
                                          placeholder: MemoryImage(
                                            Uint8List(0),
                                          ),
                                          image: itemPictureProvider(
                                            secondItems[i].pictureId!,
                                          ),
                                        )
                                        : null,

                                title: SizedBox(
                                  width: 130,
                                  child: DefaultTextStyle.merge(
                                    style: TextStyle(
                                      color:
                                          rightHasPicture
                                              ? null
                                              : getTextColor(
                                                getColor(i, false),
                                              ),
                                    ),
                                    child: TermsText(secondItems[i].text),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _MatchesPainter extends CustomPainter {
  final List<({int left, int right, Color color})> matches;

  final int itemCount;

  final double spacing;

  final double strokeWidth;

  _MatchesPainter({
    required this.matches,
    required this.spacing,
    required this.strokeWidth,
    required this.itemCount,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final itemYCenters = [];

    final itemHeight = (size.height - (spacing * (itemCount - 1))) / itemCount;

    for (var i = 0; i < itemCount; i++) {
      itemYCenters.add((spacing * i) + (i * itemHeight + itemHeight / 2));
    }

    final itemW = 130.0;
    final leftXCenter = itemW - 6;
    final rightXCenter = size.width - itemW + 6;

    final controlPointOffset = Offset((size.width - (itemW * 2)) / 1.8, 0);
    final controlPointNegOffset = Offset(-(size.width - (itemW * 2)) / 1.8, 0);

    for (var match in matches) {
      paint.color = match.color;

      // Quadratic curve
      canvas.drawPath(
        Path()
          ..moveTo(leftXCenter, itemYCenters[match.left])
          ..cubicTo(
            leftXCenter + controlPointOffset.dx,
            itemYCenters[match.left],
            rightXCenter + controlPointNegOffset.dx,
            itemYCenters[match.right],
            rightXCenter,
            itemYCenters[match.right],
          ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _ChoiceQuestion extends AppFormField<int?> {
  _ChoiceQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    required this.aiFeedbacks,
    this.padding,
    this.answer,
  }) : super(
         validator: (value) {
           if (value == null) {
             return "Please select an answer";
           }
           return null;
         },
       );

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final EdgeInsets? padding;

  final List<Fragment$AIFeedback> aiFeedbacks;

  final dynamic answer;

  @override
  AppFormFieldState<int?, _ChoiceQuestion> createState() =>
      __ChoiceQuestionState();
}

class __ChoiceQuestionState extends AppFormFieldState<int?, _ChoiceQuestion> {
  final selectedChoices = SignalList<String>([]);

  @override
  String get name => widget.key.toString();

  // void onTap(int index) {

  //   value = index;
  //   widget.onAnswer(widget.question.choices![index].id);
  //   widget.onValid(true);
  // }

  List<Fragment$QuestionItem> get choices => widget.question.choices!;

  bool get hasPicture => choices.any((e) => e.hasPicture);

  Widget withAspectRatio(Widget child) {
    if (hasPicture) {
      return SizedBox(
        width: 160,
        child: AspectRatio(aspectRatio: 4 / 3, child: child),
      );
    }

    return child;
  }

  void onTap() {
    if (readOnly) {
      return;
    }
    widget.onAnswer(selectedChoices.value.firstOrNull);
    widget.onValid(selectedChoices.value.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TermsText(
          widget.question.question,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        selectedChoices.builder((s) {
          return SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              runAlignment: WrapAlignment.start,
              children: [
                for (var i = 0; i < choices.length; i++)
                  _ChoiceCard(
                    onTap: onTap,
                    multiSelect: false,
                    item: choices[i],
                    selectedChoices: selectedChoices,
                  ),
              ],
            ),
          );
        }),
        for (var feedback in widget.aiFeedbacks)
          AIFeedbackWidget(feedback: feedback),
      ],
    );
  }
}

class _MultiChoiceQuestion extends AppFormField<List<String>?> {
  _MultiChoiceQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    this.padding,
    required this.aiFeedbacks,
    this.answer,
  }) : super(
         validator: (value) {
           if (value == null) {
             return "Please select an answer";
           }

           return null;
         },
       );

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final EdgeInsets? padding;

  final List<Fragment$AIFeedback> aiFeedbacks;

  final dynamic answer;

  @override
  AppFormFieldState<List<String>?, _MultiChoiceQuestion> createState() =>
      __MultiChoiceQuestionState();
}

class __MultiChoiceQuestionState
    extends AppFormFieldState<List<String>?, _MultiChoiceQuestion> {
  late final selectedChoices = SignalList<String>(
    (widget.answer as List? ?? []).cast<String>(),
  );

  @override
  String get name => widget.key.toString();

  List<Fragment$QuestionItem> get choices => widget.question.choices!;

  bool get hasPicture => choices.any((e) => e.hasPicture);

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TermsText(
          widget.question.question,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            runAlignment: WrapAlignment.start,
            children: [
              for (var i = 0; i < choices.length; i++)
                _ChoiceCard(
                  readOnly: readOnly,
                  multiSelect: true,
                  item: choices[i],
                  onTap: () {
                    widget.onAnswer(selectedChoices.value);
                    widget.onValid(selectedChoices.value.isNotEmpty);
                  },
                  selectedChoices: selectedChoices,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FillWriteQuestion extends AppFormField<String?> {
  _FillWriteQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    this.padding,
    required this.aiFeedbacks,
    this.answer,
  }) : super(
         validator: (value) {
           if (value == null) {
             return "Please select an answer";
           }

           return null;
         },
       );

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final EdgeInsets? padding;

  final List<Fragment$AIFeedback> aiFeedbacks;

  final dynamic answer;

  @override
  AppFormFieldState<String?, _FillWriteQuestion> createState() =>
      __FillWriteQuestionState();
}

class __FillWriteQuestionState
    extends AppFormFieldState<String?, _FillWriteQuestion> {
  final List<LinguisticUnit> _blanks = [];

  late final LinguisticUnitSet question = widget.question.question;

  // void _buildTerms() {
  //   _blanks = [];

  //   _termList = [];

  //   // blanks are in the form of "{blankId}"
  //   final regex = RegExp(r"\{([^}]+)\}");

  //   for (var i = 0; i < question.terms.length; i++) {
  //     final term = question.terms[i];
  //     final matches = regex.allMatches(term.value);
  //     if (matches.isNotEmpty) {
  //       final match = matches.first;

  //       final blankId = match.group(1);

  //       _blanks.add((i, blankId!, Signal<String>(""), FocusNode()));
  //     }
  //   }

  //   var blankIndex = 0;

  //   for (var i = 0; i < question.terms.length; i++) {
  //     final term = question.terms[i];
  //     final hasBlank = _blanks.any((e) => e.$1 == i);
  //     if (hasBlank) {
  //       final blankText =
  //           _blanks.length > 1 ? "____(Blank ${blankIndex + 1})" : "____";
  //       final blankId = _blanks[blankIndex].$2;
  //       term.value = term.value.replaceAll("{$blankId}", blankText);
  //       _termList!.add(term);
  //       blankIndex++;
  //     } else {
  //       _termList!.add(term);
  //     }
  //   }
  //   _terms = TermSet(_termList!);
  // }

  // TermSet? _terms;

  // TermSet get terms => _terms!;

  @override
  String get name => widget.key.toString();

  // void onValueChange(String? value, int index) {
  //   //widget.onAnswer(value);
  //   //widget.onValid(value.isNotEmpty);
  //   if (value == null) {
  //     widget.onAnswer(null);
  //     widget.onValid(false);
  //     return;
  //   }

  //   _terms!.terms[_blanks[index].$1].value = value;
  //   widget.onAnswer(value);
  //   widget.onValid(true);
  //   setState(() {});
  // }

  @override
  void initState() {
    for (var i = 0; i < question.units.length; i++) {
      // final unit = question.units[i];
      // if (unit.type == LinguisticUnitType.BLANK) {
      //   _blanks.add(unit);
      // }
      // TODO: implement this
    }
    selectedChoices = SignalList([]);

    if (widget.answer != null) {
      final answer = widget.answer as Map<String, dynamic>;
      for (var key in answer.keys) {
        if (widget.question.choices != null) {
          final choice = answer[key];
          selectedChoices.value.add(choice);
        } else {
          final blank = _blanks.firstWhere((e) => e.blankId == key);
          blank.controller!.text = answer[key];
        }
      }
    }

    super.initState();
  }

  late final SignalList<String> selectedChoices;

  void onValueChange(String? value, int index) {
    if (readOnly) {
      return;
    }
    selectedChoices.value[index] = value ?? "";
    widget.onAnswer(selectedChoices.value.join(","));
    widget.onValid(selectedChoices.value.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    print("ANSWER: ${widget.answer}");
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        spacing: 16,
        children: [
          Text("Please fill in the blank"),
          TermsText(question, style: Theme.of(context).textTheme.bodyLarge),

          if (widget.question.choices == null)
            for (var i = 0; i < _blanks.length; i++)
              AppTextFormField(
                key: Key("blank_$i"),
                focusNode: _blanks[i].focusNode,
                controller: _blanks[i].controller,
                onChanged: (value) {
                  _blanks[i].text = value;
                  setState(() {});
                  widget.onAnswer({_blanks[i].blankId: value});
                  widget.onValid(true);
                },
                label: _blanks.length > 1 ? "(Blank ${i + 1})" : "Blank",
              )
          else
            Builder(
              builder: (context) {
                return Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: [
                    for (var i = 0; i < widget.question.choices!.length; i++)
                      _ChoiceCard(
                        readOnly: readOnly,
                        onTap: () {
                          if (selectedChoices.isNotEmpty) {
                            widget.onAnswer({"blank": selectedChoices.first});
                            print({"blank": selectedChoices.first});
                            widget.onValid(true);
                          } else {
                            widget.onAnswer(null);
                            widget.onValid(false);
                          }
                        },
                        key: Key("choice_${widget.question.choices![i].id}"),
                        multiSelect: false,
                        item: widget.question.choices![i],
                        selectedChoices: selectedChoices,
                      ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }
}

class _OrderingQuestion extends AppFormField<List<int>?> {
  _OrderingQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    this.padding,
    required this.aiFeedbacks,
    this.answer,
  }) : super(
         validator: (value) {
           if (value == null) {
             return "Please select an answer";
           }
           return null;
         },
       );

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final EdgeInsets? padding;

  final List<Fragment$AIFeedback> aiFeedbacks;

  final dynamic answer;

  @override
  AppFormFieldState<List<int>?, _OrderingQuestion> createState() =>
      __OrderingQuestionState();
}

class __OrderingQuestionState
    extends AppFormFieldState<List<int>?, _OrderingQuestion> {
  @override
  String get name => widget.key.toString();

  final selectedChoices = SignalList<Fragment$QuestionItem>([]);
  late final unselectedChoices = SignalList<Fragment$QuestionItem>(
    widget.question.items!.toList(),
  );

  void select(Fragment$QuestionItem item) {
    selectedChoices.add(item);
    unselectedChoices.remove(item);
    widget.onAnswer(selectedChoices.value.map((e) => e.id).toList());
    widget.onValid(selectedChoices.value.isNotEmpty);
  }

  void unselect(Fragment$QuestionItem item) {
    selectedChoices.remove(item);
    unselectedChoices.add(item);
    widget.onAnswer(selectedChoices.value.map((e) => e.id).toList());
    widget.onValid(selectedChoices.value.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TermsText(
          widget.question.question,
          style: Theme.of(context).textTheme.bodyLarge,
        ),

        Text("Your answer:"),

        selectedChoices.builder((selected) {
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (var i = 0; i < selected.length; i++)
                _ChoiceCard(
                  key: Key("selected_${selected[i].id}"),
                  item: selected[i],
                  selectedChoices: SignalList(
                    selectedChoices.value.map((e) => e.id).toList(),
                  ),
                  onTap: () {
                    unselect(selected[i]);
                  },
                ),
            ],
          );
        }),

        Text("Unselected choices:"),

        unselectedChoices.builder((unselected) {
          return Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              for (var i = 0; i < unselected.length; i++)
                _ChoiceCard(
                  key: Key("unselected_${unselected[i].id}"),
                  item: unselected[i],
                  selectedChoices: SignalList([]),
                  onTap: () {
                    select(unselected[i]);
                  },
                ),
            ],
          );
        }),
      ],
    );
  }
}

class _TextInputWrite extends StatefulWidget {
  const _TextInputWrite({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    this.padding,
    required this.aiFeedbacks,
    this.answer,
  });

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final EdgeInsets? padding;

  final List<Fragment$AIFeedback> aiFeedbacks;

  final dynamic answer;

  @override
  State<_TextInputWrite> createState() => __TextInputWriteState();
}

class __TextInputWriteState extends State<_TextInputWrite> {
  late final controller = TextEditingController(text: widget.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          spacing: 16,
          children: [
            TermsText(
              widget.question.question,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppTextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter an answer";
                }
                return null;
              },
              controller: controller,
              minLines: 3,
              maxLines: 10,
              onChanged: (value) {
                widget.onAnswer(value);
                widget.onValid(value.isNotEmpty);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordQuestion extends AppFormField<String?> {
  _RecordQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
    required this.aiFeedbacks,
    this.answer,
    this.padding,
  }) : super(
         validator: (value) {
           if (value == null) {
             return "Please select an answer";
           }
           return null;
         },
       );

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final EdgeInsets? padding;

  final List<Fragment$AIFeedback> aiFeedbacks;

  final dynamic answer;

  @override
  AppFormFieldState<String?, _RecordQuestion> createState() =>
      __RecordQuestionState();
}

class __RecordQuestionState
    extends AppFormFieldState<String?, _RecordQuestion> {
  @override
  String get name => widget.key.toString();

  final amplitudes = SignalList<Amplitude>([]);

  final recording = Signal<bool>(false);
  final cancelling = Signal<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TermsText(
            widget.question.question,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: RecordWidget(
              size: 45,
              filled: true,
              onRecordComplete: (value) {
                widget.onAnswer(value);
                widget.onValid(value != null);
              },
              onAmplitudeChanged: (amplitude) {
                amplitudes.add(amplitude);
              },
              onCancellingStateChanged: (cancelling) {
                this.cancelling.value = cancelling;
              },
              onRecordStart: () {
                recording.value = true;
              },
              onRecordCancel: () {
                recording.value = false;
              },
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: recording.builder((re) {
              if (re) {
                return AmplitudeWidget(
                  amplitudes: amplitudes,
                  cancelling: cancelling,
                );
              }
              return SizedBox.shrink();
            }),
          ),
        ],
      ),
    );
  }
}

class _ChoiceCard extends StatefulWidget {
  const _ChoiceCard({
    super.key,
    required this.item,
    required this.selectedChoices,
    this.multiSelect = false,
    this.selectedColor,
    this.onTap,
    this.readOnly = false,
  });

  final Fragment$QuestionItem item;
  final SignalList<String> selectedChoices;
  final bool multiSelect;
  final Color? selectedColor;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  State<_ChoiceCard> createState() => __ChoiceCardState();
}

class __ChoiceCardState extends State<_ChoiceCard> with Slot {
  bool get hasPicture => widget.item.pictureId != null;

  LinguisticUnitSet get terms => widget.item.text;

  bool get isSelected => widget.selectedChoices.contains(widget.item.id);

  @override
  void onValue(value) {
    setState(() {});
  }

  @override
  void initState() {
    widget.selectedChoices.addSlot(this);
    super.initState();
  }

  @override
  void dispose() {
    widget.selectedChoices.removeSlot(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (terms.units.isEmpty || terms.units[0].text.isEmpty) {
      child = SizedBox.shrink();
    } else {
      if (hasPicture) {
        child = TermsText(
          terms,
          style: typo.bodyMedium.copyWith(color: AppColors.onPrimary),
        );
      } else {
        child = AnimatedDefaultTextStyle(
          duration: animationDuration,
          style:
              isSelected
                  ? typo.bodyMedium.copyWith(color: AppColors.onPrimary)
                  : typo.bodyMedium,
          child: TermsText(terms),
        );
      }
    }

    if (hasPicture) {
      child = DefaultTextStyle.merge(
        style: typo.bodyMedium.copyWith(color: Colors.white),
        child: child,
      );
    }

    if (hasPicture) {
      child = SizedBox(
        width: 200,
        child: ClipRRect(
          borderRadius: AppDimensions.borderRadiusMedium,
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: Stack(
              children: [
                ItemPicture(pictureId: widget.item.pictureId!),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.6, 0.9],
                        colors: [
                          AppColors.primary.op(0.0),
                          AppColors.primary.op(0.5),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  left: AppSpacing.sm,
                  bottom: AppSpacing.sm,
                  right: AppSpacing.sm,
                  child: Align(alignment: Alignment.bottomLeft, child: child),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (widget.readOnly) {
            return;
          }
          if (widget.multiSelect) {
            if (isSelected) {
              widget.selectedChoices.remove(widget.item.id);
            } else {
              widget.selectedChoices.add(widget.item.id);
            }
          } else {
            if (isSelected) {
              widget.selectedChoices.remove(widget.item.id);
            } else {
              if (widget.selectedChoices.value.isNotEmpty) {
                widget.selectedChoices.removeLast();
              }
              widget.selectedChoices.add(widget.item.id);
            }
          }

          widget.onTap?.call();
        },
        child: AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: AppDimensions.borderRadiusMedium,
            color:
                isSelected
                    ? (widget.selectedColor ?? AppColors.primary)
                    : Colors.white,
            boxShadow:
                isSelected
                    ? [
                      BoxShadow(
                        color: AppColors.primary.op(0.5),
                        blurRadius: 10,
                      ),
                    ]
                    : null,
          ),
          padding:
              hasPicture ? EdgeInsets.all(4) : EdgeInsets.all(AppSpacing.md),
          duration: animationDuration,
          child: child,
        ),
      ),
    );
  }
}
