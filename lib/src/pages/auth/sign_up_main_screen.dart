import 'package:assist_utils/assist_utils.dart';
import 'package:flutter/material.dart';

import 'social_media.dart';

class SignUpMainScreen extends StatelessWidget {
  const SignUpMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(title: "Welcome to", children: [SocialMediaIcons()]);
  }
}
