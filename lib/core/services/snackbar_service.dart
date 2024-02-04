import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SnackBarService {
  static void showSuccessMessage(BuildContext context, String msg) {
    var theme = Theme.of(context);

    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Scaffold(
          backgroundColor: theme.colorScheme.primary.withOpacity(0.5),
          body: Container(
            width: double.maxFinite,
            height: 80.h,
            margin: EdgeInsets.only(top: 52.h, left: 24.w, right: 24.w),
            padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.onBackground,
              borderRadius: BorderRadius.circular(25.r),
            ),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/notifications_icon.svg",
                    colorFilter: ColorFilter.mode(
                        theme.colorScheme.primary, BlendMode.srcIn)),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    msg,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(
        seconds: 2,
      ),
      dismissDirections: [DismissDirection.endToStart],
      useSafeArea: false,
      crossPage: true,
    );
  }

  static void showErrorMessage(BuildContext context, String msg) {
    var theme = Theme.of(context);

    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Scaffold(
          backgroundColor: theme.colorScheme.primary.withOpacity(0.5),
          body: Container(
            width: double.maxFinite,
            height: 80.h,
            margin: EdgeInsets.only(top: 52.h, left: 24.w, right: 24.w),
            padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: theme.colorScheme.onBackground,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/notifications_icon.svg",
                    colorFilter: ColorFilter.mode(
                        theme.colorScheme.error, BlendMode.srcIn)),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    msg,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: theme.colorScheme.error,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      duration: const Duration(
        seconds: 2,
      ),
      dismissDirections: [DismissDirection.endToStart],
      useSafeArea: false,
      crossPage: true,
    );
  }
}
