import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Center(
        child: Text(
          "Profile Screen",
          style: theme.textTheme.displayMedium,
        ),
      ),
    );
  }
}
