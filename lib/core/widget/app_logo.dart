import 'package:flutter/material.dart';

/// NewPower horizontal logo lockup (DESIGN_GUIDELINES.md §1 "Brand").
/// Native asset is 250×36 (~6.94:1) — sized by [height], width follows the
/// native aspect ratio. Client asset, reused as-is; never recolored.
class AppLogo extends StatelessWidget {
  final double height;

  const AppLogo({super.key, this.height = 36});

  static const double _aspectRatio = 250 / 36;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/newpower-logo.png',
      height: height,
      width: height * _aspectRatio,
      fit: BoxFit.contain,
    );
  }
}
