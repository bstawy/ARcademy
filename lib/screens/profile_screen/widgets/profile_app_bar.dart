import 'package:flutter/material.dart';

import '../../../core/widgets/custom_back_button.dart';

class ProfileAppBar extends StatelessWidget {
  final String title;
  final Function onClicked;

  const ProfileAppBar({
    super.key,
    required this.title,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        CustomBackButton(onClicked: () {
          onClicked();
        }),
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
