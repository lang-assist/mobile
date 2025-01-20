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

  final form = GlobalKey<AppFormState>();

  final fromExpansion = ExpansionTileController();
  final toExpansion = ExpansionTileController();
  final modelExpansion = ExpansionTileController();

  final valid = Signal<bool>(true);

  final model = Signal<AIModels>(AIModels.gpt4o);

  void _validate() {
    valid.value = to.value != null && name.value.isNotEmpty;
  }

  late final MultiSignal multi;

  @override
  void initState() {
    multi = [to, name].multiSignal;
    multi.addSlot(
      SlotWithHandler((a) {
        _validate();
      }),
    );

    super.initState();
  }

  @override
  void dispose() {
    multi.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ResponsiveConfig config) {
    return UserScaffold(
      title: "Create a journey",
      showBackButton: true,
      body: AppForm(
        key: form,
        child: SingleChildScrollView(
          child: Column(
            spacing: AppSpacing.md,
            children: [
              ExpansionTile(
                controller: toExpansion,
                initiallyExpanded: true,
                title: Text("Your Target Language"),
                children: [
                  ...Enum$SupportedLanguage.values.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: AppSelectCard<Enum$SupportedLanguage?>(
                        value: e,
                        selected: to,
                        title: e.name,
                        onTap: () {
                          toExpansion.collapse();
                        },
                      ),
                    ),
                  ),
                ],
              ),

              ExpansionTile(
                controller: modelExpansion,
                title: Text("Your AI Model"),
                children: [
                  ...AIModels.values.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: AppSelectCard<AIModels?>(
                        value: e,
                        selected: model,
                        title: e.name,
                        onTap: () {
                          modelExpansion.collapse();
                        },
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: config.pagePadding.horizontal,
                ),
                child: AppTextFormField(
                  label: "Name your journey",
                  signal: name,
                ),
              ),

              avatar.builder((a) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: config.pagePadding.horizontal,
                  ),
                  child: Row(
                    children: [
                      ImggenUserAvatar(avatar: a, size: 50),
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

              valid.builder((v) {
                return AppButton(
                  isActive: v,
                  onPressed: () async {
                    try {
                      final journey = await journeyController.createJourney(
                        to: to.value!,
                        name: name.value,
                        avatar: avatar.value,
                        model: model.value,
                      );

                      print(journey);

                      if (journey != null) {
                        if (context.mounted) context.pushJourneyInitial();
                      }
                    } catch (e, s) {
                      print(e);
                      print(s);
                    }
                  },
                  title: Text("Create Journey"),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
