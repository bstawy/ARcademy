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

class AccountInfoFormWidget extends StatefulWidget {
  const AccountInfoFormWidget({super.key});

  @override
  State<AccountInfoFormWidget> createState() => _AccountInfoFormWidgetState();
}

class _AccountInfoFormWidgetState extends State<AccountInfoFormWidget> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController emailController;
  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
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
              textEditingController: fullNameController,
              labelText: "Full Name",
              hintText: "Enter Your Name",
              validator: (value) {
                return null;
              },
            ),
          ),
          SizedBox(height: 16.h),
          FadeInRight(
            animate: true,
            delay: const Duration(milliseconds: 100),
            child: CustomTextFormField(
              textEditingController: emailController,
              labelText: "Email",
              hintText: "Enter Your Email",
              validator: (value) {
                return validateEmail(value);
              },
            ),
          ),
          SizedBox(height: 24.h),
          FadeInUp(
            animate: true,
            delay: const Duration(milliseconds: 150),
            child: CustomMaterialButton(
              title: "Update Info",
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

      String msg = await FirebaseUtils.updateAccountInfo(
        fullName: fullNameController.text,
        email: emailController.text,
      );

      EasyLoading.dismiss();

      if (msg == "success") {
        if (emailController.text.isNotEmpty) {
          msg = "Verification email sent to your new email address";
        } else {
          msg = "Account information updated successfully";
        }
        if (context.mounted) {
          SnackBarService.showSuccessMessage(context, msg);
          Navigator.pop(context);
        }
      } else {
        if (context.mounted) SnackBarService.showErrorMessage(context, msg);
      }
    }
  }
}
