import 'package:assist_app/src/controllers/journey.dart';
import 'package:assist_app/src/routes.dart';
import 'package:assist_app/src/scaffolds/app_scaffold.dart';
import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';
import 'package:user_data/user_data.dart';

class JourneysPage extends StatefulWidget {
  const JourneysPage({super.key});

  @override
  State<JourneysPage> createState() => _JourneysPageState();
}

class _JourneysPageState extends State<JourneysPage> {
  List<Fragment$Journey>? journeys;

  GraphQLError? error;

  @override
  void initState() {
    super.initState();
    fetchJourneys();
  }

  Future<void> fetchJourneys() async {
    try {
      journeys = await Api.queries.journeys();
      print(journeys);
    } catch (e) {
      error = e as GraphQLError;
    }
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return UserScaffold(
      title: "Your Journeys",
      body:
          journeys == null
              ? const Center(child: CircularProgressIndicator())
              : journeys!.isEmpty
              ? const _EmptyJourneys()
              : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: journeys!.length,
                itemBuilder:
                    (context, index) => JourneyCard(journey: journeys![index]),
              ),
    );
  }
}

class _EmptyJourneys extends StatefulWidget {
  const _EmptyJourneys();

  @override
  State<_EmptyJourneys> createState() => __EmptyJourneysState();
}

class __EmptyJourneysState extends State<_EmptyJourneys> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("No journeys found"),
          TextButton(
            onPressed: () {
              context.pushCreateJourney();
            },
            child: const Text("Create a journey"),
          ),
        ],
      ),
    );
  }
}

class JourneyCard extends StatefulWidget {
  const JourneyCard({super.key, required this.journey});

  final Fragment$Journey journey;

  @override
  State<JourneyCard> createState() => _JourneyCardState();
}

class _JourneyCardState extends State<JourneyCard> {
  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () async {
        await journeyController.setJourney(widget.journey);
        if (context.mounted) {
          context.pushJourney(widget.journey.id);
        }
      },
      title: Text(widget.journey.name),
    );
  }
}
