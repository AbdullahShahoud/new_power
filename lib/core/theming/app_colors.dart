import 'package:flutter/material.dart';

extension AppColorsExtension on BuildContext {
  /// Get theme-aware colors based on current brightness
  AppColors get colors {
    final isDark = Theme.of(this).brightness == Brightness.dark;
    return isDark ? AppColors.dark : AppColors.light;
  }
}

/// One status color's three documented facets — core (icons/dots/charts),
/// badgeBg and badgeText (pill badges). See DESIGN_GUIDELINES.md §2, "Project
/// status palette".
class StatusColor {
  final Color core;
  final Color badgeBg;
  final Color badgeText;
  const StatusColor({
    required this.core,
    required this.badgeBg,
    required this.badgeText,
  });
}

/// NewPower design tokens (DESIGN_GUIDELINES.md §2 "Color tokens").
///
/// The guidelines document a single (light) palette. Brand/status/chart hues
/// are not brightness-dependent — they're reused verbatim in dark mode. Only
/// the ink/surface *roles* (page background, card surface, text color) flip:
/// dark `page` → `ink950`, dark `surface` → `ink900`, text ramp inverted.
/// That derivation is this file's own extrapolation (the doc has no dark
/// section) — see the design-system audit for the callout.
class AppColors {
  final bool isDark;

  const AppColors._(this.isDark);

  static const light = AppColors._(false);
  static const dark = AppColors._(true);

  // ==================== Brand red ramp (§2) ====================
  Color get brand50 => const Color(0xFFFEF2F2);
  Color get brand100 => const Color(0xFFFDE3E3);
  Color get brand200 => const Color(0xFFFBC9CA);
  Color get brand300 => const Color(0xFFF79FA2);
  Color get brand400 => const Color(0xFFF25A60);
  Color get brand500 => const Color(0xFFEC1B23);
  Color get brand600 => const Color(0xFFCE1219);
  Color get brand700 => const Color(0xFFAB1016);
  Color get brand800 => const Color(0xFF8D1116);
  Color get brand900 => const Color(0xFF751317);
  Color get brand950 => const Color(0xFF400608);

  /// Primary buttons (brand500, hover/pressed brand600), links (brand600).
  Color get primary => brand500;

  // ==================== Ink ramp — warm neutral (§2) ====================
  Color get ink50 => const Color(0xFFF7F6F3);
  Color get ink100 => const Color(0xFFEFEEEA);
  Color get ink200 => const Color(0xFFE1E0D9);
  Color get ink300 => const Color(0xFFC9C7C0);
  Color get ink400 => const Color(0xFFA5A39C);
  Color get ink500 => const Color(0xFF898781);
  Color get ink600 => const Color(0xFF6B6963);
  Color get ink700 => const Color(0xFF52514E);
  Color get ink800 => const Color(0xFF383734);
  Color get ink900 => const Color(0xFF232220);
  Color get ink950 => const Color(0xFF141412);

  // ==================== Surfaces & chrome (§2) ====================
  /// App background. Dark mode: derived as ink950 (own extrapolation).
  Color get page => isDark ? ink950 : const Color(0xFFF7F6F3);

  /// Cards, sidebar, topbar. Dark mode: derived as ink900.
  Color get surface => isDark ? ink900 : const Color(0xFFFFFFFF);

  /// Hairlines, table row dividers. Not brightness-split in the doc.
  Color get chartGrid => const Color(0xFFE7E5E0);

  /// Axis lines. Not brightness-split in the doc.
  Color get chartAxis => const Color(0xFFC9C7C0);

  /// Axis ticks, secondary text. Not brightness-split in the doc.
  Color get chartMuted => const Color(0xFF898781);

  /// Validated secondary series color, pairs with brand500 (§2, §6).
  /// Used as ColorScheme.secondary — the doc's only documented non-status,
  /// non-ink hue meant to sit alongside brand red.
  Color get chartAccent2 => const Color(0xFF0891B2);

