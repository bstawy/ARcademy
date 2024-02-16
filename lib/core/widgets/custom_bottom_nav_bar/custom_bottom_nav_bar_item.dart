import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavBarItem extends StatelessWidget {
  final String iconPath;
  final bool isSelected;
  final void Function() onClicked;

  const CustomBottomNavBarItem({
    super.key,
    required this.iconPath,
    required this.isSelected,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color filterColor =
        isSelected ? theme.colorScheme.background : theme.colorScheme.primary;

    return GestureDetector(
      onTap: onClicked,
      child: Container(
        width: 44.w,
        height: 44.h,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 20.r,
                    spreadRadius: 0,
                    color: theme.colorScheme.shadow.withOpacity(0.2),
                  ),
                ]
              : [],
        ),
        child: SvgPicture.asset(
          iconPath,
          colorFilter: ColorFilter.mode(filterColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
