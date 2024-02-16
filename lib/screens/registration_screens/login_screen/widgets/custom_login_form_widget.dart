import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/loading_service.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/validation.dart';
import '../../../../layout/layout.dart';
import '../../reset_password_screen/reset_password_screen.dart';
import '../../sign_up_screen/sign_up_screen.dart';
import '../../widgets/social_media_auth_button.dart';
import '../login_view_model.dart';

class CustomLoginFormWidget extends StatelessWidget {
  const CustomLoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<LoginViewModel>(
      builder: (context, vm, child) {
        return Form(
          key: vm.loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FadeInLeft(
                animate: true,
                delay: const Duration(milliseconds: 100),
                child: CustomTextFormField(
                  textEditingController: vm.emailController,
                  labelText: "Email",
                  hintText: "Enter Your Email",
                  validator: (value) {
                    return validateEmail(value);
                  },
                ),
              ),
              SizedBox(height: 16.h),
              FadeInRight(
                animate: true,
                delay: const Duration(milliseconds: 150),
                child: CustomTextFormField(
                  textEditingController: vm.passwordController,
                  labelText: "Password",
                  hintText: "Enter password",
                  obscureText: !vm.isPasswordVisible,
                  suffixIcon: InkWell(
                    onTap: () {
                      vm.showPassword();
                    },
                    borderRadius: BorderRadius.circular(15.r),
                    child: (vm.isPasswordVisible)
                        ? const Icon(Icons.visibility_off_outlined)
                        : const Icon(Icons.visibility_outlined),
                  ),
                  validator: (value) {
                    return validatePassword(value);
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FadeInRight(
                  animate: true,
                  delay: const Duration(milliseconds: 200),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, ResetPasswordScreen.routeName);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: theme.textTheme.labelMedium,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              FadeInUp(
                animate: true,
                delay: const Duration(milliseconds: 250),
                child: CustomMaterialButton(
                  title: "Login",
                  backgroundColor: theme.colorScheme.primary,
                  onClicked: () async {
                    loginWithEmail(context, vm);
                  },
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(
                    animate: true,
                    delay: const Duration(milliseconds: 300),
                    child: SocialMediaAuthButton(
                      label: "Google",
                      iconPath: "assets/icons/google_icon.svg",
                      onClicked: () {
                        loginWithGoogle(context, vm);
                      },
                    ),
                  ),
                  SizedBox(width: 8.w),
                  FadeInRight(
                    animate: true,
                    delay: const Duration(milliseconds: 300),
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
                delay: const Duration(milliseconds: 350),
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
                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      },
                      child: Text(
                        "Sign Up for free",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        );
      },
    );
  }

  Future<void> loginWithEmail(
    BuildContext context,
    LoginViewModel vm,
  ) async {
    if (vm.loginFormKey!.currentState!.validate()) {
      configureEasyLoading(context);
      EasyLoading.show();

      await vm.loginWithEmailAndPassword(context);
      String? msg = vm.loginStatus;

      EasyLoading.dismiss();

      if (msg == "success") {
        // Navigate to Home Layout
        if (context.mounted) {
          SnackBarService.showSuccessMessage(context, "Welcome Back");
          Navigator.pushNamedAndRemoveUntil(
              context, Layout.routeName, (route) => false);
        }
      } else {
        if (context.mounted) SnackBarService.showErrorMessage(context, msg!);
      }
    }
  }

  loginWithGoogle(
    BuildContext context,
    LoginViewModel vm,
  ) async {
    configureEasyLoading(context);
    EasyLoading.show();

    await vm.loginWithGoogle(context);
    String? msg = vm.loginStatus;

    EasyLoading.dismiss();

    if (msg == "success") {
      // Navigate to Home Layout
      if (context.mounted) {
        SnackBarService.showSuccessMessage(
            context, "Logged in successfully with Google Account");
        Navigator.pushNamedAndRemoveUntil(
            context, Layout.routeName, (route) => false);
      }
    } else {
      if (context.mounted) SnackBarService.showErrorMessage(context, msg!);
    }
  }
}
