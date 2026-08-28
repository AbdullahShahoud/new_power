import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/attainment_view.dart';
import '../../data/models/decimal2.dart';
import '../attainment_format.dart';
import 'attainment_progress_bar.dart';
import 'attainment_status_badge.dart';

/// The one card at the top of the screen: who the rep reports to, the
/// server's day, and the four headline figures combined across every row.
///
/// ⚠️ `managerName` sits here, **once**, and never on a row. After a
/// mid-period transfer the two rows belong to two different managers and
/// this field names only the current one — labelling both rows with it
/// would state the opposite of what the split means (§3.2).
class AttainmentSummaryCard extends StatelessWidget {
  final String? managerName;
  final String asOf;

  /// Null when `targets` is empty — the card still renders, because "you
  /// report to Layla Mansour; no target is published yet" is a complete,
  /// correct screen (§3.2).
  final AttainmentRollup? rollup;

  const AttainmentSummaryCard({
    super.key,
    required this.managerName,
    required this.asOf,
    required this.rollup,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
        border: Border.all(color: colors.Color13),
      ),
      child: Column(
        children: [
          _ManagerRow(managerName: managerName, asOf: asOf),
          if (rollup != null) ...[
            const _Hairline(),
            _HeadlineFigures(rollup: rollup!),
            const _Hairline(),
            _OverallAttainment(rollup: rollup!),
          ],
        ],
      ),
    );
  }
}

class _Hairline extends StatelessWidget {
  const _Hairline();

  @override
  Widget build(BuildContext context) =>
      Container(height: 1, color: context.colors.Color13);
}

class _ManagerRow extends StatelessWidget {
  final String? managerName;
  final String asOf;

