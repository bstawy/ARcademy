import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final Function onClicked;

  const CustomBackButton({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        onClicked();
      },
      height: 48.w,
      minWidth: 48.w,
      padding: EdgeInsets.all(12.r),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: theme.colorScheme.secondary,
      color: theme.colorScheme.onBackground,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: theme.colorScheme.primary,
      ),
    );
  }
}
