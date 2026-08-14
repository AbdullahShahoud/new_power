import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Generates a custom teardrop marker (brand-colored circle + white glyph +
/// pointer tail) as a `BitmapDescriptor`, entirely in-process — no external
/// asset needed. Used to mark the rep's own projects distinctly from a
/// plain default Google Maps pin. Swap [MapMarkerIcons.projectPin] for
/// `BitmapDescriptor.fromAssetImage(...)` later if a designed PNG/SVG icon
/// is provided instead.
class MapMarkerIcons {
  MapMarkerIcons._();

  static BitmapDescriptor? _projectPin;
  static BitmapDescriptor? _pickedPin;

  /// The rep's own project locations on the nearby-projects map.
  static Future<BitmapDescriptor> projectPin(Color color) async {
    return _projectPin ??= await _generate(color: color, icon: Icons.apartment_rounded);
  }

  /// The single pin dropped by `MapPickerScreen`'s long-press.
  static Future<BitmapDescriptor> pickedPin(Color color) async {
    return _pickedPin ??= await _generate(color: color, icon: Icons.location_on_rounded);
  }

  /// Clears the cache — call if the brand color could change at runtime
  /// (e.g. a future theme picker). Not needed for light/dark mode, since
  /// this app's brand-500 is the same value in both.
  static void reset() {
    _projectPin = null;
    _pickedPin = null;
  }

  static Future<BitmapDescriptor> _generate({
    required Color color,
    required IconData icon,
  }) async {
    const double size = 96;
    const double circleRadius = 32;
    const double circleCenterY = 36;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
      recorder,
      const Rect.fromLTWH(0, 0, size, size),
    );

    final fillPaint = Paint()
      ..color = color
      ..isAntiAlias = true;

    // Teardrop tail.
    final tailPath = Path()
      ..moveTo(size / 2 - 12, circleCenterY + 22)
      ..lineTo(size / 2 + 12, circleCenterY + 22)
      ..lineTo(size / 2, size - 4)
      ..close();
    canvas.drawPath(tailPath, fillPaint);

    // Circle head + white ring border.
    canvas.drawCircle(
      const Offset(size / 2, circleCenterY),
      circleRadius,
      fillPaint,
    );
    canvas.drawCircle(
      const Offset(size / 2, circleCenterY),
      circleRadius,
      Paint()
        ..color = Colors.white
        ..isAntiAlias = true
        ..style = PaintingStyle.stroke
        ..strokeWidth = 4,
    );

    // Glyph.
    final textPainter = TextPainter(textDirection: TextDirection.ltr)
      ..text = TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: circleRadius,
          fontFamily: icon.fontFamily,
          package: icon.fontPackage,
          color: Colors.white,
        ),
      )
      ..layout();
    textPainter.paint(
      canvas,
      Offset(
        size / 2 - textPainter.width / 2,
        circleCenterY - textPainter.height / 2,
      ),
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(size.toInt(), size.toInt());
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.bytes(bytes!.buffer.asUint8List());
  }
}
