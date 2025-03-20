import 'dart:async';

import 'package:assist_app/src/widgets/common/measure.dart';
import 'package:assist_app/src/utils/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:gql_data/gql_data.dart';
import 'package:sign_flutter/sign_flutter.dart';
import 'package:utils/utils.dart';
import 'social_media.dart';

class UserBanner extends StatelessWidget {
  const UserBanner({super.key, required this.user});

  final Fragment$PublicUser user;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        ImggenUserAvatar(avatar: user.avatar),
        Text(
          user.name,
          style: TextTheme.of(context).titleLarge!.copyWith(fontSize: 24),
        ),
      ],
    );
  }
}

enum _Stage {
  email,
  password,
  newPassword,
  userName,
  verification,
  forgotVerification,
  forgotNewPassword,
}

final class _StageConfig {
  final String pageTitle, buttonTitle;
  final Widget buttonIcon;
  final FutureOr<void> Function() nextPage;
  final Signal<bool> valid;
  final Widget page;
  final _Stage stage;

  _StageConfig({
    required this.nextPage,
    required this.valid,
    required this.pageTitle,
    required this.buttonTitle,
    required this.buttonIcon,
    required this.page,
    required this.stage,
  });

  @override
  int get hashCode =>
      super.hashCode ^
      pageTitle.hashCode ^
      buttonTitle.hashCode ^
      buttonIcon.hashCode;

  @override
  bool operator ==(Object other) {
    return super == other && other is _StageConfig;
  }
}

class SignUpWithMailScreen extends StatefulWidget {
  const SignUpWithMailScreen({super.key});

  @override
  State<SignUpWithMailScreen> createState() => _SignUpWithMailScreenState();
}

class _SignUpWithMailScreenState extends State<SignUpWithMailScreen> {
  final email = "".signal;
  final password = "".signal;
  final newPassword = "".signal;
  final userName = "".signal;
  final verification = "".signal;
  final forgotPassword = "".signal;

  final pageController = PageController();

  final Signal<bool> isLoading = false.signal;

  Fragment$PublicUser? user;

  List<Enum$Providers>? availableMethods;

  // initial
  _submitEmail() async {
    if (emailValidator(email.value) == null) {
      final res = await Api.auth.query.getProvider(email.value);

      user = res.user;
      availableMethods = res.providers;

      setState(() {
        emailSubmitted = true;
      });

      if (availableMethods!.isEmpty) {
        addStage(_Stage.newPassword);
      } else {
        addStage(_Stage.password);
      }
    }
  }

