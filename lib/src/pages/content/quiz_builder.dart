import 'package:api/api.dart';
import 'package:assist_app/src/pages/content/material_builder.dart';
import 'package:assist_app/src/widgets/components/term_text.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class QuizBuilder extends StatefulWidget {
  const QuizBuilder({
    super.key,
    required this.quiz,
    required this.onAnswer,
    required this.onValid,
    required this.onSubmit,
  });

  final Fragment$QuizDetails quiz;

  final OnAnswer onAnswer;

  final OnValid onValid;

  final OnSubmit onSubmit;

  @override
  State<QuizBuilder> createState() => _QuizBuilderState();
}

typedef OnAnswer = void Function(String answer);

typedef OnValid = void Function(bool valid);

typedef QuizBuilderConstructor =
    Widget Function({
      Key? key,
      required Fragment$QuizQuestion question,
      required OnAnswer onAnswer,
      required OnValid onValid,
    });

class _QuizBuilderState extends State<QuizBuilder> {
  final pageController = PageController();
  final currentQuestion = Signal<int>(0);

  @override
  void initState() {
    validStates.value = List.generate(
      widget.quiz.questions.length,
      (_) => false,
    );
    answers.value = {};
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static final Map<Enum$QuizQuestionType, QuizBuilderConstructor> constructors =
      {
        Enum$QuizQuestionType.TRUE_FALSE: _TrueFalseQuestion.new,
        Enum$QuizQuestionType.MATCHING: _MatchingQuestion.new,
        Enum$QuizQuestionType.MULTIPLE_CHOICE: _MultiChoiceQuestion.new,
        Enum$QuizQuestionType.FILL_WRITE: _FillWriteQuestion.new,
        Enum$QuizQuestionType.FILL_CHOICE: _FillWriteQuestion.new,
        Enum$QuizQuestionType.ORDERING: _OrderingQuestion.new,
        Enum$QuizQuestionType.TEXT_INPUT_WRITE: _TextInputWrite.new,
        Enum$QuizQuestionType.CHOICE: _ChoiceQuestion.new,
      };

  final answers = SignalMap<String, String>({});

  final validStates = SignalList<bool>([]);

  OnAnswer onAnswer(int index) {
    final q = widget.quiz.questions[index];
    return (answer) {
      answers[q.id] = answer;
    };
  }

  OnValid onValid(int index) {
    return (valid) {
      validStates[index] = valid;
    };
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    for (var i = 0; i < widget.quiz.questions.length; i++) {
      final question = widget.quiz.questions[i];
      final key = ValueKey("${widget.quiz.hashCode}-${question.hashCode}");
      final constructor = constructors[question.type];
      if (constructor != null) {
        children.add(
          constructor(
            key: key,
            question: question,
            onAnswer: onAnswer(i),
            onValid: onValid(i),
          ),
        );
      }
    }

    for (var i = 0; i < widget.quiz.questions.length; i++) {
      final q = widget.quiz.questions[i];

      children[i] = Column(
        children: [
          if (q.preludeID != null && q.preludeID!.isNotEmpty)
            Builder(
              builder: (context) {
                final preludeIndex = widget.quiz.preludes!.indexWhere(
                  (e) => e.id == q.preludeID,
                );

                if (preludeIndex == -1) {
                  return const SizedBox.shrink();
                }

                final prelude = widget.quiz.preludes![preludeIndex];

                return Padding(
                  padding: ResponsiveConfig.of(context).pagePadding,
                  child: Column(
                    children: [
                      for (var part in prelude.parts)
                        if (part.type == Enum$QuizPreludeItemType.STORY)
                          TermsText(part.content!)
                        else if (part.type == Enum$QuizPreludeItemType.PICTURE)
                          Text(part.pictureId ?? "PICTURE ID"),
                    ],
                  ),
                );
              },
            ),
          Expanded(
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: children[i]),
              ),
            ),
          ),
        ],
      );
    }

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
            bottom: ResponsiveConfig.of(context).pagePadding.bottom,
            left: ResponsiveConfig.of(context).pagePadding.left,
            right: ResponsiveConfig.of(context).pagePadding.right,
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
              title: Text("Submit"),
            ),
          );
        }),
      ],
    );
  }
}

class _TrueFalseQuestion extends AppFormField<bool?> {
  _TrueFalseQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
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

  @override
  AppFormFieldState<bool?, _TrueFalseQuestion> createState() =>
      __TrueFalseQuestionState();
}

