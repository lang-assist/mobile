import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/pages/content/material_builder.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_app/src/scaffolds/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gql_data/gql_data.dart';

class MaterialPageView extends StatefulWidget {
  const MaterialPageView({super.key});

  @override
  State<MaterialPageView> createState() => _MaterialPageViewState();
}

class _MaterialPageViewState extends State<MaterialPageView> {
  MaterialController? _material;

  String? _error;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _material ??= context.parameterValueByName<MaterialController>("material");
    if (_error != null) {
      return UserScaffold(title: "Error", body: Text(_error!));
    }
    if (_material == null) {
      return UserScaffold(
        title: "Loading",
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return UserScaffold(
      title: _material!.title,
      body: MaterialBuilder(
        material: _material!,
        onSubmit: (answer) async {
          await Api.mutations.answerMaterial(
            _material!.id,
            _material!.stageId,
            _material!.partId,
            answer,
          );
          if (context.mounted) context.pop();
        },
        onValid: (bool valid) {
          // _valid.value = valid;
        },
      ),
    );
  }
}
