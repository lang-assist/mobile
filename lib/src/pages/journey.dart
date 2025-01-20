import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:user_data/user_data.dart';

class JourneyPage extends StatefulWidget {
  const JourneyPage({super.key});

  @override
  State<JourneyPage> createState() => _JourneyPageState();
}

class _JourneyPageState extends State<JourneyPage> {
  Fragment$DetailedJourney get journey => journeyController.journey;

  List<Fragment$DetailedPath> get paths => journey.paths;

  @override
  Widget build(BuildContext context) {
    return AppTabView(
      tabs: paths.map((e) => e.name).toList(),
      children:
          paths.map((e) => _JoruneyPath(path: e, key: ValueKey(e.id))).toList(),
    );
  }
}

class _JoruneyPath extends StatefulWidget {
  const _JoruneyPath({super.key, required this.path});

  final Fragment$DetailedPath path;

  @override
  State<_JoruneyPath> createState() => __JoruneyPathState();
}

class __JoruneyPathState extends State<_JoruneyPath> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.path.toJson().toString());
  }
}
