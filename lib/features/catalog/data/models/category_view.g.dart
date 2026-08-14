// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryRefView _$CategoryRefViewFromJson(Map<String, dynamic> json) =>
    _CategoryRefView(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: Localized.fromJson(json['name'] as Map<String, dynamic>),
      path: json['path'] as String,
    );

Map<String, dynamic> _$CategoryRefViewToJson(_CategoryRefView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'path': instance.path,
    };

_CategoryView _$CategoryViewFromJson(Map<String, dynamic> json) =>
    _CategoryView(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: Localized.fromJson(json['name'] as Map<String, dynamic>),
      path: json['path'] as String,
      parentId: json['parentId'] as String?,
      description: json['description'] == null
          ? null
          : Localized.fromJson(json['description'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String?,
      depth: (json['depth'] as num?)?.toInt() ?? 0,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      productCount: (json['productCount'] as num?)?.toInt() ?? 0,
      subtreeProductCount: (json['subtreeProductCount'] as num?)?.toInt() ?? 0,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => CategoryView.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryViewToJson(_CategoryView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'path': instance.path,
      'parentId': instance.parentId,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'depth': instance.depth,
      'sortOrder': instance.sortOrder,
      'productCount': instance.productCount,
      'subtreeProductCount': instance.subtreeProductCount,
      'children': instance.children,
    };

_GetCategoryResultView _$GetCategoryResultViewFromJson(
  Map<String, dynamic> json,
) => _GetCategoryResultView(
  category: CategoryView.fromJson(json['category'] as Map<String, dynamic>),
  breadcrumb:
      (json['breadcrumb'] as List<dynamic>?)
          ?.map((e) => CategoryView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CategoryView>[],
  children:
      (json['children'] as List<dynamic>?)
          ?.map((e) => CategoryView.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CategoryView>[],
);

Map<String, dynamic> _$GetCategoryResultViewToJson(
  _GetCategoryResultView instance,
) => <String, dynamic>{
  'category': instance.category,
  'breadcrumb': instance.breadcrumb,
  'children': instance.children,
};
