import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomActionButton extends StatelessWidget {
  final double? height;
  final double? minWidth;
  final double? padding;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? highlightColor;
  final String iconPath;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final Function onClicked;

  const CustomActionButton({
    super.key,
    this.height,
    this.minWidth,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.highlightColor,
    required this.iconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        onClicked();
      },
      height: height ?? 48.w,
      minWidth: minWidth ?? 48.w,
      padding: EdgeInsets.all(padding ?? 12.r),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: highlightColor ?? theme.colorScheme.secondary,
      color: backgroundColor ?? theme.colorScheme.onBackground,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
      ),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(
            iconColor ?? theme.colorScheme.primary, BlendMode.srcIn),
        width: iconWidth ?? 24,
        height: iconHeight ?? 24,
        fit: BoxFit.contain,
      ),
    );
  }
}
