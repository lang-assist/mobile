import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

import 'social_media.dart';

class SignUpMainScreen extends StatelessWidget {
  const SignUpMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: "Welcome to Broca Agent",
      children: [SocialMediaIcons()],
    );
  }
}
