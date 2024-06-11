import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_material_button.dart';
import '../../../core/widgets/custom_sliver_app_bar_widget.dart';
import '../../../screens/profile_screen/change_password_screen/change_password_form_widget.dart';
import '../../../screens/profile_screen/change_password_screen/forget_password_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = '/change-password';

  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
  late ScrollController _scrollController;
  bool _isAppBarPinned = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _isAppBarPinned =
            _scrollController.offset > 35.h; // Adjust the threshold as needed
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: FadeInDown(
        animate: true,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            CustomSliverAppBarWidget(
              title: "Change Password",
              leadingOnClicked: () {
                Navigator.pop(context);
              },
              isAppBarPinned: _isAppBarPinned,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 75.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const ChangePasswordFormWidget(),
                    SizedBox(height: 24.h),
                    FadeInUp(
                      animate: true,
                      delay: const Duration(milliseconds: 250),
                      child: CustomMaterialButton(
                        title: "Forgot Your Password ?",
                        backgroundColor: theme.colorScheme.onSurface,
                        titleStyle: theme.textTheme.titleMedium!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                        onClicked: () {
                          Navigator.pushNamed(
                              context, ForgetPasswordScreen.routeName);
                        },
                      ),
                    ),
                    SizedBox(height: 75.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
