import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/item_model.dart';
import 'widgets/app_bar_title_widget.dart';
import 'widgets/item_card.dart';
import 'widgets/search_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ItemCard> _items = [
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
    return Column(
      children: [
        const AppBarTitleWidget(),
        SingleChildScrollView(
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
                    items: _items,
                    options: CarouselOptions(
                      height: 378.h,
                      initialPage: 0,
                      scrollDirection: Axis.horizontal,
                      scrollPhysics: const BouncingScrollPhysics(),
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.71.w,
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
                      count: _items.length,
                      axisDirection: Axis.horizontal,
                      effect: ScrollingDotsEffect(
                        activeDotColor: theme.colorScheme.primary,
                        dotColor: theme.colorScheme.secondary,
                        dotHeight: 7,
                        dotWidth: 7,
                      ),
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
      ],
    );
  }
}
