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
      titleTextStyle: const TextStyle(
        color: Color(0xff151D31),
        fontSize: 16,
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
      secondary: const Color(0xff828A89),
      error: const Color(0xffEF233C),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xff151D31),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xff151D31),
    ),
    fontFamily: 'Jakarta',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xff151D31),
        fontSize: 40,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      displayMedium: TextStyle(
        color: Color(0xff151D31),
        fontSize: 36,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      displaySmall: TextStyle(
        color: Color(0xff151D31),
        fontSize: 32,
        fontWeight: FontWeight.w600,
        fontFamily: 'Jakarta',
      ),
      headlineLarge: TextStyle(
        color: Color(0xff151D31),
        fontSize: 28.66,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      headlineMedium: TextStyle(
        color: Color(0xff151D31),
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
      headlineSmall: TextStyle(
        color: Color(0xff151D31),
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
      titleLarge: TextStyle(
        color: Color(0xff151D31),
        fontSize: 18,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      titleMedium: TextStyle(
        color: Color(0xff828a89),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      titleSmall: TextStyle(
        color: Color(0xffC5C5C5),
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jakarta',
      ),
      labelLarge: TextStyle(
        color: Color(0xff151D31),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jakarta',
      ),
      labelMedium: TextStyle(
        color: Color(0xff151D31),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      labelSmall: TextStyle(
        color: Color(0xff151D31),
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      bodyLarge: TextStyle(
        color: Color(0xffF3F3F3),
        fontSize: 8.7,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      bodyMedium: TextStyle(
        color: Color(0xffC5C5C5),
        fontSize: 6.64,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
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
      titleTextStyle: const TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 16,
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
      secondary: const Color(0xff828A89),
      error: const Color(0xffEF233C),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xffFFFFFF),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Color(0xffFFFFFF),
    ),
    fontFamily: 'Jakarta',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 40,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      displayMedium: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 36,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      displaySmall: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 32,
        fontWeight: FontWeight.w600,
        fontFamily: 'Jakarta',
      ),
      headlineLarge: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 28.66,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      headlineMedium: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
      headlineSmall: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
      titleLarge: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 18,
        fontWeight: FontWeight.w800,
        fontFamily: 'Jakarta',
      ),
      titleMedium: TextStyle(
        color: Color(0xff828a89),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      titleSmall: TextStyle(
        color: Color(0xffC5C5C5),
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jakarta',
      ),
      labelLarge: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'Jakarta',
      ),
      labelMedium: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      labelSmall: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      bodyLarge: TextStyle(
        color: Color(0xffF3F3F3),
        fontSize: 8.7,
        fontWeight: FontWeight.w400,
        fontFamily: 'Jakarta',
      ),
      bodyMedium: TextStyle(
        color: Color(0xffC5C5C5),
        fontSize: 6.64,
        fontWeight: FontWeight.w700,
        fontFamily: 'Jakarta',
      ),
    ),
    dialogBackgroundColor: Colors.white,
  );
}
