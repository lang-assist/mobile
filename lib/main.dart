import 'package:api/api.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:assist_app/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ApiWrapper(
      child: MaterialApp.router(
        title: 'Berber',
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
