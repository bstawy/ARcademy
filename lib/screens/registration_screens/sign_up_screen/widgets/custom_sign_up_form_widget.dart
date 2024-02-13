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
import '../../widgets/social_media_auth_button.dart';
import '../sign_up_view_model.dart';

class CustomSignUpFormWidget extends StatefulWidget {
  const CustomSignUpFormWidget({super.key});

  @override
  State<CustomSignUpFormWidget> createState() => _CustomSignUpFormWidgetState();
}

class _CustomSignUpFormWidgetState extends State<CustomSignUpFormWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<SignUpViewModel>(
      builder: (context, viewModel, child) {
        return Form(
          key: viewModel.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                textEditingController: viewModel.fullNameController,
                labelText: "Full Name",
                title: "Enter Your Name",
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return ("You must enter your name");
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                textEditingController: viewModel.emailController,
                labelText: "Email",
                title: "Enter Your Email",
                validator: (value) {
                  return validateEmail(value);
                },
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                textEditingController: viewModel.passwordController,
                labelText: "Password",
                title: "Enter password",
                obscureText: !viewModel.isPasswordVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    viewModel.showPassword();
                    setState(() {});
                  },
                  borderRadius: BorderRadius.circular(15.r),
                  child: (viewModel.isPasswordVisible)
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
                validator: (value) {
                  return validatePassword(value);
                },
              ),
              SizedBox(height: 16.h),
              CustomTextFormField(
                textEditingController: viewModel.confirmPasswordController,
                labelText: "Confirm Password",
                title: "Enter password",
                obscureText: !viewModel.isPasswordVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    viewModel.showPassword();
                    setState(() {});
                  },
                  borderRadius: BorderRadius.circular(15.r),
                  child: (viewModel.isPasswordVisible)
                      ? const Icon(Icons.visibility_off_outlined)
                      : const Icon(Icons.visibility_outlined),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'You must enter your password';
                  }

                  if (value != viewModel.passwordController?.text) {
                    return "Passwords doesn't match";
                  }

                  return null;
                },
              ),
              SizedBox(height: 24.h),
              CustomMaterialButton(
                title: "Sign Up",
                backgroundColor: theme.colorScheme.primary,
                onClicked: () {
                  // TODO: pass display name while signup
                  signUpWithEmailAndPassword(context, viewModel);
                },
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaAuthButton(
                      label: "Google",
                      iconPath: "assets/icons/google_icon.svg",
                      onClicked: () {
                        signUpWithGoogle(context, viewModel);
                      }),
                  SizedBox(width: 8.w),
                  SocialMediaAuthButton(
                      label: "Apple",
                      iconPath: "assets/icons/apple_icon.svg",
                      onClicked: () {
                        SnackBarService.showSuccessMessage(
                            context, "Coming Soon...");
                      }),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: theme.textTheme.labelLarge!.copyWith(
                      color: theme.colorScheme.secondary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Login",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 75.h),
            ],
          ),
        );
      },
    );
  }

  signUpWithEmailAndPassword(
    BuildContext context,
    SignUpViewModel viewModel,
  ) async {
    if (viewModel.signUpFormKey!.currentState!.validate()) {
      configureEasyLoading(context);
      EasyLoading.show();

      await viewModel.signUpWithEmailAndPassword();
      String? msg = viewModel.signUpStatus;

      EasyLoading.dismiss();

      if (msg == "success") {
        // Navigate to Home Layout
        if (context.mounted) {
          SnackBarService.showSuccessMessage(
              context, 'Success, Please verify your account from your inbox');
          Navigator.pop(context);
        }
      } else {
        if (context.mounted) SnackBarService.showErrorMessage(context, msg!);
      }
    }
  }

  signUpWithGoogle(
    BuildContext context,
    SignUpViewModel viewModel,
  ) async {
    configureEasyLoading(context);
    EasyLoading.show();

    await viewModel.signUpWithGoogle();
    String? msg = viewModel.signUpStatus;

    EasyLoading.dismiss();

    if (msg == "success") {
      // Navigate to Home Layout
      if (context.mounted) {
        SnackBarService.showSuccessMessage(
            context, "Signed up successfully with Google Account");
        Navigator.pushNamedAndRemoveUntil(
            context, Layout.routeName, (route) => false);
      }
    } else {
      if (context.mounted) SnackBarService.showErrorMessage(context, msg!);
    }
  }
}
