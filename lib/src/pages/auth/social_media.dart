import 'package:assist_utils/assist_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:assist_app/src/pages/auth/sign_up_with_mail_screen.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {},
      title: Row(
        spacing: 8,
        children: [
          ImgGenIcons.name(ImgGenIconNames.google),
          const Text("Continue With Google"),
        ],
      ),
      customBackgroundDecoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(1000.0),
      ),
    );
  }
}

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {},
      title: Row(
        spacing: 8,
        children: [
          ImgGenIcons.name(ImgGenIconNames.apple),
          const Text("Continue With Apple"),
        ],
      ),
      customBackgroundDecoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(1000.0),
      ),
      customTextStyle: TextTheme.of(
        context,
      ).bodyLarge!.copyWith(color: AppColors.background.op(1)),
      customIconSize: 30.0,
      customIconTheme: const IconThemeData(
        color: AppColors.background,
        size: 24.0,
      ),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        const GoogleSignInButton(),
        const AppleSignInButton(),
        AppButton(
          onPressed: () async {
            // await Get.toNamed(RouteNames.signUpWithMailScreen,
            //     parameters: Get.parameters as Map<String, String>?);
            // Get.back();
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignUpWithMailScreen(),
              ),
            );
            if (context.mounted) context.go("/");
          },
          title: Row(
            spacing: 8,
            children: [
              ImgGenIcons.name(ImgGenIconNames.email),
              const Text("Continue With Email"),
            ],
          ),
        ),
      ],
    );
  }
}
