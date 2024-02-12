import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/web_services/firebase_utils.dart';
import '../../../models/organ_model.dart';
import 'favorites_ar_view_button.dart';
import 'favorites_favorite_button.dart';

class FavoritesItemCard extends StatefulWidget {
  final OrganModel organ;

  const FavoritesItemCard({super.key, required this.organ});

  @override
  State<FavoritesItemCard> createState() => _FavoritesItemCardState();
}

class _FavoritesItemCardState extends State<FavoritesItemCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    int indexOfSpace = widget.organ.title.indexOf(" ");
    double maxWidth = (widget.organ.title.substring(0, indexOfSpace).length < 7)
        ? 120.w
        : 150.w;

    return InkWell(
      onTap: () {
        // TODO: Navigate to details screen
      },
      borderRadius: BorderRadius.circular(25.r),
      splashColor: theme.colorScheme.secondary,
      splashFactory: InkSparkle.splashFactory,
      enableFeedback: true,
      child: Container(
        width: 155.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.onBackground,
          borderRadius: BorderRadius.circular(15.r),
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
                width: 86.5.w,
                height: 130.5.h,
                fit: BoxFit.contain,
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxWidth,
              ),
              child: Text(
                widget.organ.title,
                maxLines: 2,
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 16.sp,
                  height: 1.1.h,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "Category",
              style: theme.textTheme.bodyMedium,
            ),
            Text(
              widget.organ.system,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                FavoritesFavoriteButton(
                  isFavorite: widget.organ.isFavorite,
                  onClicked: () {
                    if (widget.organ.isFavorite) {
                      FirebaseUtils.deleteFromFavorites(
                          itemId: widget.organ.id);
                    } else {
                      FirebaseUtils.addToFavorites(itemId: widget.organ.id);
                    }
                    widget.organ.isFavorite = !widget.organ.isFavorite;
                    setState(() {});
                  },
                ),
                //SizedBox(width: 5.w),
                FavoritesArViewButton(
                  onClicked: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
