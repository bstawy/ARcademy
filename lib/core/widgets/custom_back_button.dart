import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackButton extends StatelessWidget {
  final Function onClicked;

  const CustomBackButton({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return MaterialButton(
        onPressed: () {
          onClicked();
        },
        height: 48.w,
        minWidth: 48.w,
        enableFeedback: false,
        padding: EdgeInsets.all(12.w),
        color: theme.colorScheme.onBackground,
        elevation: 0,
        animationDuration: const Duration(milliseconds: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: theme.colorScheme.primary,
        ));
  }
}
