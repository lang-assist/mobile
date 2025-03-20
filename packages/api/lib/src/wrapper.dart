part of '../api.dart';

class ApiWrapper extends StatelessWidget {
  const ApiWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(client: clientNotifier, child: child);
  }
}
