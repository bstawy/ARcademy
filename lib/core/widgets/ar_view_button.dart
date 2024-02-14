import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class ArViewButton extends StatelessWidget {
  TextStyle? textStyle;
  double? height;
  double? minWidth;
  double? padding;
  double? borderRadius;
  final double iconHeight;
  final double iconWidth;
  Color? backgroundColor;
  Color? highlightColor;
  final Function onClicked;

  ArViewButton({
    super.key,
    this.textStyle,
    this.height,
    this.minWidth,
    this.padding,
    this.borderRadius,
    required this.iconWidth,
    required this.iconHeight,
    this.backgroundColor,
    this.highlightColor,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        onClicked();
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
            colorFilter: ColorFilter.mode(
                theme.colorScheme.onBackground, BlendMode.srcIn),
            width: iconWidth,
            height: iconHeight,
            fit: BoxFit.contain,
          ),
          SizedBox(width: 8.w),
          Text(
            "AR View",
            style: textStyle ??
                theme.textTheme.labelLarge!.copyWith(
                  color: theme.colorScheme.onBackground,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
