import 'package:flutter/material.dart';

import 'color_manager.dart';

class AppTheme {
  ThemeMode themeMode= ThemeMode.light;
  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: ColorsManager.lightPrimary,
      onPrimary: ColorsManager.lightPrimary,
      onPrimaryContainer: ColorsManager.whiteColor,
        onSurface: ColorsManager.greyColor,
      secondary: ColorsManager.lightSecondary,
      onTertiary: ColorsManager.greyColor,

    ),
      scaffoldBackgroundColor: ColorsManager.lightColor,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ColorsManager.mainTextColor,
      ),
      bodySmall: TextStyle(
        color: ColorsManager.greyColor,
        fontSize: 16,
        fontWeight: FontWeight.w400
      ),
      labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ColorsManager.whiteColor
      ),
      labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorsManager.lightPrimary
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: .w400,
        color: ColorsManager.lightPrimary,
        decoration: TextDecoration.underline,
        decorationColor: ColorsManager.lightPrimary,
        decorationThickness: 1,
      ),
    ),
  );




  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(
      primary: ColorsManager.darkPrimary,
      onPrimary: ColorsManager.whiteColor,
      onPrimaryContainer: ColorsManager.darkUnselectedLabel,
      onSurface: ColorsManager.whiteColor,
      secondary: ColorsManager.darkSecondary,
        onTertiary: ColorsManager.darkPrimary,
    ),
    scaffoldBackgroundColor: ColorsManager.darkColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: .w600,
          color: ColorsManager.whiteColor
      ),
        bodySmall: TextStyle(
            color: ColorsManager.darkGreyColor,
            fontSize: 16,
            fontWeight: FontWeight.w400
        ),
      labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ColorsManager.whiteColor
      ),
      labelSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: ColorsManager.whiteColor
      ),
      headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: .w400,
          color: ColorsManager.darkPrimary,
          decoration: TextDecoration.underline,
          decorationColor: ColorsManager.darkPrimary,
        decorationThickness: 1,
      ),
    ),
  );
}