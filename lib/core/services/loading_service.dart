import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../theme/application_theme.dart';

void configureEasyLoading(BuildContext context) {
  var theme = Theme.of(context);
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..indicatorSize = 50.0
    ..radius = 25.0
    ..contentPadding = const EdgeInsets.all(25)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = theme.colorScheme.onBackground
    ..indicatorColor = ApplicationTheme.primaryColor
    ..textColor = Colors.white
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = theme.colorScheme.primary.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}
