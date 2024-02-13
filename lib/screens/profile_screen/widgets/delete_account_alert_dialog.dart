import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/manager/app_provider.dart';
import '../../../core/services/snackbar_service.dart';
import '../../../core/web_services/firebase_utils.dart';
import '../../../core/widgets/custom_material_button.dart';
import '../../../screens/onboarding_screens/onboarding_screens.dart';

class DeleteAccountAlertDialog extends StatelessWidget {
  const DeleteAccountAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary.withOpacity(0.5),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: double.maxFinite,
                height: 322.h,
                margin: EdgeInsets.symmetric(horizontal: 40.w),
                padding: EdgeInsets.all(16.r),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/alert_icon.svg",
                      colorFilter: ColorFilter.mode(
                          theme.colorScheme.primary, BlendMode.srcIn),
                      width: 50.w,
                      height: 50.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 10.h),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 250.w,
                      ),
                      child: Text(
                        "Are your sure to delete your account?",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineSmall,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 166.w,
                      ),
                      child: Text(
                        "all your favorites will be deleted!",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomMaterialButton(
                            title: "Cancel",
                            backgroundColor: Colors.transparent,
                            titleStyle: theme.textTheme.labelLarge,
                            borderSide: BorderSide(
                              color: theme.colorScheme.primary,
                              width: 1,
                            ),
                            onClicked: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: CustomMaterialButton(
                            title: "Delete",
                            backgroundColor: theme.colorScheme.onPrimary,
                            titleStyle: theme.textTheme.labelLarge!.copyWith(
                              color: const Color(0xffF3F3F3),
                            ),
                            onClicked: () async {
                              EasyLoading.show();

                              var msg = await FirebaseUtils.deleteAccount();

                              EasyLoading.dismiss();

                              AppProvider.userId = 'null';
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString("userId", "null");

                              if (context.mounted) {
                                Navigator.of(context).pop();

                                if (msg == "success") {
                                  SnackBarService.showSuccessMessage(
                                      context, 'Your account has been deleted');
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    OnboardingScreens.routeName,
                                    (route) => false,
                                  );
                                } else {
                                  SnackBarService.showErrorMessage(
                                      context, msg);
                                }
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
