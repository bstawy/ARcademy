import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/services/loading_service.dart';
import '../../../core/services/snackbar_service.dart';
import '../../../core/web_services/firebase_utils.dart';
import '../../../core/widgets/custom_material_button.dart';
import '../../../core/widgets/custom_sliver_app_bar_widget.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/validation.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static const String routeName = '/forget-password';

  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _resetPasswordFormKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late ScrollController _scrollController;
  bool _isAppBarPinned = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomSliverAppBarWidget(
            title: "Forgot Password",
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
                  Text(
                    "Please Enter Your Email",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: 64.h),
                  Form(
                    key: _resetPasswordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextFormField(
                          textEditingController: _emailController,
                          labelText: "Email",
                          title: "Enter Your Email",
                          validator: (value) => validateEmail(value),
                        ),
                        SizedBox(height: 24.h),
                        CustomMaterialButton(
                          title: "Reset",
                          backgroundColor: theme.colorScheme.primary,
                          onClicked: () {
                            resetPassword();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  resetPassword() async {
    if (_resetPasswordFormKey.currentState!.validate()) {
      configureEasyLoading(context);
      EasyLoading.show();

      var response =
          await FirebaseUtils.resetPassword(email: _emailController.text);

      EasyLoading.dismiss();

      if (context.mounted) {
        if (response == "success") {
          SnackBarService.showSuccessMessage(
              context, 'A password reset link has been sent to your email');
          Navigator.pop(context);
        } else {
          SnackBarService.showErrorMessage(context, response);
        }
      }
    }
  }
}
