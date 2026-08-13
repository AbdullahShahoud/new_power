import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_radius.dart';

/// Loading-state shimmer, theme-aware (dark mode swaps to darker tones
/// automatically via `context.colors`). Wrap a skeleton layout built from
/// [SkeletonBox] in this; shown wherever a screen's `…Status.initial` /
/// `.loading` branch previously rendered a bare `CircularProgressIndicator`.
class AppShimmer extends StatelessWidget {
  final Widget child;
  const AppShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Shimmer.fromColors(
      baseColor: colors.Color13,
      highlightColor: colors.surface,
      child: child,
    );
  }
}

/// One rounded-rect placeholder block — a text line, an avatar, a card
/// outline segment. Composed into per-screen skeleton layouts.
class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  const SkeletonBox({
    super.key,
    required this.width,
    required this.height,
    this.radius = AppRadius.field,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

/// Generic list-of-cards loading state — matches the row shape shared by
/// most Projects-module list screens (a title line, a shorter subtitle
/// line, a trailing badge) closely enough that swapping in real rows
/// doesn't jar. Used wherever a dedicated per-screen skeleton isn't worth
/// the upkeep.
class ShimmerCardList extends StatelessWidget {
  final int itemCount;
  final EdgeInsetsGeometry? padding;
  const ShimmerCardList({super.key, this.itemCount = 6, this.padding});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppShimmer(
      child: ListView.builder(
        padding: padding ?? EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonBox(width: 160.w, height: 14.h),
                      verticalSpace(8.h),
                      SkeletonBox(width: 100.w, height: 11.h),
                    ],
                  ),
                ),
                horizontalSpace(10),
                SkeletonBox(width: 60.w, height: 20.h, radius: AppRadius.full),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Generic detail-screen loading state — a header line plus a few stacked
/// section-card placeholders. Used wherever a dedicated per-screen skeleton
/// isn't worth the upkeep (the layout is close enough not to jar once real
/// content replaces it).
class ShimmerDetailStack extends StatelessWidget {
  final List<double> cardHeights;
  const ShimmerDetailStack({
    super.key,
    this.cardHeights = const [140, 100, 160],
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppShimmer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
        children: [
          SkeletonBox(width: 180.w, height: 16.h),
          verticalSpace(16.h),
          for (final height in cardHeights)
            Container(
              width: double.infinity,
              height: height.h,
              margin: EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(AppRadius.card),
              ),
            ),
        ],
      ),
    );
  }
}
