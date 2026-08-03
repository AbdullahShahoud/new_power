/// NewPower radius tokens (DESIGN_GUIDELINES.md §4 "Radii & shadows").
///
/// Static — radii aren't brightness-dependent, so no BuildContext is needed
/// (mirrors the free-function style of `spacing.dart`).
class AppRadius {
  AppRadius._();

  /// Cards, dialogs, big buttons. 1rem.
  static const double card = 16;

  /// Inputs, selects, segmented controls. 0.625rem.
  static const double field = 10;

  /// Status badges, small buttons, filter chips, avatars, nav indicator.
  static const double full = 999;
}
