import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArViewButton extends StatelessWidget {
  final Function onClicked;

  const ArViewButton({
    super.key,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        onClicked();
      },
      height: 40.h,
      minWidth: 161.w,
      padding: EdgeInsets.all(8.r),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: theme.colorScheme.secondary,
      color: theme.colorScheme.primary,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
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
          ),
          SizedBox(width: 8.w),
          Text(
            "AR View",
            style: theme.textTheme.labelLarge!.copyWith(
              color: theme.colorScheme.onBackground,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
