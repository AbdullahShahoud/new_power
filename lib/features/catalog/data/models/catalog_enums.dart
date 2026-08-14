import 'package:json_annotation/json_annotation.dart';

/// catalog-mobile-integration.md §9. Every value comes from the Prisma
/// schema or a DTO — none is invented. Each enum carries an `unknown`
/// fallback (`@JsonValue(null)` + `unknownEnumValue`) because an admin
/// migration can add a value before this app ships an update.

/// §9 `ProductStatus`. `DISCONTINUED` reaches the client **only** on the
/// detail endpoint (BR-2) — the list filters it out.
enum ProductStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('DISCONTINUED')
  discontinued,
  @JsonValue(null)
  unknown,
}

/// §9 `AttributeType` — how the value is **stored**. Drives formatting and
/// filter syntax. ⚠️ Never pick a filter control from this; use
/// [FilterStrategy].
enum AttributeType {
  @JsonValue('NUMBER')
  number,
  @JsonValue('ENUM')
  enumeration,
  @JsonValue('TEXT')
  text,
  @JsonValue(null)
  unknown,
}

/// §9 `FilterStrategy` — **how to render the control**, decided per
/// category. `NONE` never reaches the client (the query excludes it); if it
/// somehow does, the filter is ignored.
enum FilterStrategy {
  @JsonValue('NONE')
  none,
  @JsonValue('DISCRETE')
  discrete,
  @JsonValue('RANGE')
  range,
  @JsonValue(null)
  unknown,
}

/// §9 `MediaType`. `DATASHEET` must be excluded from the image gallery.
enum MediaType {
  @JsonValue('IMAGE')
  image,
  @JsonValue('DATASHEET')
  datasheet,
  @JsonValue(null)
  unknown,
}

/// §7.7 `?sort=` — lower-case on the wire.
enum ProductSort { relevance, name, newest, category }

extension ProductSortX on ProductSort {
  String get wireValue => switch (this) {
    ProductSort.relevance => 'relevance',
    ProductSort.name => 'name',
    ProductSort.newest => 'newest',
    ProductSort.category => 'category',
  };

  String get labelKey => switch (this) {
    ProductSort.relevance => 'catalog_sort_relevance',
    ProductSort.name => 'catalog_sort_name',
    ProductSort.newest => 'catalog_sort_newest',
    ProductSort.category => 'catalog_sort_category',
  };
}

/// §9 `SuggestionView.kind`. ⚠️ The backend only ever emits `PRODUCT`
/// (`prisma-catalog.repository.ts:1045`); `category` is declared in the type
/// but no code path produces it. Modelled for safety — **do not build a
/// category-suggestion UI**, it would never render.
enum SuggestionKind {
  @JsonValue('PRODUCT')
  product,
  @JsonValue('CATEGORY')
  category,
  @JsonValue(null)
  unknown,
}