  // sign in
  _submitSignInPassword() async {
    if (passwordValidator(password.value) == null) {
      isLoading.value = true;
      try {
        final auth = AuthController();
        await auth.signInWithEmail(email.value, password.value);
        if (auth.hasVerificationSession) {
          addStage(_Stage.verification);
        } else {
          if (auth.isAuthenticated) {
            if (mounted) Navigator.of(context).pop();
          } else {
            if (kDebugMode) {
              print(auth);
            }
            // Get.snackbar('Error', 'Verification failed. Unknown error.');
          }
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        // Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  // sign up - 1
  _submitSignUpNewPassword() async {
    if (passwordValidator(newPassword.value) == null) {
      addStage(_Stage.userName);
    }
  }

  // sign up - 2
  _submitSignUpUserName() async {
    if (usernameValidator(userName.value) == null) {
      isLoading.value = true;
      try {
        final auth = AuthController();
        await auth.signUpWithEmail(
          email.value,
          newPassword.value,
          userName.value,
        );
        if (auth.hasVerificationSession) {
          addStage(_Stage.verification);
        } else {
          // Get.snackbar('Error', 'Verification failed. Unknown error.');
        }
      } catch (e) {
        // Get.snackbar('Error', e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }

  // sign up - 3 | sign in - 2
  _submitSignUpInVerification() async {
    if (verificationValidator(verification.value) != null) {
      return;
    }

    try {
      final auth = AuthController();
      await auth.verifyEmail(verification.value);
      // Get.snackbar('Success', 'Email verified successfully');
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) Navigator.of(context).pushNamed("/");
      });
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // forgot password - 1
  _submitForgotVerification() async {
    if (verificationValidator(verification.value) != null) {
      return;
    }
    try {
      final auth = AuthController();
      await auth.verifyForgotPassword(verification.value);
      // Get.snackbar('Success', 'Email verified successfully');
      addStage(_Stage.forgotNewPassword);
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // forgot password - 2
  _submitNewPwdForgot() async {
    try {
      if (passwordValidator(forgotPassword.value) != null) {
        return;
      }

      final auth = AuthController();
      await auth.setNewPwd(forgotPassword.value);
      // Get.snackbar('Success', 'Password changed successfully');
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) Navigator.of(context).pushNamed("/");
      });
    } catch (e) {
      // Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool emailSubmitted = false;

  final emailValid = false.signal;
  final passwordValid = false.signal;
  final newPasswordValid = false.signal;
  final userNameValid = false.signal;
  final verificationValid = false.signal;
  final forgotPasswordValid = false.signal;

  double height = 190;

  Widget _page(Widget child) {
    return SingleChildScrollView(
      child: MeasureSize(
        onChange: (size) {
          final newHeight = size.height + 100;
          if (newHeight != height) {
            height = newHeight;
            setState(() {});
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [child],
        ),
      ),
    );
  }

  late Map<_Stage, _StageConfig> stageConfigs = {
    _Stage.email: _emailStage(),
    _Stage.password: _passwordStage(),
    _Stage.newPassword: _newPwdStage(),
    _Stage.userName: _userNameStage(),
    _Stage.verification: _verificationStage(),
    _Stage.forgotVerification: _verificationStage(true),
    _Stage.forgotNewPassword: _forgotNewPwdStage(),
  };

  _StageConfig _emailStage() {
    return _StageConfig(
      stage: _Stage.email,
      nextPage: _submitEmail,
      valid: emailValid,
      pageTitle: 'Welcome to Broca Agent',
      buttonTitle: 'Next',
      buttonIcon: AppIcons.name(ImgGenIconNames.email),
      page: AppTextFormField(
        key: ValueKey("email-field"),
        label: 'E-Mail',
        onEditingComplete: _submitEmail,
        signal: email,
        valid: emailValid,
        validator: emailValidator,
        autofillHints: const [AutofillHints.email],
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  // sign in
  _StageConfig _passwordStage() {
    return _StageConfig(
      stage: _Stage.password,
      nextPage: _submitSignInPassword,
      valid: passwordValid,
      pageTitle: 'Sign In to Broca Agent',
      buttonTitle: 'Sign In',
      buttonIcon: AppIcons.name(ImgGenIconNames.email),
      page: Builder(
        builder: (ctx) {
          final hasPwd = availableMethods!.contains(Enum$Providers.EMAIL);
          final hasGoogle = availableMethods!.contains(Enum$Providers.GOOGLE);
          final hasApple = availableMethods!.contains(Enum$Providers.APPLE);

          return Column(
            spacing: 12,
            children: [
              if (user != null) UserBanner(user: user!),
              AppButton(
                size: AppSizeVariant.small,
                variant: AppButtonVariant.text,
                onPressed: (_) {
                  addStage(_Stage.email);
                },
                title: const Text("Not you?"),
              ),
              if (hasPwd)
                AppTextFormField(
                  key: ValueKey("password-field"),
                  label: "Password",
                  validator: passwordValidator,
                  signal: password,
                  valid: passwordValid,
                  onEditingComplete: _submitSignInPassword,
                ),
              if (hasApple || hasGoogle)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Or continue with'),
                ),
              if (hasGoogle) const GoogleSignInButton(),
              if (hasApple) const AppleSignInButton(),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  AppButton(
                    size: AppSizeVariant.small,
                    variant: AppButtonVariant.text,
                    onPressed: (_) async {
                      final auth = AuthController();

                      await auth.forgotPassword(email.value);

                      if (auth.hasVerificationSession) {
                        addStage(_Stage.forgotVerification);
                      } else {
                        // Get.snackbar(
                        //     'Error', 'Verification failed. Unknown error.');
                      }
                    },
                    title: const Text("Forgot password?"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  // sign up - 1
  _StageConfig _newPwdStage() {
    return _StageConfig(
      stage: _Stage.newPassword,
      nextPage: _submitSignUpNewPassword,
      valid: newPasswordValid,
      pageTitle: 'Sign Up to Broca Agent',
      buttonTitle: 'Next',
      buttonIcon: AppIcons.name(ImgGenIconNames.next),
      page: AppTextFormField(
        key: ValueKey("new-password-field"),
        signal: newPassword,
        label: 'New Password',
        hint: 'Enter your new password',
        valid: newPasswordValid,
        validator: passwordValidator,
        obscureText: true,
        autofillHints: const [
          AutofillHints.password,
          AutofillHints.newPassword,
        ],
        onEditingComplete: _submitSignUpNewPassword,
      ),
    );
  }

  // sign up - 2
  _StageConfig _userNameStage() {
    return _StageConfig(
      stage: _Stage.userName,
      nextPage: _submitSignUpUserName,
      valid: userNameValid,
      pageTitle: 'Sign Up to Broca Agent',
      buttonTitle: 'Sign Up',
      buttonIcon: AppIcons.name(ImgGenIconNames.next),
      page: AppTextFormField(
        key: ValueKey("username-field"),
        signal: userName,
        label: 'Username',
        hint: 'Enter your username',
        valid: userNameValid,
        validator: usernameValidator,
        autofillHints: const [AutofillHints.username],
        onEditingComplete: _submitSignUpUserName,
      ),
    );
  }

  // sign up - 3 | sign in - 2 | forgot password - 1
  _StageConfig _verificationStage([bool forgot = false]) {
    final next =
        forgot ? _submitForgotVerification : _submitSignUpInVerification;
    return _StageConfig(
      stage: forgot ? _Stage.forgotVerification : _Stage.verification,
      nextPage: next,
      valid: verificationValid,
      pageTitle: 'Verify with Broca Agent',
      buttonTitle: 'Verify',
      buttonIcon: AppIcons.name(ImgGenIconNames.next),
      page: AppTextFormField(
        key: ValueKey("verification-field"),
        signal: verification,
        label: 'Verification Code',
        hint: 'Enter your 6 digit verification code',
        valid: verificationValid,
        validator: verificationValidator,
        keyboardType: TextInputType.number,
        autofillHints: const [AutofillHints.oneTimeCode],
        onEditingComplete: next,
      ),
    );
  }

  // forgot password - 2
  _StageConfig _forgotNewPwdStage() {
    return _StageConfig(
      stage: _Stage.forgotNewPassword,
      nextPage: _submitNewPwdForgot,
      valid: forgotPasswordValid,
      pageTitle: 'Set New Password',
      buttonTitle: 'Set Password',
      buttonIcon: AppIcons.name(ImgGenIconNames.next),
      page: AppTextFormField(
        key: ValueKey("forgot-password-field"),
        signal: forgotPassword,
        label: 'New Password',
        hint: 'Enter your new password',
        valid: forgotPasswordValid,
        validator: passwordValidator,
        keyboardType: TextInputType.visiblePassword,
        autofillHints: const [AutofillHints.newPassword],
        onEditingComplete: _submitNewPwdForgot,
      ),
    );
  }

  _nextFrame(Function() callback) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  int currentStage = 0;

  int _stageIndex(_Stage stage) {
    return _Stage.values.indexOf(stage);
  }

  addStage(_Stage stage) {
    _nextFrame(() {
      pageController
          .animateToPage(
            _stageIndex(stage),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          )
          .then((_) {
            _nextFrame(() {
              setState(() {
                currentStage = _stageIndex(stage);
              });
            });
          });
    });
  }

  _StageConfig get currentConfig {
    return stageConfigs[_Stage.values[currentStage]]!;
  }

  @override
  void initState() {
    super.initState();
  }

  final scKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      key: scKey,
      title: currentConfig.pageTitle,
      children: [
        AnimatedContainer(
          height: height,
          duration: const Duration(milliseconds: 300),
          child: Column(
            spacing: 24,
            children: [
              Expanded(
                child: AppForm(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {},
                    controller: pageController,
                    children:
                        stageConfigs.values.map((e) => _page(e.page)).toList(),
                  ),
                ),
              ),
              [currentConfig.valid, isLoading].multiSignal.builder((_) {
                return AppButton(
                  isLoading: isLoading,
                  isActive: currentConfig.valid,
                  onPressed: (_) => currentConfig.nextPage(),
                  key: ValueKey("button-$currentStage"),
                  title: Padding(
                    key: ValueKey("button-title-padding-$currentStage"),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      spacing: 4,
                      children: [
                        Text(currentConfig.buttonTitle),
                        currentConfig.buttonIcon,
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
