import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/manager/app_provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 78.w,
          height: 78.h,
          padding: EdgeInsets.all(18.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: theme.colorScheme.background,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 10),
                blurRadius: 20,
                spreadRadius: 0,
                color: theme.colorScheme.shadow.withOpacity(0.05),
              ),
            ],
          ),
          child: SvgPicture.asset(
            "assets/icons/profile_icon.svg",
            colorFilter:
                ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
            width: 43,
            height: 43,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          AppProvider.user!.displayName!,
          style: theme.textTheme.headlineSmall,
        ),
        Text(
          AppProvider.user!.email!,
          style: theme.textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xffC5C5C5),
          ),
        ),
      ],
    );
  }
}
