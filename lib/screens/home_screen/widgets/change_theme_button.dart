import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/services/loading_service.dart';
import '../../registration_screens/login_screen/login_screen.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return MaterialButton(
      onPressed: () async {
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
