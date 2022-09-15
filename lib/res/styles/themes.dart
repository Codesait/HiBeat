import 'package:flutter/material.dart';
import 'package:hi_beat/src/res.dart';

class AppTheme {
  static Color primaryColor = const Color(0xff5AAF62);
  static Color hintColor = const Color(0xff767C86);
  static Color dividerColor = const Color(0xff8A909C);
  static Color lightColor = Colors.white;
  static Color darkColor = const Color(0xff132033);
  static Color disabledColor = const Color(0xff9BA1AB);

  /// dark theme data
  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Quicksand',
    scaffoldBackgroundColor: const Color(0xff141533),
    primaryColor: AppColors.primary,
    cardColor: const Color(0xff232345),
    hintColor: hintColor,
    dividerColor: dividerColor,
    disabledColor: disabledColor,
    toggleableActiveColor: primaryColor,

    /// appBar theme
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      toolbarTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),

    /// text theme
    textTheme: TextTheme(
      button: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 12,
        color: lightColor,
      ),
      subtitle1: TextStyle(color: lightColor, fontWeight: FontWeight.w600),
      subtitle2: TextStyle(color: lightColor),
      headline1: TextStyle(color: lightColor),
      headline2: TextStyle(color: lightColor),
      headline3: TextStyle(color: lightColor),
      headline4: TextStyle(color: lightColor),
      headline5: TextStyle(color: lightColor, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: lightColor),
      bodyText1: TextStyle(color: lightColor),
      bodyText2: TextStyle(color: lightColor),
      caption: TextStyle(color: dividerColor),
      overline: TextStyle(
        color: dividerColor,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightColor),
  );

  /// light theme data
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'poppins',
    primaryColor: primaryColor,
    hintColor: hintColor.withAlpha(200),
    cardColor: lightColor,
    disabledColor: disabledColor,
    dividerColor: dividerColor.withAlpha(120),
    toggleableActiveColor: primaryColor,

    /// appBar theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      color: Colors.transparent,
      iconTheme: IconThemeData(color: darkColor),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: darkColor,
      ),
    ),

    ///text theme
    textTheme: TextTheme(
      button: const TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        fontSize: 12,
      ),
      subtitle1: const TextStyle(fontWeight: FontWeight.w600),
      subtitle2: const TextStyle(),
      headline1: const TextStyle(),
      headline2: const TextStyle(),
      headline3: const TextStyle(),
      headline4: const TextStyle(),
      headline5: const TextStyle(fontWeight: FontWeight.bold),
      headline6: const TextStyle(),
      bodyText1: const TextStyle(),
      bodyText2: const TextStyle(),
      caption: TextStyle(color: dividerColor),
      overline: TextStyle(
        color: dividerColor,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xff132033)),
  );
}