  // ==================== Project status palette (§2) — CVD-safe ==========
  StatusColor get statusNew => const StatusColor(
    core: Color(0xFF2563EB),
    badgeBg: Color(0xFFEFF4FF),
    badgeText: Color(0xFF1D4ED8),
  );
  StatusColor get statusFollowUp => const StatusColor(
    core: Color(0xFFC56E05),
    badgeBg: Color(0xFFFDF3E3),
    badgeText: Color(0xFF92510A),
  );
  StatusColor get statusVisit => const StatusColor(
    core: Color(0xFF7C3AED),
    badgeBg: Color(0xFFF5F0FF),
    badgeText: Color(0xFF6D28D9),
  );
  StatusColor get statusWon => const StatusColor(
    core: Color(0xFF15803D),
    badgeBg: Color(0xFFEAF7EE),
    badgeText: Color(0xFF166534),
  );
  StatusColor get statusLost => const StatusColor(
    core: Color(0xFFE24368),
    badgeBg: Color(0xFFFDEEF1),
    badgeText: Color(0xFFBE123C),
  );
  StatusColor get statusClosed => const StatusColor(
    core: Color(0xFFAA5F28),
    badgeBg: Color(0xFFF7EFE7),
    badgeText: Color(0xFF7C451C),
  );

  // ==================== Generic UI semantics ====================
  // The guidelines don't define generic form/UI semantics (they're scoped to
  // project statuses) — mapped onto the closest documented status hue rather
  // than inventing new colors. See design-system audit for this call.
  /// Form errors, destructive actions, error banners → status "lost" (rose).
  Color get error => statusLost.core;

  /// Success confirmations, completed actions → status "won" (green).
  Color get success => statusWon.core;

  /// Warnings, caution states → status "follow_up" (amber).
  Color get warning => statusFollowUp.core;

  /// Informational banners/messages → status "new" (blue). Never brand red —
  /// the doc explicitly reserves brand red away from the "new" status.
  Color get info => statusNew.core;

  Color get white => const Color(0xFFFFFFFF);
  Color get white70 => const Color(0xFFFFFFFF).withValues(alpha: 0.7);

  // ==================== Text (theme-aware) ====================
  /// Primary text — ink900 in light, near-white ink50 in dark.
  Color get textColor => isDark ? ink50 : ink900;

  /// Secondary text (labels, hints, meta) — ink600 in light, ink300 in dark.
  Color get textColor70 => isDark ? ink300 : ink600;

  // The three accessors below are named after the opacity percentages they
  // replaced (70%, 13%, 10% ink), which is why they are PascalCase and why
  // the analyzer flags them. They have ~44 call sites across the widget
  // layer, so renaming them is a mechanical but wide diff — deliberately
  // deferred rather than folded into release-prep, where a sweeping rename
  // would obscure the changes that actually matter for shipping.
  //
  // When renaming: Color70 → textColor70 (it is already a pure alias),
  // Color13 → surfaceSubtle, Color10 → surfaceFaint.

  /// Alias kept for existing call sites — same as [textColor70].
  // ignore: non_constant_identifier_names
  Color get Color70 => textColor70;

  /// Subtle divider/bg tone — ink100 in light, ink800 in dark.
  // ignore: non_constant_identifier_names
  Color get Color13 => isDark ? ink800 : ink100;

  /// Barely-there overlay tone — ink50 in light, ink900 in dark.
  // ignore: non_constant_identifier_names
  Color get Color10 => isDark ? ink900 : ink50;

  /// Links, accent text (e.g. "Create account") → brand600 (§2: "links
  /// (brand-600)").
  Color get textexternail => brand600;

  Color get iconColor => textColor;

  Color get backgroundColor => page;

  /// Header chip background (back-button pill, etc.).
  Color get colorHeader => isDark ? ink800 : surface;

  /// Input fill — surface + ink200 border is the documented input recipe
  /// (§5); this getter supplies the fill half.
  Color get textFiledColor => surface;

  /// Kept as an alias for [chartAccent2] — the doc's only "secondary" hue.
  Color get secondaryColor => chartAccent2;

  /// Legacy alias retained for the few remaining call sites.
  Color get whiteColor70 => white70;
}