class __TrueFalseQuestionState
    extends AppFormFieldState<bool?, _TrueFalseQuestion>
    with Slot<bool?> {
  final val = Signal<bool?>(null);

  @override
  void initState() {
    val.addSlot(this);
    super.initState();
  }

  @override
  void onValue(bool? v) {
    value = v;
    widget.onAnswer(v.toString());
    widget.onValid(v != null);
  }

  @override
  void dispose() {
    val.removeSlot(this);
    super.dispose();
  }

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
                child: AppSelectCard<bool?>(
                  size: AppSizeVariant.small,
                  value: true,
                  expandHorizontal: true,
                  selected: val,
                  title: "True",
                ),
              ),
              Expanded(
                child: AppSelectCard<bool?>(
                  size: AppSizeVariant.small,
                  value: false,
                  expandHorizontal: true,
                  selected: val,
                  title: "False",
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

class _MatchingQuestion extends AppFormField<List<Matched>?> {
  _MatchingQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
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

  @override
  AppFormFieldState<List<Matched>?, _MatchingQuestion> createState() =>
      __MatchingQuestionState();
}

typedef Matched = (List<int>, Color);

class __MatchingQuestionState
    extends AppFormFieldState<List<Matched>?, _MatchingQuestion> {
  late final randomNumbers = List.generate(
    widget.question.items!.length,
    (index) => index,
  )..shuffle();

  @override
  String get name => widget.key.toString();

  final currentSelectedLeft = Signal<(int, Color)?>(null);
  final currentSelectedRight = Signal<(int, Color)?>(null);

  final matches = SignalList<Matched>([]);

  bool get isFinished => matches.value.length == widget.question.items!.length;

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
            "${widget.question.secondItems![matches.value[i].$1[1]].id} -> ${widget.question.items![matches.value[i].$1[0]].id}",
          );
        }

        widget.onAnswer(answer.toString());
        widget.onValid(matches.value.length == widget.question.items!.length);
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

  // color: textColor
  static final colors = {
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

  int lastColorIndex = -1;

  static final colorsList = colors.keys.toList();

  Color getNextColor() {
    lastColorIndex = (lastColorIndex + 1) % colorsList.length;
    final color = colorsList[lastColorIndex];

    if (matches.value.any((match) => match.$2 == color)) {
      return getNextColor();
    }

    return color;
  }

  bool get hasPicture => leftHasPicture || rightHasPicture;

  bool get leftHasPicture => widget.question.items!.any((e) => e.hasPicture);

  bool get rightHasPicture =>
      widget.question.secondItems!.any((e) => e.hasPicture);

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

    return colors[color];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  itemCount: widget.question.items!.length,
                ),
                child: Column(
                  spacing: 16,
                  children: [
                    for (var i = 0; i < widget.question.items!.length; i++)
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
                                              widget
                                                  .question
                                                  .items![i]
                                                  .pictureId!,
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
                                                : getTextColor(
                                                  getColor(i, true),
                                                ),
                                      ),
                                      child: TermsText(
                                        widget.question.items![i].text,
                                      ),
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
                                  padding: EdgeInsets.all(4),
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
                                              widget
                                                  .question
                                                  .secondItems![i]
                                                  .pictureId!,
                                            ),
                                          )
                                          : null,

                                  expandHorizontal: true,
                                  isInteractive: true,

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
                                      child: TermsText(
                                        widget
                                            .question
                                            .secondItems![randomNumbers[i]]
                                            .text,
                                      ),
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
      ),
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

  @override
  AppFormFieldState<int?, _ChoiceQuestion> createState() =>
      __ChoiceQuestionState();
}

class __ChoiceQuestionState extends AppFormFieldState<int?, _ChoiceQuestion> {
  final selected = Signal<int?>(null);

  @override
  String get name => widget.key.toString();

  void onTap(int index) {
    if (selected.value == index) {
      selected.value = null;
      value = null;
      widget.onValid(false);
      return;
    }

    selected.value = index;
    value = index;
    widget.onAnswer(widget.question.choices![index].id);
    widget.onValid(true);
  }

  List<Fragment$QuestionItem> get choices => widget.question.choices!;

  bool get hasPicture => choices.any((e) => e.hasPicture);

