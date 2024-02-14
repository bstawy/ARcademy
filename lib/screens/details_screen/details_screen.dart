import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/widgets/ar_view_button.dart';
import '../../core/widgets/custom_back_button.dart';
import '../../core/widgets/favorite_button.dart';
import '../../models/organ_model.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'details';

  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final organ = ModalRoute.of(context)?.settings.arguments as OrganModel;
    final theme = Theme.of(context);
    int indexOfSpace = organ.title.indexOf(" ");

    double maxWidth =
        (organ.title.substring(0, indexOfSpace).length < 7) ? 200.w : 310.w;
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        elevation: 0,
        forceMaterialTransparency: true,
        leadingWidth: 100.w,
        toolbarHeight: 80.h,
        centerTitle: true,
        leading: Padding(
          padding:
              EdgeInsets.only(left: 24.w, top: 16.h, right: 24.h, bottom: 16.h),
          child: CustomBackButton(
            onClicked: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text(
          organ.system,
          style: theme.textTheme.titleMedium!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                ),
                child: Text(
                  organ.title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayLarge,
                ),
              ),
              SizedBox(height: 24.h),
              Image.asset(
                organ.imagePath,
                width: 204.w,
                height: 313.h,
                fit: BoxFit.contain,
              ),
              Text(
                """
The thoracic cage, also known as the rib cage, is a bony and cartilaginous structure that surrounds and protects the thoracic cavity. 

It consists of 12 pairs of ribs, which can be classified into true ribs, false ribs, and floating ribs. The ribs connect to the thoracic vertebrae in the spine and play a vital role in providing structural support and protecting the organs within the chest.
""",
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium!.copyWith(
                  color: theme.colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: Row(
          children: [
            FavoriteButton(
              height: 56.h,
              minWidth: 56.w,
              padding: 16.r,
              borderRadius: 15.r,
              backgroundColor: theme.colorScheme.onBackground,
              iconHeight: 24.h,
              iconWidth: 24.w,
              isFavorite: organ.isFavorite,
              onClicked: () {},
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: ArViewButton(
                minWidth: 263.w,
                height: 56.h,
                borderRadius: 15.r,
                padding: 16.r,
                textStyle: theme.textTheme.titleMedium!.copyWith(
                  color: theme.colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
                iconWidth: 24.w,
                iconHeight: 24.h,
                onClicked: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
