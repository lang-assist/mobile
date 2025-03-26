import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/pages/documentation.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_app/src/widgets/components/item_picture.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gql_data/gql_data.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';

import '../widgets/components/term_text.dart';

class JourneyPage extends StatefulWidget {
  const JourneyPage({super.key});

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  Fragment$Journey get journey => journeyController.journey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(child: _JoruneyPath(key: ValueKey(journey.id))),
          Positioned(
            top: 0,
            right: 0,
            child: PopupIconButton(
              icon: Icon(Icons.add),
              items: [
                AppButton(
                  onPressed: (_) async {
                    // await Api.mutations.genMaterial(
                    //   Input$GenMaterialInput(
                    //     journeyId: journey.id,

                    //     pathId: journey.paths.first.id,
                    //     type: Enum$MaterialType.STORY,
                    //   ),
                    // );
                  },
                  title: Text("Gen Story"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _JoruneyPath extends StatefulWidget {
  const _JoruneyPath({super.key});

  // final PathController path;

  @override
  State<_JoruneyPath> createState() => __JoruneyPathState();
}

class __JoruneyPathState extends State<_JoruneyPath> with Slot {
  final scrollController = ScrollController();

  int get itemCount => journeyController.stages.length;

  int? jumped;

  // PathController get pathController => widget.path;

  @override
  void onValue(value) {
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    journeyController.addSlot(this);
    super.initState();
  }

  @override
  void dispose() {
    journeyController.removeSlot(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveConfig.of(context);

    final mainAxisExtent =
        (responsive.breakpoint == Breakpoint.mobile ? 170.0 : 150.0) + 35;
    final crossAxisSpace = responsive.gridGutter;
    final mainAxisSpacing = 35.0;

    return journeyController.stages.builder((_) {
      return scrollController.asSignal().builder((value) {
        return CustomPaint(
          painter: _PathBackgroundPainter(
            scrollOffset:
                scrollController.hasClients ? scrollController.offset : 0,
            padding: responsive.pagePadding,
            size: MediaQuery.sizeOf(context),
            crossAxisSpace: crossAxisSpace,
            mainAxisExtent: mainAxisExtent,
            mainAxisSpacing: mainAxisSpacing,
            itemCount: itemCount,
          ),
          child: ListView.separated(
            cacheExtent: 3000,
            separatorBuilder:
                (context, index) => SizedBox(height: mainAxisSpacing),
            reverse: false,
            padding: responsive.pagePadding,
            itemCount:
                journeyController.stages.length +
                (journeyController.hasMoreStages ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == journeyController.stages.length) {
                journeyController.fetchStages();
                return Center(child: AIIndicator(size: 30));
              }

              final stage = journeyController.stages[index];

              return _StageCard(stage: stage, key: ValueKey(stage.id));
            },
          ),
        );
      });
    });
  }
}

class _StageCard extends StatefulWidget {
  const _StageCard({super.key, required this.stage});

  final Fragment$Stage stage;

  @override
  State<_StageCard> createState() => __StageCardState();
}

class __StageCardState extends State<_StageCard> {
  Fragment$DetailedStage? _detailedStage;

  bool get hasDetailedStage => _detailedStage != null;

  Fragment$DetailedStage get detailed => _detailedStage!;

  List<Fragment$StagePart> get parts => detailed.stagePart.items;

  @override
  void initState() {
    if (widget.stage.status == Enum$StageStatus.GENERATED) {
      _fetchDetailedStage();
    }
    super.initState();
  }

  Future<void> _fetchDetailedStage() async {
    final res = await Api.queries.stage(
      journeyController.journey.id,
      widget.stage.id,
    );
    _detailedStage = res;
    setState(() {});
  }

  Widget _buildLevels() {
    final start =
        widget.stage.levelsOnStart ??
        Fragment$Levels(
          grammar: -1,
          listening: -1,
          reading: -1,
          speaking: -1,
          vocabulary: -1,
          writing: -1,
        );
    final finish =
        widget.stage.levelsOnFinish ??
        Fragment$Levels(
          grammar: -1,
          listening: -1,
          reading: -1,
          speaking: -1,
          vocabulary: -1,
          writing: -1,
        );

    final children = <Widget>[];

    final newLevel = Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: AppColors.warning,
        shape: BoxShape.circle,
      ),
    );

    final increasing = SizedBox(
      height: 10,
      child: Icon(Icons.arrow_upward, color: AppColors.success, size: 10),
    );

    final decreasing = SizedBox(
      height: 10,
      child: Icon(Icons.arrow_downward, color: AppColors.error, size: 10),
    );

    // start is defined
    // finish is defined
    for (final key in [
      ("grammer", start.grammar, finish.grammar),
      ("vocabulary", start.vocabulary, finish.vocabulary),
      ("reading", start.reading, finish.reading),
      ("listening", start.listening, finish.listening),
      ("speaking", start.speaking, finish.speaking),
      ("writing", start.writing, finish.writing),
    ]) {
      if (key.$2 != -1 && key.$3 != -1 && key.$2 != key.$3) {
        children.add(
          AppCard(
            expandHorizontal: false,
            scaleOnHover: false,
            title: Row(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(key.$1),
                if (key.$3 - key.$2 > 0) increasing,
                if (key.$3 - key.$2 < 0) decreasing,
                Text(key.$3.toString()),
              ],
            ),
          ),
        );
      } else if (key.$2 == -1 && key.$3 != -1) {
        children.add(
          AppCard(
            expandHorizontal: false,
            scaleOnHover: false,
            title: Row(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [Text(key.$1), newLevel, Text(key.$3.toString())],
            ),
          ),
        );
      }
    }

    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: children,
    );
  }

  Widget _buildSkeleton() {
    return AppCard(
      scaleOnHover: false,
      color: Color.lerp(AppColors.primary, Colors.white, .65),
      title: Column(
        spacing: AppSpacing.md,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: AppSpacing.md,
            children: [
              // Skeleton avatar
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 100,
                  height: 100,
                  color: AppColors.grey.op(0.2),
                  child: Center(child: AIIndicator(size: 30)),
                ),
              ),
              // Skeleton title
              Expanded(
                child: Container(
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.grey.op(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
          // Skeleton description
          Container(
            height: 16,
            width: double.infinity,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: AppColors.grey.op(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            height: 16,
            width: double.infinity * 0.7,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: AppColors.grey.op(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterial(String id) {
    return _MaterialCard.withId(id);
  }

  @override
  Widget build(BuildContext context) {
    // Show skeleton for GENERATING status
    if (widget.stage.status == Enum$StageStatus.GENERATING) {
      return _buildSkeleton();
    }

    return AppCard(
      scaleOnHover: false,

      // color:
      //     widget.stage.status == Enum$StageStatus.GENERATED
      //         ? Color.lerp(AppColors.primary, Colors.white, .65)
      //         : null,
      title: Column(
        spacing: AppSpacing.md,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: AppSpacing.md,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child:
                      widget.stage.imageId != null
                          ? ItemPicture(pictureId: widget.stage.imageId!)
                          : Container(color: AppColors.grey.op(0.2)),
                ),
              ),

              Expanded(
                child: Text(
                  widget.stage.name ?? "Generating stage...",
                  style: typo.titleMedium,
                ),
              ),
            ],
          ),
          if (widget.stage.description != null)
            Text(widget.stage.description!, style: typo.bodyMedium),
          if (hasDetailedStage)
            ...[
              ...parts.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppSpacing.sm,
                  children: [
                    Text(e.explanation),
                    switch (e.type) {
                      Enum$StagePartType.TEST => _buildMaterial(
                        e.material!.material_ID,
                      ),
                      Enum$StagePartType.WORDS => StageWordsPart(part: e),
                      Enum$StagePartType.SENTENCES => StageSentencePart(
                        part: e,
                      ),
                      Enum$StagePartType.DOCUMENTATION =>
                        StageDocumentationCard(part: e.documentation!),
                      _ => Text(e.toJson().toString()),
                    },
                  ],
                );
              }),
            ].seperateWith(
              Divider(color: AppColors.textSecondary, height: 5, thickness: .5),
            ),
          if (widget.stage.notes != null && widget.stage.notes!.isNotEmpty) ...[
            Text("Notes", style: typo.bodyMedium),
            ...widget.stage.notes!.map(
              (e) => Row(
                spacing: AppSpacing.sm,
                children: [
                  Icon(Icons.check_circle, color: AppColors.primary, size: 16),
                  Expanded(child: Text(e, style: typo.bodySmall)),
                ],
              ),
            ),
          ],
          _buildLevels(),
        ],
      ),
    );
  }
}

extension on List<Widget> {
  List<Widget> seperateWith(Widget separator) {
    final List<Widget> result = [];
    for (var i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) {
        result.add(separator);
      }
    }
    return result;
  }
}

class StageDocumentationCard extends StatefulWidget {
  const StageDocumentationCard({super.key, required this.part});

