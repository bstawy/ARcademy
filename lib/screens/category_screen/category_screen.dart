import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: Center(
        child: Text(
          "Category Screen",
          style: theme.textTheme.displayMedium,
        ),
      ),
    );
  }
}
