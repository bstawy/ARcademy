import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/ar_view_button.dart';
import '../../../core/widgets/favorite_button.dart';
import '../../../models/organ_model.dart';

class ItemCard extends StatefulWidget {
  final OrganModel organ;

  const ItemCard({super.key, required this.organ});

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
      splashColor: theme.colorScheme.secondary,
      splashFactory: InkSparkle.splashFactory,
      enableFeedback: true,
      child: Container(
        width: 248.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 15,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                widget.organ.imagePath,
                width: 187.w,
                height: 187.h,
                fit: BoxFit.contain,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 205.w,
              ),
              child: Text(
                widget.organ.title,
                maxLines: 2,
                style: theme.textTheme.headlineLarge!.copyWith(
                  height: 1.h,
                ),
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
              widget.organ.system,
              style: theme.textTheme.labelSmall!.copyWith(
                color: const Color(0xffC5C5C5),
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                FavoriteButton(
                    isFavorite: widget.organ.isFavorite,
                    onClicked: () {
                      widget.organ.isFavorite = !widget.organ.isFavorite;
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
