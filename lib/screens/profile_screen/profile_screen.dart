import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/manager/app_provider.dart';
import '../../core/widgets/custom_material_button.dart';
import '../../core/widgets/screen_app_bar.dart';
import '../../layout/layout_view_model.dart';
import '../registration_screens/login_screen/login_screen.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_options.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(top: 46.5.h, left: 24.w, right: 24.w),
      child: (AppProvider.user == null)
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            animate: true,
            child: ScreenAppBar(
              title: "Profile",
              onClicked: () {
                Provider.of<LayoutViewModel>(context, listen: false)
                    .changeCurrentScreen(context, 0);
              },
            ),
          ),
          SizedBox(
            height: 300.h,
          ),
          FadeInUp(
            animate: true,
            delay: const Duration(milliseconds: 50),
            child:  CustomMaterialButton(
              title: "\t\t\t\tLogin\t\t\t\t",
              backgroundColor: theme.colorScheme.primary,
              onClicked: () {
                Navigator.pushNamed(
                    context, LoginScreen.routeName);
              },
            ),
          ),
        ],
      ):
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInDown(
            animate: true,
            child: ScreenAppBar(
              title: "Profile",
              onClicked: () {
                Provider.of<LayoutViewModel>(context, listen: false)
                    .changeCurrentScreen(context, 0);
              },
            ),
          ),
          SizedBox(height: 16.h),
          FadeInUp(
            animate: true,
            delay: const Duration(milliseconds: 50),
            child: const ProfileHeader(),
          ),
          SizedBox(height: 16.h),
          const ProfileOptions(),
        ],
      ),
    );
  }
}
