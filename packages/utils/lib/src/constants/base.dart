import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_flutter/sign_flutter.dart';
import '../../utils.dart';

part 'animation.dart';
part 'app_colors.dart';
part 'app_theme.dart';
part 'app_typography.dart';
part "app_spacing.dart";
part 'icons.dart';

ThemeProvider get _theme => ThemeProvider.instance;

class ThemeProvider {
  ThemeProvider._();
  static final ThemeProvider _instance = ThemeProvider._();
  static ThemeProvider get instance => _instance;

  Signal<Brightness> brightness = Signal<Brightness>(Brightness.light);

  Brightness get currentBrightness => brightness.value;

  bool get isDark => currentBrightness == Brightness.dark;

  bool themeSelected = false;

  Future<void> init() async {
    final saved = await SharedPreferences.getInstance().then(
      (prefs) => prefs.getBool('isDark'),
    );

    if (saved != null) {
      brightness.value = saved ? Brightness.dark : Brightness.light;
      themeSelected = true;
    } else {
      brightness.value = Brightness.light;
    }
  }

  Future<void> setBrightness(Brightness value) async {
    await SharedPreferences.getInstance().then(
      (prefs) => prefs.setBool('isDark', value == Brightness.dark),
    );
    themeSelected = true;
    brightness.value = value;
  }

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? _context;

  BuildContext get context => _context ?? navigatorKey.currentContext!;

  set context(BuildContext value) {
    _context = value;
  }
}
