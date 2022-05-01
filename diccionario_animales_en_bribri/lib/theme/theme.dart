import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darktheme = false;

  ThemeData? _currentTheme;

  bool get darkTheme => _darktheme;

  ThemeData? get currenttheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1:
        _darktheme = false;
        _currentTheme = ThemeData.light();

        break;
      case 2:
        _darktheme = false;
        _currentTheme = ThemeData.dark();
        _currentTheme = ThemeData.light();

        break;
      default:
        _darktheme = false;
        _currentTheme = ThemeData.light();
    }
  }

  set darkTheme(bool value) {
    _darktheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }

    notifyListeners();
  }
}
