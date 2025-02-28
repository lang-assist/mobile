import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/pages/content/material_builder.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_app/src/scaffolds/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

class InitialTestPage extends StatefulWidget {
  const InitialTestPage({super.key});

  @override
  State<InitialTestPage> createState() => _InitialTestPageState();
}

class _InitialTestPageState extends State<InitialTestPage> {
  Future<void> _submitAnswer(int index, dynamic answer) async {
    final res = await Api.mutations.answerMaterial(materials[index].id, answer);

    if (res.next == Enum$AnswerMaterialResponseNext.INITIAL_END) {
      await journeyController.refresh();

      if (mounted) {
        context.journey(journeyController.journey);
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
    super.initState();
  }

  // void _onDontUnderstand() async {
  //   final pathId = _path!.id;
  //   setState(() {
  //     _fetchingPath = true;
  //     _path = null;
  //     _materials = null;
  //   });

  //   await Api.mutations.unUnderstoodQuestions(
  //     journeyController.journey.id,
  //     pathId,
  //   );

  //   _fetchPath();
  // }

  final pageController = PageController();
  final currentPage = Signal<int>(0);
  final answers = <int, dynamic>{};

  List<MaterialController> get materials =>
      journeyController.pathController.materials
          .where((m) => m.completionStatus != Enum$MaterialCompStatus.COMPLETED)
          .toList();

  @override
  Widget build(BuildContext context) {
    // print(materials);
    return UserScaffold(
      title: "Initial Test",
      body: Column(
        children: [
          Flexible(
            child:
                journeyController.fetchingJourney
                    ? const Center(child: CircularProgressIndicator())
                    : PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        currentPage.value = index;
                      },
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        for (var i = 0; i < materials.length; i++)
                          MaterialBuilder(
                            material: materials[i],
                            onValid: (valid) {
                              currentPage.value = i;
                            },
                            // onDontUnderstand: _onDontUnderstand,
                            showDontUnderstand: true,
                            onSubmit: (answer) async {
                              await _submitAnswer(i, answer);
                            },
                          ),
                      ],
                    ),
          ),
        ],
      ),
    );
  }
}
