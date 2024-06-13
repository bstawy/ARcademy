import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaAuthButton extends StatelessWidget {
  final String label;
  final String iconPath;
  final Function onClicked;

  const SocialMediaAuthButton({
    super.key,
    required this.label,
    required this.iconPath,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () {
        onClicked();
      },
      height: 56.w,
      minWidth: 56.w,
      padding: EdgeInsets.all(16.r),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: theme.colorScheme.secondary,
      color: theme.colorScheme.onSurface,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: SvgPicture.asset(
        iconPath,
        semanticsLabel: label,
      ),
    );
  }
}
