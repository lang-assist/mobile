import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/pages/journey.dart';
import 'package:assist_app/src/scaffolds/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:user_data/user_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Fragment$DetailedJourney get journey => journeyController.journey;

  bool get isStarted => journey.paths.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return UserScaffold(
      title: journeyController.journey.name,
      actions: [
        Text(
          journeyController.journey.to.name.substring(0, 2),
          style: const TextStyle(fontSize: 16),
        ),
      ],
      body:
          isStarted ? JourneyPage() : Center(child: const Text("Not started")),
    );
  }
}
