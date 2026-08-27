import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/attainment_view.dart';
import '../../data/models/decimal_amount.dart';
import '../../data/models/target_enums.dart';

/// One published target, as a progress ring with its figures beside it.
///
/// The ring carries **two** arcs on an open period: the solid one is what
/// the rep has attained, the faint tick behind it is where the calendar
/// says they should be by today. That pace mark is the whole reason
/// `expectedToDatePct` exists — a bare 70% means nothing without knowing
/// whether the quarter is a week or a day from closing.
///
/// ⚠️ On a **closed** period the pace mark is gone entirely. There is no
/// pace to miss once a period is over, and drawing one would invite reading
/// a projection through a finished quarter.
class TargetCard extends StatelessWidget {
  final AttainmentView attainment;

  const TargetCard({super.key, required this.attainment});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final accent = _statusColor(context, attainment.status, attainment.closed);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.tr(attainment.metric.labelKey),
                      style: context.textStyles.smBold,
                    ),
                    verticalSpace(3.h),
                    _PeriodLine(attainment: attainment),
                  ],
                ),
              ),
              _StatusChip(
                status: attainment.status,
                closed: attainment.closed,
                accent: accent,
              ),
            ],
          ),
          verticalSpace(14.h),
          Row(
            children: [
              _ProgressRing(attainment: attainment, accent: accent),
              horizontalSpace(16),
              Expanded(child: _Figures(attainment: attainment, accent: accent)),
            ],
          ),
          if (!attainment.closed && attainment.totalDays != null) ...[
            verticalSpace(14.h),
            _PaceLine(attainment: attainment),
          ],
        ],
      ),
    );
  }
}

/// ⚠️ Status colour depends on `closed` as well as the value.
///
/// A quarter that ended at 94.7% reads `BEHIND`, exactly like a live one
/// that is falling short — but it is not at risk of anything any more. The
/// closed case is drawn in neutral ink so a finished record does not sit on
/// the home screen looking like a warning the rep can still act on.
Color _statusColor(BuildContext context, AttainmentStatus status, bool closed) {
  final colors = context.colors;
  if (closed) {
    return status == AttainmentStatus.met
        ? colors.statusWon.core
        : colors.ink500;
  }
  return switch (status) {
    AttainmentStatus.met => colors.statusWon.core,
    AttainmentStatus.onTrack => colors.statusNew.core,
    AttainmentStatus.atRisk => colors.statusFollowUp.core,
    AttainmentStatus.behind => colors.statusLost.core,
    AttainmentStatus.unknown => colors.ink400,
  };
}

class _StatusChip extends StatelessWidget {
  final AttainmentStatus status;
  final bool closed;
  final Color accent;

  const _StatusChip({
    required this.status,
    required this.closed,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        context.tr(status.labelKey),
        style: context.textStyles.xsSemibold.copyWith(
          color: accent,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}

class _PeriodLine extends StatelessWidget {
  final AttainmentView attainment;

  const _PeriodLine({required this.attainment});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        // Dates are calendar days, inclusive at both ends, and arrive as
        // plain `YYYY-MM-DD` strings — shown as sent rather than parsed and
        // re-rendered through a timezone that could shift the boundary.
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            '${attainment.periodStart} → ${attainment.periodEnd}',
            style: context.textStyles.xsMedium.copyWith(
              color: colors.ink400,
              fontSize: 10.sp,
            ),
          ),
        ),
        if (attainment.closed) ...[
          horizontalSpace(6),
          Text(
            context.tr('target_period_closed'),
            style: context.textStyles.xsSemibold.copyWith(
              color: colors.ink400,
              fontSize: 10.sp,
            ),
          ),
        ],
      ],
    );
  }
}

class _ProgressRing extends StatelessWidget {
  final AttainmentView attainment;
  final Color accent;

