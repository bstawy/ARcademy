import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_bottom_nav_bar_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<CustomBottomNavBarItem> items;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 66.h,
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 32.h),
      padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 11.h),
      decoration: BoxDecoration(
        color: theme.colorScheme.onBackground,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      ),
    );
  }
}
