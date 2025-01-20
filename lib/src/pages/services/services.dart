import 'package:flutter/material.dart';
import 'package:assist_app/src/scaffolds/app_scaffold.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return UserScaffold(title: "Services", body: Placeholder());
  }
}
