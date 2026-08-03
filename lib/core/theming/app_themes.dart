import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App-wide ThemeData built from NewPower's design tokens (app_colors.dart).
/// `fontFamily` is set globally here per DESIGN_GUIDELINES.md §3
/// ("Configure IBM Plex Sans Arabic globally").
class AppThemes {
  static const _fontFamily = 'IBMPlexSansArabic';

  static const _light = AppColors.light;
  static const _dark = AppColors.dark;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: _fontFamily,
    primaryColor: _light.brand500,
    scaffoldBackgroundColor: _light.page,
    colorScheme: ColorScheme.light(
      primary: _light.brand500,
      secondary: _light.chartAccent2,
      error: _light.statusLost.core,
      surface: _light.surface,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: _fontFamily,
    primaryColor: _dark.brand500,
    scaffoldBackgroundColor: _dark.page,
    colorScheme: ColorScheme.dark(
      primary: _dark.brand500,
      secondary: _dark.chartAccent2,
      error: _dark.statusLost.core,
      surface: _dark.surface,
    ),
  );
}
