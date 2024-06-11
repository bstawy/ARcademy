import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/ar_view_button.dart';
import '../../core/widgets/custom_action_button.dart';
import '../../core/widgets/favorite_button.dart';
import '../../layout/layout_view_model.dart';
import '../../models/organ_model.dart';
import '../favorites_screen/favorites_view_model.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = 'details';

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List;
    final BuildContext parentContext = args[0];
    final OrganModel organ = args[1];
    final theme = Theme.of(context);

    int indexOfSpace = organ.title.indexOf(" ");
    double maxWidth =
        (organ.title.substring(0, indexOfSpace).length < 7) ? 200.w : 310.w;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 95.w,
        leading: Padding(
          padding:
              EdgeInsets.only(left: 24.w, top: 16.h, right: 24.h, bottom: 16.h),
          child: FadeInLeft(
            animate: true,
            child: CustomActionButton(
              iconPath: "assets/icons/back_icon.svg",
              onClicked: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: FadeInRight(
          animate: true,
          child: Text(organ.system),
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
                child: FadeInLeft(
                  animate: true,
                  delay: const Duration(milliseconds: 50),
                  child: Text(
                    organ.title,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.displayLarge!.copyWith(
                      fontSize: 38.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Hero(
                tag: organ.id,
                child: Image.asset(
                  organ.imagePath,
                  width: 204.w,
                  height: 313.h,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 8.h),
              FadeInUp(
                animate: true,
                delay: const Duration(milliseconds: 100),
                child: Column(
                  children: [
                    Text(
                      organ.description
                          .substring(0, organ.description.indexOf("\n")),
                      textAlign: TextAlign.center,
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                    Text(
                      organ.description
                          .substring(organ.description.indexOf("\n")),
                      textAlign: TextAlign.start,
                      style: theme.textTheme.labelMedium!.copyWith(
                        color: theme.colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: FadeInRight(
          animate: true,
          delay: const Duration(milliseconds: 150),
          child: Row(
            children: [
              FavoriteButton(
                height: 56.h,
                minWidth: 56.w,
                padding: 16.r,
                borderRadius: 15.r,
                backgroundColor: theme.colorScheme.onSurface,
                iconHeight: 24.h,
                iconWidth: 24.w,
                isFavorite: organ.isFavorite,
                onClicked: () {
                  clickOnFavoriteButton(parentContext, organ);
                  setState(() {});
                },
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: ArViewButton(
                  minWidth: 263.w,
                  height: 56.h,
                  borderRadius: 15.r,
                  padding: 16.r,
                  textStyle: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.surface,
                    fontWeight: FontWeight.w600,
                  ),
                  iconWidth: 24.w,
                  iconHeight: 24.h,
                  onClicked: () {
                    // TODO: Navigate to AR View scene
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void clickOnFavoriteButton(BuildContext parentContext, OrganModel organ) {
    final provider =
        Provider.of<FavoritesViewModel>(parentContext, listen: false);
    if (organ.isFavorite) {
      provider.deleteFromFavorites(organ);
    } else {
      provider.addToFavorites(organ);
    }
    organ.isFavorite = !organ.isFavorite;
    Provider.of<LayoutViewModel>(parentContext, listen: false)
        .getData(parentContext);
  }
}
