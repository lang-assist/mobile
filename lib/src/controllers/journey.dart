import 'dart:async';

import 'package:api/api.dart';
import 'package:assist_app/src/controllers/path.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

final journeyController = _JourneyController();

// enum AIModels {
//   gpt4oAssistant("gpt-4o-assistant"),
//   gpt4oMiniAssistant("gpt-4o-mini-assistant"),
//   gpt4o("gpt-4o"),
//   gptO1("gpt-o1"),
//   gptO1Mini("gpt-o1-mini"),
//   claudeSonnet("claude-sonnet"),
//   deepseekReasoner("DeepSeek-R1");

//   const AIModels(this.dbName);
//   final String dbName;
// }

class _JourneyController extends VoidSignal {
  _JourneyController._();
  static final _JourneyController _instance = _JourneyController._();
  factory _JourneyController() => _instance;

  bool _fetchingJourney = false;

  bool get fetchingJourney => _fetchingJourney;

  Fragment$DetailedJourney? _journey;

  Fragment$DetailedJourney get journey => _journey!;

  PathController? _pathController;

  PathController get pathController => _pathController!;

  bool _initialized = false;

  bool get initialized => _initialized;

  Future<void> _setPath(Fragment$DetailedPath path) async {
    _pathController = PathController(path);
    if (path.type == Enum$PathType.INITIAL) {
      await _pathController!.fetchMaterials();
    }
    emit();
  }

  Future<void> setJourney(Fragment$Journey journey) async {
    final detailedJourney = await Api.queries.journey(journey.id);
    _journey = detailedJourney;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lastJourneyId", journey.id);
    final activePaths =
        detailedJourney!.paths.where((path) => path.isActive).toList();
    await _setPath(activePaths.first);
    emit();
  }

  void setJourneyWithId(String id, {Completer? completer}) {
    _fetchingJourney = true;
    Api.queries.journey(id).then((journey) {
      _journey = journey;
      _setPath(journey!.paths.first);
      _fetchingJourney = false;
      completer?.complete();
      emit();
    });
  }

  bool get hasJourney => _journey != null;

  void clearJourney() {
    _journey = null;
    _pathController = null;
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove("lastJourneyId");
    });
    emit();
  }

  Future<void> refresh() async {
    final journey = await Api.queries.journey(this.journey.id);
    _journey = journey;
    if (journey!.paths.isNotEmpty) {
      _pathController = PathController(journey.paths.first);
    }
    emit();
  }

  Future<void> init() async {
    if (_initialized) return;

    _initialized = true;
    try {
      final journey = await getLastJourney();
      if (journey != null) {
        await setJourney(journey);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      clearJourney();
    }
    emit();
  }

  Future<Fragment$DetailedJourney?> getLastJourney() async {
    final prefs = await SharedPreferences.getInstance();
    final lastJourneyId = prefs.getString("lastJourneyId");

    if (lastJourneyId == null) return null;

    try {
      final journey = await Api.queries.journey(lastJourneyId);
      return journey;
    } catch (e) {
      await prefs.remove("lastJourneyId");
      return null;
    }
  }

  Future<Fragment$DetailedJourney?> createJourney({
    required Enum$SupportedLanguage to,
    required String name,
    required Avatar avatar,
    required String modelSetId,
  }) async {
    final journey = await Api.mutations.createJourney(
      CreateJourneyInput(
        input: Input$CreateJourneyInput(
          to: to,
          name: name,
          avatar: avatar.asHslInput!,
          modelSet: modelSetId,
        ),
      ),
    );

    await setJourney(journey.journey);

    return journey.journey;
  }

  Future<Fragment$Material> waitMaterial(String id) async {
    final material = await Api.queries.detailedMaterial(id);

    return material;
  }
}
