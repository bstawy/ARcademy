import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/custom_sliver_app_bar_widget.dart';
import '../../layout/layout_view_model.dart';
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
    return SizedBox(
      height: (MediaQuery.sizeOf(context).height).h - 120.h,
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
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
          ),
        ],
      ),
    );
  }
}
