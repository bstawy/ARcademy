import 'package:ar_cademy/pages/solar_system_view/ar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const ItemCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 267,
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: const DecorationImage(
          image: AssetImage("assets/images/item_background.png"),
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 200,
                      ),
                      child: Text(
                        title,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 110,
                        minHeight: 50,
                        maxHeight: 50,
                      ),
                      child: Text(
                        "Start Viewing Sun in your real world.",
                        maxLines: 5,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ArView(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(35),
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: theme.colorScheme.onPrimary,
                  child: SvgPicture.asset(
                    "assets/icons/ar_icon.svg",
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 16,
            bottom: 24,
            child: Image.asset(imagePath, width: 200, height: 200),
          ),
        ],
      ),
    );
  }
}
