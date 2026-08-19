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

/// The grid geometry every product grid must use — the category screen and
/// the search results share it so they cannot drift apart.
///
/// Sized with `mainAxisExtent` (an absolute height) rather than
/// `childAspectRatio` (a ratio), which is what made the grid look different
/// on every handset: the image is square, so it grows with the column width,
/// but the text under it needs a roughly *fixed* number of pixels. Tying the
/// whole cell to a ratio meant a narrow phone starved the text — clipping
/// the chips — while a wide one left a dead band under them.
///
/// Here the height is "square image + a fixed text block", so the text gets
/// the same room on every screen and the only thing that varies is the
/// picture, which is exactly the part that *should* scale.
SliverGridDelegateWithFixedCrossAxisCount productGridDelegate(
  double availableWidth,
) {
  const columns = 2;
  final spacing = 12.w;
  final columnWidth = (availableWidth - spacing * (columns - 1)) / columns;
  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: columns,
    crossAxisSpacing: spacing,
    mainAxisSpacing: 12.h,
    // Room for three lines of name, the code line, and one row of chips.
    mainAxisExtent: columnWidth + 132.h,
  );
}

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
            // Takes exactly the height the grid left over, so the card can
            // never demand more than its cell — the source of the clipped
            // content on smaller screens.
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Three lines rather than two: product names here carry
                    // the wattage, colour and finish, and cutting at two
                    // routinely hid the part that distinguishes one fitting
                    // from the next. `Flexible` lets it give way first if a
                    // large system font leaves nothing to spare.
                    Flexible(
                      child: Text(
                        product.name.resolve(context),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.xsBold.copyWith(
                          height: 1.35,
                        ),
                      ),
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
                    // Absorbs whatever slack is left so the chips always sit
                    // on the card's bottom edge. Without it a short name
                    // floated its chips halfway up and the row of cards read
                    // as ragged.
                    const Spacer(),
                    if (product.highlights.isNotEmpty)
                      SizedBox(
                        height: 18.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            for (final highlight
                                in product.highlights.take(3)) ...[
                              HighlightChip(highlight: highlight),
                              horizontalSpace(4),
                            ],
                          ],
                        ),
                      ),
                  ],
                ),
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
    // Always the full `url`, never `thumbnailUrl`. The thumbnails this
    // catalogue serves are too small for a half-width card and render
    // visibly soft; the bandwidth saved is not worth a blurry grid.
    final url = product.primaryImage?.url;

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
