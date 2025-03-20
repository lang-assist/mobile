import 'dart:async';

import 'package:api/api.dart';
import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/controllers/path.dart';
import 'package:assist_app/src/pages/content/material_page.dart';
import 'package:assist_app/src/pages/documentation.dart';
import 'package:assist_app/src/pages/home/create_journey.dart';
import 'package:assist_app/src/pages/showcase/theme_showcase.dart';
import 'package:assist_app/src/pages/auth/auth.dart';
import 'package:assist_app/src/pages/home/home.dart';
import 'package:assist_app/src/utils/device.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gql_data/gql_data.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';
import 'pages/home/journeys.dart';
import 'pages/splash.dart';
import 'pages/subs/subscriptions.dart';
import 'utils/auth.dart';

/// Rotalar 3 kategoriye ayrılır:
///
/// 1 - Auth gerektirmeyen ama auth ise redirect edenler
/// 2 - Auth olup olmaması fark etmeyenler
/// 3 - Kalanları ise auth gerektirenler

const notUnallowed = ["/auth"];

const doesNotMatter = ["/feedback", "/welcome", "/theme", "/subscription"];

const journeyUnallowed = ["/journeys", "/journeys/create"];

typedef Middleware<T> =
    FutureOr<T?> Function(String value, Null Function(String?) redirect);

class AppRoute {
  final Widget Function({Key? key}) builder;
  final Map<String, Middleware>? middlewares;

  AppRoute({required this.builder, this.middlewares});
}

final Map<String, AppRoute> routes = {
  "/auth": AppRoute(builder: SignUpMainScreen.new, middlewares: {}),
  "/": AppRoute(builder: HomePage.new, middlewares: {}),
  "/theme": AppRoute(builder: ThemeShowcase.new, middlewares: {}),
  "/subscription": AppRoute(builder: SubscriptionPage.new, middlewares: {}),
  "/journeys": AppRoute(builder: JourneysPage.new, middlewares: {}),
  "/journeys/create": AppRoute(builder: CreateJourneyPage.new, middlewares: {}),
  "/journey-docs": AppRoute(builder: JourneyDocsPage.new, middlewares: {}),
  "/documentation/:documentation": AppRoute(
    builder: DocumentationPage.new,
    middlewares: {
      "documentation": (value, redirect) async {
        final documentation = await Api.queries.userDoc(value);
        return documentation;
      },
    },
  ),
  "/material/:material": AppRoute(
    builder: MaterialPageView.new,
    middlewares: {
      "material": (value, redirect) async {
        try {
          final material = await Api.queries.detailedMaterial(value);
          final materialController = MaterialController(material: material);
          return materialController;
        } catch (e) {
          logger.e("MATERIAL MIDDLEWARE ERROR $e");
          return redirect("/not-found");
        }
      },
    },
  ),
};

String? redirect(String requested, String? current) {
  if (requested == "/welcome" || requested == "/theme") {
    return null;
  }
  if (requested == current) {
    return null;
  }
  return current;
}

FutureOr<String?> _initWith(
  String location,
  bool rule,
  FutureOr<void> Function() init,
  FutureOr<String?> Function() redirect,
) {
  if (!rule) {
    return Future(() async {
      await init();
      return redirect();
    });
  }
  return redirect();
}

FutureOr<String?> splashLoad(String location) {
  // if (location == "/subscription") {
  //   return redirect(location, null);
  // }
  if (location == "/welcome") {
    return redirect(location, null);
  }

  final authController = AuthController();

  final deviceController = DeviceController();

  return _initWith(
    location,
    deviceController.initialized,
    deviceController.init,
    () {
      return _initWith(
        location,
        authController.initialized,
        authController.init,
        () {
          bool isAuth = authController.isAuthenticated;

          final initJourney = _initWith(
            location,
            journeyController.initialized,
            journeyController.init,
            () {
              final hasJourney = journeyController.hasJourney;

              if (hasJourney) {
                if (journeyUnallowed.contains(location)) {
                  return redirect(location, "/");
                }

                return redirect(location, null);
              }

              if (journeyUnallowed.contains(location)) {
                return redirect(location, null);
              }

              return redirect(location, "/journeys");
            },
          );

          if (doesNotMatter.contains(location)) {
            return initJourney;
          } else if (isAuth) {
            if (notUnallowed.contains(location)) {
              return redirect(location, "/");
            }
            return initJourney;
          }
          return redirect(location, "/auth");
        },
      );
    },
  );
}

