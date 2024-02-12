import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_sliver_app_bar_widget.dart';
import '../../layout/layout_view_model.dart';
import 'favorites_view_model.dart';
import 'widgets/favorites_body.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late ScrollController _scrollController;
  bool _isAppBarPinned = false;

  @override
  initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarPinned =
            _scrollController.offset > 35.h; // Adjust the threshold as needed
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Consumer<FavoritesViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return Expanded(
            child: Center(
              child:
                  CircularProgressIndicator(color: theme.colorScheme.primary),
            ),
          );
        } else if (viewModel.hasError) {
          return const Expanded(
            child: Center(
              child: Text("Error fetching data"),
            ),
          );
        } else {
          return Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                CustomSliverAppBarWidget(
                  title: "Favorites",
                  leadingOnClicked: () {
                    Provider.of<LayoutViewModel>(context, listen: false)
                        .changeCurrentScreen(context, 0);
                  },
                  isAppBarPinned: _isAppBarPinned,
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 75.h,
                  ),
                ),
                const FavoritesBody(),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 45.h,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
