import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/screen_app_bar.dart';
import '../../layout/layout_view_model.dart';
import 'categories_view_model.dart';
import 'widgets/tab_bar_body.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 48.0),
      child: Consumer<CategoriesViewModel>(
        builder: (context, vm, child) {
          return DefaultTabController(
            length: vm.tabs.length,
            initialIndex: 1,
            child: SizedBox(
              height: (MediaQuery.sizeOf(context).height).h - 190.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: FadeInDown(
                      animate: true,
                      child: ScreenAppBar(
                        title: "Categories",
                        onClicked: () {
                          Provider.of<LayoutViewModel>(context, listen: false)
                              .changeCurrentScreen(context, 0);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  FadeInUp(
                    animate: true,
                    delay: const Duration(milliseconds: 50),
                    child: Text(
                      "Choose",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  FadeInUp(
                    animate: true,
                    delay: const Duration(milliseconds: 100),
                    child: Text(
                      "a System to View",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.headlineMedium,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  FadeInRight(
                    animate: true,
                    delay: const Duration(milliseconds: 150),
                    child: TabBar(
                      tabs: vm.tabs,
                      tabAlignment: TabAlignment.center,
                      padding: EdgeInsets.only(bottom: 24.h),
                      dividerHeight: 0,
                      indicatorColor: theme.colorScheme.primary,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
                      indicatorWeight: 0.5,
                      labelColor: theme.colorScheme.primary,
                      labelStyle: theme.textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: theme.textTheme.titleSmall,
                      isScrollable: true,
                      physics: const ClampingScrollPhysics(),
                      splashFactory:
                          InkSparkle.constantTurbulenceSeedSplashFactory,
                      splashBorderRadius: BorderRadius.circular(25.r),
                      enableFeedback: true,
                      onTap: (value) {
                        vm.changeCurrentItemIndex(0);
                      },
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: TabBarView(
                      children: [
                        TabBarBody(items: vm.items[0]),
                        TabBarBody(items: vm.items[1]),
                        TabBarBody(items: vm.items[2]),
                        TabBarBody(items: vm.items[3]),
                        TabBarBody(items: vm.items[4]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
