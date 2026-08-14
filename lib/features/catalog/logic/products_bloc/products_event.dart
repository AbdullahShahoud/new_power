import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/catalog_enums.dart';
import '../../data/models/product_query.dart';

part 'products_event.freezed.dart';

/// Backs the product list and its filter rail. The two always move together
/// — §7.5 requires the rail to receive the same parameters as the list, or
/// its counts describe a different result set than the one on screen.
@freezed
sealed class ProductsEvent with _$ProductsEvent {
  /// Opens the list for a query. Fires `/products` and
  /// `/categories/filters` in parallel — 2 requests per interaction, which
  /// is why every entry point into this event is debounced (§2.3).
  const factory ProductsEvent.opened(ProductQuery query) = ProductsOpened;

  /// Any change to `q` / `attr` / `sort` / flags. Resets to page 1, per
  /// §7.7, and re-fetches the rail because facet counts are computed under
  /// the applied filters.
  const factory ProductsEvent.queryChanged(ProductQuery query) =
      ProductsQueryChanged;

  const factory ProductsEvent.attributeToggled({
    required String code,
    required String optionCode,
  }) = ProductsAttributeToggled;

  /// RANGE slider — replaces the attribute's whole value list with one
  /// `lo..hi` token.
  const factory ProductsEvent.attributeRangeSet({
    required String code,
    required String value,
  }) = ProductsAttributeRangeSet;

  const factory ProductsEvent.attributeCleared(String code) =
      ProductsAttributeCleared;

  const factory ProductsEvent.filtersCleared() = ProductsFiltersCleared;

  const factory ProductsEvent.sortChanged(ProductSort sort) =
      ProductsSortChanged;

  /// Appends the next page. Ignored while one is already in flight or the
  /// last page has been reached.
  const factory ProductsEvent.nextPageRequested() = ProductsNextPageRequested;

  const factory ProductsEvent.refreshed() = ProductsRefreshed;
}
