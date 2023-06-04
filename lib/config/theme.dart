import 'package:flutter/material.dart';

class ThemeConfig {
  static Color lightPrimary = Colors.white;
  static Color darkPrimary = Color(0xff1f1f1f);
  static Color lightBG = Colors.white;
  static Color darkBG = Color(0xff121212);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: lightBG,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: darkBG,
  );
}
