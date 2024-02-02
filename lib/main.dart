import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/application_theme.dart';
import 'login_screen/login_screen.dart';
import 'onboarding_screens/onboarding_screens.dart';

void main() {
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
          theme: ApplicationTheme.lightTheme,
          initialRoute: OnboardingScreens.routeName,
          routes: {
            OnboardingScreens.routeName: (context) => const OnboardingScreens(),
            LoginScreen.routeName: (context) => const LoginScreen(),
          },
        );
      },
    );
  }
}
