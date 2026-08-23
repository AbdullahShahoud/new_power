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
import 'catalog_image.dart';
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
    mainAxisExtent: columnWidth + kProductTextBlockHeight,
  );
}

/// The exact height the text under the image needs.
///
/// Derived from the same units the text is actually laid out in rather than
/// guessed as one round number — that is what left the third line of the
/// name sliced in half. A flat `132.h` reserve is expressed in *height*
/// units while the glyphs are sized in `.sp`, so on any device where the two
/// scales diverge (a larger system font, a different aspect ratio) the
/// reserve stopped covering the text it was supposed to hold.
///
/// Adding the parts up in their own units means the box grows with the type
/// instead of drifting away from it.
double get kProductTextBlockHeight {
  const nameLines = 3;
  // `xsBold` is 12sp; the card sets height: 1.35 on it.
  final nameHeight = 12.sp * 1.35 * nameLines;
  // `xsMedium` at 12sp, single line, default leading.
  final codeHeight = 12.sp * 1.3;
  const chipsHeight = 18.0;
  // 8 top + 10 bottom padding, 4 under the name, 8 above the chips.
  final spacingTotal = 8.h + 10.h + 4.h + 8.h + chipsHeight.h;
  // A line box is not exactly `fontSize * height` — the font's own ascent
  // and descent add a little on top. Without this the last line lands a
  // hair short and gets sliced, which is the whole symptom.
  final safety = 8.h;
  return nameHeight + codeHeight + spacingTotal + safety;
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
                    // from the next.
                    //
                    // Deliberately **not** `Flexible`. Letting the name give
                    // way meant a squeezed cell handed it less height than
                    // three lines need, and the third line rendered sliced
                    // through the middle — visible, but unreadable. Now it
                    // asks for its full height and the cell reserves exactly
                    // that (see [kProductTextBlockHeight]), so a line is
                    // either drawn whole or ellipsised — never half-drawn.
                    Text(
                      product.name.resolve(context),
                      maxLines: 3,
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
                    // Absorbs whatever slack is left so the chips always sit
                    // on the card's bottom edge. Without it a short name
                    // floated its chips halfway up and the row of cards read
                    // as ragged.
                    const Spacer(),
                    if (product.highlights.isNotEmpty)
                      // A `Wrap` under a clip, not a horizontal strip.
                      //
                      // The strip laid three chips in a row and simply ran
                      // off the card, leaving the first one sliced down the
                      // middle — a stray ")" at the edge that reads as a
                      // rendering fault. `Wrap` pushes whatever does not fit
                      // onto a second line, and the clip hides that line
                      // entirely, so the card shows *fewer* chips rather
                      // than a broken one.
                      //
                      // `OverflowBox` is what keeps that legal: it hands the
                      // Wrap an unbounded height to lay out in, so the extra
                      // line is clipped rather than reported as an overflow.
                      SizedBox(
                        height: 18.h,
                        width: double.infinity,
                        child: ClipRect(
                          child: OverflowBox(
                            alignment: AlignmentDirectional.topStart,
                            maxHeight: double.infinity,
                            child: Wrap(
                              spacing: 4.w,
                              runSpacing: 4.h,
                              children: [
                                for (final highlight
                                    in product.highlights.take(3))
                                  HighlightChip(highlight: highlight),
                              ],
                            ),
                          ),
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
    // `thumbnailUrl` first — it is what a half-width card needs, and the
    // full-resolution `url` costs bandwidth and cache room this grid cannot
    // spare. §7.7 marks `thumbnailUrl` itself nullable, so the full image is
    // the fallback rather than the default.
    final url =
        product.primaryImage?.thumbnailUrl ?? product.primaryImage?.url;

    if (url == null) return _Placeholder(product: product);

    return LayoutBuilder(
      builder: (context, constraints) => CatalogImage(
        url: url,
        // Decoded to the cell's real width at this device's pixel ratio, so
        // a card never holds a full-resolution bitmap it cannot show.
        decodeWidth:
            (constraints.maxWidth * MediaQuery.devicePixelRatioOf(context))
                .round(),
        placeholderBuilder: (_) => const CatalogImagePlaceholder(),
        errorBuilder: (_) => _Placeholder(product: product),
      ),
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
