import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_response_meta.dart';
import 'attribute_view.dart';
import 'category_view.dart';
import 'filter_view.dart';
import 'product_view.dart';

part 'catalog_responses.freezed.dart';
part 'catalog_responses.g.dart';

/// §5.1 the standard envelope — used by 8 of the 9 endpoints, where the
/// payload sits directly in `data`.
@freezed
abstract class CategoryListResponse with _$CategoryListResponse {
  const factory CategoryListResponse({
    bool? success,
    String? message,
    @Default(<CategoryView>[]) List<CategoryView> data,
    ApiResponseMeta? meta,
  }) = _CategoryListResponse;

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);
}

@freezed
abstract class CategoryDetailResponse with _$CategoryDetailResponse {
  const factory CategoryDetailResponse({
    bool? success,
    String? message,
    required GetCategoryResultView data,
    ApiResponseMeta? meta,
  }) = _CategoryDetailResponse;

  factory CategoryDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailResponseFromJson(json);
}

@freezed
abstract class CategoryFiltersResponse with _$CategoryFiltersResponse {
  const factory CategoryFiltersResponse({
    bool? success,
    String? message,
    required CategoryFiltersView data,
    ApiResponseMeta? meta,
  }) = _CategoryFiltersResponse;

  factory CategoryFiltersResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryFiltersResponseFromJson(json);
}

@freezed
abstract class AttributeListResponse with _$AttributeListResponse {
  const factory AttributeListResponse({
    bool? success,
    String? message,
    @Default(<AttributeView>[]) List<AttributeView> data,
    ApiResponseMeta? meta,
  }) = _AttributeListResponse;

  factory AttributeListResponse.fromJson(Map<String, dynamic> json) =>
      _$AttributeListResponseFromJson(json);
}

@freezed
abstract class ProductDetailResponse with _$ProductDetailResponse {
  const factory ProductDetailResponse({
    bool? success,
    String? message,
    required ProductDetailView data,
    ApiResponseMeta? meta,
  }) = _ProductDetailResponse;

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailResponseFromJson(json);
}

@freezed
abstract class SuggestionListResponse with _$SuggestionListResponse {
  const factory SuggestionListResponse({
    bool? success,
    String? message,
    @Default(<SuggestionView>[]) List<SuggestionView> data,
    ApiResponseMeta? meta,
  }) = _SuggestionListResponse;

  factory SuggestionListResponse.fromJson(Map<String, dynamic> json) =>
      _$SuggestionListResponseFromJson(json);
}

@freezed
abstract class CatalogVersionResponse with _$CatalogVersionResponse {
  const factory CatalogVersionResponse({
    bool? success,
    String? message,
    required CatalogVersionView data,
    ApiResponseMeta? meta,
  }) = _CatalogVersionResponse;

  factory CatalogVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogVersionResponseFromJson(json);
}

/// ⚠️ §5.2 — **`GET /products` uses a different envelope from every other
/// endpoint in this app**, and this is the single most important structural
/// fact in the integration doc.
///
/// The server's interceptor takes its "flat" branch only when the handler
/// returns an object carrying **both** `message` and `data`. The product
/// controller returns `{ message, items, total, page, limit, totalPages }`
/// — it has `message` but no `data` — so it falls through to the raw-wrap
/// branch. The real payload therefore lands **one level down**, with
/// `"Success"` as the outer message and **no sibling `pagination` object**
/// (unlike `/projects` and `/accounts`, which do build one).
///
/// So: read the list from `data.items` and the paging from `data.total` /
/// `data.page` / … — this class models that inner object.
@freezed
abstract class ProductPage with _$ProductPage {
  const factory ProductPage({
    String? message,
    @Default(<ProductListItemView>[]) List<ProductListItemView> items,
    @Default(0) int total,
    @Default(1) int page,
    @Default(20) int limit,
    @Default(0) int totalPages,
  }) = _ProductPage;

  factory ProductPage.fromJson(Map<String, dynamic> json) =>
      _$ProductPageFromJson(json);
}

@freezed
abstract class ProductListResponse with _$ProductListResponse {
  const factory ProductListResponse({
    bool? success,
    String? message,
    required ProductPage data,
    ApiResponseMeta? meta,
  }) = _ProductListResponse;

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
}