  final Fragment$StagePartDocumentation part;

  @override
  State<StageDocumentationCard> createState() => _StageDocumentationCardState();
}

class _StageDocumentationCardState extends State<StageDocumentationCard> {
  @override
  Widget build(BuildContext context) {
    return AppCard(scaleOnHover: false, title: Text(widget.part.title));
  }
}

class StageWordsPart extends StatefulWidget {
  const StageWordsPart({super.key, required this.part});

  final Fragment$StagePart part;

  @override
  State<StageWordsPart> createState() => _StageWordsPartState();
}

enum _Interaction {
  learning, // learning means, practice, validate, etc.
  pronunciation, // pronunciation means, listen, record, etc.
}

class _StageWordsPartState extends State<StageWordsPart> {
  List<Fragment$StageWord> get words => widget.part.words!;
  int selectedIndex = 0;

  // ignore: unused_field
  final Map<int, Set<_Interaction>> _interactions = {};

  // ignore: unused_field
  String? _definition;
  // ignore: unused_field
  List<String>? _examples;
  // ignore: unused_field
  String? _practiceId;

  void _markInteraction(int index, _Interaction type) {
    setState(() {
      if (!_interactions.containsKey(index)) {
        _interactions[index] = {};
      }
      _interactions[index]!.add(type);
    });
  }

