import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/bottom_sheet_helper.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_dialog.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/attainment_enums.dart';
import '../../data/models/attainment_period.dart';
import '../../data/models/attainment_view.dart';
import '../../logic/attainment_cubit/attainment_cubit.dart';
import '../../logic/attainment_cubit/attainment_state.dart';
import '../attainment_format.dart';
import 'attainment_summary_card.dart';
import 'attainment_target_card.dart';

/// `GET /attainment/me` — the rep's own targets, rendered as the **Home
/// tab's body**.
///
/// Read-only, and the only target route a `REPRESENTATIVE` can reach: the
/// handler takes the actor id off the token, so there is no
/// `representativeId` to pass and no way for a rep to read a colleague.
///
/// It is a body, not a screen: it carries no `Scaffold` and no app bar,
/// because the Home tab already owns that chrome (the logo, the
/// notification bell, the page title). It expects to be given a bounded
/// height — an `Expanded` inside the tab's `Column`.
class MyAttainmentBody extends StatelessWidget {
  const MyAttainmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AttainmentCubit>()..load(),
      child: const _MyAttainmentView(),
    );
  }
}

class _MyAttainmentView extends StatelessWidget {
  const _MyAttainmentView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttainmentCubit, AttainmentState>(
      builder: (context, state) => RefreshIndicator(
        color: context.colors.brand500,
        onRefresh: () => context.read<AttainmentCubit>().refresh(),
        child: _Body(state: state),
      ),
    );
  }
}

/// The screen has to be able to explain itself — §4: *a bare percentage is
/// unreadable mid-period.* This is where the pace rule, the status
/// thresholds and the two-row transfer split are spelled out, so the rep can
/// check the numbers by hand and agree with them.
///
/// Public because the trigger lives on the Home tab's header, which owns the
/// chrome this body deliberately does not.
void showAttainmentHelp(BuildContext context) {
  AppDialog.show(
    context: context,
    title: context.tr('attainment_help_title'),
    content: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final key in const [
            'attainment_help_pace',
            'attainment_help_status',
            'attainment_help_split',
            'attainment_help_closed',
          ]) ...[
            Text(
              context.tr(key),
              style: context.textStyles.xsMedium.copyWith(height: 1.6),
            ),
            verticalSpace(10.h),
          ],
        ],
      ),
    ),
    actions: [
      AppDialogButton.primary(
        label: context.tr('ok'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );
}

class _Body extends StatelessWidget {
  final AttainmentState state;

  const _Body({required this.state});

  @override
  Widget build(BuildContext context) {
    // 20.w horizontal and 100.h at the bottom match the other tab roots:
    // `MainScreen` sets `extendBody: true` and floats the nav bar over the
    // content, so a shorter bottom pad would hide the export button behind
    // it.
    final padding = EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 100.h);

    switch (state.status) {
      case AttainmentStatus.initial:
      case AttainmentStatus.loading:
        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: padding,
          children: [
            const _Selectors(),
            verticalSpace(14.h),
            const _AttainmentSkeleton(),
          ],
        );

      case AttainmentStatus.forbidden:
        // Terminal — an exact `@Roles(REPRESENTATIVE)` match, so a retry
        // cannot change the answer and none is offered.
        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: padding,
          children: [
            verticalSpace(60.h),
            EmptyState(
              icon: Icons.lock_outline_rounded,
              title: context.tr('attainment_forbidden_title'),
              subtitle: context.tr('attainment_forbidden_subtitle'),
            ),
          ],
        );

      case AttainmentStatus.error:
        return ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: padding,
          children: [
            const _Selectors(),
            verticalSpace(50.h),
            EmptyState(
              icon: Icons.wifi_off_rounded,
              title: context.tr('error_unexpected'),
              subtitle: state.errorMessage,
            ),
            verticalSpace(12.h),
            Center(
              child: PressableScale(
                onTap: () => context.read<AttainmentCubit>().refresh(),
                child: Text(
                  context.tr('retry'),
                  style: context.textStyles.smBold.copyWith(
                    color: context.colors.brand600,
                  ),
                ),
              ),
            ),
          ],
        );

      case AttainmentStatus.empty:
      case AttainmentStatus.loaded:
        return _LoadedBody(state: state, padding: padding);
    }
  }
}

