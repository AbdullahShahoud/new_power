import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/filter_view.dart';
import '../../data/models/product_query.dart';
import '../../data/models/product_view.dart';

part 'products_state.freezed.dart';

enum ProductsStatus {
  initial,
  loading,
  loaded,
  empty,
  networkError,

  /// `503 CATALOG_NO_PUBLISHED_VERSION` — its own state because the screen
  /// must not read as a client error. Nothing was done wrong, nothing should
  /// be cleared, and the next admin publish fixes it (§6.2).
  catalogUnavailable,
}

enum FiltersStatus { initial, loading, loaded, networkError }

@freezed
sealed class ProductsState with _$ProductsState {
  const factory ProductsState({
    @Default(ProductQuery()) ProductQuery query,

    @Default(ProductsStatus.initial) ProductsStatus status,
    @Default(<ProductListItemView>[]) List<ProductListItemView> products,
    @Default(0) int total,
    @Default(1) int page,
    @Default(0) int totalPages,
    String? errorMessage,

    /// Appending a page, as opposed to replacing the list. Keeps the
    /// existing rows on screen instead of flashing a skeleton over them.
    @Default(false) bool isLoadingMore,

    // ── the rail ────────────────────────────────────────────────────
    @Default(FiltersStatus.initial) FiltersStatus filtersStatus,
    @Default(<FilterView>[]) List<FilterView> filters,

    /// Set when §19.3's recovery ran: a filter the server no longer
    /// recognises was dropped and the request retried. The UI owes the user
    /// a notice — silently returning different results would be worse.
    String? droppedFilterCode,
  }) = _ProductsState;
}

extension ProductsStateX on ProductsState {
  bool get hasMore => page < totalPages;

  /// True when filters are responsible for the empty result — the screen
  /// then offers "clear filters" instead of a generic empty state.
  bool get isEmptyWithFilters =>
      status == ProductsStatus.empty && query.hasFilters;

  /// True when a search term is responsible. §11.3's corpus excludes spec
  /// sheets and descriptions entirely, so this state must *teach* that limit
  /// rather than say "try again" — searching "IP65" genuinely cannot match.
  bool get isEmptyWithSearch =>
      status == ProductsStatus.empty && query.effectiveQuery != null;
}
