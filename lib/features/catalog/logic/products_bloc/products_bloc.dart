import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/catalog_responses.dart';
import '../../data/models/filter_view.dart';
import '../../data/models/product_query.dart';
import '../../data/repo/catalog_repository.dart';
import 'products_event.dart';
import 'products_state.dart';

/// The list + rail pair.
///
/// Superseded work is dropped rather than raced, via [_generation]: each
/// load stamps a ticket and a response whose ticket is stale is discarded
/// before it can emit. Without that, two quick filter taps can land
/// out-of-order and the older result set wins the screen. (A generation
/// counter rather than `bloc_concurrency`'s `restartable()` — this is the
/// only place in the app that needs it, and it isn't worth a new dependency.)
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final CatalogRepository _repository;

  /// Incremented on every load; a response carrying an older ticket is a
  /// superseded request and is dropped.
  int _generation = 0;

  ProductsBloc(this._repository) : super(const ProductsState()) {
    on<ProductsOpened>(_onOpened);
    on<ProductsQueryChanged>(_onQueryChanged);
    on<ProductsAttributeToggled>(_onAttributeToggled);
    on<ProductsAttributeRangeSet>(_onAttributeRangeSet);
    on<ProductsAttributeCleared>(_onAttributeCleared);
    on<ProductsFiltersCleared>(_onFiltersCleared);
    on<ProductsSortChanged>(_onSortChanged);
    on<ProductsNextPageRequested>(_onNextPageRequested);
    on<ProductsRefreshed>(_onRefreshed);
  }

  Future<void> _onOpened(
    ProductsOpened event,
    Emitter<ProductsState> emit,
  ) => _load(event.query, emit);

  Future<void> _onQueryChanged(
    ProductsQueryChanged event,
    Emitter<ProductsState> emit,
  ) => _load(event.query, emit);

  Future<void> _onAttributeToggled(
    ProductsAttributeToggled event,
    Emitter<ProductsState> emit,
  ) => _load(
    state.query.toggleAttribute(event.code, event.optionCode),
    emit,
  );

  Future<void> _onAttributeRangeSet(
    ProductsAttributeRangeSet event,
    Emitter<ProductsState> emit,
  ) => _load(state.query.setAttribute(event.code, [event.value]), emit);

  Future<void> _onAttributeCleared(
    ProductsAttributeCleared event,
    Emitter<ProductsState> emit,
  ) => _load(state.query.withoutAttribute(event.code), emit);

  Future<void> _onFiltersCleared(
    ProductsFiltersCleared event,
    Emitter<ProductsState> emit,
  ) => _load(state.query.cleared(), emit);

  Future<void> _onSortChanged(
    ProductsSortChanged event,
    Emitter<ProductsState> emit,
  ) => _load(state.query.copyWith(sort: event.sort, page: 1), emit);

  Future<void> _onRefreshed(
    ProductsRefreshed event,
    Emitter<ProductsState> emit,
  ) => _load(state.query.copyWith(page: 1), emit);

  /// Replaces the result set: page 1 of `/products` plus a fresh rail, in
  /// parallel. §7.5 — the rail must carry the same parameters as the list,
  /// which is why both take the one [ProductQuery].
  Future<void> _load(ProductQuery query, Emitter<ProductsState> emit) async {
    final ticket = ++_generation;
    final firstPage = query.copyWith(page: 1);
    emit(
      state.copyWith(
        query: firstPage,
        status: ProductsStatus.loading,
        errorMessage: null,
        droppedFilterCode: null,
        filtersStatus: FiltersStatus.loading,
      ),
    );

    final results = await Future.wait([
      _repository.getProducts(firstPage),
      _repository.getFilters(firstPage),
    ]);
    if (emit.isDone || ticket != _generation) return;

    final productsResult = results[0] as ApiResult<ProductPage>;
    final filtersResult = results[1] as ApiResult<CategoryFiltersView>;

    // §19.3 — a rail the client still holds can name an attribute the
    // vocabulary no longer has. Recovery is bounded to exactly one retry:
    // drop the offending filter and re-run. A loop here would burn the
    // whole per-minute budget in seconds.
    if (productsResult is Failure<ProductPage> &&
        productsResult.error.isStaleFilter &&
        firstPage.hasFilters) {
      final dropped = firstPage.attributes.keys.first;
      final retryQuery = firstPage.withoutAttribute(dropped);
      final retry = await Future.wait([
        _repository.getProducts(retryQuery),
        _repository.getFilters(retryQuery),
      ]);
      if (emit.isDone || ticket != _generation) return;
      _emitOutcome(
        emit,
        query: retryQuery,
        productsResult: retry[0] as ApiResult<ProductPage>,
        filtersResult: retry[1] as ApiResult<CategoryFiltersView>,
        droppedFilterCode: dropped,
      );
      return;
    }

    _emitOutcome(
      emit,
      query: firstPage,
      productsResult: productsResult,
      filtersResult: filtersResult,
    );
  }

  void _emitOutcome(
    Emitter<ProductsState> emit, {
    required ProductQuery query,
    required ApiResult<ProductPage> productsResult,
    required ApiResult<CategoryFiltersView> filtersResult,
    String? droppedFilterCode,
  }) {
    // The rail is supporting cast: if it fails while the list succeeded, the
    // screen still works — it just loses the filter button. Its failure is
    // never allowed to blank a good result set.
    final filters = filtersResult is Success<CategoryFiltersView>
        ? filtersResult.data.filters
        : <FilterView>[];
    final filtersStatus = filtersResult is Success<CategoryFiltersView>
        ? FiltersStatus.loaded
        : FiltersStatus.networkError;

    if (productsResult is Failure<ProductPage>) {
      emit(
        state.copyWith(
          query: query,
          status: productsResult.error.isNoPublishedVersion
              ? ProductsStatus.catalogUnavailable
              : ProductsStatus.networkError,
          errorMessage: productsResult.error.message,
          products: const [],
          filters: filters,
          filtersStatus: filtersStatus,
          droppedFilterCode: droppedFilterCode,
        ),
      );
      return;
    }

    final pageData = (productsResult as Success<ProductPage>).data;
    emit(
      state.copyWith(
        query: query,
        // §7.7 — an empty result is a 200 with `total: 0`, never a 404.
        status: pageData.items.isEmpty
            ? ProductsStatus.empty
            : ProductsStatus.loaded,
        products: pageData.items,
        total: pageData.total,
        page: pageData.page,
        totalPages: pageData.totalPages,
        errorMessage: null,
        isLoadingMore: false,
        filters: filters,
        filtersStatus: filtersStatus,
        droppedFilterCode: droppedFilterCode,
      ),
    );
  }

  /// Appends the next page. The rail is **not** re-fetched — facet counts
  /// describe the whole result set, not the loaded slice, so paging cannot
  /// change them and a second call would be wasted budget.
  Future<void> _onNextPageRequested(
    ProductsNextPageRequested event,
    Emitter<ProductsState> emit,
  ) async {
    if (state.isLoadingMore || !state.hasMore) return;
    if (state.status != ProductsStatus.loaded) return;

    // Shares the generation counter with `_load`: if the rep changes a
    // filter while page 2 is in flight, the append must not splice rows from
    // the old result set onto the new one.
    final ticket = _generation;
    emit(state.copyWith(isLoadingMore: true));

    final nextQuery = state.query.copyWith(page: state.page + 1);
    final result = await _repository.getProducts(nextQuery);
    if (emit.isDone || ticket != _generation) return;

    if (result is Failure<ProductPage>) {
      // Keep what's on screen — a failed append is not a reason to lose the
      // pages the rep already scrolled through.
      emit(
        state.copyWith(
          isLoadingMore: false,
          errorMessage: result.error.message,
        ),
      );
      return;
    }

    final pageData = (result as Success<ProductPage>).data;
    emit(
      state.copyWith(
        query: nextQuery,
        products: [...state.products, ...pageData.items],
        page: pageData.page,
        total: pageData.total,
        totalPages: pageData.totalPages,
        isLoadingMore: false,
      ),
    );
  }
}
