import 'package:flutter/material.dart';

import 'custom_action_widget.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Morning! 🥰',
                style: theme.textTheme.bodySmall!
                    .copyWith(color: theme.colorScheme.onSecondary),
              ),
              Text(
                'Mohamed Bastawy',
                style: theme.textTheme.titleSmall!
                    .copyWith(color: theme.colorScheme.onSecondary),
              ),
            ],
          ),
          const Row(
            children: [
              CustomActionWidget(
                title: "Favorite Icon",
                iconPath: "assets/icons/favorite_icon.svg",
              ),
              SizedBox(width: 8),
              CustomActionWidget(
                title: "Profile Icon",
                iconPath: "assets/icons/profile_icon.svg",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
