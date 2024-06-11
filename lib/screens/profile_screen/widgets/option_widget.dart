import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OptionWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final TextStyle? titleStyle;
  final Color? selectedColor;
  final Function onTap;

  const OptionWidget({
    super.key,
    required this.title,
    required this.iconPath,
    this.titleStyle,
    this.selectedColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(13.r),
        enableFeedback: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 44.w,
                  height: 44.h,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: SvgPicture.asset(
                    iconPath,
                    colorFilter: ColorFilter.mode(
                        selectedColor ?? theme.colorScheme.primary,
                        BlendMode.srcIn),
                    width: 16.w,
                    height: 16.h,
                  ),
                ),
                SizedBox(
                  width: 18.w,
                ),
                Text(
                  title,
                  style: titleStyle ?? theme.textTheme.labelLarge,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: selectedColor ?? theme.colorScheme.primary,
              size: 24.r,
            ),
          ],
        ),
      ),
    );
  }
}