  const _ManagerRow({required this.managerName, required this.asOf});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final name = managerName?.trim();
    // §3.2 — null is a real, expected value (a stranded team, an account
    // approved without a manager, a dangling reporting line). Render the
    // absence; never fall back to an empty string.
    final hasManager = name != null && name.isNotEmpty;

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 14.h),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.statusWon.badgeBg,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Icon(
              Icons.person_outline_rounded,
              size: 19.sp,
              color: colors.statusWon.core,
            ),
          ),
          horizontalSpace(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr('attainment_manager'),
                  style: context.textStyles.xsMedium,
                ),
                Text(
                  hasManager ? name : context.tr('attainment_no_manager'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.smBold.copyWith(
                    color: hasManager ? colors.textColor : colors.ink400,
                  ),
                ),
              ],
            ),
          ),
          horizontalSpace(8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 13.sp,
                    color: colors.textColor70,
                  ),
                  horizontalSpace(5.w),
                  Text(
                    context.tr('attainment_as_of'),
                    style: context.textStyles.xsMedium,
                  ),
                ],
              ),
              // The **server's** calendar day, not the device's.
              Text(
                formatIsoDay(context, asOf),
                style: context.textStyles.smBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Attained · Expected to date · Remaining · Status.
///
/// The three figures are the compact form (`18.40M`) — the exact strings
/// live on the target cards below, where a rep who wants the full number
/// can read it without the header wrapping.
class _HeadlineFigures extends StatelessWidget {
  final AttainmentRollup rollup;

  const _HeadlineFigures({required this.rollup});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 4.w),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _FigureCell(
                label: context.tr('attainment_attained'),
                value: formatAmountCompact(rollup.attained, rollup.metric),
                valueColor: colors.statusWon.core,
                hint: formatPercentLabel(rollup.attainedPct),
              ),
            ),
            const _CellDivider(),
            Expanded(
              child: _FigureCell(
                label: context.tr('attainment_expected_to_date'),
                // §3.4 — the pace fields are *absent* on a closed period.
                // An em dash says "there is none" without implying zero.
                value: rollup.expected == null
                    ? '—'
                    : formatAmountCompact(rollup.expected!, rollup.metric),
                valueColor: rollup.expected == null
                    ? colors.ink400
                    : colors.statusNew.core,
                hint: rollup.expectedPct == null
                    ? null
                    : formatPercentLabel(rollup.expectedPct),
              ),
            ),
            const _CellDivider(),
            Expanded(
              child: _FigureCell(
                label: context.tr('attainment_remaining'),
                value: formatAmountCompact(rollup.remaining, rollup.metric),
                valueColor: colors.statusFollowUp.core,
                // `remaining` is floored at zero, so an overachieved target
                // reports the overshoot here rather than a negative figure.
                hint: rollup.remaining.isZero && !rollup.attained.isZero
                    ? context
                          .tr('attainment_over_by')
                          .replaceAll(
                            '{amount}',
                            formatAmountCompact(
                              _overshoot(rollup),
                              rollup.metric,
                            ),
                          )
                    : null,
                hintColor: colors.statusWon.core,
              ),
            ),
            const _CellDivider(),
            Expanded(
              child: _FigureCell(
                label: context.tr('attainment_status'),
                badge: AttainmentStatusBadge(status: rollup.status),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Decimal2 _overshoot(AttainmentRollup rollup) {
    final diff = rollup.attained - rollup.target;
    return diff.isNegative ? Decimal2.zero : diff;
  }
}

class _CellDivider extends StatelessWidget {
  const _CellDivider();

  @override
  Widget build(BuildContext context) => Container(
    width: 1,
    margin: EdgeInsets.symmetric(vertical: 2.h),
    color: context.colors.Color13,
  );
}

/// DESIGN_GUIDELINES.md §5 "Stat card": label `text-xs ink-500`, value
/// emphasised, hint `text-xs ink-400`.
class _FigureCell extends StatelessWidget {
  final String label;
  final String? value;
  final Color? valueColor;
  final String? hint;
  final Color? hintColor;
  final Widget? badge;

  const _FigureCell({
    required this.label,
    this.value,
    this.valueColor,
    this.hint,
    this.hintColor,
    this.badge,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: context.textStyles.xsMedium.copyWith(fontSize: 11.sp),
          ),
          verticalSpace(6.h),
          if (badge != null)
            badge!
          else
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value ?? '—',
                style: context.textStyles.baseBold.copyWith(
                  color: valueColor ?? colors.textColor,
                  fontSize: 17.sp,
                ),
              ),
            ),
          if (hint != null) ...[
            verticalSpace(2.h),
            Text(
              hint!,
              textAlign: TextAlign.center,
              style: context.textStyles.xsMedium.copyWith(
                fontSize: 11.sp,
                color: hintColor ?? colors.ink400,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// The combined bar and the one sentence that makes it readable: how much
/// of the period has gone.
class _OverallAttainment extends StatelessWidget {
  final AttainmentRollup rollup;

  const _OverallAttainment({required this.rollup});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final palette = statusPalette(context, rollup.status);

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 16.w, 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.tr('attainment_overall'),
                  style: context.textStyles.smBold,
                ),
              ),
              Text(
                formatPercentLabel(rollup.attainedPct),
                style: context.textStyles.baseBold.copyWith(fontSize: 17.sp),
              ),
            ],
          ),
          verticalSpace(8.h),
          AttainmentProgressBar(
            attainedFraction: rollup.attainedFraction,
            expectedFraction: rollup.expectedFraction,
            fillColor: palette.core,
          ),
          verticalSpace(4.h),
          // §4 — "show attainedPct against expectedToDatePct, not against
          // 100". This is the sentence that turns the bar into a judgement.
          if (rollup.hasPace &&
              rollup.elapsedDays != null &&
              rollup.totalDays != null)
            Text.rich(
              TextSpan(
                style: context.textStyles.xsMedium,
                children: [
                  TextSpan(
                    text: context
                        .tr('attainment_period_elapsed')
                        .replaceAll(
                          '{percent}',
                          formatPercentLabel(rollup.expectedPct),
                        ),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text:
                        '(${rollup.elapsedDays} / ${rollup.totalDays} '
                        '${context.tr('attainment_days')})',
                    style: context.textStyles.xsSemibold.copyWith(
                      color: colors.statusNew.core,
                    ),
                  ),
                ],
              ),
            )
          else
            // Every row is closed. There is no pace left to miss, so the
            // screen says so rather than drawing a marker at 100 %.
            Text(
              context.tr('attainment_period_finished'),
              style: context.textStyles.xsMedium,
            ),
        ],
      ),
    );
  }
}
