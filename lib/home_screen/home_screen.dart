import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/change_theme_button.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 44.h,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 48.w,
                            height: 48.h,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Mohamed Bastawy",
                                style: theme.textTheme.labelLarge!.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "bastawiie@gmail.com",
                                style: theme.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const ChangeThemeButton(),
                  ],
                ),
                SizedBox(height: 24.h),
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
        ),
      ),
    );
  }
}
