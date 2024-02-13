import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_sliver_app_bar_widget.dart';
import 'account_info_form_widget.dart';

class AccountInfoScreen extends StatefulWidget {
  static const String routeName = '/account-info';

  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreen();
}

class _AccountInfoScreen extends State<AccountInfoScreen> {
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
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomSliverAppBarWidget(
            title: "Account\nInformation",
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
                  const AccountInfoFormWidget(),
                  SizedBox(height: 75.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
