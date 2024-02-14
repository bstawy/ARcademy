import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../layout/layout_view_model.dart';
import 'widgets/profile_app_bar.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_options.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 48.h, left: 24.w, right: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileAppBar(
            title: "Profile",
            onClicked: () {
              Provider.of<LayoutViewModel>(context, listen: false)
                  .changeCurrentScreen(context, 0);
            },
          ),
          SizedBox(height: 16.h),
          const ProfileHeader(),
          SizedBox(height: 16.h),
          const ProfileOptions(),
        ],
      ),
    );
  }
}
