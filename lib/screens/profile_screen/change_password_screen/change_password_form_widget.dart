import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/web_services/firebase_utils.dart';
import '../../../../core/widgets/custom_material_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../core/services/loading_service.dart';
import '../../../core/services/snackbar_service.dart';
import '../../../core/widgets/validation.dart';

class ChangePasswordFormWidget extends StatefulWidget {
  const ChangePasswordFormWidget({super.key});

  @override
  State<ChangePasswordFormWidget> createState() =>
      _ChangePasswordFormWidgetState();
}

class _ChangePasswordFormWidgetState extends State<ChangePasswordFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    oldPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FadeInLeft(
            animate: true,
            delay: const Duration(milliseconds: 50),
            child: CustomTextFormField(
              textEditingController: oldPasswordController,
              labelText: "Old Password",
              hintText: "Enter your old password",
              obscureText: !isPasswordVisible,
              suffixIcon: InkWell(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});
                },
                borderRadius: BorderRadius.circular(15.r),
                child: (isPasswordVisible)
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              validator: (value) {
                return validatePassword(value);
              },
            ),
          ),
          SizedBox(height: 16.h),
          FadeInRight(
            animate: true,
            delay: const Duration(milliseconds: 100),
            child: CustomTextFormField(
              textEditingController: newPasswordController,
              labelText: "New Password",
              hintText: "Enter new password",
              obscureText: !isPasswordVisible,
              suffixIcon: InkWell(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});
                },
                borderRadius: BorderRadius.circular(15.r),
                child: (isPasswordVisible)
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              validator: (value) {
                if (value == oldPasswordController.text) {
                  return "New password must differ than old password";
                }
                return validatePassword(value);
              },
            ),
          ),
          SizedBox(height: 16.h),
          FadeInLeft(
            animate: true,
            delay: const Duration(milliseconds: 150),
            child: CustomTextFormField(
              textEditingController: confirmNewPasswordController,
              labelText: "Confirm Password",
              hintText: "Enter password",
              obscureText: !isPasswordVisible,
              suffixIcon: InkWell(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});
                },
                borderRadius: BorderRadius.circular(15.r),
                child: (isPasswordVisible)
                    ? const Icon(Icons.visibility_off_outlined)
                    : const Icon(Icons.visibility_outlined),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'You must enter your password';
                }

                if (value != newPasswordController.text) {
                  return "Passwords doesn't match";
                }

                return null;
              },
            ),
          ),
          SizedBox(height: 24.h),
          FadeInUp(
            animate: true,
            delay: const Duration(milliseconds: 200),
            child: CustomMaterialButton(
              title: "Change Password",
              backgroundColor: theme.colorScheme.primary,
              onClicked: () {
                changePassword(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> changePassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      configureEasyLoading(context);
      EasyLoading.show();

      String msg = await FirebaseUtils.changePassword(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
      );

      EasyLoading.dismiss();

      if (msg == "success") {
        if (context.mounted) {
          SnackBarService.showSuccessMessage(
              context, "Password changed successfully");
          Navigator.pop(context);
        }
      } else {
        if (context.mounted) SnackBarService.showErrorMessage(context, msg);
      }
    }
  }
}
