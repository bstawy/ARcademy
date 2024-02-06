import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void configureEasyLoading(BuildContext context) {
  final theme = Theme.of(context);

  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..indicatorSize = 50.0.r
    ..radius = 25.0.r
    ..contentPadding = EdgeInsets.all(25.r)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = theme.colorScheme.onBackground
    ..indicatorColor = theme.colorScheme.primary
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = theme.colorScheme.primary.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}
