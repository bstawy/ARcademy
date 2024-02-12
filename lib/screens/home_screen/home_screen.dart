import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_view_model.dart';
import 'widgets/app_bar_title_widget.dart';
import 'widgets/search_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                        Consumer<HomeViewModel>(
                          builder: (context, viewModel, child) {
                            return InkWell(
                              onTap: () {
                                viewModel.changeSelectedSystemIndex();
                              },
                              child: Text(
                                "Recently viewed",
                                style: theme.textTheme.headlineSmall,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Consumer<HomeViewModel>(
                    builder: (context, viewModel, child) {
                      return CarouselSlider(
                        items: viewModel.items[viewModel.selectedSystemIndex],
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
                            viewModel.changeCurrentIemIndex(index);
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  Center(
                    child: Consumer<HomeViewModel>(
                      builder: (context, viewModel, child) {
                        return AnimatedSmoothIndicator(
                          activeIndex: viewModel.currentItemIndex,
                          count: viewModel
                              .items[viewModel.selectedSystemIndex].length,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                            activeDotColor: theme.colorScheme.primary,
                            dotColor: theme.colorScheme.secondary,
                            dotHeight: 7.h,
                            dotWidth: 7.w,
                          ),
                        );
                      },
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