  Widget withAspectRatio(Widget child) {
    if (hasPicture) {
      return SizedBox(
        width: 120,
        child: AspectRatio(aspectRatio: 0.8, child: child),
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TermsText(widget.question.question),
        selected.builder((s) {
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
                  withAspectRatio(
                    AppCard(
                      image:
                          hasPicture
                              ? FadeInImage(
                                placeholderErrorBuilder: (
                                  context,
                                  error,
                                  stackTrace,
                                ) {
                                  return const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  );
                                },
                                fit: BoxFit.cover,
                                placeholder: MemoryImage(Uint8List(0)),
                                image: itemPictureProvider(
                                  choices[i].pictureId!,
                                ),
                              )
                              : null,
                      title: TermsText(choices[i].text),
                      isInteractive: true,
                      size: AppSizeVariant.small,
                      onTap: () => onTap(i),
                      padding: EdgeInsets.all(4),
                      color: s == i ? Colors.blue : null,
                    ),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _MultiChoiceQuestion extends AppFormField<List<int>?> {
  _MultiChoiceQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
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

  @override
  AppFormFieldState<List<int>?, _MultiChoiceQuestion> createState() =>
      __MultiChoiceQuestionState();
}

class __MultiChoiceQuestionState
    extends AppFormFieldState<List<int>?, _MultiChoiceQuestion> {
  final selected = SignalList<int>([]);

  void onTap(int index) {
    if (selected.value.contains(index)) {
      selected.remove(index);
    } else {
      selected.add(index);
    }
    value = selected.value;
    final answer =
        selected.value.map((e) => widget.question.choices![e].id).toList();
    widget.onAnswer(answer.join(","));
    widget.onValid(selected.value.isNotEmpty);
  }

  @override
  String get name => widget.key.toString();

  List<Fragment$QuestionItem> get choices => widget.question.choices!;

  bool get hasPicture => choices.any((e) => e.hasPicture);

  Widget withAspectRatio(Widget child) {
    if (hasPicture) {
      return SizedBox(
        width: 120,
        child: AspectRatio(aspectRatio: 0.8, child: child),
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 16,
        children: [
          TermsText(widget.question.question),
          selected.builder((s) {
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
                    withAspectRatio(
                      AppCard(
                        image:
                            hasPicture
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
                                  placeholder: MemoryImage(Uint8List(0)),
                                  image: itemPictureProvider(
                                    choices[i].pictureId!,
                                  ),
                                )
                                : null,
                        title: TermsText(
                          choices[i].text,
                          style: TextStyle(color: Colors.white),
                        ),
                        isInteractive: true,

                        size: AppSizeVariant.small,
                        onTap: () => onTap(i),
                        color: s.contains(i) ? Colors.blue : null,
                        padding: EdgeInsets.all(4),
                      ),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _FillWriteQuestion extends AppFormField<String?> {
  _FillWriteQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
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

  @override
  AppFormFieldState<String?, _FillWriteQuestion> createState() =>
      __FillWriteQuestionState();
}

class __FillWriteQuestionState
    extends AppFormFieldState<String?, _FillWriteQuestion> {
  late final text = Signal<TermSet>(widget.question.question);

  late final textEditingController = TextEditingController();

  late final blankLocation = text.value.terms.indexWhere(
    (term) => term.type == TermType.BLANK,
  );

  @override
  String get name => widget.key.toString();

  void onValueChange(String value) {
    // TODO: Implement this
    widget.onAnswer(value);
    widget.onValid(value.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TermsText(text.value),
        AppTextFormField(
          controller: textEditingController,
          onChanged: onValueChange,
        ),
      ],
    );
  }
}

class _OrderingQuestion extends AppFormField<List<int>?> {
  _OrderingQuestion({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
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

  @override
  AppFormFieldState<List<int>?, _OrderingQuestion> createState() =>
      __OrderingQuestionState();
}

class __OrderingQuestionState
    extends AppFormFieldState<List<int>?, _OrderingQuestion> {
  @override
  String get name => widget.key.toString();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [Text(widget.question.toJson().toString())],
    );
  }
}

class _TextInputWrite extends StatefulWidget {
  const _TextInputWrite({
    super.key,
    required this.question,
    required this.onAnswer,
    required this.onValid,
  });

  final Fragment$QuizQuestion question;

  final OnAnswer onAnswer;

  final OnValid onValid;

  @override
  State<_TextInputWrite> createState() => __TextInputWriteState();
}

class __TextInputWriteState extends State<_TextInputWrite> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Column(
          spacing: 16,
          children: [
            TermsText(
              widget.question.question,
              style: Theme.of(context).textTheme.bodyLarge,
              onTermTap: (term) => print(term.value),
            ),
            AppTextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter an answer";
                }
                return null;
              },
              controller: TextEditingController(),
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
