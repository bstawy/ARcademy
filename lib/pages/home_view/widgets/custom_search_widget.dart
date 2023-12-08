import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 183,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.only(left: 16),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: const Color(0xffBBF6E2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: () {
          //showSearch(context: context, delegate: delegate)
        },
        child: const Row(
          children: [
            Icon(
              Icons.search,
              color: Color(0xff112331),
            ),
            SizedBox(width: 8),
            Text(
              'Search...',
              style: TextStyle(
                color: Color(0xff26296E),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
