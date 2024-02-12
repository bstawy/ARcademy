import 'package:flutter/material.dart';

import '../screens/category_screen/category_screen.dart';
import '../screens/favorite_screen/favorite_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_screen/profile_screen.dart';

class LayoutViewModel extends ChangeNotifier {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  int get selectedScreenIndex => _selectedScreenIndex;

  List<Widget> get screen => _screens;

  void changeCurrentScreen(int index) {
    if (_selectedScreenIndex != index) {
      _selectedScreenIndex = index;
      notifyListeners();
    }
  }
}
