import 'package:ar_cademy/screens/favorites_screen/favorites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'favorites_item_card.dart';

class FavoritesBody extends StatelessWidget {
  const FavoritesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Consumer<FavoritesViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                Center(
                  child: CircularProgressIndicator(
                      color: theme.colorScheme.primary),
                ),
              ],
            ),
          );
        } else if (viewModel.hasError) {
          return const SliverToBoxAdapter(
            child: Text("Error fetching data"),
          );
        } else {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            sliver: (viewModel.myFavorites.isNotEmpty)
                ? SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return FavoritesItemCard(
                            organ: viewModel.myFavorites[index]);
                      },
                      childCount: viewModel.myFavorites.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                      childAspectRatio: 50.w / 88.h,
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
                        Text(
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
}

/*
{
      if (viewModel.isLoading) {
        return Expanded(
          child: Center(
            child: CircularProgressIndicator(color: theme.colorScheme.primary),
          ),
        );
      }
      else if (viewModel.hasError) {
        return const Expanded(
          child: Center(

          ),
        );
      }
    }
  }
 */
