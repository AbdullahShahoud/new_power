// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryListResponse _$CategoryListResponseFromJson(
  Map<String, dynamic> json,
) => _CategoryListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CategoryView>[],
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryListResponseToJson(
  _CategoryListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_CategoryDetailResponse _$CategoryDetailResponseFromJson(
  Map<String, dynamic> json,
) => _CategoryDetailResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: GetCategoryResultView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryDetailResponseToJson(
  _CategoryDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_CategoryFiltersResponse _$CategoryFiltersResponseFromJson(
  Map<String, dynamic> json,
) => _CategoryFiltersResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: CategoryFiltersView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryFiltersResponseToJson(
  _CategoryFiltersResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_AttributeListResponse _$AttributeListResponseFromJson(
  Map<String, dynamic> json,
) => _AttributeListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => AttributeView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <AttributeView>[],
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AttributeListResponseToJson(
  _AttributeListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_ProductDetailResponse _$ProductDetailResponseFromJson(
  Map<String, dynamic> json,
) => _ProductDetailResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: ProductDetailView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductDetailResponseToJson(
  _ProductDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_SuggestionListResponse _$SuggestionListResponseFromJson(
  Map<String, dynamic> json,
) => _SuggestionListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => SuggestionView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SuggestionView>[],
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SuggestionListResponseToJson(
  _SuggestionListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_CatalogVersionResponse _$CatalogVersionResponseFromJson(
  Map<String, dynamic> json,
) => _CatalogVersionResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: CatalogVersionView.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CatalogVersionResponseToJson(
  _CatalogVersionResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_ProductPage _$ProductPageFromJson(Map<String, dynamic> json) => _ProductPage(
  message: json['message'] as String?,
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => ProductListItemView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <ProductListItemView>[],
  total: (json['total'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  limit: (json['limit'] as num?)?.toInt() ?? 20,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductPageToJson(_ProductPage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'items': instance.items,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };

_ProductListResponse _$ProductListResponseFromJson(Map<String, dynamic> json) =>
    _ProductListResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: ProductPage.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['meta'] == null
          ? null
          : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductListResponseToJson(
  _ProductListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
