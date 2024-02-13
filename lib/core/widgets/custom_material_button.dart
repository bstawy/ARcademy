import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomMaterialButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  TextStyle? titleStyle;
  BorderSide? borderSide;
  final Function onClicked;

  CustomMaterialButton({
    super.key,
    required this.title,
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
      height: 56.h,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: borderSide ?? BorderSide.none,
      ),
      elevation: 0,
      padding: EdgeInsets.all(16.h),
      color: backgroundColor,
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
