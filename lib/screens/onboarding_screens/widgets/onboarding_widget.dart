import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/onboarding_model.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 335.w,
          height: 335.h,
          child: FadeInUp(
            animate: true,
            delay: const Duration(milliseconds: 50),
            child: SvgPicture.asset(model.imagePath),
          ),
        ),
        SizedBox(height: 24.h),
        FadeInLeft(
          animate: true,
          delay: const Duration(milliseconds: 100),
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: theme.textTheme.displaySmall!
                .copyWith(fontSize: 30.sp, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 16.h),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 300.w,
          ),
          child: FadeInRight(
            animate: true,
            delay: const Duration(milliseconds: 150),
            child: Text(
              model.description,
              textAlign: TextAlign.center,
              style: theme.textTheme.labelMedium,
            ),
          ),
        ),
      ],
    );
  }
}
