import 'package:ar_cademy/pages/solar_system_view/widgets/item_card.dart';
import 'package:flutter/material.dart';

class SolarSystemView extends StatelessWidget {
  static const String routeName = "/solar-system";

  const SolarSystemView({super.key});

  final List<ItemCard> items = const [
    ItemCard(title: "Sun", imagePath: "assets/images/sun.png"),
    ItemCard(title: "Mercury Planet", imagePath: "assets/images/mercury.png"),
    ItemCard(title: "Earth Planet", imagePath: "assets/images/earth.png"),
    ItemCard(title: "Jupiter Planet", imagePath: "assets/images/jupiter.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solar System"),
      ),
      body: Expanded(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
    );
  }
}
