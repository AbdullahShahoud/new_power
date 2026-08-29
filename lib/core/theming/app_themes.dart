import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'brand.dart';

/// App-wide ThemeData built from the design tokens (app_colors.dart).
/// `fontFamily` is set globally here per DESIGN_GUIDELINES.md §3
/// ("Configure IBM Plex Sans Arabic globally").
///
/// ⚠️ Both themes are now **functions of the active [Brand]**, where they
/// used to be constant fields. `primaryColor` and `colorScheme.primary` feed
/// every Material default the app has not overridden — text selection
/// handles, the refresh indicator, switches, ripples. Leaving them fixed
/// while `context.colors` followed the brand would have produced a screen
/// that is cyan everywhere the app paints and red everywhere Material does.
class AppThemes {
  static const _fontFamily = 'IBMPlexSansArabic';

  static ThemeData light(Brand brand) =>
      _build(AppColors.of(isDark: false, brand: brand), Brightness.light);

  static ThemeData dark(Brand brand) =>
      _build(AppColors.of(isDark: true, brand: brand), Brightness.dark);

  static ThemeData _build(AppColors colors, Brightness brightness) {
    final scheme =
        brightness == Brightness.dark
            ? ColorScheme.dark(
                primary: colors.brand500,
                secondary: colors.chartAccent2,
                error: colors.statusLost.core,
                surface: colors.surface,
              )
            : ColorScheme.light(
                primary: colors.brand500,
                secondary: colors.chartAccent2,
                error: colors.statusLost.core,
                surface: colors.surface,
              );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: _fontFamily,
      primaryColor: colors.brand500,
      scaffoldBackgroundColor: colors.page,
      colorScheme: scheme,
    );
  }
}
