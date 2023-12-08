import 'package:flutter/material.dart';

import '../human_anatomy_view/human_anatomy_view.dart';
import 'widgets/category_card_widget.dart';

class HumanAnatomyWidget extends StatelessWidget {
  const HumanAnatomyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryCardWidget(
      title: "Human Anatomy",
      description:
          "Interact with real-time 3D models for an immersive learning experience like no other.",
      onTap: () {
        Navigator.pushNamed(context, HumanAnatomyView.routeName);
      },
    );
  }
}
