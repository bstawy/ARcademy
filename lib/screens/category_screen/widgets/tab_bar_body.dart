import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../categories_view_model.dart';

class TabBarBody extends StatelessWidget {
  final List<Widget> items;

  const TabBarBody({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<CategoriesViewModel>(
      builder: (context, vm, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeInLeft(
              animate: true,
              delay: const Duration(milliseconds: 200),
              child: CarouselSlider(
                items: items,
                options: CarouselOptions(
                  height: 390.h,
                  initialPage: 0,
                  scrollDirection: Axis.horizontal,
                  scrollPhysics: const BouncingScrollPhysics(),
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.71,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  onPageChanged: (index, reason) {
                    vm.changeCurrentItemIndex(index);
                  },
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: FadeInRight(
                animate: true,
                delay: const Duration(milliseconds: 200),
                child: AnimatedSmoothIndicator(
                  activeIndex: vm.selectedItemIndex,
                  count: items.length,
                  axisDirection: Axis.horizontal,
                  effect: ScrollingDotsEffect(
                    activeDotColor: theme.colorScheme.primary,
                    dotColor: theme.colorScheme.secondary,
                    dotHeight: 7.h,
                    dotWidth: 7.w,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
