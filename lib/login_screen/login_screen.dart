import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/widgets/custom_back_button.dart';
import '../core/widgets/custom_material_button.dart';
import '../core/widgets/custom_text_form_field.dart';
import '../core/widgets/social_media_auth_button.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  "Welcome Back",
                  style: theme.textTheme.displaySmall,
                ),
                SizedBox(height: 8.h),
                Text(
                  "Welcome Back! Please Enter Your Details.",
                  style: TextStyle(
                    color: const Color(0xff828a89),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 32.h),
                Form(
                  key: loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                          child: (isVisible)
                              ? const Icon(Icons.visibility_off_outlined)
                              : const Icon(Icons.visibility_outlined),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomMaterialButton(
                        title: "Login",
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
                            "Don't have an account?",
                            style: theme.textTheme.labelLarge!.copyWith(
                              color: theme.colorScheme.secondary,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up for free",
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
