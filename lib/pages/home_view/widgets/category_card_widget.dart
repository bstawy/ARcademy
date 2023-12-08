import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final void Function() onTap;

  const CategoryCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      width: double.infinity,
      height: 380,
      margin: const EdgeInsets.only(top: 16, left: 24, right: 24),
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: const DecorationImage(
          image: AssetImage("assets/images/card_background.png"),
        ),
        //const Color(0xffC4FF35),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
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
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 175,
                    minHeight: 85,
                    maxHeight: 85,
                  ),
                  child: Text(
                    description,
                    maxLines: 5,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 16),
                MaterialButton(
                  onPressed: () => onTap(),
                  minWidth: 116,
                  height: 48,
                  enableFeedback: true,
                  focusColor: const Color(0xff112331),
                  hoverColor: const Color(0xff112331),
                  highlightColor: const Color(0xff112331),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: const BorderSide(
                      color: Color(0xFFF3F3F3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    "Explore",
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
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
    );
  }
}
