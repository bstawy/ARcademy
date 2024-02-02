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
      displayLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 40.sp,
        fontWeight: FontWeight.w800,
      ),
      displayMedium: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 36.sp,
        fontWeight: FontWeight.w800,
      ),
      displaySmall: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 28.66.sp,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: TextStyle(
        color: const Color(0xffffffff),
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: const Color(0xffC5C5C5),
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: const Color(0xffF3F3F3),
        fontSize: 8.7.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: const Color(0xffC5C5C5),
        fontSize: 6.64.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
    dialogBackgroundColor: Colors.white,
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff333C4B),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xff333C4B),
      elevation: 0,
      toolbarHeight: 115.h,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Jakarta',
      ),
    ),
    primaryColor: const Color(0xffFFFFFF),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffFFFFFF),
      primary: const Color(0xffFFFFFF),
      background: const Color(0xff333C4B),
      onBackground: const Color(0xff4A4C5B),
      error: const Color(0xffEF233C),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xffFFFFFF),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xffFFFFFF),
    ),
    fontFamily: 'Jakarta',
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 40.sp,
        fontWeight: FontWeight.w800,
      ),
      displayMedium: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 36.sp,
        fontWeight: FontWeight.w800,
      ),
      displaySmall: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 28.66.sp,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
      ),
      titleMedium: TextStyle(
        color: const Color(0xffffffff),
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        color: const Color(0xffC5C5C5),
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
      ),
      labelLarge: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: const Color(0xffF3F3F3),
        fontSize: 8.7.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        color: const Color(0xffC5C5C5),
        fontSize: 6.64.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
    dialogBackgroundColor: Colors.white,
  );
}
