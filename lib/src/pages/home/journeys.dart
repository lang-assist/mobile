import 'package:api/api.dart';
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
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: responsive.gridColumns * 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: responsive.containerPadding.horizontal,
                  mainAxisSpacing: responsive.containerPadding.vertical,
                ),
                padding: responsive.pagePadding,
                itemCount: journeys!.length + 1,
                itemBuilder:
                    (context, index) =>
                        index == journeys!.length
                            ? Center(
                              child: AppButton(
                                onPressed: () async {
                                  context.createJourney();
                                },
                                title: Text("Create a journey"),
                              ),
                            )
                            : JourneyCard(journey: journeys![index]),
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
              context.createJourney();
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
      image: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Avatar.fromString(widget.journey.avatar).hslColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      onTap: () async {
        await journeyController.setJourney(widget.journey);
        if (context.mounted) {
          context.journey(widget.journey);
        }
      },
      title: Text(widget.journey.name),
    );
  }
}
