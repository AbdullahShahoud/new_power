import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';

/// Attained-against-pace, as one bar.
///
/// attainment-me.md §4 is blunt about why: *a bare percentage is unreadable
/// mid-period — 40 % is excellent on day ten of a quarter and a crisis on
/// day eighty.* So the fill is `attainedPct` and the tick is
/// `expectedToDatePct`, and the rep reads one against the other rather than
/// against 100.
///
/// [expectedFraction] is null on a **closed** period, and the tick then
/// disappears entirely: a finished quarter has no pace to miss, and a
/// marker would invite a projection through a period that is already over.
class AttainmentProgressBar extends StatelessWidget {
  /// 0…1, already clamped by the caller.
  final double attainedFraction;

  /// 0…1, or null when there is no pace (a closed target).
  final double? expectedFraction;

  final Color fillColor;
  final double height;

  const AttainmentProgressBar({
    super.key,
    required this.attainedFraction,
    required this.expectedFraction,
    required this.fillColor,
    this.height = 10,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final track = colors.isDark ? colors.ink800 : colors.ink200;
    final barHeight = height.h;
    // The tick overhangs the track top and bottom so it reads as a marker
    // on the bar rather than a segment of it.
    final tickHeight = barHeight + 8.h;

    return SizedBox(
      height: tickHeight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final marker = expectedFraction;
          return Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Container(
                height: barHeight,
                decoration: BoxDecoration(
                  color: track,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
              ),
              // AlignmentDirectional + FractionallySizedBox rather than a
              // fixed offset: the bar has to fill from the right in Arabic.
              FractionallySizedBox(
                alignment: AlignmentDirectional.centerStart,
                widthFactor: attainedFraction,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeOutCubic,
                  height: barHeight,
                  decoration: BoxDecoration(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                ),
              ),
              if (marker != null)
                PositionedDirectional(
                  // Half the tick's own width, so it centres on the mark
                  // instead of starting at it.
                  start: (width * marker) - 1,
                  child: Container(
                    width: 2,
                    height: tickHeight,
                    decoration: BoxDecoration(
                      color: colors.statusNew.core,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
