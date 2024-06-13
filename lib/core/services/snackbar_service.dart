import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SnackBarService {
  static void showSuccessMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: false,
      crossPage: true,
      dismissDirections: [DismissDirection.endToStart],
      duration: const Duration(
        seconds: 2,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, "success", msg);
      },
    );
  }

  static void showErrorMessage(BuildContext context, String msg) {
    BotToast.showCustomNotification(
      useSafeArea: false,
      crossPage: true,
      dismissDirections: [DismissDirection.endToStart],
      duration: const Duration(
        seconds: 2,
      ),
      toastBuilder: (void Function() cancelFunc) {
        return _buildNotificationWidget(context, "error", msg);
      },
    );
  }

  static Widget _buildNotificationWidget(
    BuildContext context,
    String state,
    String msg,
  ) {
    final theme = Theme.of(context);

    Color msgColor = (state == "success")
        ? theme.colorScheme.primary
        : theme.colorScheme.error;

    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: 52.h, left: 24.w, right: 24.w),
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface,
          borderRadius: BorderRadius.circular(25.r),
        ),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/notifications_icon.svg",
                colorFilter: ColorFilter.mode(msgColor, BlendMode.srcIn)),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                msg,
                textAlign: TextAlign.start,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleSmall!.copyWith(
                  color: msgColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
