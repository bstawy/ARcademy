import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/manager/app_provider.dart';
import '../../../core/services/loading_service.dart';
import '../../onboarding_screens/onboarding_screens.dart';
import '../account_info_screen/account_info_screen.dart';
import '../change_password_screen/change_password_screen.dart';
import 'delete_account_alert_dialog.dart';
import 'option_widget.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final theme = Theme.of(context);

    final List<Widget> options = [
      FadeInLeft(
        animate: true,
        delay: const Duration(milliseconds: 100),
        child: OptionWidget(
          title: "Account Information",
          iconPath: "assets/icons/profile_icon.svg",
          onTap: () {
            Navigator.pushNamed(context, AccountInfoScreen.routeName);
          },
        ),
      ),
      FadeInRight(
        animate: true,
        delay: const Duration(milliseconds: 150),
        child: OptionWidget(
          title: "Change Password",
          iconPath: "assets/icons/change_password_icon.svg",
          onTap: () {
            Navigator.pushNamed(context, ChangePasswordScreen.routeName);
          },
        ),
      ),
      FadeInLeft(
        animate: true,
        delay: const Duration(milliseconds: 200),
        child: OptionWidget(
          title: "Logout",
          iconPath: "assets/icons/logout_icon.svg",
          onTap: () {
            logout(context, provider);
          },
        ),
      ),
      FadeInRight(
        animate: true,
        delay: const Duration(milliseconds: 250),
        child: OptionWidget(
          title: "Delete Account",
          iconPath: "assets/icons/delete_icon.svg",
          titleStyle: theme.textTheme.labelLarge!.copyWith(
            color: theme.colorScheme.error,
          ),
          selectedColor: const Color(0xffEF233C),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const DeleteAccountAlertDialog();
              },
            );
          },
        ),
      ),
    ];

    return SizedBox(
      height: 350.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return options[index];
        },
        itemCount: options.length,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  void logout(BuildContext context, AppProvider provider) {
    configureEasyLoading(context);
    EasyLoading.show();

    provider.logout();

    EasyLoading.dismiss();

    Navigator.pushNamedAndRemoveUntil(
        context, OnboardingScreens.routeName, (route) => false);
  }
}
