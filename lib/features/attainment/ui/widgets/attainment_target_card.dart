import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/attainment_view.dart';
import '../attainment_format.dart';
import 'attainment_progress_bar.dart';
import 'attainment_status_badge.dart';

/// One row of `targets` — one window, with its own target, its own pace and
/// its own status.
///
/// Two of these on screen are **one period made of two windows**, not two
/// unrelated quarters (§3.3): a mid-period transfer split the quarter, and
/// the rep sees both halves — the one their old manager keeps and the one
/// the new one owns.
class AttainmentTargetCard extends StatelessWidget {
  final AttainmentView target;

  /// Opens the outcomes list. Null hides the row's chevron — the count is
  /// still shown, it simply is not a link.
  final VoidCallback? onConfirmedOutcomesTap;

  const AttainmentTargetCard({
    super.key,
    required this.target,
    this.onConfirmedOutcomesTap,
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
          _Header(target: target),
          const _Hairline(),
          _TargetAndAttained(target: target),
          const _Hairline(),
          _PaceRow(target: target),
          const _Hairline(),
          _ConfirmedOutcomesRow(
            count: target.confirmedOutcomes,
            onTap: onConfirmedOutcomesTap,
          ),
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

class _Header extends StatelessWidget {
  final AttainmentView target;

  const _Header({required this.target});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 14.h),
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
              Icons.trending_up_rounded,
              size: 19.sp,
              color: colors.statusWon.core,
            ),
          ),
          horizontalSpace(10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ⚠️ `periodEnd` is INCLUSIVE — 30 Sep is a day inside the
                // window, and both ends are rendered from the raw string
                // rather than a parsed local DateTime.
                Text(
                  formatIsoDayRange(
                    context,
                    target.periodStart,
                    target.periodEnd,
                  ),
                  style: context.textStyles.smBold,
                ),
                verticalSpace(2.h),
                _TargetIdRow(targetId: target.targetId),
              ],
            ),
          ),
          horizontalSpace(8.w),
          TargetLifecycleBadge(closed: target.closed),
        ],
      ),
    );
  }
}

/// The target id, truncated, with a copy action.
///
/// It is here because it is the only handle a rep has when something looks
/// wrong: it is what a manager needs to find the same target on their side.
class _TargetIdRow extends StatelessWidget {
  final String targetId;

  const _TargetIdRow({required this.targetId});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (targetId.isEmpty) return const SizedBox.shrink();
    final shortened = targetId.length > 18
        ? '${targetId.substring(0, 18)}…'
        : targetId;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: targetId));
        if (!context.mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(context.tr('attainment_target_id_copied')),
            ),
          );
      },
      child: Row(
        children: [
          Flexible(
            child: Text(
              '${context.tr('attainment_target_id')} $shortened',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.xsMedium.copyWith(fontSize: 11.sp),
            ),
          ),
          horizontalSpace(6.w),
          Icon(Icons.copy_rounded, size: 13.sp, color: colors.ink400),
        ],
      ),
    );
  }
}

/// The two exact figures, then the bar that relates them.
class _TargetAndAttained extends StatelessWidget {
  final AttainmentView target;

  const _TargetAndAttained({required this.target});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 14.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: _ExactFigure(
                    label: context.tr('attainment_target'),
                    // The full, unabbreviated string — this is the number a
                    // rep checks against their own arithmetic.
                    value: formatAmount(target.targetAmount, target.metric),
                    valueColor: colors.textColor,
                    // ⚠️ Read per row, not off targets[0]. Null for both
                    // count metrics, always present for SALES_VALUE.
                    hint: target.currency,
                  ),
                ),
                horizontalSpace(12.w),
                Container(width: 1, color: colors.Color13),
                horizontalSpace(12.w),
                Expanded(
                  child: _ExactFigure(
                    label: context.tr('attainment_attained'),
                    value: formatAmount(target.attainedAmount, target.metric),
                    valueColor: colors.statusWon.core,
                    hint: formatPercentLabel(target.attainedPct),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(14.h),
          AttainmentProgressBar(
            attainedFraction: target.attainedFraction,
            expectedFraction: target.expectedFraction,
            fillColor: statusPalette(context, target.status).core,
          ),
          if (target.hasPace && target.expectedToDatePct != null) ...[
            verticalSpace(2.h),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                '${context.tr('attainment_expected_to_date')} '
                '${formatPercentLabel(target.expectedToDatePct)}',
                style: context.textStyles.xsMedium.copyWith(
                  color: colors.statusNew.core,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ExactFigure extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final String? hint;

  const _ExactFigure({
    required this.label,
    required this.value,
    required this.valueColor,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textStyles.xsMedium),
        verticalSpace(4.h),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            value,
            style: context.textStyles.baseBold.copyWith(
              color: valueColor,
              fontSize: 17.sp,
            ),
          ),
        ),
        if (hint != null)
          Text(hint!, style: context.textStyles.xsMedium.copyWith(fontSize: 11.sp)),
      ],
    );
  }
}

