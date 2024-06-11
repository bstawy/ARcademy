import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/manager/app_provider.dart';
import '../../../core/widgets/custom_action_button.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(top: 48, left: 24.w, bottom: 8.h, right: 24.w),
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
                // Profile icon
                Container(
                  width: 44.w,
                  height: 44.h,
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: theme.colorScheme.surface,
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
                    "assets/icons/nav_profile_icon.svg",
                    colorFilter: ColorFilter.mode(
                        theme.colorScheme.primary, BlendMode.srcIn),
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppProvider.user!.displayName!,
                      style: theme.textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      AppProvider.user!.email!,
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomActionButton(
            iconPath: "assets/icons/theme_icon.svg",
            onClicked: () {
              changeTheme(context);
            },
          ),
        ],
      ),
    );
  }

  void changeTheme(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    var newTheme = appProvider.currentTheme == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    appProvider.changeTheme(newTheme);
  }
}
