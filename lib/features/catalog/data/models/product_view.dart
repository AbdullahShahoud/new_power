// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'catalog_enums.dart';
import 'category_view.dart';
import 'localized.dart';

part 'product_view.freezed.dart';
part 'product_view.g.dart';

/// §7.7 `primaryImage` — the first `IMAGE` medium by `sortOrder ASC, id ASC`.
/// The whole object is null when the product has no image, and
/// `thumbnailUrl` is itself nullable.
@freezed
abstract class ProductImageRef with _$ProductImageRef {
  const factory ProductImageRef({
    required String url,
    String? thumbnailUrl,
  }) = _ProductImageRef;

  factory ProductImageRef.fromJson(Map<String, dynamic> json) =>
      _$ProductImageRefFromJson(json);
}

/// §8.7 `HighlightView` — a **typed facet**, pre-rendered server-side.
///
/// ⚠️ Not to be confused with `highlightPoints` on the detail view, which
/// are free-text marketing bullets. The offline payload swaps these two
/// names outright (§8.9); this app reads only the online surface.
@freezed
abstract class HighlightView with _$HighlightView {
  const factory HighlightView({
    required String code,
    required Localized label,
    String? unit,

    /// **Pre-rendered** (`"30 W"`, `"50 / 60 Hz"`, `"≥ 90"`). Display as-is
    /// — never reformat, the unit and qualifier are already baked in.
    required Localized display,
  }) = _HighlightView;

  factory HighlightView.fromJson(Map<String, dynamic> json) =>
      _$HighlightViewFromJson(json);
}

/// §8.4 `MediaView`. Detail endpoint only (the list carries just
/// `primaryImage`).
@freezed
abstract class MediaView with _$MediaView {
  const factory MediaView({
    String? id,
    @JsonKey(unknownEnumValue: MediaType.unknown)
    @Default(MediaType.unknown)
    MediaType type,
    required String url,
    String? thumbnailUrl,
    Localized? alt,
    @Default(0) int sortOrder,
  }) = _MediaView;

  factory MediaView.fromJson(Map<String, dynamic> json) =>
      _$MediaViewFromJson(json);
}

/// §8.8 `SpecSheetRow` — composed server-side, not stored.
///
/// Units are appended, multi-values joined (`50 / 60 Hz`), qualifiers
/// rendered (`≥ 0.9`) and display units rescaled (a 50 m reel reads `50 m`,
/// not `50000 mm`). **Do not reformat.** Render in array order — facet rows
/// and extra specs interleave on a shared `displayOrder` axis.
@freezed
abstract class SpecSheetRow with _$SpecSheetRow {
  const factory SpecSheetRow({
    /// `null` marks an **extra spec** — a free-form row no attribute claims.
    String? code,
    required Localized label,
    required Localized value,
  }) = _SpecSheetRow;

  factory SpecSheetRow.fromJson(Map<String, dynamic> json) =>
      _$SpecSheetRowFromJson(json);
}

/// §7.7 `ProductListItemView`.
@freezed
abstract class ProductListItemView with _$ProductListItemView {
  const factory ProductListItemView({
    required String id,
    required String slug,
    String? sku,
    String? itemNumber,
    required Localized name,

    /// `null` when the product is unfiled (`Product.categoryId` is
    /// nullable). **Handle it** — a card must still render.
    CategoryRefView? category,
    ProductImageRef? primaryImage,

    /// Typed facets for this product's category binding, so a card renders
    /// without a second call. Empty when unfiled or the category binds none.
    @Default(<HighlightView>[]) List<HighlightView> highlights,

    /// **Advisory only** (CP7 — the ERP owns real stock). Never hide a
    /// product because of it.
    @Default(true) bool isAvailable,
    @JsonKey(unknownEnumValue: ProductStatus.unknown)
    @Default(ProductStatus.active)
    ProductStatus status,
    String? checksum,
  }) = _ProductListItemView;

  factory ProductListItemView.fromJson(Map<String, dynamic> json) =>
      _$ProductListItemViewFromJson(json);
}

/// §7.9 `ProductDetailView` — extends the list item.
///
/// ⚠️ Its `breadcrumb` **includes the product's own category** as the last
/// element, unlike `/categories/{idOrSlug}` which strips it. Do not share a
/// breadcrumb widget across both without normalising.
@freezed
abstract class ProductDetailView with _$ProductDetailView {
  const factory ProductDetailView({
    required String id,
    required String slug,
    String? sku,
    String? itemNumber,
    required Localized name,
    Localized? description,

    /// Free-text marketing bullets — **distinct from [highlights]**, which
    /// are typed facets.
    @Default(<Localized>[]) List<Localized> highlightPoints,
    CategoryRefView? category,
    @Default(<CategoryRefView>[]) List<CategoryRefView> breadcrumb,
    ProductImageRef? primaryImage,

    /// **All** media — both `IMAGE` and `DATASHEET`. The gallery must filter
    /// client-side.
    @Default(<MediaView>[]) List<MediaView> media,
    @Default(<HighlightView>[]) List<HighlightView> highlights,
    @Default(<SpecSheetRow>[]) List<SpecSheetRow> specSheet,
    @Default(false) bool hasDatasheet,
    @Default(true) bool isAvailable,

    /// ⚠️ This is the **one** endpoint where `DISCONTINUED` can appear
    /// (BR-2) — a discontinued product still returns 200 because historical
    /// activities reference it. Render a banner; never 404 it yourself.
    @JsonKey(unknownEnumValue: ProductStatus.unknown)
    @Default(ProductStatus.active)
    ProductStatus status,
    String? checksum,
  }) = _ProductDetailView;

  factory ProductDetailView.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailViewFromJson(json);
}

extension ProductDetailViewX on ProductDetailView {
  /// §8.4 — `DATASHEET` entries must never enter the image gallery.
  List<MediaView> get images =>
      media.where((m) => m.type == MediaType.image).toList();

  MediaView? get datasheet {
    for (final m in media) {
      if (m.type == MediaType.datasheet) return m;
    }
    return null;
  }

  bool get isDiscontinued => status == ProductStatus.discontinued;
}

/// §7.8 `SuggestionView`.
@freezed
abstract class SuggestionView with _$SuggestionView {
  const factory SuggestionView({
    @JsonKey(unknownEnumValue: SuggestionKind.unknown)
    @Default(SuggestionKind.product)
    SuggestionKind kind,
    required String id,
    required String slug,
    required Localized name,
    String? sku,
  }) = _SuggestionView;

  factory SuggestionView.fromJson(Map<String, dynamic> json) =>
      _$SuggestionViewFromJson(json);
}

/// §7.2 `CatalogVersionView` — the cheap staleness probe.
@freezed
abstract class CatalogVersionView with _$CatalogVersionView {
  const factory CatalogVersionView({
    required int versionNumber,
    DateTime? publishedAt,
    @Default(0) int itemCount,

    /// **Opaque.** Only ever compared against a value previously stored from
    /// this same endpoint — two different hashing algorithms exist in the
    /// backend and produce different strings for identical data. Never
    /// derive or recompute it client-side.
    required String manifestChecksum,
  }) = _CatalogVersionView;

  factory CatalogVersionView.fromJson(Map<String, dynamic> json) =>
      _$CatalogVersionViewFromJson(json);
}
