import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                        obscureText: false,
                      ),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        textEditingController: emailController,
                        labelText: "Email",
                        title: "Enter Your Email",
                        obscureText: false,
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
                      ),
                      SizedBox(height: 24.h),
                      CustomMaterialButton(
                        title: "Sign Up",
                        onClicked: () {},
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
}
