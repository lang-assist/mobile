import 'package:api/api.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:assist_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:sign_flutter/sign_flutter.dart';

void main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  await ThemeProvider.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key _key = UniqueKey();

  @override
  void initState() {
    ThemeProvider.instance.brightness.addSlot(
      SlotWithHandler((_) {
        setState(() {
          _key = UniqueKey();
        });
      }),
    );
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (!ThemeProvider.instance.themeSelected &&
        ThemeProvider.instance.currentBrightness !=
            MediaQuery.of(context).platformBrightness) {
      ThemeProvider.instance.setBrightness(
        MediaQuery.of(context).platformBrightness,
      );
    }
    return ApiWrapper(
      child: MaterialApp.router(
        key: _key,
        title: 'Berber',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        darkTheme: AppTheme.dark,
        theme: AppTheme.light,
        themeMode:
            ThemeProvider.instance.currentBrightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
        themeAnimationStyle: AnimationStyle(
          duration: animationDuration,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}
