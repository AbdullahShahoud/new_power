// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductImageRef _$ProductImageRefFromJson(Map<String, dynamic> json) =>
    _ProductImageRef(
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$ProductImageRefToJson(_ProductImageRef instance) =>
    <String, dynamic>{
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };

_HighlightView _$HighlightViewFromJson(Map<String, dynamic> json) =>
    _HighlightView(
      code: json['code'] as String,
      label: Localized.fromJson(json['label'] as Map<String, dynamic>),
      unit: json['unit'] as String?,
      display: Localized.fromJson(json['display'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HighlightViewToJson(_HighlightView instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'unit': instance.unit,
      'display': instance.display,
    };

_MediaView _$MediaViewFromJson(Map<String, dynamic> json) => _MediaView(
  id: json['id'] as String?,
  type:
      $enumDecodeNullable(
        _$MediaTypeEnumMap,
        json['type'],
        unknownValue: MediaType.unknown,
      ) ??
      MediaType.unknown,
  url: json['url'] as String,
  thumbnailUrl: json['thumbnailUrl'] as String?,
  alt: json['alt'] == null
      ? null
      : Localized.fromJson(json['alt'] as Map<String, dynamic>),
  sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$MediaViewToJson(_MediaView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$MediaTypeEnumMap[instance.type],
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
      'alt': instance.alt,
      'sortOrder': instance.sortOrder,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 'IMAGE',
  MediaType.datasheet: 'DATASHEET',
  MediaType.unknown: null,
};

_SpecSheetRow _$SpecSheetRowFromJson(Map<String, dynamic> json) =>
    _SpecSheetRow(
      code: json['code'] as String?,
      label: Localized.fromJson(json['label'] as Map<String, dynamic>),
      value: Localized.fromJson(json['value'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpecSheetRowToJson(_SpecSheetRow instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'value': instance.value,
    };

_ProductListItemView _$ProductListItemViewFromJson(Map<String, dynamic> json) =>
    _ProductListItemView(
      id: json['id'] as String,
      slug: json['slug'] as String,
      sku: json['sku'] as String?,
      itemNumber: json['itemNumber'] as String?,
      name: Localized.fromJson(json['name'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryRefView.fromJson(json['category'] as Map<String, dynamic>),
      primaryImage: json['primaryImage'] == null
          ? null
          : ProductImageRef.fromJson(
              json['primaryImage'] as Map<String, dynamic>,
            ),
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => HighlightView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <HighlightView>[],
      isAvailable: json['isAvailable'] as bool? ?? true,
      status:
          $enumDecodeNullable(
            _$ProductStatusEnumMap,
            json['status'],
            unknownValue: ProductStatus.unknown,
          ) ??
          ProductStatus.active,
      checksum: json['checksum'] as String?,
    );

Map<String, dynamic> _$ProductListItemViewToJson(
  _ProductListItemView instance,
) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'sku': instance.sku,
  'itemNumber': instance.itemNumber,
  'name': instance.name,
  'category': instance.category,
  'primaryImage': instance.primaryImage,
  'highlights': instance.highlights,
  'isAvailable': instance.isAvailable,
  'status': _$ProductStatusEnumMap[instance.status],
  'checksum': instance.checksum,
};

const _$ProductStatusEnumMap = {
  ProductStatus.active: 'ACTIVE',
  ProductStatus.discontinued: 'DISCONTINUED',
  ProductStatus.unknown: null,
};

_ProductDetailView _$ProductDetailViewFromJson(Map<String, dynamic> json) =>
    _ProductDetailView(
      id: json['id'] as String,
      slug: json['slug'] as String,
      sku: json['sku'] as String?,
      itemNumber: json['itemNumber'] as String?,
      name: Localized.fromJson(json['name'] as Map<String, dynamic>),
      description: json['description'] == null
          ? null
          : Localized.fromJson(json['description'] as Map<String, dynamic>),
      highlightPoints:
          (json['highlightPoints'] as List<dynamic>?)
              ?.map((e) => Localized.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Localized>[],
      category: json['category'] == null
          ? null
          : CategoryRefView.fromJson(json['category'] as Map<String, dynamic>),
      breadcrumb:
          (json['breadcrumb'] as List<dynamic>?)
              ?.map((e) => CategoryRefView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CategoryRefView>[],
      primaryImage: json['primaryImage'] == null
          ? null
          : ProductImageRef.fromJson(
              json['primaryImage'] as Map<String, dynamic>,
            ),
      media:
          (json['media'] as List<dynamic>?)
              ?.map((e) => MediaView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <MediaView>[],
      highlights:
          (json['highlights'] as List<dynamic>?)
              ?.map((e) => HighlightView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <HighlightView>[],
      specSheet:
          (json['specSheet'] as List<dynamic>?)
              ?.map((e) => SpecSheetRow.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SpecSheetRow>[],
      hasDatasheet: json['hasDatasheet'] as bool? ?? false,
      isAvailable: json['isAvailable'] as bool? ?? true,
      status:
          $enumDecodeNullable(
            _$ProductStatusEnumMap,
            json['status'],
            unknownValue: ProductStatus.unknown,
          ) ??
          ProductStatus.active,
      checksum: json['checksum'] as String?,
    );

Map<String, dynamic> _$ProductDetailViewToJson(_ProductDetailView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'sku': instance.sku,
      'itemNumber': instance.itemNumber,
      'name': instance.name,
      'description': instance.description,
      'highlightPoints': instance.highlightPoints,
      'category': instance.category,
      'breadcrumb': instance.breadcrumb,
      'primaryImage': instance.primaryImage,
      'media': instance.media,
      'highlights': instance.highlights,
      'specSheet': instance.specSheet,
      'hasDatasheet': instance.hasDatasheet,
      'isAvailable': instance.isAvailable,
      'status': _$ProductStatusEnumMap[instance.status],
      'checksum': instance.checksum,
    };

_SuggestionView _$SuggestionViewFromJson(Map<String, dynamic> json) =>
    _SuggestionView(
      kind:
          $enumDecodeNullable(
            _$SuggestionKindEnumMap,
            json['kind'],
            unknownValue: SuggestionKind.unknown,
          ) ??
          SuggestionKind.product,
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: Localized.fromJson(json['name'] as Map<String, dynamic>),
      sku: json['sku'] as String?,
    );

Map<String, dynamic> _$SuggestionViewToJson(_SuggestionView instance) =>
    <String, dynamic>{
      'kind': _$SuggestionKindEnumMap[instance.kind],
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'sku': instance.sku,
    };

const _$SuggestionKindEnumMap = {
  SuggestionKind.product: 'PRODUCT',
  SuggestionKind.category: 'CATEGORY',
  SuggestionKind.unknown: null,
};

_CatalogVersionView _$CatalogVersionViewFromJson(Map<String, dynamic> json) =>
    _CatalogVersionView(
      versionNumber: (json['versionNumber'] as num).toInt(),
      publishedAt: json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
      itemCount: (json['itemCount'] as num?)?.toInt() ?? 0,
      manifestChecksum: json['manifestChecksum'] as String,
    );

Map<String, dynamic> _$CatalogVersionViewToJson(_CatalogVersionView instance) =>
    <String, dynamic>{
      'versionNumber': instance.versionNumber,
      'publishedAt': instance.publishedAt?.toIso8601String(),
      'itemCount': instance.itemCount,
      'manifestChecksum': instance.manifestChecksum,
    };
