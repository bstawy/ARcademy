import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../onboarding_model.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 335.w,
          height: 335.h,
          child: SvgPicture.asset(model.imagePath),
        ),
        SizedBox(height: 24.h),
        Text(
          model.title,
          textAlign: TextAlign.center,
          style: theme.textTheme.displaySmall!
              .copyWith(fontSize: 30, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 16.h),
        ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 300.w,
            maxWidth: 300.w,
          ),
          child: Text(
            model.description,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
