import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../sign_up_screen/sign_up_screen.dart';
import '../../widgets/social_media_auth_button.dart';

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
            obscureText: false,
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
}
