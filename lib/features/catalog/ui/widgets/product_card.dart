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
  double availableWidth, {
  /// Needed to measure chip text. Omit only where there is nothing to
  /// measure — the loading skeletons, which reserve one chip line.
  BuildContext? context,

  /// The rows about to be laid out. Every product's spec chips are measured
  /// so the cell height fits the **tallest** block in the batch, which is
  /// what lets each card show all of its chips without any being cut.
  List<ProductListItemView> products = const [],
}) {
  const columns = 2;
  final spacing = 12.w;
  final columnWidth = (availableWidth - spacing * (columns - 1)) / columns;

  // The chips lay out inside the text block's horizontal padding
  // (`EdgeInsets.fromLTRB(10.w, …, 10.w, …)` on the card).
  final chipAreaWidth = columnWidth - 20.w;

  var chipLines = 1;
  if (context != null) {
    for (final product in products) {
      final lines = HighlightStrip.lineCount(
        context,
        product.highlights,
        chipAreaWidth,
      );
      if (lines > chipLines) chipLines = lines;
    }
  }

  return SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: columns,
    crossAxisSpacing: spacing,
    mainAxisSpacing: 12.h,
    mainAxisExtent: columnWidth + productTextBlockHeight(chipLines, context),
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
/// [chipLines] is measured per batch by [productGridDelegate] — every card
/// in a grid gets the same height, sized to whichever product needs the most
/// chip rows. Cards with fewer chips carry a little slack, which is the
/// price of a grid that stays aligned; the alternative is a masonry layout
/// where no two columns line up.
double productTextBlockHeight(int chipLines, [BuildContext? context]) {
  const nameLines = 3;
  // `xsBold` is 12sp; the card sets height: 1.35 on it.
  final nameHeight = 12.sp * 1.35 * nameLines;
  // `xsMedium` at 12sp, single line, default leading.
  final codeHeight = 12.sp * 1.3;
  // Chip rows: their measured height, plus the Wrap's runSpacing between
  // them. See [chipRowHeight] for why this is measured rather than fixed.
  final chipsHeight =
      chipLines * chipRowHeight(context) + (chipLines - 1) * kChipRunSpacing;
  // 8 top + 10 bottom padding, 4 under the name, 8 above the chips.
  final spacingTotal = 8.h + 10.h + 4.h + 8.h + chipsHeight;
  // A line box is not exactly `fontSize * height` — the font's own ascent
  // and descent add a little on top. Without this the last line lands a
  // hair short and gets sliced, which is the whole symptom.
  final safety = 8.h;
  return nameHeight + codeHeight + spacingTotal + safety;
}

/// Gap between wrapped chip rows. Shared by the strip that draws them and
/// the delegate that reserves room for them.
double get kChipRunSpacing => 4.h;

/// Height of one row of spec chips — **measured**, not assumed.
///
/// This was a flat `18.h`, and it was wrong: a chip is text sized in `.sp`
/// inside padding sized in `.h`, and those two scales diverge with the
/// system font setting. The reserve came out under the real height, so the
/// bottom row of a wrapped strip was clipped by the grid cell — the same
/// units mistake [productTextBlockHeight] documents for the name lines,
/// repeated one widget down.
///
/// Measuring the actual line box removes the guess. [context] is optional
/// only for the loading skeletons, which have no text to measure; they fall
/// back to an estimate that is deliberately generous rather than tight.
double chipRowHeight([BuildContext? context]) {
  final padding = HighlightChip.verticalPadding * 2;
  if (context == null) return 10.sp * 1.6 + padding;
  final painter = TextPainter(
    // Digits and Latin caps bracket the tallest glyphs a chip renders; an
    // Arabic sample is taller still, so it leads.
    text: TextSpan(text: 'أ0W', style: HighlightStrip.chipStyle(context)),
    textDirection: TextDirection.ltr,
    maxLines: 1,
    textScaler: MediaQuery.textScalerOf(context),
  )..layout();
  return painter.height + padding;
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
                      HighlightStrip(highlights: product.highlights),
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
/// Every spec chip a product carries, wrapped onto as many rows as it takes.
///
/// **Nothing is dropped and nothing is cut.** Two earlier attempts got this
/// wrong in opposite directions: the first put a `Wrap` inside a `ClipRect`,
/// so rows past the first were sliced away mid-chip; the second measured a
/// single row and summarised the rest as `+N`, which is still a card
/// refusing to show what it knows.
///
/// The height is not guessed here. [productGridDelegate] runs [lineCount]
/// over the whole batch before the grid is built and reserves the tallest
/// result for every cell, so the `Wrap` below always has the room it needs.
/// [lineCount] and this `build` share one spacing constant and one text
/// style precisely so the reservation and the render cannot disagree.
class HighlightStrip extends StatelessWidget {
  final List<HighlightView> highlights;

  const HighlightStrip({super.key, required this.highlights});

  static double get _spacing => 4.w;

  /// The text style chips render in. One definition, read by both the
  /// measurement and the widget.
  static TextStyle chipStyle(BuildContext context) =>
      context.textStyles.xsSemibold.copyWith(
        color: context.colors.textColor70,
        fontSize: 10.sp,
      );

  /// How many rows [highlights] needs at [maxWidth]. Mirrors `Wrap`'s own
  /// greedy line-breaking: a chip that does not fit the current row starts
  /// the next one.
  static int lineCount(
    BuildContext context,
    List<HighlightView> highlights,
    double maxWidth,
  ) {
    if (highlights.isEmpty || maxWidth <= 0) return 1;
    final style = chipStyle(context);
    final scale = MediaQuery.textScalerOf(context).scale(1);

    var lines = 1;
    var rowWidth = 0.0;
    for (final highlight in highlights) {
      final width = _chipWidth(highlight.display.resolve(context), style, scale);
      // First chip on a row takes no leading gap.
      final needed = rowWidth == 0 ? width : _spacing + width;
      if (rowWidth + needed > maxWidth && rowWidth > 0) {
        lines++;
        rowWidth = width;
      } else {
        rowWidth += needed;
      }
    }
    return lines;
  }

  /// Rendered width of one chip: its text plus [HighlightChip]'s padding.
  static double _chipWidth(String label, TextStyle style, double textScale) {
    final painter = TextPainter(
      text: TextSpan(text: label, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
      textScaler: TextScaler.linear(textScale),
    )..layout();
    return painter.width + HighlightChip.horizontalPadding * 2;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: _spacing,
      runSpacing: kChipRunSpacing,
      children: [
        for (final highlight in highlights) HighlightChip(highlight: highlight),
      ],
    );
  }
}

/// A pre-rendered facet value (`display`), shown exactly as the server sent
/// it — the unit is appended and any qualifier (`≥`, `≤`, `≈`) is already
/// baked in, so reformatting it here would only corrupt it.
class HighlightChip extends StatelessWidget {
  final HighlightView highlight;

  /// Caps the chip and ellipsises its label. Only used by [HighlightStrip]
  /// for the degenerate case where not even one chip fits whole.
  final double? maxWidth;

  /// Shared with [HighlightStrip]'s measurement so the width it predicts and
  /// the width this renders can never drift apart.
  static double get horizontalPadding => 7.w;

  /// Vertical padding, shared with [chipRowHeight]'s measurement.
  static double get verticalPadding => 2.h;

  const HighlightChip({super.key, required this.highlight, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final chip = Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        color: colors.Color13,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        highlight.display.resolve(context),
        maxLines: 1,
        overflow: maxWidth == null ? TextOverflow.clip : TextOverflow.ellipsis,
        softWrap: false,
        style: context.textStyles.xsSemibold.copyWith(
          color: colors.textColor70,
          fontSize: 10.sp,
        ),
      ),
    );
    if (maxWidth == null) return chip;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth!),
      child: chip,
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
    // `url` first, `thumbnailUrl` as the fallback.
    //
    // The order used to be the other way round, on bandwidth grounds. In
    // practice the served thumbnails are too small for a half-width card on
    // a modern handset — a 3x device asks for roughly 570 px of image and
    // gets a thumbnail rendered soft. `CatalogImage` below decodes to the
    // cell's real width and caches the decoded result, so the extra bytes
    // are paid once per image rather than per scroll.
    final url =
        product.primaryImage?.url ?? product.primaryImage?.thumbnailUrl;

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
