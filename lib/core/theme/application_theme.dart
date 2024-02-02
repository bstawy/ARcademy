import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF3F3F3),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xffF3F3F3),
      elevation: 0,
      toolbarHeight: 115.h,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Jakarta',
      ),
    ),
    primaryColor: const Color(0xff151D31),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff151D31),
      primary: const Color(0xff151D31),
      background: const Color(0xffF3F3F3),
      onBackground: const Color(0xffffffff),
      secondary: const Color(0xffA8A8A8),
      error: const Color(0xffEF233C),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff151D31),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xff151D31),
    ),
    fontFamily: 'Jakarta',
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 36.sp,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 40.sp,
        fontWeight: FontWeight.w800,
      ),
      labelMedium: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 28.5.sp,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}
