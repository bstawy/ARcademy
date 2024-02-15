import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_sliver_app_bar_widget.dart';
import 'widgets/custom_sign_up_form_widget.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/sign-up';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
              title: "Create Account",
              leadingOnClicked: () {
                Navigator.pop(context);
              },
              isAppBarPinned: _isAppBarPinned,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeInUp(
                      animate: true,
                      delay: const Duration(milliseconds: 50),
                      child: Text(
                        "Lets create account together",
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    const CustomSignUpFormWidget(),
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