final router = GoRouter(
  initialLocation: "/",
  navigatorKey: ThemeProvider.instance.navigatorKey,
  routes:
      [
        GoRoute(
          path: "/welcome",
          builder: (context, state) => const SplashScreen(),
        ),
        ...routes.entries.map(
          (e) => GoRoute(
            redirect: (context, state) {
              return splashLoad(e.key);
            },
            path: e.key,
            builder: (context, state) {
              final resolvedParameters = ParametersHolder();
              final parameters = <String, String>{};
              for (final parameter in e.key.split("/").skip(1)) {
                if (!parameter.startsWith(":")) {
                  continue;
                }

                final parameterName = parameter.substring(1);

                parameters[parameterName] =
                    state.pathParameters[parameterName]!;
              }

              final resolvers = <FutureOr>[];

              for (final parameter in parameters.entries) {
                final resolver = e.value.middlewares?[parameter.key];

                if (state.extra != null) {
                  resolvedParameters.set(
                    parameter.key,
                    (state.extra as Map<String, dynamic>)[parameter.key]!,
                  );
                } else if (resolver != null) {
                  resolvers.add(
                    (() {
                      String? redirected;

                      final res = resolver(parameter.value, (value) {
                        redirected = value;
                      });
                      if (res is Future) {
                        return Future(() async {
                          final waitedRes = await res;
                          if (redirected != null) {
                            return redirect(redirected!, null);
                          }
                          resolvedParameters.set(parameter.key, waitedRes);
                          return waitedRes;
                        });
                      }
                      if (redirected != null) {
                        return redirect(redirected!, null);
                      }
                      resolvedParameters.set(parameter.key, res);
                      return res;
                    })(),
                  );
                }
              }

              final child = ThemeProvider.instance.brightness.builder((br) {
                return ResponsiveProvider(
                  child: Builder(
                    builder: (context) {
                      ThemeProvider.instance.context = context;
                      return _ParametersHolder(
                        parameters: resolvedParameters,
                        child: e.value.builder(),
                      );
                    },
                  ),
                );
              });

              if (resolvers.isNotEmpty) {
                if (resolvers.any((e) => e is Future)) {
                  return _Loader(
                    resolver: Future.wait(
                      resolvers.map((e) {
                        if (e is Future) {
                          return e;
                        }
                        return Future.value(e);
                      }),
                    ),
                    builder: () {
                      Future.wait(
                        resolvers.map((e) {
                          if (e is Future) {
                            return e;
                          }
                          return Future.value(e);
                        }),
                      ).then((value) {});
                      return child;
                    },
                  );
                }
              }

              return child;
            },
          ),
        ),
      ].toList(),
);

extension Routes on BuildContext {
  T parameterValue<T>() {
    return _ParametersHolder.of(this).find<T>()!;
  }

  T parameterValueByName<T>(String name) {
    return _ParametersHolder.of(this).get<T>(name);
  }

  Future<void> _toRoute(String route, [Map<String, dynamic>? parameters]) {
    // if (kIsWeb) {
    //   go(route);
    //   return Future.value();
    // }
    return push(route, extra: parameters);
  }

  Future<void> splash() {
    return _toRoute("/welcome");
  }

  Future<void> auth() {
    return _toRoute("/auth");
  }

  Future<void> home() {
    return _toRoute("/");
  }

  Future<void> theme() {
    return _toRoute("/theme");
  }

  Future<void> journeys() {
    return _toRoute("/journeys");
  }

  Future<void> createJourney() {
    return _toRoute("/journeys/create");
  }

  Future<void> journey() async {
    //await journeyController.setJourneyDetailed(journey);
    if (!journeyController.hasJourney) {
      throw Exception("Journey not found");
    }
    return _toRoute("/");
  }

  Future<void> material(String id) {
    return _toRoute("/material/$id");
  }

  Future<void> docWithId(String id) {
    return _toRoute("/documentation/$id");
  }

  Future<void> doc(Fragment$UserDoc documentation) {
    return _toRoute("/documentation/${documentation.id}", {
      "documentation": documentation,
    });
  }

  Future<void> journeyDocs() {
    return _toRoute("/journey-docs");
  }
}

class ParametersHolder {
  final Map<String, dynamic> parameters = {};

  void set<T>(String key, T value) {
    parameters[key] = value;
  }

  T get<T>(String key) {
    return parameters[key] as T;
  }

  T? find<T>() {
    for (final parameter in parameters.entries) {
      if (parameter.value is T) {
        return parameter.value as T;
      }
    }
    return null;
  }
}

class _Loader extends StatefulWidget {
  const _Loader({required this.resolver, required this.builder});

  final Future resolver;
  final Widget Function() builder;

  @override
  State<_Loader> createState() => __LoaderState();
}

class __LoaderState extends State<_Loader> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.resolver,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const SizedBox.shrink();
          case ConnectionState.waiting:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case ConnectionState.active:
            return widget.builder();
          case ConnectionState.done:
            return widget.builder();
        }
      },
    );
  }
}

class _ParametersHolder extends InheritedWidget {
  const _ParametersHolder({required super.child, required this.parameters});

  final ParametersHolder parameters;

  static ParametersHolder of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_ParametersHolder>()!
        .parameters;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
