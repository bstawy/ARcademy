import 'package:flutter/material.dart';

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
  int _selectedScreenIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void _changeCurrentScreen(int index) {
    if (_selectedScreenIndex != index) {
      _selectedScreenIndex = index;
      setState(() {
        debugPrint("Current screen index = $_selectedScreenIndex");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _screens[_selectedScreenIndex],
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedScreenIndex,
        items: [
          CustomBottomNavBarItem(
            iconPath: "assets/icons/nav_home_icon.svg",
            isSelected: (_selectedScreenIndex == 0),
            onClicked: () {
              _changeCurrentScreen(0);
            },
          ),
          CustomBottomNavBarItem(
            iconPath: "assets/icons/nav_category_icon.svg",
            isSelected: (_selectedScreenIndex == 1),
            onClicked: () {
              _changeCurrentScreen(1);
            },
          ),
          CustomBottomNavBarItem(
            iconPath: "assets/icons/nav_favorite_icon.svg",
            isSelected: (_selectedScreenIndex == 2),
            onClicked: () {
              _changeCurrentScreen(2);
            },
          ),
          CustomBottomNavBarItem(
            iconPath: "assets/icons/nav_profile_icon.svg",
            isSelected: (_selectedScreenIndex == 3),
            onClicked: () {
              _changeCurrentScreen(3);
            },
          ),
        ],
      ),
    );
  }
}
