import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Center(
        child: Text(
          "Favorite Screen",
          style: theme.textTheme.displayMedium,
        ),
      ),
    );
  }
}
