import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_back_button.dart';

class CustomSliverAppBarWidget extends StatelessWidget {
  final String title;
  final Function leadingOnClicked;
  final bool _isAppBarPinned;

  const CustomSliverAppBarWidget({
    super.key,
    required this.title,
    required this.leadingOnClicked,
    required bool isAppBarPinned,
  }) : _isAppBarPinned = isAppBarPinned;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      pinned: true,
      floating: true,
      automaticallyImplyLeading: false,
      backgroundColor: theme.colorScheme.background,
      toolbarHeight: 73.h,
      expandedHeight: 145.h,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 72.w,
      leading: Padding(
        padding: EdgeInsets.only(top: 18.h, left: 24.w, bottom: 8.h),
        child: CustomBackButton(
          onClicked: () {
            leadingOnClicked();
          },
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        collapseMode: CollapseMode.parallax,
        centerTitle: true,
        titlePadding:
            _isAppBarPinned ? EdgeInsets.only(bottom: 15.h) : EdgeInsets.zero,
        title: Padding(
          padding: EdgeInsets.only(top: 10.h, bottom: 8.h),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
            style: theme.textTheme.displaySmall!,
            child: Text(
              title,
              style: (_isAppBarPinned)
                  ? theme.textTheme.titleMedium!.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    )
                  : theme.textTheme.displaySmall,
            ),
          ),
        ),
      ),
    );
  }
}
