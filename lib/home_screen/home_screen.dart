import 'package:ar_cademy/home_screen/widgets/item_card.dart';
import 'package:ar_cademy/home_screen/widgets/search_widget.dart';
import 'package:ar_cademy/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/change_theme_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 95.h,
              right: 0,
              child: const SearchButton(),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 44.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 48.w,
                                height: 48.h,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mohamed Bastawy",
                                    style: theme.textTheme.labelLarge!.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "bastawiie@gmail.com",
                                    style: theme.textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const ChangeThemeButton(),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 256.w,
                        maxWidth: 300.w,
                      ),
                      child: Text(
                        "See Beyond The Text Books",
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.displayMedium,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Recently viewed",
                      style: theme.textTheme.headlineSmall,
                    ),
                    SizedBox(height: 24.h),
                    ItemCard(
                      model: ItemModel(
                        title: "Brain Anatomy",
                        system: "The Nervous System",
                        isFavorite: false,
                        imagePath: "assets/images/nervous_system/brain.svg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
