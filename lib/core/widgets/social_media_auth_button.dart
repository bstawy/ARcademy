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
    var theme = Theme.of(context);

    return Container(
      width: 56.w,
      height: 56.h,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: theme.colorScheme.onBackground,
      ),
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          onClicked();
        },
        enableFeedback: true,
        child: SvgPicture.asset(
          iconPath,
          semanticsLabel: label,
        ),
      ),
    );
  }
}