class _LoadedBody extends StatelessWidget {
  final AttainmentState state;
  final EdgeInsets padding;

  const _LoadedBody({required this.state, required this.padding});

  @override
  Widget build(BuildContext context) {
    final view = state.view;
    final targets = state.sortedTargets;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: padding,
      children: [
        const _Selectors(),
        // A period or metric change re-fetches, but the rows already on
        // screen stay put rather than collapsing into a skeleton — this
        // hairline is the only thing that says a newer answer is coming.
        SizedBox(
          height: 3.h,
          child: state.isRefreshing
              ? LinearProgressIndicator(
                  minHeight: 2.h,
                  color: context.colors.brand500,
                  backgroundColor: Colors.transparent,
                )
              : null,
        ),
        verticalSpace(11.h),
        // Renders even with no targets: "you report to Layla Mansour; no
        // target is published yet" is a complete, correct screen (§3.2).
        AttainmentSummaryCard(
          managerName: view?.managerName,
          asOf: view?.asOf ?? '',
          rollup: state.rollup,
        ),
        verticalSpace(20.h),
        if (targets.isEmpty) ...[
          // §3.3 — a length of 0 is **a normal answer, not a failure**.
          // Nothing has been published for this period yet.
          verticalSpace(20.h),
          EmptyState(
            icon: Icons.flag_outlined,
            title: context.tr('attainment_empty_title'),
            subtitle: context.tr('attainment_empty_subtitle'),
          ),
        ] else ...[
          _TargetsHeader(count: targets.length),
          verticalSpace(10.h),
          for (final target in targets) ...[
            AttainmentTargetCard(
              target: target,
              onConfirmedOutcomesTap: () =>
                  context.pushNamed(Routes.outcomesListScreen),
            ),
            verticalSpace(12.h),
          ],
          verticalSpace(2.h),
          const _OverlapNote(),
          verticalSpace(14.h),
          _ExportSummaryButton(state: state),
        ],
      ],
    );
  }
}

/// Period and metric, side by side — the only two things this route takes.
///
/// Both re-fetch. Neither can be applied locally: `period` selects a window
/// and which targets overlap it is the server's answer, and one response
/// carries exactly one metric.
class _Selectors extends StatelessWidget {
  const _Selectors();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<AttainmentCubit, AttainmentState>(
      buildWhen: (previous, current) =>
          previous.period != current.period ||
          previous.metric != current.metric,
      builder: (context, state) => Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(color: colors.Color13),
          boxShadow: AppShadows.card,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: _SelectorCell(
                  icon: Icons.calendar_month_outlined,
                  label: context.tr('attainment_period'),
                  value: state.period.wireValue,
                  onTap: () => _pickPeriod(context, state.period),
                ),
              ),
              Container(
                width: 1,
                margin: EdgeInsets.symmetric(vertical: 10.h),
                color: colors.Color13,
              ),
              Expanded(
                child: _SelectorCell(
                  icon: Icons.bar_chart_rounded,
                  label: context.tr('attainment_metric'),
                  // The readable name, never the `SALES_VALUE` wire token —
                  // the screaming-snake spelling belongs on the query
                  // string, not in front of a rep.
                  value: context.tr(state.metric.nameKey),
                  onTap: () => _pickMetric(context, state.metric),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickPeriod(
    BuildContext context,
    AttainmentPeriod current,
  ) async {
    final cubit = context.read<AttainmentCubit>();
    // Derived from the **UTC** day, like the server's own default — so the
    // client's idea of "this quarter" cannot disagree with it on the last
    // night of a quarter.
    final options = AttainmentPeriod.options();
    final selected = await showAnimatedBottomSheet<AttainmentPeriod>(
      context: context,
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SheetTitle(text: sheetContext.tr('attainment_period')),
          // ⚠️ Three shapes, and no free date range: §1 — a rollup over
          // "1 Jul to 20 Aug" is a number with no meaning, because the
          // targets it would sum were written for whole periods.
          _SheetNote(text: sheetContext.tr('attainment_period_note')),
          for (final option in options)
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(
                option.wireValue,
                style: option == current
                    ? sheetContext.textStyles.smBold
                    : sheetContext.textStyles.smMedium,
              ),
              trailing: option == current
                  ? Icon(Icons.check, color: sheetContext.colors.brand500)
                  : null,
              onTap: () => Navigator.of(sheetContext).pop(option),
            ),
        ],
      ),
    );
    if (selected != null) await cubit.periodSelected(selected);
  }

  Future<void> _pickMetric(
    BuildContext context,
    AttainmentMetric current,
  ) async {
    final cubit = context.read<AttainmentCubit>();
    final selected = await showAnimatedBottomSheet<AttainmentMetric>(
      context: context,
      initialChildSize: 0.36,
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SheetTitle(text: sheetContext.tr('attainment_metric')),
          for (final option in AttainmentMetric.values)
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                sheetContext.tr(option.nameKey),
                style: option == current
                    ? sheetContext.textStyles.smBold
                    : sheetContext.textStyles.smMedium,
              ),
              subtitle: Text(
                sheetContext.tr(option.descriptionKey),
                style: sheetContext.textStyles.xsMedium,
              ),
              trailing: option == current
                  ? Icon(Icons.check, color: sheetContext.colors.brand500)
                  : null,
              onTap: () => Navigator.of(sheetContext).pop(option),
            ),
        ],
      ),
    );
    if (selected != null) await cubit.metricSelected(selected);
  }
}

