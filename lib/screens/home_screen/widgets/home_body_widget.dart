import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home_view_model.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return Column(
          children: [
            FadeInRight(
              animate: true,
              delay: const Duration(milliseconds: 100),
              child: CarouselSlider(
                items: vm.items,
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
                    vm.changeCurrentIemIndex(index);
                  },
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: FadeInLeft(
                animate: true,
                delay: const Duration(milliseconds: 100),
                child: AnimatedSmoothIndicator(
                  activeIndex: vm.currentItemIndex,
                  count: vm.items.length,
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
