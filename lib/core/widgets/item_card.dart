import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/organ_model.dart';
import '../../screens/ar_view_screen/ar_view_screen.dart';
import '../../screens/details_screen/details_screen.dart';
import '../manager/app_provider.dart';
import '../services/snackbar_service.dart';
import '../web_services/firebase_utils.dart';
import 'ar_view_button.dart';
import 'favorite_button.dart';

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
            arguments: [context, widget.organ]);
      },
      borderRadius: BorderRadius.circular(25.r),
      splashColor: theme.colorScheme.secondary,
      splashFactory: InkSparkle.splashFactory,
      enableFeedback: true,
      child: Container(
        width: 248.w,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface,
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
              child: Hero(
                tag: widget.organ.id,
                child: Image.asset(
                  widget.organ.imagePath,
                  width: 187.w,
                  height: 187.h,
                  fit: BoxFit.contain,
                ),
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
                    if (AppProvider.user != null) {
                      if (widget.organ.isFavorite) {
                        FirebaseUtils.deleteFromFavorites(
                            itemId: widget.organ.id);
                      } else {
                        FirebaseUtils.addToFavorites(itemId: widget.organ.id);
                      }
                      widget.organ.isFavorite = !widget.organ.isFavorite;
                      setState(() {});
                    } else {
                      SnackBarService.showErrorMessage(
                          context, "Please login first");
                    }
                  },
                ),
                SizedBox(width: 8.w),
                ArViewButton(
                  organId: widget.organ.id,
                  iconWidth: 24.w,
                  iconHeight: 24.h,
                  onClicked: () {
                    Navigator.pushNamed(context, ArViewScreen.routeName,
                        arguments: widget.organ.id);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