  const _ProgressRing({required this.attainment, required this.accent});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      width: 84.w,
      height: 84.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Animates from empty so the ring reads as a fill rather than
          // appearing already drawn.
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: attainment.progress),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOutCubic,
            builder: (context, value, _) => CustomPaint(
              size: Size(84.w, 84.w),
              painter: _RingPainter(
                progress: value,
                pace: attainment.paceProgress,
                accent: accent,
                track: colors.Color13,
                paceColor: colors.ink400,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // The server's own rounded value, shown verbatim — it is
              // computed half-up so this screen and a manager's calculator
              // cannot disagree in the last digit.
              Directionality(
                textDirection: TextDirection.ltr,
                child: Text(
                  '${_trimPct(attainment.attainedPct)}%',
                  style: context.textStyles.baseBold.copyWith(color: accent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static String _trimPct(num value) {
    final rounded = (value * 10).round() / 10;
    return rounded == rounded.roundToDouble()
        ? rounded.toStringAsFixed(0)
        : rounded.toStringAsFixed(1);
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final double? pace;
  final Color accent;
  final Color track;
  final Color paceColor;

  _RingPainter({
    required this.progress,
    required this.pace,
    required this.accent,
    required this.track,
    required this.paceColor,
  });

  static const _start = -math.pi / 2;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = size.width * 0.11;
    final rect = Rect.fromLTWH(
      stroke / 2,
      stroke / 2,
      size.width - stroke,
      size.height - stroke,
    );

    canvas.drawArc(
      rect,
      0,
      math.pi * 2,
      false,
      Paint()
        ..color = track
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke,
    );

    canvas.drawArc(
      rect,
      _start,
      math.pi * 2 * progress,
      false,
      Paint()
        ..color = accent
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeWidth = stroke,
    );

    // The calendar mark. Drawn only when the period is open — see the class
    // doc on [TargetCard].
    final paceValue = pace;
    if (paceValue != null) {
      final angle = _start + math.pi * 2 * paceValue;
      final radius = rect.width / 2;
      final centre = rect.center;
      final inner = radius - stroke * 0.75;
      final outer = radius + stroke * 0.25;
      canvas.drawLine(
        centre + Offset(math.cos(angle) * inner, math.sin(angle) * inner),
        centre + Offset(math.cos(angle) * outer, math.sin(angle) * outer),
        Paint()
          ..color = paceColor
          ..strokeWidth = 2
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(_RingPainter old) =>
      old.progress != progress ||
      old.pace != pace ||
      old.accent != accent ||
      old.track != track;
}

class _Figures extends StatelessWidget {
  final AttainmentView attainment;
  final Color accent;

  const _Figures({required this.attainment, required this.accent});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isMoney = attainment.metric.isMoney;
    final unit = isMoney ? (attainment.currency ?? '') : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FigureRow(
          label: context.tr('target_attained'),
          value: attainment.attainedAmount.format(),
          unit: unit,
          emphasis: true,
          color: accent,
        ),
        verticalSpace(6.h),
        _FigureRow(
          label: context.tr('target_goal'),
          value: attainment.targetAmount.format(),
          unit: unit,
        ),
        verticalSpace(6.h),
        // `remaining` is floored at "0.00" server-side — an overachieved
        // target never reports a negative gap, so "0" here means "done",
        // not "exactly on the line".
        _FigureRow(
          label: attainment.remainingAmount.isZero
              ? context.tr('target_remaining_none')
              : context.tr('target_remaining'),
          value: attainment.remainingAmount.isZero
              ? ''
              : attainment.remainingAmount.format(),
          unit: attainment.remainingAmount.isZero ? '' : unit,
          color: colors.ink500,
        ),
      ],
    );
  }
}

class _FigureRow extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final bool emphasis;
  final Color? color;

  const _FigureRow({
    required this.label,
    required this.value,
    required this.unit,
    this.emphasis = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.xsMedium.copyWith(
              color: colors.ink400,
              fontSize: 10.sp,
            ),
          ),
        ),
        if (value.isNotEmpty)
          // Figures and currency codes are Latin; isolated so they do not
          // reorder inside an Arabic line.
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              unit.isEmpty ? value : '$value $unit',
              style: emphasis
                  ? context.textStyles.smBold.copyWith(color: color)
                  : context.textStyles.xsSemibold.copyWith(color: color),
            ),
          ),
      ],
    );
  }
}

/// How far through the calendar the period is, in plain words.
///
/// Shown only while the period is open. `elapsedDays`/`totalDays` are
/// absent once it closes, which is the same signal as `closed` — the card
/// branches on `closed`, the documented field, and reads these only after.
class _PaceLine extends StatelessWidget {
  final AttainmentView attainment;

  const _PaceLine({required this.attainment});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final elapsed = attainment.elapsedDays ?? 0;
    final total = attainment.totalDays ?? 0;
    if (total <= 0) return const SizedBox.shrink();

    return Row(
      children: [
        Icon(Icons.schedule_rounded, size: 13.sp, color: colors.ink400),
        horizontalSpace(6),
        Expanded(
          child: Text(
            context
                .tr('target_days_elapsed')
                .replaceAll('{elapsed}', '$elapsed')
                .replaceAll('{total}', '$total'),
            style: context.textStyles.xsMedium.copyWith(
              color: colors.ink400,
              fontSize: 10.sp,
            ),
          ),
        ),
        if (attainment.confirmedOutcomes != null)
          Text(
            context
                .tr('target_confirmed_wins')
                .replaceAll('{count}', '${attainment.confirmedOutcomes}'),
            style: context.textStyles.xsMedium.copyWith(
              color: colors.ink400,
              fontSize: 10.sp,
            ),
          ),
      ],
    );
  }
}

/// The combined figure across a transferred rep's two half-periods.
///
/// ⚠️ Only rendered when `targets` holds more than one row, which happens
/// after a **mid-period transfer**: the rep sees both halves of their own
/// quarter — the one their old manager keeps and the one their new manager
/// owns. The doc is explicit that summing them yourself is the honest
/// total, so without this the rep would see two partial numbers and no
/// answer to "how am I doing this quarter".
///
/// Summed through [DecimalAmount] rather than by parsing to `double`: these
/// are 12-integer-digit money figures and a float would quietly lose the
/// low end.
class TargetTotalSummary extends StatelessWidget {
  final List<AttainmentView> targets;

  const TargetTotalSummary({super.key, required this.targets});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    var attained = DecimalAmount.zero;
    var goal = DecimalAmount.zero;
    for (final row in targets) {
      attained = attained + row.attainedAmount;
      goal = goal + row.targetAmount;
    }
    final pct = attained.percentOf(goal);
    final unit = targets.first.metric.isMoney
        ? (targets.first.currency ?? '')
        : '';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: colors.brand50,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('target_combined_title'),
                  style: context.textStyles.xsBold.copyWith(
                    color: colors.brand700,
                  ),
                ),
                verticalSpace(2.h),
                Text(
                  context.tr('target_combined_subtitle'),
                  style: context.textStyles.xsMedium.copyWith(
                    color: colors.brand600,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(10),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${pct.toStringAsFixed(pct == pct.roundToDouble() ? 0 : 1)}%',
                  style: context.textStyles.baseBold.copyWith(
                    color: colors.brand700,
                  ),
                ),
                Text(
                  unit.isEmpty
                      ? '${attained.format()} / ${goal.format()}'
                      : '${attained.format()} / ${goal.format()} $unit',
                  style: context.textStyles.xsMedium.copyWith(
                    color: colors.brand600,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
