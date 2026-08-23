import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/image_viewer_screen.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/category_view.dart';
import '../../data/models/localized.dart';
import '../../data/models/product_view.dart';
import '../../logic/product_detail_bloc/product_detail_bloc.dart';
import '../widgets/catalog_image.dart';
import '../widgets/catalog_skeletons.dart';

/// Full product detail.
///
/// The spec sheet arrives **composed by the server**: units appended,
/// multi-values joined, qualifiers rendered (`≥ 90`) and display units
/// rescaled. Nothing here reformats a value — it only isolates each one
/// directionally, without which `220–240 V` renders reversed inside an
/// Arabic line.
class ProductDetailScreen extends StatelessWidget {
  final String idOrSlug;

  const ProductDetailScreen({super.key, required this.idOrSlug});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProductDetailBloc>()
        ..add(ProductDetailEvent.requested(idOrSlug)),
      child: const _ProductDetailView(),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return switch (state.status) {
            ProductDetailStatus.initial ||
            ProductDetailStatus.loading => const ProductDetailSkeleton(),

            // §19.5 — "not published" and "not found" are deliberately
            // indistinguishable (BR-4). Do not retry, and do not imply the
            // product might appear if they try again.
            ProductDetailStatus.notFound => _ErrorState(
              icon: Icons.inventory_2_outlined,
              title: context.tr('catalog_product_not_found_title'),
              subtitle: context.tr('catalog_product_not_found_subtitle'),
            ),
            ProductDetailStatus.catalogUnavailable => _ErrorState(
              icon: Icons.cloud_off_outlined,
              title: context.tr('catalog_unavailable_title'),
              subtitle: context.tr('catalog_unavailable_subtitle'),
            ),
            ProductDetailStatus.networkError => _ErrorState(
              icon: Icons.wifi_off_rounded,
              title: context.tr('error_unexpected'),
              subtitle: state.errorMessage,
            ),
            ProductDetailStatus.loaded => _Content(product: state.product!),
          };
        },
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const _ErrorState({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: _CircleButton(
                icon: Icons.arrow_back_rounded,
                onTap: () => context.pop(),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: EmptyState(icon: icon, title: title, subtitle: subtitle),
            ),
          ),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final ProductDetailView product;

  const _Content({required this.product});


  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final images = product.images;

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _Gallery(images: images)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // BR-2 — a discontinued product still returns 200 and is
                    // rendered in full, because historical activities and
                    // outcomes reference it. The banner is the disclosure.
                    if (product.isDiscontinued) ...[
                      _DiscontinuedBanner(),
                      verticalSpace(14.h),
                    ],
                    if (product.breadcrumb.isNotEmpty) ...[
                      _ProductBreadcrumb(trail: product.breadcrumb),
                      verticalSpace(10.h),
                    ],
                    Text(
                      product.name.resolve(context),
                      style: context.textStyles.lgBold.copyWith(height: 1.35),
                    ),
                    verticalSpace(6.h),
                    _Codes(product: product),
                    verticalSpace(10.h),
                    _AvailabilityLine(isAvailable: product.isAvailable),

                    if (product.highlights.isNotEmpty) ...[
                      verticalSpace(18.h),
                      _HighlightGrid(highlights: product.highlights),
                    ],

                    if (product.description != null) ...[
                      verticalSpace(18.h),
                      Text(
                        product.description!.resolve(context),
                        style: context.textStyles.smRegular.copyWith(
                          height: 1.7,
                        ),
                      ),
                    ],

                    // Free-text marketing bullets — a different field from
                    // the typed facets above, despite the similar name.
                    if (product.highlightPoints.isNotEmpty) ...[
                      verticalSpace(16.h),
                      for (final point in product.highlightPoints)
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.h),
                                child: Icon(
                                  Icons.circle,
                                  size: 6.sp,
                                  color: colors.brand400,
                                ),
                              ),
                              horizontalSpace(10),
                              Expanded(
                                child: Text(
                                  point.resolve(context),
                                  style: context.textStyles.smRegular.copyWith(
                                    height: 1.6,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],

                    if (product.specSheet.isNotEmpty) ...[
                      verticalSpace(20.h),
                      Text(
                        context.tr('catalog_specs_section'),
                        style: context.textStyles.baseBold,
                      ),
                      verticalSpace(10.h),
                      _SpecSheet(rows: product.specSheet),
                    ],
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ],
        ),

        // Floats over the gallery, matching the design's transparent bar.
        //
        // Explicitly positioned rather than wrapped in an `Align`: a
        // non-positioned `Stack` child gets loose constraints, so an `Align`
        // with no size factors expands to the **whole stack** — which put
        // this button halfway down the screen instead of in the corner.
        PositionedDirectional(
          top: 0,
          start: 0,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(12.w),
              child: _CircleButton(
                icon: Icons.arrow_back_rounded,
                onTap: () => context.pop(),
              ),
            ),
          ),
        ),

        if (product.hasDatasheet)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
              decoration: BoxDecoration(
                color: colors.surface,
                boxShadow: AppShadows.cardHover,
              ),
              child: SafeArea(
                top: false,
                child: _DatasheetButton(product: product),
              ),
            ),
          ),
      ],
    );
  }
}

