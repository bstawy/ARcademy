import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/manager/app_provider.dart';
import '../core/widgets/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import '../core/widgets/custom_bottom_nav_bar/custom_bottom_nav_bar_item.dart';
import '../screens/category_screen/category_screen.dart';
import '../screens/favorite_screen/favorite_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_screen/profile_screen.dart';

class Layout extends StatefulWidget {
  static const String routeName = '/layout';

  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Column(
            children: [
              _screens[provider.selectedScreenIndex],
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(
            currentIndex: provider.selectedScreenIndex,
            items: [
              CustomBottomNavBarItem(
                iconPath: "assets/icons/nav_home_icon.svg",
                isSelected: (provider.selectedScreenIndex == 0),
                onClicked: () {
                  provider.changeCurrentScreen(0);
                },
              ),
              CustomBottomNavBarItem(
                iconPath: "assets/icons/nav_category_icon.svg",
                isSelected: (provider.selectedScreenIndex == 1),
                onClicked: () {
                  provider.changeCurrentScreen(1);
                },
              ),
              CustomBottomNavBarItem(
                iconPath: "assets/icons/nav_favorite_icon.svg",
                isSelected: (provider.selectedScreenIndex == 2),
                onClicked: () {
                  provider.changeCurrentScreen(2);
                },
              ),
              CustomBottomNavBarItem(
                iconPath: "assets/icons/nav_profile_icon.svg",
                isSelected: (provider.selectedScreenIndex == 3),
                onClicked: () {
                  provider.changeCurrentScreen(3);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
