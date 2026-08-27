import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../logic/year_targets_cubit.dart';
import '../widgets/target_card.dart';

/// Every quarter of one year, from `GET /attainment/me` asked four times.
///
/// The home card answers "how am I doing right now"; this screen answers
/// "how has the year gone" — which quarter slipped, which was met, and what
/// is still unpublished. They read the same endpoint through the same period
/// resolver, so the current quarter shown here and the one on the home card
/// are the same days by construction.
class YearTargetsScreen extends StatelessWidget {
  const YearTargetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<YearTargetsCubit>()..load(),
      child: const _YearTargetsView(),
    );
  }
}

class _YearTargetsView extends StatelessWidget {
  const _YearTargetsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.page,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: context.tr('targets_year_title')),
            Expanded(
              child: BlocBuilder<YearTargetsCubit, YearTargetsState>(
                builder: (context, state) => RefreshIndicator(
                  color: context.colors.brand600,
                  onRefresh: () =>
                      context.read<YearTargetsCubit>().load(refresh: true),
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 32.h),
                    children: [
                      _YearSwitcher(state: state),
                      verticalSpace(16.h),
                      ..._body(context, state),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _body(BuildContext context, YearTargetsState state) {
    switch (state.status) {
      case YearTargetsStatus.initial:
      case YearTargetsStatus.loading:
        return [
          for (var i = 0; i < 4; i++) ...[
            const _QuarterSkeleton(),
            verticalSpace(14.h),
          ],
        ];

      // Only reached when all four quarters failed. A single bad quarter
      // renders inline instead, so the rest of the year stays readable.
      case YearTargetsStatus.networkError:
        return [
          _Notice(
            icon: Icons.wifi_off_rounded,
            title: context.tr('error_unexpected'),
            subtitle: state.errorMessage,
            onRetry: () =>
                context.read<YearTargetsCubit>().load(refresh: true),
          ),
        ];

      case YearTargetsStatus.loaded:
        final current = YearTargetsCubit.currentQuarterOf(state.year);
        return [
          for (final quarter in state.quarters) ...[
            _QuarterBlock(
              quarter: quarter,
              isCurrent: quarter.quarter == current,
            ),
            verticalSpace(14.h),
          ],
        ];
    }
  }
}

/// Year navigation.
///
/// The forward arrow stops at the current calendar year: targets are
/// published by a manager for periods that exist, so paging into next year
/// would only ever show four "nothing published" blocks and invite the rep
/// to read that as a bug.
class _YearSwitcher extends StatelessWidget {
  final YearTargetsState state;

  const _YearSwitcher({required this.state});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final thisYear = DateTime.now().year;
    final busy = state.status == YearTargetsStatus.loading;
    final canGoForward = state.year < thisYear && !busy;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ArrowButton(
            // The chevrons point at earlier/later years, so in Arabic they
            // must mirror with the layout — an RTL reader moving "back"
            // reaches for the right-hand arrow.
            icon: Directionality.of(context) == TextDirection.rtl
                ? Icons.chevron_right_rounded
                : Icons.chevron_left_rounded,
            enabled: !busy,
            onTap: () =>
                context.read<YearTargetsCubit>().changeYear(state.year - 1),
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              '${state.year}',
              style: context.textStyles.baseBold.copyWith(
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ),
          _ArrowButton(
            icon: Directionality.of(context) == TextDirection.rtl
                ? Icons.chevron_left_rounded
                : Icons.chevron_right_rounded,
            enabled: canGoForward,
            onTap: () =>
                context.read<YearTargetsCubit>().changeYear(state.year + 1),
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  const _ArrowButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: enabled ? onTap : null,
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Icon(
          icon,
          size: 22.sp,
          color: enabled ? colors.ink900 : colors.ink300,
        ),
      ),
    );
  }
}

/// One quarter: its heading, then whatever it holds — cards, a "nothing
/// published" line, or its own error.
class _QuarterBlock extends StatelessWidget {
  final QuarterAttainment quarter;
  final bool isCurrent;

  const _QuarterBlock({required this.quarter, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              context.tr('target_quarter_q${quarter.quarter}'),
              style: context.textStyles.smBold,
            ),
            if (isCurrent) ...[
              horizontalSpace(8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: colors.brand200,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(
                  context.tr('target_quarter_current'),
                  style: context.textStyles.xsMedium.copyWith(
                    color: colors.brand600,
                    fontSize: 10.sp,
                  ),
                ),
              ),
            ],
          ],
        ),
        verticalSpace(8.h),
        if (quarter.hasError)
          _Notice(
            icon: Icons.error_outline_rounded,
            title: context.tr('target_quarter_error'),
            subtitle: quarter.errorMessage,
            onRetry: () =>
                context.read<YearTargetsCubit>().load(refresh: true),
          )
        else if (quarter.isEmpty)
          _Notice(
            icon: Icons.flag_outlined,
            title: context.tr('targets_empty_title'),
            subtitle: context.tr('targets_empty_subtitle'),
          )
        else ...[
          // Two rows only after a mid-period transfer, and then they are
          // two halves of one quarter — the combined figure leads and the
          // halves are the breakdown, matching the home card.
          if (quarter.targets.length > 1) ...[
            TargetTotalSummary(targets: quarter.targets),
            verticalSpace(10.h),
          ],
          for (var i = 0; i < quarter.targets.length; i++) ...[
            TargetCard(attainment: quarter.targets[i]),
            if (i < quarter.targets.length - 1) verticalSpace(10.h),
          ],
        ],
      ],
    );
  }
}

class _Notice extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onRetry;

  const _Notice({
    required this.icon,
    required this.title,
    this.subtitle,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          Icon(icon, size: 22.sp, color: colors.ink300),
          verticalSpace(8.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textStyles.smBold,
          ),
          if (subtitle != null) ...[
            verticalSpace(4.h),
            Text(
              subtitle!,
              textAlign: TextAlign.center,
              style: context.textStyles.xsMedium.copyWith(color: colors.ink400),
            ),
          ],
          if (onRetry != null) ...[
            verticalSpace(10.h),
            PressableScale(
              onTap: onRetry,
              child: Text(
                context.tr('retry'),
                style: context.textStyles.smBold.copyWith(
                  color: colors.brand600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _QuarterSkeleton extends StatelessWidget {
  const _QuarterSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonBox(width: 70.w, height: 12.h),
          verticalSpace(8.h),
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Row(
              children: [
                Container(
                  width: 72.w,
                  height: 72.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                horizontalSpace(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonBox(width: double.infinity, height: 12.h),
                      verticalSpace(8.h),
                      SkeletonBox(width: 120.w, height: 10.h),
                    ],
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
