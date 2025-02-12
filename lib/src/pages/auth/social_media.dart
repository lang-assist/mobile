import 'package:assist_utils/assist_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:assist_app/src/pages/auth/sign_up_with_mail_screen.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      variant: AppButtonVariant.outlined,
      onPressed: () {},
      title: Row(
        spacing: 8,
        children: [
          ImgGenIcons.name(
            ImgGenIconNames.google,
            size: 24,
            color: AppColors.primary,
          ),
          Text(
            "Continue With Google",
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}

class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      variant: AppButtonVariant.outlined,
      onPressed: () {},
      title: Row(
        spacing: 8,
        children: [
          ImgGenIcons.name(
            ImgGenIconNames.apple,
            size: 24,
            color: AppColors.primary,
          ),
          Text(
            "Continue With Apple",
            style: TextStyle(color: AppColors.primary),
          ),
        ],
      ),
      customTextStyle: TextTheme.of(
        context,
      ).bodyLarge!.copyWith(color: AppColors.surface.op(1)),
    );
  }
}

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.spacing4),
      child: Column(
        spacing: AppDimensions.spacing4,
        children: [
          SizedBox(width: double.infinity, child: const GoogleSignInButton()),
          SizedBox(width: double.infinity, child: const AppleSignInButton()),
          SizedBox(
            width: double.infinity,
            child: AppButton(
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
          ),
        ],
      ),
    );
  }
}
