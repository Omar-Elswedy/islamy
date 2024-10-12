import 'package:flutter/material.dart';
import 'package:islamy/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    dividerColor: AppColors.mainLightColor,
    dividerTheme: DividerThemeData(
      color: AppColors.mainLightColor,
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.mainLightColor,
        onPrimary: AppColors.white,
        secondary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Colors.white,
        onSurface: Colors.white),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.mainLightColor,
      selectedItemColor: AppColors.black,
      unselectedItemColor: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.black),
      color: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    primaryColor: AppColors.mainLightColor,
    scaffoldBackgroundColor: Colors.transparent,
  );
  static ThemeData darkTheme = ThemeData(
    dividerColor: AppColors.gold,
    dividerTheme: DividerThemeData(
      color: AppColors.gold,
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.mainDarkColor,
        onPrimary: AppColors.mainDarkColor,
        secondary: Colors.white,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Colors.white,
        onSurface: Colors.white),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: AppColors.gold,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.gold,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.mainDarkColor,
      selectedItemColor: AppColors.gold,
      unselectedItemColor: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.white),
      color: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    primaryColor: AppColors.mainDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
  );
}
