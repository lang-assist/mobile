import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/pages/content/material_builder.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_app/src/scaffolds/app_scaffold.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class InitialTestPage extends StatefulWidget {
  const InitialTestPage({super.key});

  @override
  State<InitialTestPage> createState() => _InitialTestPageState();
}

class _InitialTestPageState extends State<InitialTestPage> {
  Fragment$DetailedPath? _path;
  Fragment$DetailedPath get path => _path!;
  List<Fragment$DetailedMaterial>? _materials;
  List<Fragment$DetailedMaterial> get materials {
    return _materials!.where((mat) => mat.answer == null).toList();
  }

  bool _fetchingPath = false;

  Future<void> _submitAnswer(int index, dynamic answer) async {
    final res = await Api.mutations.answerMaterial(materials[index].id, answer);

    if (res.next == Enum$AnswerMaterialResponseNext.INITIAL_END) {
      if (mounted) {
        context.pushJourney(journeyController.journey.id);
      }
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    if (journeyController.hasJourney &&
        journeyController.paths.isNotEmpty &&
        journeyController.hasInitMaterials) {
      _fetchingPath = false;
      _path = journeyController.paths.first;
      _materials = journeyController.initMaterials;
    } else {
      _fetchingPath = true;
      _fetchPath();
    }

    super.initState();
  }

  void _fetchPath() async {
    final res = await Api.queries.initialPath(journeyController.journey.id);

    setState(() {
      _fetchingPath = false;
      _path = res.path;
      _materials = res.materials;
    });
  }

  void _onDontUnderstand() async {
    final pathId = _path!.id;
    setState(() {
      _fetchingPath = true;
      _path = null;
      _materials = null;
    });

    await Api.mutations.unUnderstoodQuestions(
      journeyController.journey.id,
      pathId,
    );

    _fetchPath();
  }

  // Future<void> createPath() async {
  //   final res = await Api.mutations.createInitialPath(
  //     journeyController.journey.id,
  //   );
  //   setState(() {
  //     _path = res.path;
  //     _contents = [res.content];
  //   });
  // }

  bool get hasInitialized => _path != null && _materials != null;

  final pageController = PageController();
  final currentPage = Signal<int>(0);

  final answers = <int, dynamic>{};

  bool showDebugButtons = false;

  @override
  Widget build(BuildContext context) {
    return UserScaffold(
      title: "Initial Test",
      body: Column(
        children: [
          SizedBox(height: 16),
          if (kDebugMode && showDebugButtons)
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                AppButton(
                  onPressed: () async {
                    await Api.mutations.resetJourney(
                      journeyController.journey.id,
                    );
                  },
                  title: const Text("Reset Journey"),
                ),
                AppButton(
                  onPressed: () async {
                    await Api.mutations.deleteTemp(1);
                  },
                  title: const Text("Delete Temp 1"),
                ),
                AppButton(
                  onPressed: () async {
                    await Api.mutations.deleteTemp(2);
                  },
                  title: const Text("Delete Temp 2"),
                ),
                AppButton(
                  onPressed: () async {
                    await Api.mutations.deleteTemp(3);
                  },
                  title: const Text("Delete Temp 3"),
                ),
              ],
            ),
          Flexible(
            child:
                _fetchingPath
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              spacing: 16,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (hasInitialized) ...[
                                  Expanded(
                                    child: PageView(
                                      controller: pageController,
                                      onPageChanged: (index) {
                                        currentPage.value = index;
                                      },
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      children: [
                                        for (
                                          var i = 0;
                                          i < materials.length;
                                          i++
                                        )
                                          MaterialBuilder(
                                            material: materials[i],
                                            onValid: (valid) {
                                              currentPage.value = i;
                                            },
                                            onDontUnderstand: _onDontUnderstand,
                                            showDontUnderstand: true,
                                            onSubmit: (answer) async {
                                              await _submitAnswer(i, answer);
                                            },
                                          ),
                                      ],
                                    ),
                                  ),
                                ] else ...[
                                  Text(
                                    "To start your journey, please start initial assessment.",
                                  ),
                                  Text(
                                    "This will take ~2 minutes.",
                                    style: TextTheme.of(context).labelSmall,
                                  ),
                                  // AppButton(
                                  //   onPressed: createPath,
                                  //   title: const Text("Let's Go!"),
                                  // ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
