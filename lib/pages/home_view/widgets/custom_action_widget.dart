import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomActionWidget extends StatelessWidget {
  final String title;
  final String iconPath;

  const CustomActionWidget({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFFF6F6F6),
          width: 1,
        ),
      ),
      child: SvgPicture.asset(
        iconPath,
        semanticsLabel: title,
        colorFilter:
            ColorFilter.mode(theme.colorScheme.onSecondary, BlendMode.srcIn),
        width: 18,
        height: 18,
        fit: BoxFit.fill,
      ),
    );
  }
}
