import 'package:ar_cademy/layout/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/loading_service.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/web_services/firebase_utils.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../widgets/social_media_auth_button.dart';

class CustomSignUpFormWidget extends StatefulWidget {
  const CustomSignUpFormWidget({super.key});

  @override
  State<CustomSignUpFormWidget> createState() => _CustomSignUpFormWidgetState();
}

class _CustomSignUpFormWidgetState extends State<CustomSignUpFormWidget> {
  final _signUpFormKey = GlobalKey<FormState>();
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _signUpFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextFormField(
            textEditingController: _fullNameController,
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
            textEditingController: _emailController,
            labelText: "Email",
            title: "Enter Your Email",
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return ("You must enter your email");
              }

              var regex = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

              if (!regex.hasMatch(value)) {
                return 'Invalid email address';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            textEditingController: _passwordController,
            labelText: "Password",
            title: "Enter password",
            obscureText: !_isVisible,
            suffixIcon: InkWell(
              onTap: () {
                _isVisible = !_isVisible;
                setState(() {});
              },
              borderRadius: BorderRadius.circular(15.r),
              child: (_isVisible)
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'You must enter your password';
              }

              var regex = RegExp(
                r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$",
              );

              if (!regex.hasMatch(value)) {
                return 'Must contains A-Z, a-z, @-#-&.. , 1-9';
              }

              return null;
            },
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            textEditingController: _confirmPasswordController,
            labelText: "Confirm Password",
            title: "Enter password",
            obscureText: !_isVisible,
            suffixIcon: InkWell(
              onTap: () {
                _isVisible = !_isVisible;
                setState(() {});
              },
              borderRadius: BorderRadius.circular(15.r),
              child: (_isVisible)
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'You must enter your password';
              }

              if (value != _passwordController.text) {
                return "Passwords doesn't match";
              }

              return null;
            },
          ),
          SizedBox(height: 24.h),
          CustomMaterialButton(
            title: "Sign Up",
            onClicked: () {
              signUpWithEmailAndPassword();
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
                    debugPrint("Google button pressed");
                    signUpWithGoogle();
                  }),
              SizedBox(width: 8.w),
              SocialMediaAuthButton(
                  label: "Apple",
                  iconPath: "assets/icons/apple_icon.svg",
                  onClicked: () {}),
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
  }

  signUpWithEmailAndPassword() async {
    if (_signUpFormKey.currentState!.validate()) {
      configureEasyLoading(context);
      EasyLoading.show();

      // call api to register
      var response = await FirebaseUtils.signUpWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      response.fold(
        (l) {
          EasyLoading.dismiss();

          SnackBarService.showErrorMessage(context, l!);
        },
        (r) {
          EasyLoading.dismiss();

          SnackBarService.showSuccessMessage(
              context, 'Success, Please verify your account from your inbox');
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
      );
    }
  }

  signUpWithGoogle() async {
    configureEasyLoading(context);
    EasyLoading.show();

    var response = await FirebaseUtils.signUpWithGoogle();
    response.fold((l) {
      EasyLoading.dismiss();

      SnackBarService.showErrorMessage(context, l);
    }, (r) {
      EasyLoading.dismiss();

      SnackBarService.showSuccessMessage(
          context, 'Signed up successfully with Google');
      if (context.mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, Layout.routeName, (route) => false);
      }
    });
  }
}
