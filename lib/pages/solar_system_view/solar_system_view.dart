import 'package:ar_cademy/pages/solar_system_view/widgets/item_card.dart';
import 'package:flutter/material.dart';

class SolarSystemView extends StatelessWidget {
  static const String routeName = "/solar-system";

  const SolarSystemView({super.key});

  final List<ItemCard> items = const [
    ItemCard(
      title: "Sun",
      imagePath: "assets/images/sun.png",
      texturePath: "assets/textures/sun_texture.jpg",
    ),
    ItemCard(
      title: "Mercury Planet",
      imagePath: "assets/images/mercury.png",
      texturePath: "assets/textures/mercury_texture.jpg",
    ),
    ItemCard(
      title: "Earth Planet",
      imagePath: "assets/images/earth.png",
      texturePath: "assets/textures/earth_texture.jpg",
    ),
    ItemCard(
      title: "Jupiter Planet",
      imagePath: "assets/images/jupiter.png",
      texturePath: "assets/textures/jupiter_texture.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Solar System"),
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
