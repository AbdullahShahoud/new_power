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

/// The row of spec chips under a product name.
///
/// ⚠️ It **measures** rather than clips. The previous version put a `Wrap`
/// inside an `OverflowBox` and a `ClipRect`: anything past the first line
/// was cut away, which in practice meant a card showed two chips no matter
/// how many the product had, and — because the clip is a rectangle, not a
/// chip boundary — a third could be sliced down its middle and left as a
/// stray sliver at the card's edge. That is the artefact in the bug report.
///
/// Here the chips are laid out only if they fit whole, and anything left
/// over is reported as a `+N` chip. Nothing is ever half-drawn, and the card
/// stops silently lying about how much it knows: a fitting with five specs
/// now says so instead of looking identical to one with two.
///
/// A single line by choice. The grid cell reserves a fixed text block
/// (`kProductTextBlockHeight`), so a second line of chips would have to come
/// out of the product name — and the name is what a rep scans first.
class HighlightStrip extends StatelessWidget {
  final List<HighlightView> highlights;

  const HighlightStrip({super.key, required this.highlights});

  /// Width a chip occupies: its text plus the horizontal padding
  /// [HighlightChip] applies. Measured with the same style the chip renders
  /// with, so the two cannot disagree.
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
    final colors = context.colors;
    final style = context.textStyles.xsSemibold.copyWith(
      color: colors.textColor70,
      fontSize: 10.sp,
    );
    final textScale = MediaQuery.textScalerOf(context).scale(1);
    final spacing = 4.w;

    return SizedBox(
      height: 18.h,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final labels = [
            for (final h in highlights) h.display.resolve(context),
          ];
          final widths = [
            for (final label in labels) _chipWidth(label, style, textScale),
          ];

          // Greedy fit, reserving room for the "+N" chip whenever anything
          // would be left behind. The count is only known once the fit is
          // decided, so the reservation uses the widest plausible label
          // ("+" plus the total count) — never narrower than what is drawn.
          final overflowLabel = '+${highlights.length}';
          final overflowWidth = _chipWidth(overflowLabel, style, textScale);

          var used = 0.0;
          var fitted = 0;
          for (var i = 0; i < widths.length; i++) {
            final needed = (i == 0 ? 0.0 : spacing) + widths[i];
            final isLast = i == widths.length - 1;
            // Every chip after this one still has to be announced, so the
            // "+N" chip's width is part of the budget unless this is the
            // final chip and it fits outright.
            final reserve = isLast ? 0.0 : spacing + overflowWidth;
            if (used + needed + reserve > maxWidth) break;
            used += needed;
            fitted++;
          }

          final hidden = highlights.length - fitted;

          // Nothing fits — a very narrow card or a very long single spec.
          // Show one chip clipped by ellipsis rather than an empty band:
          // a truncated value the rep can tap through to is more use than
          // no value at all.
          if (fitted == 0 && highlights.isNotEmpty) {
            return Align(
              alignment: AlignmentDirectional.centerStart,
              child: HighlightChip(
                highlight: highlights.first,
                maxWidth: maxWidth,
              ),
            );
          }

          return Row(
            children: [
              for (var i = 0; i < fitted; i++) ...[
                if (i > 0) SizedBox(width: spacing),
                HighlightChip(highlight: highlights[i]),
              ],
              if (hidden > 0) ...[
                SizedBox(width: spacing),
                _OverflowChip(label: '+$hidden'),
              ],
            ],
          );
        },
      ),
    );
  }
}

/// The `+N` marker closing a truncated [HighlightStrip].
///
/// Deliberately styled as a chip rather than plain text: it sits in a row of
/// chips, and anything else there reads as a value rather than a count.
class _OverflowChip extends StatelessWidget {
  final String label;

  const _OverflowChip({required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: HighlightChip.horizontalPadding,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: colors.Color13,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        // The count is a number in both languages; forcing LTR stops "+3"
        // from being reordered to "3+" under an RTL layout.
        textDirection: TextDirection.ltr,
        style: context.textStyles.xsSemibold.copyWith(
          color: colors.textColor70,
          fontSize: 10.sp,
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

  /// Caps the chip and ellipsises its label. Only used by [HighlightStrip]
  /// for the degenerate case where not even one chip fits whole.
  final double? maxWidth;

  /// Shared with [HighlightStrip]'s measurement so the width it predicts and
  /// the width this renders can never drift apart.
  static double get horizontalPadding => 7.w;

  const HighlightChip({super.key, required this.highlight, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final chip = Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 2.h,
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
