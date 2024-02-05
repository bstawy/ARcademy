import 'package:ar_cademy/core/widgets/ar_view_button.dart';
import 'package:ar_cademy/core/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/item_model.dart';

class ItemCard extends StatefulWidget {
  final ItemModel model;

  const ItemCard({super.key, required this.model});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        // TODO: Navigate to details screen
      },
      borderRadius: BorderRadius.circular(25.r),
      enableFeedback: true,
      splashColor: theme.colorScheme.secondary,
      splashFactory: InkSparkle.splashFactory,
      child: Container(
        width: 248.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/nervous_system/brain 1.png",
                width: 187.w,
                height: 187.h,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              widget.model.title,
              style: theme.textTheme.headlineLarge!.copyWith(
                height: 1.h,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Category",
              style: theme.textTheme.labelSmall!.copyWith(
                color: const Color(0xffC5C5C5),
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              widget.model.system,
              style: theme.textTheme.labelSmall!.copyWith(
                color: const Color(0xffC5C5C5),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                FavoriteButton(
                    isFavorite: widget.model.isFavorite,
                    onClicked: () {
                      widget.model.isFavorite = !widget.model.isFavorite;
                      setState(() {});
                    }),
                SizedBox(width: 8.w),
                ArViewButton(onClicked: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
