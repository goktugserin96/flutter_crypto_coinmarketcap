import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialProvider extends ChangeNotifier {
  ThemeData _darkMode = ThemeData.dark();
  ThemeData get darkMode => _darkMode;

  ThemeData _lightMode = ThemeData.light();
  ThemeData get lightMode => _lightMode;

  bool _isThemeData = true;
  bool get isThemeData => _isThemeData;

  ThemeData get selectedThemeData => _isThemeData ? _darkMode : _lightMode;

  void toggleStatus() {
    _isThemeData = !_isThemeData;
    notifyListeners();
  }
}
