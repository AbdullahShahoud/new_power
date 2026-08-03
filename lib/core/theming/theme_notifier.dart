import 'package:flutter/material.dart';
import '../helpers/cache_helper.dart';

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light) {
    _loadThemeFromPreferences();
  }

  /// Load saved theme preference on app startup
  Future<void> _loadThemeFromPreferences() async {
    final savedTheme = CacheHelper.getData(key: CacheHelper.themeMode);
    if (savedTheme != null) {
      value = _themeModeFromString(savedTheme);
    }
  }

  /// Toggle between light and dark themes
  Future<void> toggleTheme() async {
    if (value == ThemeMode.light) {
      await setDarkMode();
    } else {
      await setLightMode();
    }
  }

  /// Set light mode
  Future<void> setLightMode() async {
    value = ThemeMode.light;
    await CacheHelper.saveData(key: CacheHelper.themeMode, value: 'light');
  }

  /// Set dark mode
  Future<void> setDarkMode() async {
    value = ThemeMode.dark;
    await CacheHelper.saveData(key: CacheHelper.themeMode, value: 'dark');
  }

  /// Set system mode
  Future<void> setSystemMode() async {
    value = ThemeMode.system;
    await CacheHelper.saveData(key: CacheHelper.themeMode, value: 'system');
  }

  /// Convert string to ThemeMode
  ThemeMode _themeModeFromString(String theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.light;
    }
  }

  /// Check if current theme is dark
  bool get isDarkMode {
    return value == ThemeMode.dark;
  }

  /// Check if current theme is light
  bool get isLightMode {
    return value == ThemeMode.light;
  }
}
