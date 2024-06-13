import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/loading_service.dart';
import '../../../core/services/snackbar_service.dart';
import '../../../core/web_services/firebase_utils.dart';
import '../../../core/widgets/custom_material_button.dart';
import '../../../core/widgets/custom_sliver_app_bar_widget.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/validation.dart';
import '../../../layout/layout.dart';
import '../sign_up_screen/sign_up_screen.dart';
import '../widgets/social_media_auth_button.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/reset-password';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _resetPasswordFormKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late ScrollController _scrollController;
  bool _isAppBarPinned = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarPinned =
            _scrollController.offset > 35.h; // Adjust the threshold as needed
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: FadeInDown(
        animate: true,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomSliverAppBarWidget(
              title: "Reset Password",
              leadingOnClicked: () {
                Navigator.pop(context);
              },
              isAppBarPinned: _isAppBarPinned,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInUp(
                      animate: true,
                      delay: const Duration(milliseconds: 50),
                      child: Text(
                        "Please Enter Your Email",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 64.h),
                    Form(
                      key: _resetPasswordFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FadeInLeft(
                            animate: true,
                            delay: const Duration(milliseconds: 100),
                            child: CustomTextFormField(
                              textEditingController: _emailController,
                              labelText: "Email",
                              hintText: "Enter Your Email",
                              validator: (value) => validateEmail(value),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          FadeInRight(
                            animate: true,
                            delay: const Duration(milliseconds: 150),
                            child: CustomMaterialButton(
                              title: "Reset",
                              backgroundColor: theme.colorScheme.primary,
                              onClicked: () {
                                resetPassword();
                              },
                            ),
                          ),
                          SizedBox(height: 48.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FadeInLeft(
                                animate: true,
                                delay: const Duration(milliseconds: 200),
                                child: SocialMediaAuthButton(
                                    label: "Google",
                                    iconPath: "assets/icons/google_icon.svg",
                                    onClicked: () {
                                      loginWithGoogle();
                                    }),
                              ),
                              SizedBox(width: 8.w),
                              FadeInRight(
                                animate: true,
                                delay: const Duration(milliseconds: 250),
                                child: SocialMediaAuthButton(
                                    label: "Apple",
                                    iconPath: "assets/icons/apple_icon.svg",
                                    onClicked: () {
                                      SnackBarService.showSuccessMessage(
                                          context, "Coming Soon...");
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          FadeInUp(
                            animate: true,
                            delay: const Duration(milliseconds: 300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: theme.textTheme.labelLarge!.copyWith(
                                    color: theme.colorScheme.secondary,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, SignUpScreen.routeName);
                                  },
                                  child: Text(
                                    "Sign Up for free",
                                    style: theme.textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  resetPassword() async {
    if (_resetPasswordFormKey.currentState!.validate()) {
      configureEasyLoading(context);
      EasyLoading.show();

      var response =
          await FirebaseUtils.resetPassword(email: _emailController.text);

      EasyLoading.dismiss();

      if (mounted) {
        if (response == "success") {
          SnackBarService.showSuccessMessage(
              context, 'A password reset link has been sent to your email');
          Navigator.pop(context);
        } else {
          SnackBarService.showErrorMessage(context, response);
        }
      }
    }
  }

  loginWithGoogle() async {
    configureEasyLoading(context);
    EasyLoading.show();

    var response = await FirebaseUtils.signUpWithGoogle();

    EasyLoading.dismiss();

    response.fold((l) {
      SnackBarService.showErrorMessage(context, l);
    }, (r) {
      EasyLoading.dismiss();

      SnackBarService.showSuccessMessage(
          context, 'Logged in successfully with Google');
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, Layout.routeName, (route) => false);
      }
    });
  }
}
