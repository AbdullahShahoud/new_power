import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// NewPower horizontal logo lockup (DESIGN_GUIDELINES.md §1 "Brand").
/// Sized by [height]; width follows the artwork's own aspect ratio.
/// Client asset, reused as-is; never recoloured.
///
/// ⚠️ **The `.svg` is not vector artwork.** It is a base64 PNG wrapped in an
/// `<svg>` element — zero `path`/`rect` elements, one `<image>`. So it
/// rasterises exactly like the old `.png` did and gains no sharpness at any
/// size; `flutter_svg` simply decodes the embedded bitmap.
///
/// Kept on the SVG because that is the asset the brand owner maintains, but
/// if the logo ever looks soft on a high-density screen, the fix is a real
/// vector export from the source file — not anything in this widget.
///
/// ## Dark theme
///
/// Two files, not a colour filter. The lockup is two-tone — red "NEW",
/// near-black "POWER" and rule — so on a dark surface the black half simply
/// disappeared while the red half stayed put, leaving a logo that read as
/// "NEW" alone. A tint would have flattened both halves to one colour and
/// lost the mark entirely.
///
/// `newpower-logo-dark.svg` lifts only the achromatic ink to a light warm
/// neutral and leaves the brand red exactly as delivered, so the two files
/// are the same artwork rather than two different logos. It is generated
/// from the light asset — regenerate it rather than editing it, and if the
/// brand owner ships a new lockup, regenerate from that.
class AppLogo extends StatelessWidget {
  final double height;

  const AppLogo({super.key, this.height = 36});

  /// The SVG's own `viewBox` is `0 0 345 45`, which is the ratio to honour —
  /// the old PNG's 250×36 was a different crop of the same lockup and using
  /// it here would letterbox or stretch the artwork.
  static const double _aspectRatio = 345 / 45;

  @override
  Widget build(BuildContext context) {
    // Read from the ambient Theme, not from `AppColors.isDark` directly, so
    // the logo follows a subtree that overrides brightness (a dark sheet on
    // a light screen) rather than the app-wide setting.
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SvgPicture.asset(
      isDark
          ? 'assets/images/newpower-logo-dark.svg'
          : 'assets/images/newpower-logo.svg',
      height: height,
      width: height * _aspectRatio,
      fit: BoxFit.contain,
      // Reserves the final size while the asset is parsed, so the header
      // does not jump as it appears.
      placeholderBuilder: (_) =>
          SizedBox(height: height, width: height * _aspectRatio),
    );
  }
}
