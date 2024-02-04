import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/services/loading_service.dart';
import '../core/services/snackbar_service.dart';
import '../core/web_services/firebase_utils.dart';
import '../core/widgets/custom_back_button.dart';
import '../core/widgets/custom_material_button.dart';
import '../core/widgets/custom_text_form_field.dart';
import '../core/widgets/social_media_auth_button.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpFormKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomBackButton(onClicked: () {
                  Navigator.pop(context);
                }),
                SizedBox(height: 32.h),
                Text(
                  "Create Account",
                  style: theme.textTheme.displaySmall,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Lets create account together",
                  style: TextStyle(
                    color: const Color(0xff828a89),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32.h),
                Form(
                  key: signUpFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextFormField(
                        textEditingController: fullNameController,
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
                        textEditingController: emailController,
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
                        textEditingController: passwordController,
                        labelText: "Password",
                        title: "Enter password",
                        obscureText: !isVisible,
                        suffixIcon: InkWell(
                          onTap: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          borderRadius: BorderRadius.circular(15.r),
                          child: (isVisible)
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
                        textEditingController: confirmPasswordController,
                        labelText: "Confirm Password",
                        title: "Enter password",
                        obscureText: !isVisible,
                        suffixIcon: InkWell(
                          onTap: () {
                            isVisible = !isVisible;
                            setState(() {});
                          },
                          borderRadius: BorderRadius.circular(15.r),
                          child: (isVisible)
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'You must enter your password';
                          }

                          if (value != passwordController.text) {
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
                              onClicked: () {}),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signUpWithEmailAndPassword() async {
    if (signUpFormKey.currentState!.validate()) {
      configureEasyLoading(context);
      EasyLoading.show();

      // call api to register
      var response = await FirebaseUtils.signUpWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
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
}
