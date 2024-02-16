import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMaterialButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? padding;
  final double? borderRadius;
  final Color backgroundColor;
  final TextStyle? titleStyle;
  final BorderSide? borderSide;
  final Function onClicked;

  const CustomMaterialButton({
    super.key,
    required this.title,
    this.height,
    this.padding,
    this.borderRadius,
    required this.backgroundColor,
    this.titleStyle,
    this.borderSide,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        onClicked();
      },
      height: height ?? 56.h,
      elevation: 0,
      padding: EdgeInsets.all(padding ?? 16.h),
      color: backgroundColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
        borderSide: borderSide ?? BorderSide.none,
      ),
      child: Text(
        title,
        style: titleStyle ??
            theme.textTheme.titleMedium!.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
