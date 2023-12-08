import 'package:flutter/material.dart';

import '../solar_system_view/solar_system_view.dart';
import 'widgets/category_card_widget.dart';

class SolarSystemWidget extends StatelessWidget {
  const SolarSystemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CategoryCardWidget(
      title: "Solar System",
      description:
          "Interact with real-time 3D models for an immersive learning experience like no other.",
      onTap: () {
        Navigator.pushNamed(context, SolarSystemView.routeName);
      },
    );
  }
}
