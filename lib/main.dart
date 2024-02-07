import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/application_theme.dart';
import 'firebase_options.dart';
import 'layout/layout.dart';
import 'screens/onboarding_screens/onboarding_screens.dart';
import 'screens/registration_screens/login_screen/login_screen.dart';
import 'screens/registration_screens/login_screen/reset_password_screen.dart';
import 'screens/registration_screens/sign_up_screen/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ARcademy',
          themeMode: ThemeMode.light,
          theme: ApplicationTheme.lightTheme,
          darkTheme: ApplicationTheme.darkTheme,
          initialRoute: OnboardingScreens.routeName,
          routes: {
            OnboardingScreens.routeName: (context) => const OnboardingScreens(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            ResetPasswordScreen.routeName: (context) =>
                const ResetPasswordScreen(),
            Layout.routeName: (context) => const Layout(),
          },
          builder: EasyLoading.init(
            builder: BotToastInit(),
          ),
        );
      },
    );
  }
}
