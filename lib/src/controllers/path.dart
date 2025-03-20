import 'package:gql_data/gql_data.dart';
import 'package:sign_flutter/sign_flutter.dart';

class MaterialController extends VoidSignal {
  MaterialController({
    Fragment$DetailedMaterial? detailed,
    Fragment$Material? material,
  }) {
    _detailed = detailed;
    _material = material;
  }

  Fragment$DetailedMaterial? _detailed;
  Fragment$Material? _material;

  int get unseenFeedbacksCount {
    if (isDetailed) {
      return _detailed!.aiFeedbacks.items.where((e) => !e.seen).length;
    }
    if (!isCreating) {
      return _material!.unseenAiFeedbacks;
    }

    throw Exception("Creating material has no feedbacks");
  }

  List<Fragment$AIFeedback> get feedbacks {
    if (!isDetailed) throw Exception("Material is not detailed");
    return _detailed!.aiFeedbacks.items;
  }

  Fragment$UserAnswer? get userAnswer {
    if (!isDetailed) throw Exception("Material is not detailed");
    return _detailed!.answer;
  }

  Fragment$MaterialDetails get details {
    if (isDetailed) return _detailed!.details!;
    throw Exception("Material is not detailed");
  }

  bool get isCreating {
    if (_detailed != null) {
      return _detailed!.genStatus == Enum$MaterialGenStatus.CREATING;
    }
    if (_material != null) {
      return _material!.genStatus == Enum$MaterialGenStatus.CREATING;
    }
    return false;
  }

  bool get isDetailed => _detailed != null;

  Signal<bool> get fetchingDetailed => Signal(false);

  Future<void> fetchDetailed() async {
    if (isDetailed) return;
    fetchingDetailed.value = true;
    final res = await Api.queries.detailedMaterial(_material!.id);
    _detailed = res;
    fetchingDetailed.value = false;
    emit();
  }

  String get id => _material?.id ?? _detailed!.id;

  String get stageId => _material?.stage_ID ?? _detailed!.stage_ID;

  String get partId => _material?.part_ID ?? _detailed!.part_ID;

  String get title => _material?.details?.title ?? _detailed!.details!.title;

  String get description =>
      _material?.details?.description ?? _detailed!.details!.description;

  Enum$MaterialType get type =>
      isCreating
          ? throw Exception("Creating material has no type")
          : (_detailed?.type ?? _material!.type!);

  Future<Fragment$Material> waitMaterial() async {
    if (isDetailed) return _detailed!;
    final res = await Api.queries.material(id);
    _material = res;
    emit();
    return res;
  }

  Future<void> answerMaterial(Map<String, dynamic> answer) async {
    if (!isDetailed) throw Exception("Material is not detailed");
    await Api.mutations.answerMaterial(id, stageId, partId, answer);
    emit();
  }

  List<Fragment$ConversationTurn> get turns {
    if (!isDetailed) throw Exception("Material is not detailed");
    return _detailed!.turns.items;
  }

  Future<void> refetch() async {
    final res = await Api.queries.detailedMaterial(id);
    _detailed = res;
    emit();
  }

  Enum$MaterialCompStatus get completionStatus {
    if (isCreating) return Enum$MaterialCompStatus.NOT_STARTED;
    if (isDetailed) return _detailed!.compStatus;
    return _material!.compStatus;
  }

  Enum$MaterialConvStatus get conversationStatus {
    if (isCreating) return Enum$MaterialConvStatus.NOT_STARTED;
    if (isDetailed) return _detailed!.convStatus;
    return _material!.convStatus;
  }

  Enum$MaterialGenStatus get generationStatus {
    if (isCreating) return Enum$MaterialGenStatus.CREATING;
    if (isDetailed) return _detailed!.genStatus;
    return _material!.genStatus;
  }
}

// class PathController extends VoidSignal {
//   PathController(this.path);

//   String get journeyId => journeyController.journey.id;

//   final Fragment$DetailedPath path;

//   String get id => path.id;

//   final List<MaterialController> _materials = [];

//   List<MaterialController> get materials => _materials;

//   late Input$PaginationInput pagination = _getPagination();

//   Fragment$PageInfo _pageInfo = Fragment$PageInfo(hasNextPage: true);

//   Fragment$PageInfo get pageInfo => _pageInfo;

//   Signal<bool> get fetchingMaterials => Signal(false);

//   Future<void> fetchMaterials() async {
//     if (fetchingMaterials.value) return;
//     fetchingMaterials.value = true;
//     final res = await Api.queries.materials(journeyId, path.id, pagination);
//     _materials.addAll(res.items.map((e) => MaterialController(material: e)));
//     pagination = pagination.copyWith(cursor: res.pageInfo.nextCursor);
//     _pageInfo = res.pageInfo;
//     fetchingMaterials.value = false;
//     emit();
//   }

//   setMaterials(List<Fragment$DetailedMaterial> materials) {
//     _materials.clear();
//     _materials.addAll(materials.map((e) => MaterialController(detailed: e)));
//     emit();
//   }

//   Future<void> fetchMoreMaterials() async {
//     if (fetchingMaterials.value) return;
//     fetchingMaterials.value = true;
//     await fetchMaterials();
//     fetchingMaterials.value = false;
//   }

//   Input$PaginationInput _getPagination() {
//     return Input$PaginationInput(limit: 10, sort: "createdAt:asc");
//   }

//   Future<void> refreshMaterials() async {
//     _materials.clear();
//     pagination = _getPagination();
//     await fetchMaterials();
//   }

//   MaterialController? getCreatingMaterial(String id) {
//     return _materials.firstWhere((e) {
//       if (e.isCreating) {
//         return e.id == id;
//       }
//       return false;
//     });
//   }
// }
