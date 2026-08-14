import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/widget/shimmer_skeleton.dart';

/// Loading state for any catalogue grid. Mirrors the real card's proportions
/// — square image, two text lines, a chip row — so the swap to content
/// doesn't jump.
class CatalogGridSkeleton extends StatelessWidget {
  final int itemCount;
  final EdgeInsetsGeometry padding;

  const CatalogGridSkeleton({
    super.key,
    this.itemCount = 6,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: GridView.builder(
        padding: padding,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.68,
        ),
        itemCount: itemCount,
        itemBuilder: (_, _) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.card),
          ),
        ),
      ),
    );
  }
}

/// Loading state for the tree in list mode.
class CatalogListSkeleton extends StatelessWidget {
  final int itemCount;
  final EdgeInsetsGeometry padding;

  const CatalogListSkeleton({
    super.key,
    this.itemCount = 7,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.builder(
        padding: padding,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (_, _) => Container(
          height: 66.h,
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppRadius.card),
          ),
        ),
      ),
    );
  }
}

/// Loading state for the product detail: gallery block, title lines,
/// highlight cards, then spec rows.
class ProductDetailSkeleton extends StatelessWidget {
  const ProductDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 260.h,
              width: double.infinity,
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonBox(width: 220.w, height: 18.h),
                  verticalSpace(10.h),
                  SkeletonBox(width: 120.w, height: 12.h),
                  verticalSpace(20.h),
                  Row(
                    children: [
                      for (var i = 0; i < 3; i++) ...[
                        Expanded(
                          child: SkeletonBox(
                            width: double.infinity,
                            height: 58.h,
                            radius: AppRadius.card,
                          ),
                        ),
                        if (i < 2) horizontalSpace(8),
                      ],
                    ],
                  ),
                  verticalSpace(20.h),
                  for (var i = 0; i < 6; i++) ...[
                    SkeletonBox(width: double.infinity, height: 14.h),
                    verticalSpace(12.h),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
