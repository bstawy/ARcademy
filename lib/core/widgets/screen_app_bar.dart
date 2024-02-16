import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_action_button.dart';

class ScreenAppBar extends StatelessWidget {
  final String title;
  final Function onClicked;

  const ScreenAppBar({
    super.key,
    required this.title,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double width = (title.length > 7) ? 70 : 90;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomActionButton(
          iconPath: "assets/icons/back_icon.svg",
          onClicked: () {
            onClicked();
          },
        ),
        SizedBox(width: width.w),
        Text(
          title,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