class _SelectorCell extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  const _SelectorCell({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Row(
          children: [
            Icon(icon, size: 18.sp, color: colors.textColor70),
            horizontalSpace(8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label, style: context.textStyles.xsMedium),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.smBold,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20.sp,
              color: colors.textColor70,
            ),
          ],
        ),
      ),
    );
  }
}

class _SheetTitle extends StatelessWidget {
  final String text;

  const _SheetTitle({required this.text});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: 4.h),
    child: Text(text, style: context.textStyles.baseBold),
  );
}

class _SheetNote extends StatelessWidget {
  final String text;

  const _SheetNote({required this.text});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Text(text, style: context.textStyles.xsMedium),
  );
}

class _TargetsHeader extends StatelessWidget {
  final int count;

  const _TargetsHeader({required this.count});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Expanded(
          child: Text(
            '${context.tr('attainment_targets')} ($count)',
            style: context.textStyles.baseBold,
          ),
        ),
        PressableScale(
          onTap: () => _pickSort(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.swap_vert_rounded,
                size: 18.sp,
                color: colors.brand600,
              ),
              horizontalSpace(4.w),
              Text(
                context.tr('attainment_sort'),
                style: context.textStyles.smBold.copyWith(
                  color: colors.brand600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Client-side only — the route has no sort parameter, and an unknown
  /// query key is a 400 rather than an ignored one.
  Future<void> _pickSort(BuildContext context) async {
    final cubit = context.read<AttainmentCubit>();
    final current = cubit.state.sort;
    final selected = await showAnimatedBottomSheet<AttainmentSort>(
      context: context,
      initialChildSize: 0.4,
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SheetTitle(text: sheetContext.tr('attainment_sort')),
          for (final option in AttainmentSort.values)
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(
                sheetContext.tr(option.labelKey),
                style: option == current
                    ? sheetContext.textStyles.smBold
                    : sheetContext.textStyles.smMedium,
              ),
              trailing: option == current
                  ? Icon(Icons.check, color: sheetContext.colors.brand500)
                  : null,
              onTap: () => Navigator.of(sheetContext).pop(option),
            ),
        ],
      ),
    );
    if (selected != null) cubit.sortSelected(selected);
  }
}

