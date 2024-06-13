import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/manager/app_provider.dart';
import '../../../core/widgets/custom_material_button.dart';
import '../../registration_screens/login_screen/login_screen.dart';
import '../favorites_view_model.dart';
import 'favorites_item_card.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Consumer<FavoritesViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return buildLoadingWidget(theme);
        } else if (viewModel.hasError) {
          return buildErrorWidget(theme);
        } else {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            sliver: (viewModel.myFavorites.isNotEmpty)
                ? SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return FadeInUp(
                          animate: true,
                          delay: const Duration(milliseconds: 50),
                          child: FavoritesItemCard(
                              organ: viewModel.myFavorites[index]),
                        );
                      },
                      childCount: viewModel.myFavorites.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: ((MediaQuery.of(context).size.width -
                                  (24.w + 24.w + 16.w)) /
                              2) /
                          220.h,
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 170.h,
                        ),
                        (AppProvider.user == null)
                            ? CustomMaterialButton(
                          title: "\t\t\t\tLogin\t\t\t\t",
                          backgroundColor: theme.colorScheme.primary,
                          onClicked: () {
                            Navigator.pushNamed(
                                context, LoginScreen.routeName);
                          },
                        )
                            : Text(
                          "No Favorites",
                          style: theme.textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
          );
        }
      },
    );
  }

  SliverToBoxAdapter buildErrorWidget(ThemeData theme) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: Text(
              "Error fetching data",
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter buildLoadingWidget(ThemeData theme) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(
            height: 100.h,
          ),
          Center(
            child: CircularProgressIndicator(color: theme.colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
