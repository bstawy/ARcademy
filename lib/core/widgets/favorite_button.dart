import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final Function onClicked;

  const FavoriteButton(
      {super.key, required this.isFavorite, required this.onClicked});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MaterialButton(
      onPressed: () async {
        widget.onClicked();
      },
      height: 40.h,
      minWidth: 40.w,
      padding: EdgeInsets.all(8.w),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: theme.colorScheme.secondary,
      color: theme.colorScheme.background,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: (widget.isFavorite)
          ? SvgPicture.asset(
              "assets/icons/favorite_filled_icon.svg",
              colorFilter:
                  ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
            )
          : SvgPicture.asset(
              "assets/icons/favorite_icon.svg",
              colorFilter:
                  ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
            ),
    );
  }
}
