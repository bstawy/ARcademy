import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/app_bar_title_widget.dart';
import 'widgets/home_body_header_widget.dart';
import 'widgets/home_body_widget.dart';
import 'widgets/search_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInDown(animate: true, child: const AppBarTitleWidget()),
        SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInLeft(
                    animate: true,
                    delay: const Duration(milliseconds: 50),
                    child: const HomeBodyHeaderWidget(),
                  ),
                  SizedBox(height: 16.h),
                  const HomeBodyWidget(),
                ],
              ),
              Positioned(
                top: 8.h,
                right: 0,
                child: FadeInRight(
                  animate: true,
                  delay: const Duration(milliseconds: 50),
                  child: const SearchButton(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
