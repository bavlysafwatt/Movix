import 'package:flutter/material.dart';
import 'package:movix/constants/app_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeMode = AppThemeData.lightTheme;
  final String themeKey = "isDarkTheme";

  ThemeData get themeMode => _themeMode;

  ThemeProvider() {
    loadTheme();
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _themeMode = _themeMode == AppThemeData.darkTheme
        ? AppThemeData.lightTheme
        : AppThemeData.darkTheme;
    await prefs.setBool(themeKey, _themeMode == AppThemeData.darkTheme);
    notifyListeners();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(themeKey) ?? false;
    _themeMode = isDarkMode ? AppThemeData.darkTheme : AppThemeData.lightTheme;
    notifyListeners();
  }
}
