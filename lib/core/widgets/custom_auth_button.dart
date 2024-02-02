import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAuthButton extends StatelessWidget {
  final String title;
  final Function onClicked;

  const CustomAuthButton(
      {super.key, required this.title, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        onClicked;
      },
      height: 56.h,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide.none,
      ),
      elevation: 0,
      padding: EdgeInsets.all(16.h),
      color: theme.colorScheme.primary,
      child: Text(
        "Login",
        style: theme.textTheme.titleMedium!.copyWith(
          color: theme.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
