import 'package:ar_cademy/core/services/loading_service.dart';
import 'package:ar_cademy/login_screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/manager/app_manager.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    ThemeMode currentTheme = AppManager.currentTheme;

    return MaterialButton(
      onPressed: () async {
        /*
        if (currentTheme == ThemeMode.light) {
          currentTheme = ThemeMode.dark;
          AppManager.changeTheme(currentTheme);
        } else {
          currentTheme = ThemeMode.light;
          AppManager.changeTheme(currentTheme);
        }
         */
        configureEasyLoading(context);
        EasyLoading.show();
        await FirebaseAuth.instance.signOut();
        EasyLoading.dismiss();
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, LoginScreen.routeName);
        }
      },
      height: 48.w,
      minWidth: 48.w,
      padding: EdgeInsets.all(12.w),
      elevation: 0,
      highlightElevation: 0,
      highlightColor: theme.colorScheme.secondary,
      color: theme.colorScheme.onBackground,
      enableFeedback: true,
      animationDuration: const Duration(milliseconds: 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: SvgPicture.asset(
        "assets/icons/theme_icon.svg",
        colorFilter:
            ColorFilter.mode(theme.colorScheme.primary, BlendMode.srcIn),
      ),
    );
  }
}
