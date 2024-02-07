import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/manager/app_provider.dart';
import '../../../core/services/loading_service.dart';
import '../../registration_screens/login_screen/login_screen.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);

    return Container(
      width: 110.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          // TODO: Navigate to search screen
          configureEasyLoading(context);
          EasyLoading.show();

          provider.logout();

          EasyLoading.dismiss();

          if (context.mounted) {
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          }
        },
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
        elevation: 0,
        highlightElevation: 0,
        highlightColor: theme.colorScheme.secondary,
        color: theme.colorScheme.onBackground,
        enableFeedback: true,
        animationDuration: const Duration(milliseconds: 50),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            bottomLeft: Radius.circular(18.r),
          ),
          borderSide: BorderSide.none,
        ),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/search_icon.svg"),
            SizedBox(width: 8.w),
            Text(
              "Search",
              style: theme.textTheme.labelMedium!.copyWith(
                color: theme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
