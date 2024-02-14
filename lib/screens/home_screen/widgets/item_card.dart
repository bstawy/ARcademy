import 'package:ar_cademy/screens/details_screen/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/web_services/firebase_utils.dart';
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

    int indexOfSpace = widget.organ.title.indexOf(" ");
    double maxWidth = (widget.organ.title.substring(0, indexOfSpace).length < 7)
        ? 170.w
        : 250.w;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName,
            arguments: widget.organ);
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
                maxWidth: maxWidth,
              ),
              child: Text(
                widget.organ.title,
                maxLines: 2,
                style: theme.textTheme.headlineLarge!.copyWith(
                  height: 1.2.h,
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
                  iconWidth: 24.w,
                  iconHeight: 24.h,
                  isFavorite: widget.organ.isFavorite,
                  onClicked: () {
                    FirebaseUtils.addToFavorites(itemId: widget.organ.id);
                    /*if (widget.organ.isFavorite) {
                        FirebaseUtils.deleteFromFavorites(widget.organ.id);
                      } else {
                        FirebaseUtils.addToFavorites(widget.organ.id);
                      }*/
                    widget.organ.isFavorite = !widget.organ.isFavorite;
                    setState(() {});
                  },
                ),
                SizedBox(width: 8.w),
                ArViewButton(
                  iconWidth: 24.w,
                  iconHeight: 24.h,
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
