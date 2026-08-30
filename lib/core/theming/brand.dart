import 'package:flutter/material.dart';

/// The three product lines this app ships for.
///
/// One binary, three identities: the rep picks theirs on first launch and it
/// changes the logo and the accent ramp. Everything else — layout, copy,
/// endpoints — is identical, so this is a theming concern and deliberately
/// not a flavour or a separate build.
///
/// The choice is **permanent for the install** (see `BrandManager`), so the
/// enum's [storageKey] is a contract: renaming a value would silently reset
/// every existing user to the picker.
enum Brand {
  newPower(
    storageKey: 'newPower',
    displayNameKey: 'brand_new_power',
    lightLogo: 'assets/images/newpower-logo.svg',
    // The only brand needing a second file: its wordmark is half near-black,
    // which disappears on a dark ground. The other two are drawn in their
    // own accent and read on both.
    darkLogo: 'assets/images/newpower-logo-dark.svg',
    logoAspectRatio: 345 / 45,
    palette: BrandPalette(
      shade50: Color(0xFFFEF2F2),
      shade100: Color(0xFFFDE3E3),
      shade200: Color(0xFFFBC9CA),
      shade300: Color(0xFFF79FA2),
      shade400: Color(0xFFF25A60),
      shade500: Color(0xFFEC1B23),
      shade600: Color(0xFFCE1219),
      shade700: Color(0xFFAB1016),
      shade800: Color(0xFF8D1116),
      shade900: Color(0xFF751317),
      shade950: Color(0xFF400608),
    ),
  ),

  osco(
    storageKey: 'osco',
    displayNameKey: 'brand_osco',
    lightLogo: 'assets/images/logo_smart_2.svg',
    // Its "TOOLS" wordline is black and disappears on a dark ground, exactly
    // like NewPower's. The dark file lifts only those glyphs to a light
    // neutral; the red mark and the pill are untouched.
    darkLogo: 'assets/images/logo_smart_2-dark.svg',
    // Measured off the rendered ink, not read off the file's own viewBox.
    // The Illustrator export declared 425.2×330 (1.29:1) but the artwork
    // only occupied 62% of that width and 32% of its height — the rest was
    // empty canvas. `SvgPicture(height:)` scales the *viewBox*, so a third
    // of the requested height was margin and the lockup rendered tiny.
    // The viewBox is now cropped to the ink and this is its true ratio.
    logoAspectRatio: 262.1 / 104.5,
    palette: BrandPalette(
      shade50: Color(0xFFFDF2F2),
      shade100: Color(0xFFFBE2E3),
      shade200: Color(0xFFF7C8C9),
      shade300: Color(0xFFEF9DA0),
      shade400: Color(0xFFE5565B),
      shade500: Color(0xFFCE2127),
      shade600: Color(0xFFAE1D22),
      shade700: Color(0xFF91191D),
      shade800: Color(0xFF78181B),
      shade900: Color(0xFF64181A),
      shade950: Color(0xFF36090B),
    ),
  ),

  smartHome(
    storageKey: 'smartHome',
    displayNameKey: 'brand_smart_home',
    lightLogo: 'assets/images/logo_smart_1.svg',
    darkLogo: 'assets/images/logo_smart_1.svg',
    // Same story as OSCO, worse: the export declared a square 1000×1000 box
    // whose ink filled 87% of the width but only **30%** of the height. At
    // `height: 28` on the home header that left roughly 9px of actual
    // artwork. Cropped to the ink, the lockup is a 2.9:1 horizontal mark —
    // which is what it always was.
    logoAspectRatio: 873.4 / 300,
    palette: BrandPalette(
      shade50: Color(0xFFF3FAFD),
      shade100: Color(0xFFE5F5FC),
      shade200: Color(0xFFCDEBF8),
      shade300: Color(0xFFA5DBF2),
      shade400: Color(0xFF65C1E9),
      shade500: Color(0xFF2AA9E0),
      shade600: Color(0xFF1D92C5),
      shade700: Color(0xFF197AA4),
      shade800: Color(0xFF196687),
      shade900: Color(0xFF195671),
      shade950: Color(0xFF0A2E3D),
    ),
  );

  const Brand({
    required this.storageKey,
    required this.displayNameKey,
    required this.lightLogo,
    required this.darkLogo,
    required this.logoAspectRatio,
    required this.palette,
  });

  /// Persisted value. **Do not rename** — see the note on the enum.
  final String storageKey;

  /// Localisation key for the name shown in the picker.
  final String displayNameKey;

  final String lightLogo;
  final String darkLogo;

  /// Width ÷ height of the artwork. The three lockups are wildly different
  /// shapes — a 7.7:1 horizontal wordmark, a 1.3:1 block and a square — so
  /// `AppLogo` cannot assume one ratio and stay undistorted.
  final double logoAspectRatio;

  final BrandPalette palette;

  String logoFor(Brightness brightness) =>
      brightness == Brightness.dark ? darkLogo : lightLogo;

  /// Resolves a persisted [storageKey]. Returns null for an unknown value —
  /// which is treated as "not chosen yet" rather than defaulted, so a
  /// corrupted preference sends the rep back to the picker instead of
  /// silently rebranding their app.
  static Brand? fromStorageKey(String? key) {
    if (key == null) return null;
    for (final brand in Brand.values) {
      if (brand.storageKey == key) return brand;
    }
    return null;
  }
}

/// A brand's accent ramp, 50 (lightest tint) → 950 (near-black).
///
/// Every brand supplies all eleven steps because the app uses them at
/// specific jobs — `shade300` for a focused input border, `shade600` for
/// links and pressed states, `shade50` for a tinted row. The three ramps
/// share one lightness/saturation curve so those choices hold their contrast
/// whichever brand is active; only the hue moves.
class BrandPalette {
  final Color shade50;
  final Color shade100;
  final Color shade200;
  final Color shade300;
  final Color shade400;
  final Color shade500;
  final Color shade600;
  final Color shade700;
  final Color shade800;
  final Color shade900;
  final Color shade950;

  const BrandPalette({
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
    required this.shade950,
  });
}
