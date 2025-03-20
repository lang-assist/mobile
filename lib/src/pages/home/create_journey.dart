import 'dart:async';
import 'dart:math';

import 'package:api/api.dart';
import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_app/src/scaffolds/app_scaffold.dart';
import 'package:assist_app/src/widgets/components/record.dart';
import 'package:flutter/material.dart';
import 'package:gql_data/gql_data.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';

class CreateJourneyPage extends StatefulWidget {
  const CreateJourneyPage({super.key});

  @override
  State<CreateJourneyPage> createState() => _CreateJourneyPageState();
}

enum _Pages {
  mainLanguage,
  targetLanguage,
  aiModel,
  //journeyName,
  initTest,
  introduction,
}

class _CreateJourneyPageState extends State<CreateJourneyPage>
    with ResponsivePageMixin {
  final to = Signal<Fragment$DetailedSupportedLanguage?>(null);
  final from = Signal<Fragment$SupportedLocale?>(null);
  final name = Signal<String>("test");
  final avatar = Signal<Avatar>(Avatar.fromString(randomColor()));
  final model = Signal<Fragment$ModelSet?>(null);
  final valid = Signal<bool>(true);

  var supportedLanguages = <Fragment$DetailedSupportedLanguage>[];
  var supportedLocales = <Fragment$SupportedLocale>[];

  final pageController = PageController();
  final currentPage = Signal<_Pages>(_Pages.mainLanguage);

  final form = GlobalKey<AppFormState>();

  void _validate() {
    switch (currentPage.value) {
      case _Pages.mainLanguage:
        valid.value = from.value != null;
        break;
      case _Pages.targetLanguage:
        valid.value = to.value != null;
        break;
      case _Pages.aiModel:
        valid.value = model.value != null;
        break;
      // case _Pages.journeyName:
      //   valid.value = name.value.isNotEmpty;
      //   break;
      case _Pages.initTest:
        valid.value =
            referenceText.value != null &&
            (recording.value != null || repating.value.isNotEmpty);
        break;
      case _Pages.introduction:
        valid.value = introduction.value.isNotEmpty;
        break;
    }
  }

  void _previousPage(_) {
    if (currentPage.value.index > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage.value = _Pages.values[currentPage.value.index - 1];
      _validate();
    }
  }

  FutureOr<void> _nextPage() {
    if (currentPage.value.index < _Pages.values.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage.value = _Pages.values[currentPage.value.index + 1];
      _validate();
    } else {
      return Future(_createJourney);
    }
  }

  Future<void> _createJourney() async {
    try {
      final journey = await journeyController.createJourney(
        to: to.value!.tag,
        from: from.value!.tag,
        name: name.value,
        avatar: avatar.value,
        modelSetId: model.value!.id,
        referenceText: referenceText.value!,
        description: description.value.isNotEmpty ? description.value : null,
        introduction: introduction.value.isNotEmpty ? introduction.value : null,
        recording: recording.value,
        repating: repating.value.isNotEmpty ? repating.value : null,
      );

      if (journey != null && context.mounted) {
        if (mounted) context.journey();
      }
    } catch (_) {}
  }

  var referenceText = Signal<String?>(null);
  var description = Signal<String>("");
  var introduction = Signal<String>("");
  var recording = Signal<Uint8List?>(null);
  var repating = Signal<String>("");

  late final MultiSignal multi;

  late final List<Fragment$ModelSet> modelSets;

  Signal<bool> fetchingModelSets = Signal(true);

  @override
  void initState() {
    multi =
        [
          from,
          to,
          name,
          model,
          recording,
          repating,
          introduction,
          canRead,
        ].multiSignal;
    multi.addSlot(
      SlotWithHandler((a) {
        _validate();
      }),
    );
    _validate();
    Api.queries.modelSets().then((value) {
      modelSets = value;
      fetchingModelSets.value = false;
    });
    _fetchSupportedLanguages();
    super.initState();
  }

  Future<void> _fetchSupportedLanguages() async {
    supportedLanguages = await Api.queries.supportedLanguages();
    supportedLocales = await Api.queries.supportedLocales();
    setState(() {});
  }

  Signal<bool> submitGroupActive = Signal(true);

  @override
  void dispose() {
    multi.dispose();
    pageController.dispose();
    super.dispose();
  }

  Widget _buildTargetLanguage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select Your Target Language",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppSpacing.lg),
        ...supportedLanguages.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: AppSelectCard<Fragment$DetailedSupportedLanguage?>(
              value: e,
              signal: to,
              title: e.name,
              onTap: () {
                to.value = e;
                name.value = e.name;
                final arr = e.sentences_to_translate;
                referenceText.value = arr[Random().nextInt(arr.length)];
                _nextPage();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainLanguage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select Your Main Language",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppSpacing.lg),
        ...supportedLocales.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: AppSelectCard<Fragment$SupportedLocale?>(
              value: e,
              signal: from,
              title: e.name,
              onTap: () {
                from.value = e;
                _nextPage();
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAIModel() {
    return fetchingModelSets.builder((v) {
      if (v) {
        return const Center(child: CircularProgressIndicator());
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Choose Your AI Model",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: AppSpacing.lg),
          ...modelSets.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: AppSelectCard<Fragment$ModelSet?>(
                value: e,
                signal: model,
                title: e.name,
                onTap: () {
                  model.value = e;
                  _nextPage();
                },
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildJourneyName(ResponsiveConfig config) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Identify Your Journey",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppSpacing.lg),
        avatar.builder((a) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: config.pagePadding.horizontal,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImggenUserAvatar(avatar: a, size: 100),
                SizedBox(width: AppSpacing.md),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      avatar.value = Avatar.fromString(randomColor());
                    },
                    child: Text("Change Avatar"),
                  ),
                ),
              ],
            ),
          );
        }),
        SizedBox(height: AppSpacing.lg),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: config.pagePadding.horizontal,
          ),
          child: AppTextFormField(label: "Journey name", signal: name),
        ),
        SizedBox(height: AppSpacing.sm),
      ],
    );
  }

  Signal<bool> canRecord = Signal(true);
  Signal<bool> canRead = Signal(true);

  Widget _buildInitTest() {
    return [referenceText, canRecord, canRead].multiSignal.builder((_) {
      if (referenceText.value == null) {
        return const SizedBox.shrink();
      }
      return Center(
        child: SingleChildScrollView(
          padding: responsive.pagePadding,
          child: Column(
            spacing: AppSpacing.sm,
            children: [
              Text(
                "We have some starter questions for a more personalized learning journey. It will take just a moment!",
                style: typo.bodyLarge.copyWith(fontWeight: FontWeight.normal),
              ),

              Text(
                referenceText.value!,
                style: typo.headlineMedium.copyWith(
                  fontWeight: FontWeight.normal,
                  color: AppColors.primary,
                ),
              ),

              Text("Please repeat the sentence above with your voice."),
              AppButton(
                variant: AppButtonVariant.text,
                onPressed: (_) {
                  canRecord.value = false;
                },
                title: Text(
                  "You can't record ?",
                  textAlign: TextAlign.center,
                  style: typo.bodyMedium.copyWith(color: AppColors.textHint),
                ),
              ),
              RecordWidget(
                size: AppSpacing.xxl,
                onRecordComplete: (r) {
                  recording.value = r;
                },
              ),

              if (!canRecord.value) ...[
                AppTextFormField(label: "Repeat", signal: repating),
              ],
              Text(
                "You can't read ${to.value!.name} ?",
                style: typo.hint.bodyMedium,
              ),
              AppButton(
                isGroupActive: submitGroupActive,
                onPressed: (pr) async {
                  Future.delayed(Duration(seconds: 1)).then((_) {
                    pr("Starting from scratch...");
                  });
                  Future.delayed(Duration(seconds: 2)).then((_) {
                    pr("Almost done...");
                  });
                  await _createJourney();
                  pr("Done");
                  Future.delayed(Duration(seconds: 1)).then((_) {
                    pr(null);
                  });
                },
                title: Text("Start from stratch", textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildIntroduction() {
    return AppTextFormField(
      label: "Introduction",
      signal: introduction,
      maxLines: 5,
      minLines: 2,
      hint:
          "Please introduce yourself, your name, age, etc. If you can, please write your goals and expectations for this journey.",
    );
  }

  @override
  Widget buildResponsive(BuildContext context, ResponsiveConfig config) {
    return UserScaffold(
      title: "Create a journey",
      showBackButton: true,
      body: AppForm(
        key: form,
        child: Column(
          children: [
            Expanded(
              child: Column(
                spacing: AppSpacing.md,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  [from, to, model].multiSignal.builder((c) {
                    final buf = <TextSpan>[];

                    if (from.value != null) {
                      buf.add(
                        TextSpan(
                          text: from.value!.name,
                          style: typo.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    if (to.value != null) {
                      buf.add(TextSpan(text: "  >>  "));
                      buf.add(
                        TextSpan(
                          text: to.value!.name,
                          style: typo.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                      buf.add(TextSpan(text: ". "));
                    }

                    if (model.value != null) {
                      buf.add(TextSpan(text: "Powered by "));
                      buf.add(
                        TextSpan(
                          text: model.value!.name,
                          style: typo.bodyMedium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }

                    return Padding(
                      padding: responsive.pagePadding,
                      child: RichText(
                        text: TextSpan(
                          children: buf,
                          style: typo.bodyMedium.copyWith(),
                        ),
                      ),
                    );
                  }),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _buildMainLanguage(),
                        _buildTargetLanguage(),
                        _buildAIModel(),
                        //_buildJourneyName(config),
                        _buildInitTest(),
                        _buildIntroduction(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: Row(
                  children: [
                    currentPage.builder(
                      (page) =>
                          page.index > 0
                              ? AppButton(
                                variant: AppButtonVariant.text,
                                onPressed: _previousPage,
                                title: Text("Back"),
                              )
                              : SizedBox(),
                    ),
                    Spacer(),
                    AppButton(
                      isActive: valid,
                      isGroupActive: submitGroupActive,
                      onPressed: (_) async => await _nextPage(),
                      title: currentPage.builder((page) {
                        return Text(
                          page.index == _Pages.values.length - 1
                              ? "Create Journey"
                              : "Next",
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
