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
class AppLogo extends StatelessWidget {
  final double height;

  const AppLogo({super.key, this.height = 36});

  /// The SVG's own `viewBox` is `0 0 345 45`, which is the ratio to honour —
  /// the old PNG's 250×36 was a different crop of the same lockup and using
  /// it here would letterbox or stretch the artwork.
  static const double _aspectRatio = 345 / 45;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/newpower-logo.svg',
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
