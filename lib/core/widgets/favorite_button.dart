import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class FavoriteButton extends StatefulWidget {
  TextStyle? textStyle;
  double? height;
  double? minWidth;
  double? padding;
  double? borderRadius;
  final double iconHeight;
  final double iconWidth;
  Color? backgroundColor;
  Color? highlightColor;
  final bool isFavorite;
  final Function onClicked;

  FavoriteButton({
    super.key,
    this.textStyle,
    this.height,
    this.minWidth,
    this.padding,
    this.borderRadius,
    required this.iconWidth,
    required this.iconHeight,
    this.backgroundColor,
    this.highlightColor,
    required this.isFavorite,
    required this.onClicked,
  });

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
      height: widget.height ?? 40.h,
      minWidth: widget.minWidth ?? 40.w,
      padding: EdgeInsets.all(widget.padding ?? 8.r),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: widget.highlightColor ?? theme.colorScheme.secondary,
      color: widget.backgroundColor ?? theme.colorScheme.background,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 15.r),
      ),
      child: (widget.isFavorite)
          ? SvgPicture.asset(
              "assets/icons/favorite_filled_icon.svg",
              colorFilter:
                  ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
              width: widget.iconWidth,
              height: widget.iconHeight,
              fit: BoxFit.contain,
            )
          : SvgPicture.asset(
        "assets/icons/favorite_icon.svg",
              colorFilter:
                  ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
              width: widget.iconWidth,
              height: widget.iconHeight,
              fit: BoxFit.contain,
            ),
    );
  }
}
