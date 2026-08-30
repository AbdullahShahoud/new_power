import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theming/app_colors.dart';
import '../theming/brand.dart';

/// The active brand's logo lockup (DESIGN_GUIDELINES.md §1 "Brand").
///
/// Sized by [height]; width follows the artwork's own aspect ratio, which
/// comes from the [Brand] rather than a constant — the three lockups are a
/// 7.7:1 horizontal wordmark, a 1.3:1 block and a square, so one shared
/// ratio would letterbox two of them and stretch the third.
///
/// Client assets, reused as-is; never recoloured.
///
/// ## Dark theme
///
/// Two of the three ship a second file, for the same reason: part of the
/// lockup is drawn in near-black, which disappears on a dark surface.
/// NewPower loses the "POWER" half of its wordmark; OSCO loses its "TOOLS"
/// wordline. Each dark variant lifts only that ink to a light neutral and
/// leaves the brand colour exactly as delivered.
///
/// Smart Home genuinely needs one file — it is drawn entirely in its own
/// cyan and pale teal, with no achromatic ink at all, so it reads on both
/// grounds unchanged.
///
/// If a future lockup introduces near-black ink, give it a dark variant in
/// [Brand.darkLogo] rather than tinting it here — a tint would flatten a
/// two-tone mark to one colour and lose it.
///
/// ⚠️ **The NewPower `.svg` is not vector artwork.** It is a base64 PNG
/// wrapped in an `<svg>` element, so it rasterises and gains no sharpness at
/// any size. The other two are real paths. If the NewPower logo ever looks
/// soft on a high-density screen, the fix is a real vector export from the
/// source file — not anything in this widget.
class AppLogo extends StatelessWidget {
  final double height;

  /// Overrides the ambient selection. Used by the brand picker, which has to
  /// show all three at once before any of them is active.
  final Brand? brand;

  const AppLogo({super.key, this.height = 36, this.brand});

  @override
  Widget build(BuildContext context) {
    final resolved = brand ?? BrandScope.of(context);

    // Read from the ambient Theme, not from `AppColors.isDark` directly, so
    // the logo follows a subtree that overrides brightness (a dark sheet on
    // a light screen) rather than the app-wide setting.
    final brightness = Theme.of(context).brightness;
    final width = height * resolved.logoAspectRatio;

    return SvgPicture.asset(
      resolved.logoFor(brightness),
      height: height,
      width: width,
      fit: BoxFit.contain,
      // Reserves the final size while the asset is parsed, so the header
      // does not jump as it appears.
      placeholderBuilder: (_) => SizedBox(height: height, width: width),
    );
  }
}
