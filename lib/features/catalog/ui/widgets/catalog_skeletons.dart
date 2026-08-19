import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import 'product_card.dart';

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
        // Both are required together: this is placed inside a
        // `SliverToBoxAdapter`, which offers **unbounded** height. Without
        // `shrinkWrap` the grid tries to fill infinity, the shimmer's filter
        // never gets a size, and layout dies with "RenderBox was not laid
        // out" — taking the whole sliver's geometry with it.
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // The real grid's geometry, not an approximation of it — a skeleton
        // at a different cell height makes the whole page jump the moment
        // content lands.
        gridDelegate: productGridDelegate(
          MediaQuery.sizeOf(context).width - 40.w,
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
        // Same unbounded-height reason as [CatalogGridSkeleton].
        shrinkWrap: true,
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

/// Loading state for a category screen's header — the breadcrumb trail and
/// the horizontal subcategory strip.
///
/// Needed because those two come from `/categories/{idOrSlug}`, a *separate*
/// request from `/products`: without it the top of the screen stays blank
/// while the grid below already shimmers, and the header then pops in and
/// shoves the grid down.
class CategoryHeaderSkeleton extends StatelessWidget {
  final bool showSubcategories;

  const CategoryHeaderSkeleton({super.key, this.showSubcategories = true});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SkeletonBox(width: 180.w, height: 12.h),
          ),
          if (showSubcategories) ...[
            verticalSpace(16.h),
            SizedBox(
              height: 118.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (_, _) => horizontalSpace(10),
                itemBuilder: (_, _) => SizedBox(
                  width: 108.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppRadius.card),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
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
