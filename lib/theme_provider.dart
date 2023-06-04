import 'package:flutter/material.dart';
import '../config/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData theme = ThemeConfig.darkTheme;

  void setTheme() {
    if (theme == ThemeConfig.darkTheme) {
      theme = ThemeConfig.lightTheme;
    } else {
      theme = ThemeConfig.darkTheme;
    }
    notifyListeners();
  }

  ThemeData get currTheme => theme;
}