/// The datasheet button, with its own download state.
///
/// Stateful because the work it does is **not instant and gives no feedback
/// of its own**: `open_filex` can only open a *local* path, so the PDF has
/// to be fetched to the cache first. Over a field connection that is several
/// seconds during which the OS viewer has not appeared yet — without a
/// spinner the button reads as dead and reps tap it repeatedly, starting a
/// second download on top of the first.
class _DatasheetButton extends StatefulWidget {
  final ProductDetailView product;

  const _DatasheetButton({required this.product});

  @override
  State<_DatasheetButton> createState() => _DatasheetButtonState();
}

class _DatasheetButtonState extends State<_DatasheetButton> {
  bool _downloading = false;

  /// Downloads the PDF to the cache, then hands the **local** path to the OS
  /// viewer — the same route `AttachmentOpener` takes.
  ///
  /// §7.9 — datasheet URLs are **stable and unsigned** (a signed URL would
  /// expire before a rep opened the app in the field), so no resolve step is
  /// needed here, unlike activity attachments.
  Future<void> _open() async {
    final media = widget.product.datasheet;
    // Re-entrancy guard: a second tap while the first download is in flight
    // would write the same file twice and open it twice.
    if (media == null || _downloading) return;

    final messenger = ScaffoldMessenger.of(context);
    final failedMessage = context.tr('catalog_datasheet_failed');
    setState(() => _downloading = true);

    try {
      final directory = await getTemporaryDirectory();
      final name = Uri.parse(media.url).pathSegments.last;
      final path =
          '${directory.path}/'
          '${name.isEmpty ? '${widget.product.slug}.pdf' : name}';
      await Dio().download(media.url, path);
      final result = await OpenFilex.open(path);
      if (result.type != ResultType.done) {
        messenger.showSnackBar(SnackBar(content: Text(failedMessage)));
      }
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(failedMessage)));
    } finally {
      // The screen can be popped mid-download — the OS viewer takes focus
      // and a rep may back out before it opens.
      if (mounted) setState(() => _downloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: _downloading ? null : _open,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 46.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          // Dimmed rather than greyed: the button is still the same action,
          // just already running.
          color: _downloading ? colors.brand400 : colors.brand500,
          borderRadius: BorderRadius.circular(AppRadius.field),
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _downloading
              ? Row(
                  key: const ValueKey('downloading'),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 16.w,
                      height: 16.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: colors.white,
                      ),
                    ),
                    horizontalSpace(8),
                    Text(
                      context.tr('catalog_datasheet_opening'),
                      style: context.textStyles.smBold.copyWith(
                        color: colors.white,
                      ),
                    ),
                  ],
                )
              : Row(
                  key: const ValueKey('idle'),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.description_outlined,
                      size: 18.sp,
                      color: colors.white,
                    ),
                    horizontalSpace(8),
                    Text(
                      context.tr('catalog_datasheet'),
                      style: context.textStyles.smBold.copyWith(
                        color: colors.white,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

/// Image gallery. `DATASHEET` media are filtered out upstream — a PDF in an
/// image carousel would render as a broken tile.
class _Gallery extends StatefulWidget {
  final List<MediaView> images;

  const _Gallery({required this.images});

  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (widget.images.isEmpty) {
      return Container(
        height: 260.h,
        color: colors.Color10,
        alignment: Alignment.center,
        child: Icon(
          Icons.lightbulb_outline_rounded,
          size: 48.sp,
          color: colors.ink300,
        ),
      );
    }

    return SizedBox(
      height: 300.h,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            onPageChanged: (i) => setState(() => _index = i),
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              final media = widget.images[index];
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ImageViewerScreen(
                      images: [
                        for (final m in widget.images)
                          ViewableImage.network(m.url),
                      ],
                      initialIndex: index,
                    ),
                  ),
                ),
                child: Container(
                  color: colors.surface,
                  // Full `url` here, not the thumbnail: this is the one place
                  // the photo is shown large and can be zoomed, so the
                  // bandwidth is what the rep is actually asking for. Cards
                  // and tiles take the thumbnail instead.
                  child: CatalogImage(
                    url: media.url,
                    fit: BoxFit.contain,
                    placeholderBuilder: (_) => const CatalogImagePlaceholder(),
                    errorBuilder: (_) => Icon(
                      Icons.broken_image_outlined,
                      color: colors.ink300,
                    ),
                  ),
                ),
              );
            },
          ),
          if (widget.images.length > 1)
            Positioned(
              bottom: 14.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < widget.images.length; i++)
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: EdgeInsets.symmetric(horizontal: 3.w),
                      width: i == _index ? 16.w : 6.w,
                      height: 6.w,
                      decoration: BoxDecoration(
                        color: i == _index ? colors.brand500 : colors.ink300,
                        borderRadius: BorderRadius.circular(AppRadius.full),
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

class _DiscontinuedBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: colors.statusClosed.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.field),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline_rounded,
            size: 16.sp,
            color: colors.statusClosed.badgeText,
          ),
          horizontalSpace(8),
          Expanded(
            child: Text(
              context.tr('catalog_discontinued_notice'),
              style: context.textStyles.xsSemibold.copyWith(
                color: colors.statusClosed.badgeText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Codes extends StatelessWidget {
  final ProductDetailView product;

  const _Codes({required this.product});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // `sku` and `itemNumber` are separate columns but hold the same string
    // for much of this catalogue. Printing "NP-TL-30B · NP-TL-30B" looks
    // like a rendering fault, so identical values collapse to one.
    // Compared case-insensitively and trimmed: they come from different
    // source columns and drift in casing alone is not a real difference.
    final sku = product.sku?.trim();
    final itemNumber = product.itemNumber?.trim();
    final sameCode =
        sku != null &&
        itemNumber != null &&
        sku.toLowerCase() == itemNumber.toLowerCase();
    final parts = [
      if (sku != null && sku.isNotEmpty) sku,
      if (!sameCode && itemNumber != null && itemNumber.isNotEmpty)
        itemNumber,
    ];
    if (parts.isEmpty) return const SizedBox.shrink();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Text(
        parts.join('  ·  '),
        style: context.textStyles.xsMedium.copyWith(
          color: colors.ink500,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}

class _AvailabilityLine extends StatelessWidget {
  final bool isAvailable;

  const _AvailabilityLine({required this.isAvailable});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final status = isAvailable ? colors.statusWon : colors.statusFollowUp;
    return Row(
      children: [
        Container(
          width: 7.w,
          height: 7.w,
          decoration: BoxDecoration(color: status.core, shape: BoxShape.circle),
        ),
        horizontalSpace(7),
        Text(
          context.tr(
            isAvailable ? 'catalog_available' : 'catalog_unavailable',
          ),
          style: context.textStyles.xsSemibold.copyWith(color: status.core),
        ),
      ],
    );
  }
}

/// The typed facets, as the design's three-up cards.
class _HighlightGrid extends StatelessWidget {
  final List<HighlightView> highlights;

  const _HighlightGrid({required this.highlights});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        for (final highlight in highlights)
          // Sized to its content, not forced to a third of the row.
          //
          // A hard `1/3` width assumed every facet value is short. Real ones
          // are not — "بولي إيثيلين / نحاس" and "أسود / أحمر / أبيض" were
          // both cut to an ellipsis, hiding exactly the part that
          // distinguishes the product. These values are **pre-rendered
          // server-side** and cannot be shortened or reformatted here, so
          // the layout has to bend around them instead.
          //
          // `Wrap` still packs three short values onto one line; a long one
          // simply takes the room it needs and pushes the rest down.
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: (1.sw - 40.w - 16.w) / 3,
              // Never wider than the row, so a very long value wraps inside
              // its own card rather than overflowing the screen.
              maxWidth: 1.sw - 40.w,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(AppRadius.card),
                boxShadow: AppShadows.card,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      highlight.display.resolve(context),
                      // Two lines: enough for a compound value like
                      // "أسود / أحمر / أبيض" to read in full.
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: context.textStyles.smBold,
                    ),
                  ),
                  verticalSpace(3.h),
                  Text(
                    highlight.label.resolve(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: context.textStyles.xsMedium.copyWith(
                      color: colors.ink400,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

/// Rendered in **array order**: facet rows and free-form extra specs
/// (`code == null`) interleave on a shared display order that reflects the
/// manufacturer's own table, so re-sorting or grouping them would scramble
/// a deliberate sequence.
class _SpecSheet extends StatelessWidget {
  final List<SpecSheetRow> rows;

  const _SpecSheet({required this.rows});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
              decoration: BoxDecoration(
                border: i == rows.length - 1
                    ? null
                    : Border(bottom: BorderSide(color: colors.Color13)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      rows[i].label.resolve(context),
                      style: context.textStyles.xsMedium,
                    ),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    flex: 5,
                    child: Directionality(
                      // Isolated: without this a value like `220–240 V`
                      // renders reversed inside an Arabic line.
                      textDirection: TextDirection.ltr,
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          rows[i].value.resolve(context),
                          textAlign: TextAlign.end,
                          style: context.textStyles.xsSemibold,
                        ),
                      ),
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

class _ProductBreadcrumb extends StatelessWidget {
  /// ⚠️ Unlike the category endpoint's trail, this one **already includes
  /// the product's own category** as its last element — nothing is appended.
  final List<CategoryRefView> trail;

  const _ProductBreadcrumb({required this.trail});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      height: 22.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: trail.length,
        itemBuilder: (context, index) => Row(
          children: [
            Text(
              trail[index].name.resolve(context),
              style: context.textStyles.xsMedium.copyWith(
                color: colors.ink400,
              ),
            ),
            if (index != trail.length - 1)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Icon(
                  Icons.chevron_right_rounded,
                  size: 13.sp,
                  color: colors.ink300,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: colors.surface,
          shape: BoxShape.circle,
          boxShadow: AppShadows.card,
        ),
        child: Icon(icon, size: 18.sp, color: colors.textColor),
      ),
    );
  }
}
