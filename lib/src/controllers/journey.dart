import 'package:api/api.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:user_data/user_data.dart';

final journeyController = _JourneyController();

enum AIModels {
  gpt4o("gpt-4o"),
  gpt4oMini("gpt-4o-mini");

  const AIModels(this.dbName);
  final String dbName;
}

class _JourneyController extends VoidSignal {
  _JourneyController._();
  static final _JourneyController _instance = _JourneyController._();
  factory _JourneyController() => _instance;

  Fragment$DetailedJourney? _journey;

  Fragment$DetailedJourney get journey => _journey!;

  Fragment$DetailedPath? _initPath;
  List<Fragment$DetailedMaterial>? _initMaterials;

  List<Fragment$DetailedMaterial> get initMaterials => _initMaterials!;

  bool get hasInitMaterials => _initMaterials != null;

  List<Fragment$DetailedPath> get paths {
    if (_initPath != null) {
      return [_initPath!];
    }
    return journey.paths.where((e) => e.isActive).toList();
  }

  bool _initialized = false;

  bool get initialized => _initialized;

  Future<void> setJourney(Fragment$Journey journey) async {
    final detailedJourney = await Api.queries.journey(journey.id);
    _journey = detailedJourney;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lastJourneyId", journey.id);
    emit();
  }

  bool get hasJourney => _journey != null;

  void clearJourney() {
    _journey = null;
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove("lastJourneyId");
    });
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
    required AIModels model,
  }) async {
    final journey = await Api.mutations.createJourney(
      CreateJourneyInput(
        input: Input$CreateJourneyInput(
          to: to,
          name: name,
          avatar: avatar.asHslInput!,
          model: model.dbName,
        ),
      ),
    );

    setJourney(journey.journey);

    _initPath = journey.path;
    _initMaterials = journey.materials;

    return journey.journey;
  }
}
