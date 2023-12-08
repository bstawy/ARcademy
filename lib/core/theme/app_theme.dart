import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF866EE0);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      centerTitle: false,
      toolbarHeight: 100,
      titleTextStyle: TextStyle(
        color: Color(0XFF112331),
        fontFamily: 'PoppinsMedium',
        fontSize: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
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
        fontFamily: 'PoppinsBold',
        fontSize: 36,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF112331),
        fontFamily: 'PoppinsMedium',
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF26296E),
        fontFamily: 'PoppinsRegular',
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'PoppinsBold',
        fontSize: 36,
        height: 1.0,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'PoppinsRegular',
        fontSize: 12,
        height: 1.4,
      ),
      bodySmall: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'PoppinsRegular',
        fontSize: 10,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF112331),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF112331),
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 100,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'PoppinsMedium',
        fontSize: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
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
        fontFamily: 'PoppinsBold',
        fontSize: 36,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF112331),
        fontFamily: 'PoppinsMedium',
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF26296E),
        fontFamily: 'PoppinsRegular',
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'PoppinsBold',
        fontSize: 36,
        height: 1.0,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'PoppinsRegular',
        fontSize: 12,
        height: 1.4,
      ),
      bodySmall: TextStyle(
        color: Color(0xFFF3F3F3),
        fontFamily: 'PoppinsRegular',
        fontSize: 10,
      ),
    ),
  );
}
