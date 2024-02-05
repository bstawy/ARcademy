import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/widgets/custom_back_button.dart';
import '../core/widgets/custom_material_button.dart';
import '../core/widgets/custom_text_form_field.dart';
import '../core/widgets/social_media_auth_button.dart';
import '../sign_up_screen/sign_up_screen.dart';

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

  final ScrollController _scrollController = ScrollController();
  bool _isAppBarPinned = false;

  @override
  void initState() {
    super.initState();
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
    var theme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            automaticallyImplyLeading: false,
            backgroundColor: theme.colorScheme.background,
            toolbarHeight: 73.h,
            expandedHeight: 145.h,
            elevation: 0,
            scrolledUnderElevation: 0,
            leadingWidth: 72.w,
            leading: Padding(
              padding: EdgeInsets.only(top: 18.h, left: 24.w, bottom: 8.h),
              child: CustomBackButton(onClicked: () {
                Navigator.pop(context);
              }),
            ),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              collapseMode: CollapseMode.parallax,
              titlePadding: _isAppBarPinned
                  ? EdgeInsets.only(bottom: 15.h)
                  : EdgeInsets.zero,
              centerTitle: true,
              title: Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
                child: AnimatedDefaultTextStyle(
                  style: theme.textTheme.displaySmall!,
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 200),
                  child: Text(
                    "Welcome Back",
                    style: (_isAppBarPinned)
                        ? theme.textTheme.titleMedium!.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          )
                        : theme.textTheme.displaySmall,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back! Please Enter Your Details",
                    textAlign: TextAlign.center,
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
                            borderRadius: BorderRadius.circular(15.r),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
