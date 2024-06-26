import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/web_services/firebase_utils.dart';
import '../../../core/widgets/favorite_button.dart';
import '../../../models/organ_model.dart';
import '../../details_screen/details_screen.dart';

class FavoritesItemCard extends StatelessWidget {
  final OrganModel organ;

  const FavoritesItemCard({super.key, required this.organ});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    int indexOfSpace = organ.title.indexOf(" ");
    double maxWidth =
        (organ.title.substring(0, indexOfSpace).length < 7) ? 120.w : 150.w;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailsScreen.routeName,
            arguments: [context, organ]);
      },
      borderRadius: BorderRadius.circular(25.r),
      splashColor: theme.colorScheme.secondary,
      splashFactory: InkSparkle.splashFactory,
      enableFeedback: true,
      child: Container(
        width: 155.w,
        padding: EdgeInsets.all(10.r),
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
                tag: organ.id,
                child: Image.asset(
                  organ.imagePath,
                  width: 130.w,
                  height: 130.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: maxWidth,
                maxHeight: 40,
              ),
              child: Text(
                organ.title,
                maxLines: 2,
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 16.sp,
                  height: 1.1.h,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Category",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text(
                      organ.system,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                FavoriteButton(
                  height: 25.h,
                  minWidth: 25.w,
                  padding: 5.r,
                  borderRadius: 10.r,
                  iconWidth: 15.r,
                  iconHeight: 15.r,
                  isFavorite: organ.isFavorite,
                  onClicked: () {
                    FirebaseUtils.deleteFromFavorites(itemId: organ.id);
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
