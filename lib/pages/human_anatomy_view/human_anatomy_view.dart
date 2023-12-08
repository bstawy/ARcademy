import 'package:flutter/material.dart';

class HumanAnatomyView extends StatelessWidget {
  static const String routeName = "/human-anatomy";

  const HumanAnatomyView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Human Anatomy"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Coming Soon!",
            style: theme.textTheme.titleLarge!.copyWith(
              color: theme.primaryColor,
              fontSize: 28,
            )),
      ),
    );
  }
}
