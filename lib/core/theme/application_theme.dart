import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xffF3F3F3),

    // Configure colors for light mode
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff151D31),
      primary: const Color(0xff151D31),
      background: const Color(0xffF3F3F3),
      onBackground: const Color(0xffffffff),
      secondary: const Color(0xff828A89),
      error: const Color(0xffEF233C),
    ),

    // Configure text styles
    fontFamily: 'Jakarta',
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 40.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      displayMedium: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 36.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      displaySmall: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Jakarta',
      ),
      headlineLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 26.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      headlineMedium: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
      headlineSmall: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
      titleLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      titleMedium: TextStyle(
        color: const Color(0xff828a89),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      titleSmall: TextStyle(
        color: const Color(0xffC5C5C5),
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jakarta',
      ),
      labelLarge: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jakarta',
      ),
      labelMedium: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      labelSmall: TextStyle(
        color: const Color(0xff151D31),
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      bodyLarge: TextStyle(
        color: const Color(0xffF3F3F3),
        fontSize: 8.7.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      bodyMedium: TextStyle(
        color: const Color(0xffC5C5C5),
        fontSize: 6.64.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff333C4B),

    // Configure colors for dark mode
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffFFFFFF),
      primary: const Color(0xffFFFFFF),
      background: const Color(0xff333C4B),
      onBackground: const Color(0xff4A4C5B),
      secondary: const Color(0xff828A89),
      error: const Color(0xffEF233C),
    ),

    // Configure text styles
    fontFamily: 'Jakarta',
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 40.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      displayMedium: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 36.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      displaySmall: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 32.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Jakarta',
      ),
      headlineLarge: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 28.66.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      headlineMedium: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
      headlineSmall: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
      titleLarge: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      titleMedium: TextStyle(
        color: const Color(0xff828a89),
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      titleSmall: TextStyle(
        color: const Color(0xffC5C5C5),
        fontSize: 15.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jakarta',
      ),
      labelLarge: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jakarta',
      ),
      labelMedium: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      labelSmall: TextStyle(
        color: const Color(0xffFFFFFF),
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      bodyLarge: TextStyle(
        color: const Color(0xffF3F3F3),
        fontSize: 8.7.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      bodyMedium: TextStyle(
        color: const Color(0xffC5C5C5),
        fontSize: 6.64.sp,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
    ),
  );
}