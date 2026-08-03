import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

extension TextStylesExtension on BuildContext {
  AppTextStyles get textStyles => AppTextStyles(this);
}

/// NewPower type scale (DESIGN_GUIDELINES.md §3 "Typography").
///
/// Font family is IBM Plex Sans Arabic throughout (self-hosted, see
/// `pubspec.yaml`'s `fonts:` block) — weights 400/500/600/700 only, no light
/// weight (per the doc, needed for Arabic legibility). Names follow the
/// doc's own Tailwind-sized scale (`xs/sm/base/lg/2xl/3xl`) rather than the
/// project's old arbitrary `font14`/`font20` naming, so each getter traces
/// directly back to a row in the doc's type-scale table.
class AppTextStyles {
  final BuildContext context;

  AppTextStyles(this.context);

  AppColors get _colors => context.colors;

  static const String _family = 'IBMPlexSansArabic';

  TextStyle _style(double size, FontWeight weight, {Color? color}) =>
      TextStyle(
        fontSize: size.sp,
        fontWeight: weight,
        fontFamily: _family,
        color: color ?? _colors.textColor,
        height: 1.5, // leading-relaxed, per §3
      );

  // ==================== xs (12) — badges, table headers, labels, meta, hints, small buttons ====================
  TextStyle get xsMedium => _style(12, FontWeight.w500, color: _colors.textColor70);
  TextStyle get xsSemibold => _style(12, FontWeight.w600);
  TextStyle get xsBold => _style(12, FontWeight.w700);

  // ==================== sm (14) — body text, card titles, nav, form fields, table body ====================
  TextStyle get smRegular => _style(14, FontWeight.w400, color: _colors.textColor70);
  TextStyle get smMedium => _style(14, FontWeight.w500);
  TextStyle get smBold => _style(14, FontWeight.w700);

  // ==================== base (16) — dialog titles, mobile stat values ====================
  TextStyle get baseBold => _style(16, FontWeight.w700);

  // ==================== lg (18) — page titles (topbar) ====================
  TextStyle get lgBold => _style(18, FontWeight.w700);

  // ==================== 2xl (24) — KPI numbers in stat cards ====================
  TextStyle get xl2Semibold => _style(24, FontWeight.w600);

  // ==================== 3xl (30) — dashboard hero numbers ====================
  TextStyle get xl3Semibold => _style(30, FontWeight.w600);
  TextStyle get xl3Bold => _style(30, FontWeight.w700);
}
