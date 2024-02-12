import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/widgets/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import '../core/widgets/custom_bottom_nav_bar/custom_bottom_nav_bar_item.dart';
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
          create: (context) => LayoutViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritesViewModel(),
        ),
      ],
      child: Consumer<LayoutViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                viewModel.screen[viewModel.selectedScreenIndex],
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: viewModel.selectedScreenIndex,
              items: [
                CustomBottomNavBarItem(
                  iconPath: "assets/icons/nav_home_icon.svg",
                  isSelected: (viewModel.selectedScreenIndex == 0),
                  onClicked: () {
                    viewModel.changeCurrentScreen(context, 0);
                  },
                ),
                CustomBottomNavBarItem(
                  iconPath: "assets/icons/nav_category_icon.svg",
                  isSelected: (viewModel.selectedScreenIndex == 1),
                  onClicked: () {
                    viewModel.changeCurrentScreen(context, 1);
                  },
                ),
                CustomBottomNavBarItem(
                  iconPath: "assets/icons/nav_favorite_icon.svg",
                  isSelected: (viewModel.selectedScreenIndex == 2),
                  onClicked: () {
                    viewModel.changeCurrentScreen(context, 2);
                  },
                ),
                CustomBottomNavBarItem(
                  iconPath: "assets/icons/nav_profile_icon.svg",
                  isSelected: (viewModel.selectedScreenIndex == 3),
                  onClicked: () {
                    viewModel.changeCurrentScreen(context, 3);
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
