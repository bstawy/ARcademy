import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF866EE0);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 122,
      titleTextStyle: TextStyle(
        color: Color(0XFF112331),
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        side: BorderSide.none,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      onPrimary: const Color(0xffFEE7B3),
      secondary: const Color(0xffD6FFD8),
      onSecondary: const Color(0xFF112331),
      background: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xFF112331),
        fontFamily: 'Poppins',
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF112331),
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF26296E),
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'Poppins',
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'Poppins',
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF112331),
    appBarTheme: const AppBarTheme(
      color: const Color(0xFF112331),
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 122,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        side: BorderSide.none,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      onPrimary: const Color(0xffFEE7B3),
      secondary: const Color(0xffD6FFD8),
      onSecondary: Colors.white,
      background: const Color(0xFF112331),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Poppins',
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF112331),
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF26296E),
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'Poppins',
        fontSize: 36,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'Poppins',
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
