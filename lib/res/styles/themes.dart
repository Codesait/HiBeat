import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';

class AppTheme {
  /// dark theme data
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Quicksand',
    scaffoldBackgroundColor: AppColors.black,
    backgroundColor: AppColors.black,
    primaryColor: AppColors.primary,
    cardColor: AppColors.black,
    hintColor: AppColors.grey,
    dividerColor: AppColors.primary,
    disabledColor: AppColors.grey,
    useMaterial3: true,
    toggleableActiveColor: AppColors.primary,

    /// appBar theme
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.white),
      elevation: 0,
      color: AppColors.black,
      titleTextStyle: TextStyle(
        fontFamily: 'Quicksand',
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),

    /// text theme
    textTheme: const TextTheme(
      button: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 12,
        color: AppColors.white,
      ),
      subtitle1: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
      headline5: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: AppColors.white),
      bodyText1: TextStyle(color: AppColors.white),
      bodyText2: TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
      overline: TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.primary),
  );

  /// light theme data
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Quicksand',
    scaffoldBackgroundColor: AppColors.white,
    backgroundColor: AppColors.primary,
    primaryColor: AppColors.primary,
    cardColor: AppColors.white,
    hintColor: AppColors.grey,
    dividerColor: AppColors.primary,
    disabledColor: AppColors.grey,
    useMaterial3: true,
    toggleableActiveColor: AppColors.primary,

    /// appBar theme
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),
      titleTextStyle: TextStyle(
        fontFamily: 'Quicksand',
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),

    /// text theme
    textTheme: const TextTheme(
      button: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 12,
        color: AppColors.white,
      ),
      subtitle1: TextStyle(color: AppColors.grey, fontWeight: FontWeight.w600),
      headline5: TextStyle(color: AppColors.grey, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: AppColors.black),
      bodyText1: TextStyle(color: AppColors.black),
      bodyText2: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
      overline: TextStyle(
        color: AppColors.grey,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.primary),
  );
}
