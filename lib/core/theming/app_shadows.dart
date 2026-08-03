import 'package:flutter/material.dart';

/// NewPower shadow tokens (DESIGN_GUIDELINES.md §4 "Radii & shadows").
///
/// Exact rgba values from the doc — not brightness-split there, so applied
/// as-is in both themes (own choice, not literal doc content, since the doc
/// has no dark-mode shadow spec).
class AppShadows {
  AppShadows._();

  /// Resting cards: `0 1px 2px rgba(20,20,18,.04), 0 4px 16px -4px rgba(20,20,18,.06)`.
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x0A141412), // rgba(20,20,18,.04)
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
    BoxShadow(
      color: Color(0x0F141412), // rgba(20,20,18,.06)
      offset: Offset(0, 4),
      blurRadius: 16,
      spreadRadius: -4,
    ),
  ];

  /// Interactive cards: `0 2px 4px rgba(20,20,18,.05), 0 10px 28px -6px rgba(20,20,18,.12)`.
  static const List<BoxShadow> cardHover = [
    BoxShadow(
      color: Color(0x0D141412), // rgba(20,20,18,.05)
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
    BoxShadow(
      color: Color(0x1F141412), // rgba(20,20,18,.12)
      offset: Offset(0, 10),
      blurRadius: 28,
      spreadRadius: -6,
    ),
  ];
}
