import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'pages/home_view/home_view.dart';
import 'pages/human_anatomy_view/human_anatomy_view.dart';
import 'pages/solar_system_view/solar_system_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ARcademy',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        HumanAnatomyView.routeName: (context) => const HumanAnatomyView(),
        SolarSystemView.routeName: (context) => const SolarSystemView(),
      },
    );
  }
}
