import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/widgets/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import '../core/widgets/custom_bottom_nav_bar/custom_bottom_nav_bar_item.dart';
import '../screens/category_screen/categories_view_model.dart';
import '../screens/favorites_screen/favorites_view_model.dart';
import '../screens/home_screen/home_view_model.dart';
import 'layout_view_model.dart';

class Layout extends StatelessWidget {
  static const String routeName = '/layout';

  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LayoutViewModel()..getData(context),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritesViewModel(),
        ),
      ],
      child: Consumer<LayoutViewModel>(
        builder: (context, vm, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  vm.screen[vm.selectedScreenIndex],
                ],
              ),
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: vm.selectedScreenIndex,
              items: [
                CustomBottomNavBarItem(
                  iconPath: "assets/icons/nav_home_icon.svg",
                  isSelected: (vm.selectedScreenIndex == 0),
                  onClicked: () {
                    vm.changeCurrentScreen(context, 0);
                  },
                ),
                CustomBottomNavBarItem(
                  iconPath: "assets/icons/nav_category_icon.svg",
                  isSelected: (vm.selectedScreenIndex == 1),
                  onClicked: () {
                    vm.changeCurrentScreen(context, 1);
                  },
                ),
                CustomBottomNavBarItem(
                  iconPath: "assets/icons/nav_favorite_icon.svg",
                  isSelected: (vm.selectedScreenIndex == 2),
                  onClicked: () {
                    vm.changeCurrentScreen(context, 2);
                  },
                ),
                CustomBottomNavBarItem(
                  iconPath: "assets/icons/nav_profile_icon.svg",
                  isSelected: (vm.selectedScreenIndex == 3),
                  onClicked: () {
                    vm.changeCurrentScreen(context, 3);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