/// §1 — `period` selects a window; it does not have to match a target's
/// window. This note is why two rows can appear for one quarter, said once
/// under the list rather than repeated on every card.
class _OverlapNote extends StatelessWidget {
  const _OverlapNote();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: colors.statusNew.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.field),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 16.sp,
            color: colors.statusNew.core,
          ),
          horizontalSpace(8.w),
          Expanded(
            child: Text(
              context.tr('attainment_overlap_note'),
              style: context.textStyles.xsMedium.copyWith(
                color: colors.statusNew.badgeText,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Copies the whole screen as plain text.
///
/// There is no export endpoint on this route — and there does not need to
/// be one: everything the rep would export is already on screen. The
/// figures are written out **exactly as the API sent them** (full decimal
/// strings, not the `18.40M` tiles), so what is pasted into a message to a
/// manager is the number the server holds.
class _ExportSummaryButton extends StatelessWidget {
  final AttainmentState state;

  const _ExportSummaryButton({required this.state});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: () => _export(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: colors.statusNew.badgeBg,
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.file_download_outlined,
              size: 18.sp,
              color: colors.statusNew.badgeText,
            ),
            horizontalSpace(8.w),
            Text(
              context.tr('attainment_export_summary'),
              style: context.textStyles.smBold.copyWith(
                color: colors.statusNew.badgeText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _export(BuildContext context) async {
    final text = _buildSummary(context);
    await Clipboard.setData(ClipboardData(text: text));
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(context.tr('attainment_export_copied')),
        ),
      );
  }

  String _buildSummary(BuildContext context) {
    final view = state.view;
    final rollup = state.rollup;
    final lines = <String>[
      context.tr('attainment_title'),
      '${context.tr('attainment_period')}: ${state.period.wireValue}',
      '${context.tr('attainment_metric')}: '
          '${context.tr(state.metric.nameKey)}',
      '${context.tr('attainment_manager')}: '
          '${view?.managerName ?? context.tr('attainment_no_manager')}',
      '${context.tr('attainment_as_of')}: ${view?.asOf ?? ''}',
    ];

    if (rollup != null) {
      lines
        ..add('')
        ..add(
          '${context.tr('attainment_target')}: '
          '${formatAmount(rollup.target, rollup.metric)}'
          '${rollup.currency == null ? '' : ' ${rollup.currency}'}',
        )
        ..add(
          '${context.tr('attainment_attained')}: '
          '${formatAmount(rollup.attained, rollup.metric)} '
          '(${formatPercentLabel(rollup.attainedPct)})',
        )
        ..add(
          '${context.tr('attainment_remaining')}: '
          '${formatAmount(rollup.remaining, rollup.metric)}',
        );
      // Omitted rather than sent as zero when the period is closed — the
      // server omits the keys for the same reason.
      final expected = rollup.expected;
      if (expected != null) {
        lines.add(
          '${context.tr('attainment_expected_to_date')}: '
          '${formatAmount(expected, rollup.metric)} '
          '(${formatPercentLabel(rollup.expectedPct)})',
        );
      }
      if (rollup.elapsedDays != null && rollup.totalDays != null) {
        lines.add(
          '${context.tr('attainment_days_elapsed')}: '
          '${rollup.elapsedDays} / ${rollup.totalDays}',
        );
      }
      lines.add(
        '${context.tr('attainment_status')}: '
        '${context.tr(rollup.status.labelKey)}',
      );
    }

    for (final target in state.sortedTargets) {
      lines
        ..add('')
        ..add(
          '— ${formatIsoDayRange(context, target.periodStart, target.periodEnd)}',
        )
        ..add('  ${context.tr('attainment_target_id')} ${target.targetId}')
        ..add(
          '  ${context.tr('attainment_target')}: '
          '${formatAmount(target.targetAmount, target.metric)}'
          '${target.currency == null ? '' : ' ${target.currency}'}',
        )
        ..add(
          '  ${context.tr('attainment_attained')}: '
          '${formatAmount(target.attainedAmount, target.metric)} '
          '(${formatPercentLabel(target.attainedPct)})',
        )
        ..add(
          '  ${context.tr('attainment_status')}: '
          '${context.tr(target.status.labelKey)}',
        );
    }

    return lines.join('\n');
  }
}

/// Mirrors the real layout closely enough that swapping in the loaded card
/// does not jar: the selector row, the summary card, one target card.
class _AttainmentSkeleton extends StatelessWidget {
  const _AttainmentSkeleton();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final width = MediaQuery.sizeOf(context).width;

    Widget block(double height) => Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: colors.Color13),
      ),
      padding: EdgeInsets.all(14.w),
      child: AppShimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SkeletonBox(width: width * 0.45, height: 14.h),
            verticalSpace(10.h),
            SkeletonBox(width: width * 0.7, height: 20.h),
            verticalSpace(12.h),
            SkeletonBox(width: double.infinity, height: height),
          ],
        ),
      ),
    );

    return Column(
      children: [
        block(46.h),
        verticalSpace(14.h),
        block(72.h),
      ],
    );
  }
}