  bool _hasInteraction(int index, _Interaction type) {
    return _interactions[index]?.contains(type) ?? false;
  }

  int interactionCount(int index) {
    return _interactions[index]?.length ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: List.generate(words.length, (i) {
              final c = interactionCount(i);
              final icon = switch (c) {
                0 => Icons.check_circle_outline,
                1 => Icons.check_circle,
                _ => Icons.check_circle,
              };

              final color = switch (c) {
                0 => AppColors.textSecondary,
                1 => AppColors.warning,
                _ => AppColors.success,
              };

              return AppCard(
                onTap: () => StageWordBottomSheet.show(context, words[i]),
                color:
                    selectedIndex == i
                        ? Color.lerp(AppColors.primary, Colors.white, .65)
                        : null,
                title: Row(
                  spacing: AppSpacing.sm,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [Icon(icon, color: color), Text(words[i].word)],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class StageWordBottomSheet extends StatefulWidget {
  const StageWordBottomSheet({super.key, required this.word});

  final Fragment$StageWord word;

  static Future<void> show(
    BuildContext context,
    Fragment$StageWord word,
  ) async {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      showDragHandle: true,
      scrollControlDisabledMaxHeightRatio: 0.5,
      builder: (context) => StageWordBottomSheet(word: word),
    );
  }

  @override
  State<StageWordBottomSheet> createState() => _StageWordBottomSheetState();
}

class _StageWordBottomSheetState extends State<StageWordBottomSheet> {
  Fragment$StageWord get word => widget.word;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: responsive.containerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            spacing: AppSpacing.sm,
            children: [
              Text(word.word, style: typo.displaySmall),

              // Pronunciation button
              AppButton(
                variant: AppButtonVariant.outlined,
                onPressed: (_) {
                  // TODO: Play pronunciation
                },
                title: Icon(Icons.volume_up),
              ),

              // Translation button
              AppButton(
                variant: AppButtonVariant.danger,
                onPressed: (_) {
                  // TODO: Show translation
                },
                title: Icon(Icons.translate),
              ),
            ],
          ),

          if (word.category != null) ...[
            SizedBox(height: 8),
            Text(
              "Category: ${word.category!}",
              style: typo.bodySmall.copyWith(color: AppColors.textSecondary),
            ),
          ],

          SizedBox(height: 16),

          AppCard(
            scaleOnHover: false,
            title: Column(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: typo.bodyLarge.copyWith(color: AppColors.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: AppSpacing.sm,
                    children: [
                      Icon(Icons.book, color: AppColors.primary),
                      Text("Study"),
                    ],
                  ),
                ),

                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    // Generate definition
                    AppButton(
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Row(
                        spacing: AppSpacing.sm,
                        children: [
                          Icon(Icons.auto_stories),
                          Text("Definition"),
                          // AI Generation button
                          Icon(
                            FontAwesome5.minus_square,
                            size: 10,
                            color: AppColors.onPrimary.op(.4),
                          ),
                        ],
                      ),
                    ),

                    // Generate examples
                    AppButton(
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Row(
                        spacing: AppSpacing.sm,
                        children: [
                          Icon(Icons.format_quote),
                          Text("Examples"),
                          // AI Generation button
                          Icon(
                            FontAwesome5.minus_square,
                            size: 10,
                            color: AppColors.onPrimary.op(.4),
                          ),
                        ],
                      ),
                    ),

                    // Generate practice
                    AppButton(
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Row(
                        spacing: AppSpacing.sm,
                        children: [
                          Icon(Icons.psychology),
                          Text("Practice"),
                          // AI Generation button
                          Icon(
                            FontAwesome5.minus_square,
                            size: 10,
                            color: AppColors.onPrimary.op(.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Test
          AppCard(
            scaleOnHover: false,
            title: Column(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: typo.bodyLarge.copyWith(color: AppColors.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: AppSpacing.sm,
                    children: [
                      Icon(Icons.check_circle, color: AppColors.primary),
                      Text("Test"),
                    ],
                  ),
                ),

                Row(
                  spacing: AppSpacing.sm,
                  children: [
                    Text("Pronunciation", style: typo.bodyLarge),
                    Spacer(),

                    // Listen button
                    AppButton(
                      variant: AppButtonVariant.outlined,
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Icon(Icons.volume_up),
                    ),

                    AppButton(
                      variant: AppButtonVariant.outlined,
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Text("Record"),
                    ),
                  ],
                ),

                Divider(
                  color: AppColors.textSecondary,
                  height: 5,
                  thickness: .5,
                ),

                Column(
                  spacing: AppSpacing.sm,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Knowledge", style: typo.bodyLarge),
                    AppTextFormField(
                      hint:
                          "Write translation, definition or an example sentence",
                      maxLines: 4,
                      minLines: 2,
                      onChanged: (value) {
                        // TODO: Validate input
                      },
                    ),
                    Row(
                      spacing: AppSpacing.sm,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          onPressed: (_) {
                            // TODO: Show study
                          },
                          title: Text("Check"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StageSentencePart extends StatefulWidget {
  const StageSentencePart({super.key, required this.part});

  final Fragment$StagePart part;

  @override
  State<StageSentencePart> createState() => _StageSentencePartState();
}

class _StageSentencePartState extends State<StageSentencePart> {
  Fragment$StagePart get part => widget.part;

  List<Fragment$StageSentence> get sentences => part.sentences!;

  // ignore: unused_field
  final Map<int, Set<_Interaction>> _interactions = {};

  // ignore: unused_field
  String? _definition;
  // ignore: unused_field
  List<String>? _examples;
  // ignore: unused_field
  String? _practiceId;

  void _markInteraction(int index, _Interaction type) {
    setState(() {
      if (!_interactions.containsKey(index)) {
        _interactions[index] = {};
      }
      _interactions[index]!.add(type);
    });
  }

  bool _hasInteraction(int index, _Interaction type) {
    return _interactions[index]?.contains(type) ?? false;
  }

  int interactionCount(int index) {
    return _interactions[index]?.length ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: AppSpacing.sm,
            children: List.generate(sentences.length, (i) {
              final c = interactionCount(i);
              final icon = switch (c) {
                0 => Icons.check_circle_outline,
                1 => Icons.check_circle,
                _ => Icons.check_circle,
              };

              final color = switch (c) {
                0 => AppColors.textSecondary,
                1 => AppColors.warning,
                _ => AppColors.success,
              };

              return AppCard(
                onTap:
                    () => StageSentenceBottomSheet.show(context, sentences[i]),

                title: Row(
                  spacing: AppSpacing.sm,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: color),
                    Expanded(child: Text(sentences[i].sentence)),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class StageSentenceBottomSheet extends StatefulWidget {
  const StageSentenceBottomSheet({super.key, required this.sentence});

  final Fragment$StageSentence sentence;

  static Future<void> show(
    BuildContext context,
    Fragment$StageSentence sentence,
  ) async {
    return showModalBottomSheet(
      context: context,
      builder: (context) => StageSentenceBottomSheet(sentence: sentence),
    );
  }

  @override
  State<StageSentenceBottomSheet> createState() =>
      _StageSentenceBottomSheetState();
}

class _StageSentenceBottomSheetState extends State<StageSentenceBottomSheet> {
  Fragment$StageSentence get sentence => widget.sentence;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: responsive.containerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            spacing: AppSpacing.sm,
            children: [
              Expanded(child: Text(sentence.sentence, style: typo.bodyMedium)),

              // Pronunciation button
              AppButton(
                variant: AppButtonVariant.outlined,
                onPressed: (_) {
                  // TODO: Play pronunciation
                },
                title: Icon(Icons.volume_up),
              ),

              // Translation button
              AppButton(
                variant: AppButtonVariant.danger,
                onPressed: (_) {
                  // TODO: Show translation
                },
                title: Icon(Icons.translate),
              ),
            ],
          ),

          SizedBox(height: 16),

          AppCard(
            scaleOnHover: false,
            title: Column(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: typo.bodyLarge.copyWith(color: AppColors.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: AppSpacing.sm,
                    children: [
                      Icon(Icons.book, color: AppColors.primary),
                      Text("Study"),
                    ],
                  ),
                ),

                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    // Generate definition
                    AppButton(
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Row(
                        spacing: AppSpacing.sm,
                        children: [
                          Icon(Icons.auto_stories),
                          Text("Parse"),
                          // AI Generation button
                          Icon(
                            FontAwesome5.minus_square,
                            size: 10,
                            color: AppColors.onPrimary.op(.4),
                          ),
                        ],
                      ),
                    ),

                    // Generate examples
                    AppButton(
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Row(
                        spacing: AppSpacing.sm,
                        children: [
                          Icon(Icons.format_quote),
                          Text("Use Cases"),
                          // AI Generation button
                          Icon(
                            FontAwesome5.minus_square,
                            size: 10,
                            color: AppColors.onPrimary.op(.4),
                          ),
                        ],
                      ),
                    ),

                    // Generate practice
                    AppButton(
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Row(
                        spacing: AppSpacing.sm,
                        children: [
                          Icon(Icons.psychology),
                          Text("Practice"),
                          // AI Generation button
                          Icon(
                            FontAwesome5.minus_square,
                            size: 10,
                            color: AppColors.onPrimary.op(.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Test
          AppCard(
            scaleOnHover: false,
            title: Column(
              spacing: AppSpacing.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(
                  style: typo.bodyLarge.copyWith(color: AppColors.primary),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: AppSpacing.sm,
                    children: [
                      Icon(Icons.check_circle, color: AppColors.primary),
                      Text("Test"),
                    ],
                  ),
                ),

                Row(
                  spacing: AppSpacing.sm,
                  children: [
                    Text("Pronunciation", style: typo.bodyLarge),
                    Spacer(),

                    // Listen button
                    AppButton(
                      variant: AppButtonVariant.outlined,
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Icon(Icons.volume_up),
                    ),

                    AppButton(
                      variant: AppButtonVariant.outlined,
                      onPressed: (_) {
                        // TODO: Show study
                      },
                      title: Text("Record"),
                    ),
                  ],
                ),

                Divider(
                  color: AppColors.textSecondary,
                  height: 5,
                  thickness: .5,
                ),

                Column(
                  spacing: AppSpacing.sm,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Knowledge", style: typo.bodyLarge),
                    AppTextFormField(
                      hint:
                          "Write translation, summary or rewrite in different ways to show your knowledge...",
                      maxLines: 4,
                      minLines: 2,
                      onChanged: (value) {
                        // TODO: Validate input
                      },
                    ),
                    Row(
                      spacing: AppSpacing.sm,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppButton(
                          onPressed: (_) {
                            // TODO: Show study
                          },
                          title: Text("Check"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MaterialCard extends StatefulWidget {
  const _MaterialCard({required this.material});

  final MaterialController material;

  static Widget withId(String id) {
    final future = Api.queries.material(id);

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final material = snapshot.data!;
          return _MaterialCard(
            material: MaterialController(material: material),
          );
        }
        return Center(child: AIIndicator(size: 16));
      },
    );
  }

  @override
  State<_MaterialCard> createState() => __MaterialCardState();
}

class __MaterialCardState extends State<_MaterialCard> with Slot {
  bool get isCreating => widget.material.isCreating;

  @override
  void initState() {
    super.initState();
    if (isCreating) {
      widget.material.fetchDetailed();
    }
    widget.material.addSlot(this);
  }

  @override
  void dispose() {
    widget.material.removeSlot(this);
    super.dispose();
  }

  @override
  void onValue(value) {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isCreating) {
      return Column(children: [AIIndicator(size: 16), Text("Generating...")]);
    }

    final description = widget.material.description;
    final title = widget.material.title;

    Widget child = AppCard(
      onTap: () => context.material(widget.material.id),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSpacing.sm,
        children: [
          Tooltip(
            message: description,
            child: Text(
              description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      title: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, maxLines: 2),
          Text(
            widget.material.type.name,
            style: TextStyle(fontSize: 10),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );

    // if (widget.material.unseenFeedbacksCount > 0) {
    //   child = Stack(
    //     clipBehavior: Clip.none,
    //     children: [
    //       Positioned.fill(child: child),
    //       Positioned(
    //         top: -10,
    //         right: -10,
    //         height: 20,
    //         width: 20,
    //         child: Container(
    //           padding: EdgeInsets.all(2),
    //           decoration: BoxDecoration(
    //             color: AppColors.error,
    //             shape: BoxShape.circle,
    //           ),
    //           alignment: Alignment.center,
    //           child: AutoSizeText(
    //             widget.material.unseenFeedbacksCount.toString(),
    //             style: TextStyle(color: Colors.white, fontSize: 16),
    //             maxLines: 1,
    //             minFontSize: 8,
    //             maxFontSize: 20,
    //             overflow: TextOverflow.ellipsis,
    //           ),
    //         ),
    //       ),
    //     ],
    //   );
    // }

    return child;
  }
}

class _PathBackgroundPainter extends CustomPainter {
  final EdgeInsets padding;
  final Size size;
  final double crossAxisSpace;
  final double mainAxisExtent;
  final double mainAxisSpacing;
  final double scrollOffset;
  final int itemCount;

  _PathBackgroundPainter({
    required this.padding,
    required this.size,
    required this.crossAxisSpace,
    required this.mainAxisExtent,
    required this.mainAxisSpacing,
    required this.scrollOffset,
    required this.itemCount,
  });

  Size get drawingSize => Size(
    size.width - padding.left - padding.right,
    size.height - padding.top - padding.bottom,
  );

  Offset get drawingOffset => padding.topLeft;

  double get drawingWidth => (drawingSize.width - (crossAxisSpace * 2)) / 3;

  double getX(int index) {
    final x = drawingWidth * index + (crossAxisSpace * index);
    return x + drawingOffset.dx + (drawingWidth / 2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = AppColors.primary.op(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 20;

    final x1 = getX(0);
    final x2 = getX(1);
    final x3 = getX(2);

    final yStart = -50.0;
    final yEnd = size.height + 50.0;

    final path1 =
        Path()
          ..moveTo(x1, yStart)
          ..lineTo(x1, yEnd);

    canvas.drawPath(path1, paint);

    final path2 =
        Path()
          ..moveTo(x2, yStart)
          ..lineTo(x2, yEnd);

    canvas.drawPath(path2, paint);

    final path3 =
        Path()
          ..moveTo(x3, yStart)
          ..lineTo(x3, yEnd);

    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant _PathBackgroundPainter oldDelegate) =>
      oldDelegate.size != size ||
      oldDelegate.padding != padding ||
      oldDelegate.crossAxisSpace != crossAxisSpace ||
      oldDelegate.scrollOffset != scrollOffset ||
      oldDelegate.itemCount != itemCount;
}

class _ArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offset = Offset(size.width / 2, size.height / 2);

    final paint =
        Paint()
          ..color = AppColors.primary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3;

    final path =
        Path()
          ..moveTo(offset.dx - 10, offset.dy + 4)
          ..lineTo(offset.dx, offset.dy - 6)
          ..lineTo(offset.dx + 10, offset.dy + 4);

    canvas.drawPath(path, paint);

    final secondPath = path.shift(Offset(0, 6));
    canvas.drawPath(secondPath, paint);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class WithArrow extends StatelessWidget {
  const WithArrow({super.key, required this.child, required this.height});

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPaint(
          painter: _ArrowPainter(),
          child: SizedBox(height: height, width: double.infinity),
        ),
        Expanded(child: SizedBox(width: double.infinity, child: child)),
      ],
    );
  }
}


/**
The user Mehmet is learning English (US). User's main language is Turkish. All user facing texts MUST be in English (US).
   Progress:
      Levels:
         grammar: 40%
         listening: Unknown
         reading: Unknown
         speaking: 35%
         vocabulary: 45%
         writing: 40%
      Observations:
         General:
               Sentence structures are basic but functional
               Uses simple vocabulary appropriate for daily communication
               Some grammar errors but meaning remains clear
               Motivated by career advancement goals
               Software developer with specific learning purpose
               Able to express thoughts but with limited complexity
               Limited detail in personal introduction
               Shows self-awareness about career goals and language barriers
               Demonstrates basic but functional writing skills
         Weak Points:
               Article usage errors (missing 'a' before 'software developer')
               Subject-verb agreement issues ('My english not enough')
               Limited sentence complexity and variety
               Basic vocabulary range
               Needs improvement in verb tenses
               Limited speaking evidence available
               Spelling errors ('sofware' instead of 'software')
               Missing copula/linking verb ('My english not enough' instead of 'My English is not enough')
               Limited sentence complexity in written response
         Strong Points:
               Clear communication of personal goals
               Able to express professional identity
               Good self-awareness of language needs
               Motivated learner with specific purpose
               Can construct simple sentences to convey meaning
               Understands question prompts and responds appropriately
               Clear career motivation for language learning
               Concise expression of goals
   Description: Welcome to your first focused English learning stage! In this stage, you'll develop essential communication skills for everyday situations. We'll strengthen your vocabulary, improve your grammar with a focus on articles and verb tenses, and build your confidence in expressing yourself. Through interactive activities, you'll practice constructing more complex sentences and expand your ability to communicate effectively in professional and casual settings.
   Skills: grammar, vocabulary, speaking, writing
   Areas: article usage, present tense verbs, sentence structure, professional vocabulary, everyday conversation
   Topics: technology and software, workplace communication, daily routines, professional introductions, describing projects
Generation Instruction::
   Will be improved: reading, writing, sentence structure
   Will be measured: writing, grammar
   Instruction: Create a short story (250-300 words) about a day in the life of a software developer, including morning routine, commute, workplace interactions, and a team meeting. The story should use varied sentence structures with a mix of simple and compound sentences. After the story, include 5 comprehension questions and 3 writing prompts. The writing prompts should ask the user to describe their own daily routine, explain a project they're working on, and write about their ideal workplace environment. Evaluate the user's responses for appropriate article usage, correct present tense verbs, and sentence complexity.
All user-facing fields (except picture prompts) must be in the target language (English (US)).
 */