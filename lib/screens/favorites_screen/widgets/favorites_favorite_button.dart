import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoritesFavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final Function onClicked;

  const FavoritesFavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () async {
        onClicked();
      },
      height: 25.h,
      minWidth: 25.w,
      padding: EdgeInsets.all(5.r),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: theme.colorScheme.secondary,
      color: theme.colorScheme.background,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      // remove margins around button
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: (isFavorite)
          ? SvgPicture.asset(
              "assets/icons/favorite_filled_icon.svg",
              colorFilter:
                  ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
              height: 15.r,
              width: 15.r,
              fit: BoxFit.contain,
            )
          : SvgPicture.asset(
              "assets/icons/favorite_icon.svg",
              colorFilter:
                  ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
              height: 15.r,
              width: 15.r,
              fit: BoxFit.contain,
            ),
    );
  }
}
