import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/localized.dart';
import '../../data/models/product_view.dart';

/// One product in the grid.
///
/// There is **no price and no stock figure anywhere in this API** — that
/// space on the card is taken by the server-rendered `highlights` chips
/// instead, which is what a rep actually reads a fitting by (30 W, ≥ 90,
/// 50 / 60 Hz).
class ProductCard extends StatelessWidget {
  final ProductListItemView product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: AppShadows.card,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _ProductThumb(product: product),
                  // `isAvailable` is advisory only (CP7 — the ERP owns real
                  // stock), so it is surfaced as a badge and **never** used
                  // to hide or grey out the product.
                  if (!product.isAvailable)
                    PositionedDirectional(
                      top: 8.h,
                      start: 8.w,
                      child: _UnavailableBadge(),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name.resolve(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.xsBold.copyWith(height: 1.35),
                  ),
                  if (product.sku != null) ...[
                    verticalSpace(4.h),
                    // Latin codes inside an Arabic layout must be
                    // direction-isolated or the punctuation flips to the
                    // wrong end of the string.
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        product.sku!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.xsMedium.copyWith(
                          color: colors.ink400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                  ],
                  if (product.highlights.isNotEmpty) ...[
                    verticalSpace(8.h),
                    Wrap(
                      spacing: 4.w,
                      runSpacing: 4.h,
                      children: [
                        for (final highlight in product.highlights.take(3))
                          HighlightChip(highlight: highlight),
                      ],
                    ),
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

/// A pre-rendered facet value (`display`), shown exactly as the server sent
/// it — the unit is appended and any qualifier (`≥`, `≤`, `≈`) is already
/// baked in, so reformatting it here would only corrupt it.
class HighlightChip extends StatelessWidget {
  final HighlightView highlight;

  const HighlightChip({super.key, required this.highlight});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: colors.Color13,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        highlight.display.resolve(context),
        style: context.textStyles.xsSemibold.copyWith(
          color: colors.textColor70,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}

class _UnavailableBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      decoration: BoxDecoration(
        color: colors.statusFollowUp.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5.w,
            height: 5.w,
            decoration: BoxDecoration(
              color: colors.statusFollowUp.core,
              shape: BoxShape.circle,
            ),
          ),
          horizontalSpace(4),
          Text(
            context.tr('catalog_unavailable'),
            style: context.textStyles.xsSemibold.copyWith(
              color: colors.statusFollowUp.badgeText,
              fontSize: 9.sp,
            ),
          ),
        ],
      ),
    );
  }
}

/// The image, or a **designed** stand-in when there is none — not a grey
/// box. `primaryImage` is genuinely null for part of the catalogue, so the
/// fallback is a real state the rep will meet, not an edge case.
class _ProductThumb extends StatelessWidget {
  final ProductListItemView product;

  const _ProductThumb({required this.product});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final url = product.primaryImage?.thumbnailUrl ?? product.primaryImage?.url;

    if (url == null) return _Placeholder(product: product);

    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) => progress == null
          ? child
          : Container(color: colors.Color13),
      errorBuilder: (_, _, _) => _Placeholder(product: product),
    );
  }
}

class _Placeholder extends StatelessWidget {
  final ProductListItemView product;

  const _Placeholder({required this.product});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      color: colors.Color10,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.lightbulb_outline_rounded,
            size: 26.sp,
            color: colors.ink300,
          ),
          if (product.category != null) ...[
            verticalSpace(6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                product.category!.name.resolve(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: context.textStyles.xsMedium.copyWith(
                  color: colors.ink400,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
