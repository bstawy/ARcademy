import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkipButton extends StatelessWidget {
  final Function onClicked;

  const SkipButton({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        onClicked();
      },
      height: 48.h,
      minWidth: 83.w,
      enableFeedback: false,
      padding: EdgeInsets.all(12.w),
      color: theme.colorScheme.onBackground,
      elevation: 0,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Skip", style: theme.textTheme.labelLarge),
          SizedBox(width: 8.w),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: theme.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
