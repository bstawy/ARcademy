import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/services/loading_service.dart';
import '../../../../core/services/snackbar_service.dart';
import '../../../../core/web_services/firebase_utils.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../layout/layout.dart';
import '../../sign_up_screen/sign_up_screen.dart';
import '../../widgets/social_media_auth_button.dart';
import '../reset_password_screen.dart';

class CustomLoginFormWidget extends StatefulWidget {
  const CustomLoginFormWidget({super.key});

  @override
  State<CustomLoginFormWidget> createState() => _CustomLoginFormWidgetState();
}

class _CustomLoginFormWidgetState extends State<CustomLoginFormWidget> {
  final _loginFormKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: _loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, ResetPasswordScreen.routeName);
              },
              child: Text(
                "Forgot Password?",
                style: theme.textTheme.labelMedium,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          CustomMaterialButton(
            title: "Login",
            onClicked: () {
              loginWithEmailAndPassword();
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
                    loginWithGoogle();
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
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  loginWithEmailAndPassword() async {
    if (_loginFormKey.currentState!.validate()) {
      configureEasyLoading(context);
      EasyLoading.show();

      // call api to register
      var response = await FirebaseUtils.loginWithEmailAndPassword(
          _emailController.text, _passwordController.text);

      EasyLoading.dismiss();

      response.fold((l) {
        SnackBarService.showErrorMessage(context, l!);
      }, (r) {
        SnackBarService.showSuccessMessage(context, "Welcome Back");
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
              context, Layout.routeName, (route) => false);
        }
      });
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
