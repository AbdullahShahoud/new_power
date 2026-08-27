import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../logic/my_targets_cubit.dart';
import 'target_card.dart';

/// The rep's targets, on the home screen.
///
/// Reads the one endpoint this role can reach — `GET /attainment/me` — with
/// no `period`, which the server resolves to **the current quarter**.
/// Deliberately not computed locally: a client-side quarter could disagree
/// with the server's resolver at a boundary, and then this card and every
/// other screen would tell different stories about the same days.
class MyTargetsSection extends StatelessWidget {
  const MyTargetsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MyTargetsCubit>()..load(),
      child: const _MyTargetsView(),
    );
  }
}

class _MyTargetsView extends StatelessWidget {
  const _MyTargetsView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyTargetsCubit, MyTargetsState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.tr('targets_section_title'),
                    style: context.textStyles.baseBold,
                  ),
                ),
                if (state.asOf != null)
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      state.asOf!,
                      style: context.textStyles.xsMedium.copyWith(
                        color: context.colors.ink400,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                horizontalSpace(10),
                // This card is the current quarter only — the server resolves
                // an omitted `period` to it. The whole year lives one push
                // away rather than inline, because four quarters of rings on
                // the home tab would bury the figure the rep opened the app
                // for.
                PressableScale(
                  onTap: () => Navigator.of(
                    context,
                  ).pushNamed(Routes.yearTargetsScreen),
                  child: Text(
                    context.tr('targets_view_year'),
                    style: context.textStyles.xsMedium.copyWith(
                      color: context.colors.brand600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(10.h),
            _body(context, state),
          ],
        );
      },
    );
  }

  Widget _body(BuildContext context, MyTargetsState state) {
    switch (state.status) {
      case MyTargetsStatus.initial:
      case MyTargetsStatus.loading:
        return const _TargetsSkeleton();

      case MyTargetsStatus.networkError:
        return _Notice(
          icon: Icons.wifi_off_rounded,
          title: context.tr('error_unexpected'),
          subtitle: state.errorMessage,
          onRetry: () => context.read<MyTargetsCubit>().load(refresh: true),
        );

      // ⚠️ Not an error. An empty list means nothing is published for this
      // period yet — a manager has not drafted or published a target — and
      // showing a failure here would have the rep chasing a bug that does
      // not exist.
      case MyTargetsStatus.empty:
        return _Notice(
          icon: Icons.flag_outlined,
          title: context.tr('targets_empty_title'),
          subtitle: context.tr('targets_empty_subtitle'),
        );

      case MyTargetsStatus.loaded:
        return Column(
          children: [
            // Only after a mid-period transfer is there more than one row,
            // and then the rep is looking at two halves of a single quarter.
            // The combined figure leads, because "how am I doing" is the
            // question — the halves below are the breakdown.
            if (state.targets.length > 1) ...[
              TargetTotalSummary(targets: state.targets),
              verticalSpace(10.h),
            ],
            for (var i = 0; i < state.targets.length; i++) ...[
              TargetCard(attainment: state.targets[i]),
              if (i < state.targets.length - 1) verticalSpace(10.h),
            ],
          ],
        );
    }
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
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          Icon(icon, size: 26.sp, color: colors.ink300),
          verticalSpace(10.h),
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
              style: context.textStyles.xsMedium.copyWith(
                color: colors.ink400,
              ),
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

/// Mirrors the real card — ring on one side, three figure lines on the
/// other — so the swap to content does not jump.
class _TargetsSkeleton extends StatelessWidget {
  const _TargetsSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        child: Row(
          children: [
            Container(
              width: 84.w,
              height: 84.w,
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
                  SkeletonBox(width: 140.w, height: 10.h),
                  verticalSpace(8.h),
                  SkeletonBox(width: 100.w, height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
