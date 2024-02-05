import 'package:ar_cademy/home_screen/home_screen.dart';
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
                    "Create Account",
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
                  ),
                ],
              ),
            ),
          ),
        ],
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
            context, HomeScreen.routeName, (route) => false);
      }
    });
  }
}
