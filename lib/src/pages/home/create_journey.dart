import 'dart:async';

import 'package:api/api.dart';
import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_app/src/scaffolds/app_scaffold.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class CreateJourneyPage extends StatefulWidget {
  const CreateJourneyPage({super.key});

  @override
  State<CreateJourneyPage> createState() => _CreateJourneyPageState();
}

class _CreateJourneyPageState extends State<CreateJourneyPage>
    with ResponsivePageMixin {
  final to = Signal<Enum$SupportedLanguage?>(Enum$SupportedLanguage.en_US);
  final name = Signal<String>("test");
  final avatar = Signal<Avatar>(Avatar.fromString(randomColor()));
  final model = Signal<AIModels>(AIModels.gpt4o);
  final valid = Signal<bool>(true);

  final pageController = PageController();
  final currentPage = Signal<int>(0);

  final form = GlobalKey<AppFormState>();

  void _validate() {
    switch (currentPage.value) {
      case 0:
        valid.value = to.value != null;
        break;
      case 1:
        valid.value = true;
        break;
      case 2:
        valid.value = name.value.isNotEmpty;
        break;
      case 3:
        valid.value = true;
        break;
    }
  }

  void _previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage.value--;
      _validate();
    }
  }

  FutureOr<void> _nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      currentPage.value++;
      _validate();
    } else {
      return Future(_createJourney);
    }
  }

  Future<void> _createJourney() async {
    try {
      final journey = await journeyController.createJourney(
        to: to.value!,
        name: name.value,
        avatar: avatar.value,
        model: model.value,
      );

      if (journey != null && context.mounted) {
        if (mounted) context.journeyInitial();
      }
    } catch (_) {}
  }

  late final MultiSignal multi;

  @override
  void initState() {
    multi = [to, name, model].multiSignal;
    multi.addSlot(
      SlotWithHandler((a) {
        _validate();
      }),
    );
    _validate();
    super.initState();
  }

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
        ...Enum$SupportedLanguage.values.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: AppSelectCard<Enum$SupportedLanguage?>(
              value: e,
              signal: to,
              title: e.name,
              onTap: () {
                to.value = e;
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAIModel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Choose Your AI Model",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: AppSpacing.lg),
        ...AIModels.values.map(
          (e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: AppSelectCard<AIModels?>(
              value: e,
              signal: model,
              title: e.name,
              onTap: () {
                model.value = e;
              },
            ),
          ),
        ),
      ],
    );
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
              child: PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildTargetLanguage(),
                  _buildAIModel(),
                  _buildJourneyName(config),
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
                          page > 0
                              ? AppButton(
                                isActive: true,
                                variant: AppButtonVariant.text,
                                onPressed: _previousPage,
                                title: Text("Back"),
                              )
                              : SizedBox(),
                    ),
                    Spacer(),
                    valid.builder((v) {
                      return currentPage.builder(
                        (page) => AppButton(
                          isActive: v,
                          onPressed: () async => await _nextPage(),
                          title: Text(page == 2 ? "Create Journey" : "Next"),
                        ),
                      );
                    }),
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
