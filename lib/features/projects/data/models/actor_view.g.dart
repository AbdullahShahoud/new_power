// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActorView _$ActorViewFromJson(Map<String, dynamic> json) => _ActorView(
  id: json['id'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$ActorViewToJson(_ActorView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
    };

_TerritoryRefView _$TerritoryRefViewFromJson(Map<String, dynamic> json) =>
    _TerritoryRefView(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$TerritoryRefViewToJson(_TerritoryRefView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

_PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    _PaginationMeta(
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
    <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
      'totalPages': instance.totalPages,
    };
