import 'package:ar_cademy/home_screen/widgets/item_card.dart';
import 'package:ar_cademy/home_screen/widgets/search_widget.dart';
import 'package:ar_cademy/models/item_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/change_theme_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemCard> items = [
    ItemCard(
      model: ItemModel(
        title: "Brain Anatomy",
        system: "The Nervous System",
        isFavorite: false,
        imagePath: "assets/images/nervous_system/brain.svg",
      ),
    ),
    ItemCard(
      model: ItemModel(
        title: "Brain Anatomy",
        system: "The Nervous System",
        isFavorite: false,
        imagePath: "assets/images/nervous_system/brain.svg",
      ),
    ),
    ItemCard(
      model: ItemModel(
        title: "Brain Anatomy",
        system: "The Nervous System",
        isFavorite: false,
        imagePath: "assets/images/nervous_system/brain.svg",
      ),
    ),
    ItemCard(
      model: ItemModel(
        title: "Brain Anatomy",
        system: "The Nervous System",
        isFavorite: false,
        imagePath: "assets/images/nervous_system/brain.svg",
      ),
    ),
    ItemCard(
      model: ItemModel(
        title: "Brain Anatomy",
        system: "The Nervous System",
        isFavorite: false,
        imagePath: "assets/images/nervous_system/brain.svg",
      ),
    ),
    ItemCard(
      model: ItemModel(
        title: "Brain Anatomy",
        system: "The Nervous System",
        isFavorite: false,
        imagePath: "assets/images/nervous_system/brain.svg",
      ),
    ),
    ItemCard(
      model: ItemModel(
        title: "Brain Anatomy",
        system: "The Nervous System",
        isFavorite: false,
        imagePath: "assets/images/nervous_system/brain.svg",
      ),
    ),
  ];

  int _currentItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 100.h,
        scrolledUnderElevation: 0,
        elevation: 0,
        excludeHeaderSemantics: true,
        title: Padding(
          padding:
              EdgeInsets.only(top: 24.h, left: 8.w, bottom: 8.h, right: 8.w),
          child: Row(
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
                      width: 44.w,
                      height: 44.h,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: theme.colorScheme.background,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 20,
                            spreadRadius: 0,
                            color: theme.colorScheme.primary.withOpacity(0.05),
                          ),
                        ],
                      ),
                      child:
                          SvgPicture.asset("assets/icons/nav_profile_icon.svg"),
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
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                CarouselSlider(
                  items: items,
                  options: CarouselOptions(
                    height: 361.h,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                    scrollPhysics: const BouncingScrollPhysics(),
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.72.w,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                    onPageChanged: (index, reason) {
                      _currentItemIndex = index;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                Center(
                  child: AnimatedSmoothIndicator(
                    activeIndex: _currentItemIndex,
                    count: items.length,
                    axisDirection: Axis.horizontal,
                    effect: ScrollingDotsEffect(
                      activeDotColor: theme.colorScheme.primary,
                      dotColor: theme.colorScheme.secondary,
                      dotHeight: 7,
                      dotWidth: 7,
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Container(
                  height: 66.h,
                  margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8),
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.w, vertical: 11.h),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 44.w,
                        height: 44.h,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(15.r),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 10),
                              blurRadius: 20,
                              spreadRadius: 0,
                              color: theme.colorScheme.primary.withOpacity(0.2),
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/nav_home_icon.svg",
                          colorFilter: ColorFilter.mode(
                              theme.colorScheme.background, BlendMode.srcIn),
                        ),
                      ),
                      Container(
                        width: 44.w,
                        height: 44.h,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/nav_category_icon.svg",
                          colorFilter: ColorFilter.mode(
                              theme.colorScheme.primary, BlendMode.srcIn),
                        ),
                      ),
                      Container(
                        width: 44.w,
                        height: 44.h,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/nav_favorite_icon.svg",
                          colorFilter: ColorFilter.mode(
                              theme.colorScheme.primary, BlendMode.srcIn),
                        ),
                      ),
                      Container(
                        width: 44.w,
                        height: 44.h,
                        padding: EdgeInsets.all(10.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/nav_profile_icon.svg",
                          colorFilter: ColorFilter.mode(
                              theme.colorScheme.primary, BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8.h,
              right: 0,
              child: const SearchButton(),
            ),
          ],
        ),
      ),
    );
  }
}
