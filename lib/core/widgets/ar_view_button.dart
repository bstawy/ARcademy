import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../screens/ar_view_screen/ar_view_screen.dart';

class ArViewButton extends StatelessWidget {
  final int? organId;
  final TextStyle? textStyle;
  final double? height;
  final double? minWidth;
  final double? padding;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? highlightColor;
  final double iconWidth;
  final double iconHeight;
  final Color? iconColor;
  final Function? onClicked;

  const ArViewButton({
    super.key,
    this.organId,
    this.textStyle,
    this.height,
    this.minWidth,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.highlightColor,
    required this.iconWidth,
    required this.iconHeight,
    this.iconColor,
    this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(ArViewScreen.routeName, arguments: organId as int);
      },
      height: height ?? 40.h,
      minWidth: minWidth ?? 161.w,
      padding: EdgeInsets.all(padding ?? 8.r),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: highlightColor ?? theme.colorScheme.secondary,
      color: backgroundColor ?? theme.colorScheme.primary,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/ar_icon.svg",
            semanticsLabel: "AR icon",
            colorFilter:
                ColorFilter.mode(theme.colorScheme.onSurface, BlendMode.srcIn),
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 8.w),
          Text(
            "AR View",
            style: textStyle ??
                theme.textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
