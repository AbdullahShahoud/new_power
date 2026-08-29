// TEMPORARY. Rasterises each brand lockup at a fixed height onto a light and
// a dark ground so the artwork can be looked at before its sizing and colour
// are decided. Not an assertion — delete once the logos are settled.
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _shoot(
  WidgetTester tester,
  String asset,
  Color background,
  String outName,
  double height,
) async {
  final repaintKey = GlobalKey();
  await tester.pumpWidget(
    MaterialApp(
      home: RepaintBoundary(
        key: repaintKey,
        child: Container(
          color: background,
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: SvgPicture.asset(asset, height: height),
        ),
      ),
    ),
  );
  await tester.pump(const Duration(milliseconds: 300));
  await tester.pump(const Duration(milliseconds: 300));

  final boundary =
      repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  final image = await boundary.toImage(pixelRatio: 3);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  final dir = Directory('build/logo-preview')..createSync(recursive: true);
  File('${dir.path}/$outName').writeAsBytesSync(
    bytes!.buffer.asUint8List(),
  );
}

void main() {
  testWidgets('rasterise brand lockups', (tester) async {
    tester.view.physicalSize = const Size(900, 500);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    const light = Color(0xFFF7F6F3);
    const dark = Color(0xFF141412);

    await _shoot(tester, 'assets/images/logo_smart_2.svg', light, 'osco-light.png', 120);
  });
}
