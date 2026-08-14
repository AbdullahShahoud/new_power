import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/attribute_view.dart';
import '../models/catalog_responses.dart';
import '../models/category_view.dart';
import '../models/filter_view.dart';
import '../models/product_query.dart';
import '../models/product_view.dart';

/// Machine-stable `error.code` values from §6.1 that the UI actually
/// branches on. Everything else is rendered from `message`.
class CatalogErrorCodes {
  CatalogErrorCodes._();

  /// 503 — **server state, not a client error**, and transient: the next
  /// admin publish fixes it. Never log out, never clear a cache, never
  /// aggressive-retry (it burns the 30-request budget).
  static const String noPublishedVersion = 'CATALOG_NO_PUBLISHED_VERSION';

  /// 400 — the held rail no longer matches the vocabulary. Recoverable:
  /// drop the filter, retry **once**, rebuild the rail.
  static const String unknownFilterAttribute =
      'CATALOG_UNKNOWN_FILTER_ATTRIBUTE';
  static const String invalidFilterValue = 'CATALOG_INVALID_FILTER_VALUE';

  static const String categoryNotFound = 'CATALOG_CATEGORY_NOT_FOUND';
  static const String productNotFound = 'CATALOG_PRODUCT_NOT_FOUND';
  static const String rateLimited = 'RATE_LIMIT_EXCEEDED';

  /// The two 400s a stale rail produces — both recover the same way.
  static bool isStaleFilter(String? code) =>
      code == unknownFilterAttribute || code == invalidFilterValue;
}

/// The rep-facing catalogue surface (catalog-mobile-integration.md).
///
/// Read-only: all nine endpoints are `GET` and every one is
/// `REPRESENTATIVE`+, so there is **no role branch and no write path** here
/// — unlike every other module in this app.
///
/// `/catalog/sync` is deliberately not wired. Offline is out of scope for
/// this build, and the sync payload is a genuinely different object from the
/// online views (§8.9 — `highlights` means marketing bullets there and typed
/// facets here), so it would need its own models rather than a flag.
class CatalogRepository {
  final ApiService _apiService;

  CatalogRepository(this._apiService);

  /// The 43-row tree, held for the session.
  ///
  /// The cache lives **here** rather than in a long-lived Bloc: §19.4 names
  /// caching `/categories` among the required mitigations for a budget of 30
  /// requests per minute shared across all nine endpoints, but a Bloc handed
  /// to `BlocProvider(create:)` is closed when its screen pops — so a
  /// singleton Bloc would be dead after the first category screen. The
  /// repository is the singleton; Blocs stay per-screen and disposable.
  List<CategoryView>? _cachedTree;

  /// §7.4 — the taxonomy. Not version-gated, so it survives a 503 and can be
  /// shown even when nothing is published.
  Future<ApiResult<List<CategoryView>>> getCategories({
    bool tree = false,
    String? parentId,
    bool forceRefresh = false,
  }) async {
    final cacheable = tree && parentId == null;
    if (cacheable && !forceRefresh && _cachedTree != null) {
      return ApiResult.success(_cachedTree!);
    }
    try {
      final response = await _apiService.getCategories(
        tree: tree ? true : null,
        parentId: parentId,
      );
      if (cacheable) _cachedTree = response.data;
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §7.6 — one category with its ancestors and direct children. Resolves a
  /// slug deep-link into id + breadcrumb + children in a single call, which
  /// `/categories?parentId=` cannot do (it takes ids only).
  Future<ApiResult<GetCategoryResultView>> getCategory(String idOrSlug) async {
    try {
      final response = await _apiService.getCategory(idOrSlug);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §7.1 — the attribute dictionary. Works with nothing published (no 503).
  Future<ApiResult<List<AttributeView>>> getAttributes() async {
    try {
      final response = await _apiService.getCatalogAttributes();
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §7.2 — the staleness probe. Retained because it is the only endpoint
  /// that reports what version the rep is browsing and when it was
  /// published, which the catalogue's empty/unavailable states show.
  Future<ApiResult<CatalogVersionView>> getVersion() async {
    try {
      final response = await _apiService.getCatalogVersion();
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §7.7 — the workhorse.
  ///
  /// ⚠️ Reads the page from `data.items`, not `data` — this endpoint alone
  /// nests its payload a level deeper and ships **no sibling `pagination`
  /// object** (§5.2). [ProductListResponse] models that shape.
  Future<ApiResult<ProductPage>> getProducts(ProductQuery query) async {
    try {
      final response = await _apiService.getProducts(
        query.toQueryParameters(),
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §7.5 — the rail, with facet counts computed **under the filters already
  /// applied**, so options that would return nothing can be greyed out.
  ///
  /// Takes the same [ProductQuery] as [getProducts] by design: the rail is
  /// only meaningful when its result set matches the list's.
  Future<ApiResult<CategoryFiltersView>> getFilters(
    ProductQuery query,
  ) async {
    try {
      final response = await _apiService.getCategoryFilters(
        query.toFilterQueryParameters(),
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §7.8 — typeahead.
  ///
  /// Gated at 2 characters and clamped to 25 **client-side**: the server
  /// returns `[]` below the threshold rather than an error, and a
  /// per-keystroke call would exhaust the 30-per-minute budget in about 15
  /// characters (§2.3).
  Future<ApiResult<List<SuggestionView>>> suggest(
    String query, {
    int limit = 10,
  }) async {
    final trimmed = query.trim();
    if (trimmed.length < 2) return const ApiResult.success(<SuggestionView>[]);
    try {
      final response = await _apiService.suggestProducts(
        q: trimmed,
        limit: limit.clamp(1, 25),
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// §7.9 — full detail.
  ///
  /// ⚠️ A `DISCONTINUED` product returns **200, not 404** (BR-2): it is
  /// referenced by historical activities and outcomes, and blanking those
  /// pages would erase things that genuinely happened. The caller checks
  /// `status` and shows a banner.
  Future<ApiResult<ProductDetailView>> getProduct(String idOrSlug) async {
    try {
      final response = await _apiService.getProduct(idOrSlug);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}

extension CatalogFailureX on ApiErrorModel {
  bool get isNoPublishedVersion =>
      code == CatalogErrorCodes.noPublishedVersion;
  bool get isStaleFilter => CatalogErrorCodes.isStaleFilter(code);
  bool get isCategoryNotFound => code == CatalogErrorCodes.categoryNotFound;
  bool get isProductNotFound => code == CatalogErrorCodes.productNotFound;
}
