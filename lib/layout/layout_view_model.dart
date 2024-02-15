import 'package:ar_cademy/data/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/category_screen/category_screen.dart';
import '../screens/favorites_screen/favorites_screen.dart';
import '../screens/favorites_screen/favorites_view_model.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/profile_screen/profile_screen.dart';

class LayoutViewModel extends ChangeNotifier {
  int _selectedScreenIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  int get selectedScreenIndex => _selectedScreenIndex;

  List<Widget> get screen => _screens;

  void changeCurrentScreen(BuildContext context, int index) {
    if (_selectedScreenIndex != index) {
      _selectedScreenIndex = index;

      if (index == 0 || index == 2) {
        Provider.of<FavoritesViewModel>(context, listen: false).getFavorites();
      }
      notifyListeners();
    }
  }

  getData(context) async {
    await SystemsData.getData(context);
    notifyListeners();
  }
}