/// Expected to date · Remaining · Days elapsed · Status.
///
/// ⚠️ On a **closed** target the first and third cells read `—`: the four
/// pace fields are omitted from the JSON entirely, and a zero there would
/// be a different, false claim.
class _PaceRow extends StatelessWidget {
  final AttainmentView target;

  const _PaceRow({required this.target});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final expected = target.expectedAmount;
    final hasPace = target.hasPace && expected != null;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 2.w),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _MiniCell(
                label: context.tr('attainment_expected_to_date'),
                value: hasPace
                    ? formatAmount(expected, target.metric)
                    : '—',
                valueColor: hasPace ? colors.textColor : colors.ink400,
                hint: hasPace
                    ? formatPercentLabel(target.expectedToDatePct)
                    : null,
              ),
            ),
            const _MiniDivider(),
            Expanded(
              child: _MiniCell(
                label: context.tr('attainment_remaining'),
                value: formatAmount(target.remainingAmount, target.metric),
                valueColor: colors.statusFollowUp.core,
                // `remaining` never goes negative — the overshoot on an
                // overachieved target is only expressible as attained −
                // target, so it is surfaced here explicitly.
                hint: target.overshoot.isZero
                    ? null
                    : context
                          .tr('attainment_over_by')
                          .replaceAll(
                            '{amount}',
                            formatAmount(target.overshoot, target.metric),
                          ),
                hintColor: colors.statusWon.core,
              ),
            ),
            const _MiniDivider(),
            Expanded(
              child: _MiniCell(
                label: context.tr('attainment_days_elapsed'),
                value: hasPace && target.totalDays != null
                    ? '${target.elapsedDays ?? 0} / ${target.totalDays}'
                    : '—',
                valueColor: hasPace ? colors.textColor : colors.ink400,
              ),
            ),
            const _MiniDivider(),
            Expanded(
              child: _MiniCell(
                label: context.tr('attainment_status'),
                badge: AttainmentStatusBadge(
                  status: target.status,
                  compact: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniDivider extends StatelessWidget {
  const _MiniDivider();

  @override
  Widget build(BuildContext context) => Container(
    width: 1,
    margin: EdgeInsets.symmetric(vertical: 2.h),
    color: context.colors.Color13,
  );
}

class _MiniCell extends StatelessWidget {
  final String label;
  final String? value;
  final Color? valueColor;
  final String? hint;
  final Color? hintColor;
  final Widget? badge;

  const _MiniCell({
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
            style: context.textStyles.xsMedium.copyWith(fontSize: 10.5.sp),
          ),
          verticalSpace(5.h),
          if (badge != null)
            badge!
          else
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                value ?? '—',
                style: context.textStyles.smBold.copyWith(
                  color: valueColor ?? colors.textColor,
                ),
              ),
            ),
          if (hint != null) ...[
            verticalSpace(2.h),
            Text(
              hint!,
              textAlign: TextAlign.center,
              style: context.textStyles.xsMedium.copyWith(
                fontSize: 10.sp,
                color: hintColor ?? colors.ink400,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// How many confirmed, won outcomes were counted into `attained`.
///
/// ⚠️ Outcomes in a **different currency** to the target are dropped from
/// both this count and `attained`, and this route does not say how many —
/// only the manager drill-down surfaces them, as `excluded` rows with
/// reason `CURRENCY_MISMATCH`. So this is "what counted", not "what you
/// won".
class _ConfirmedOutcomesRow extends StatelessWidget {
  final int? count;
  final VoidCallback? onTap;

  const _ConfirmedOutcomesRow({required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 12.h),
        child: Row(
          children: [
            Icon(
              Icons.emoji_events_outlined,
              size: 18.sp,
              color: colors.textColor70,
            ),
            horizontalSpace(8.w),
            Expanded(
              child: Text(
                context.tr('attainment_confirmed_outcomes'),
                style: context.textStyles.smMedium,
              ),
            ),
            Text('${count ?? 0}', style: context.textStyles.smBold),
            if (onTap != null) ...[
              horizontalSpace(4.w),
              Icon(
                Icons.chevron_right_rounded,
                size: 20.sp,
                color: colors.ink400,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
