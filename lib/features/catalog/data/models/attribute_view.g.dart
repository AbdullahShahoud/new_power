// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttributeOptionView _$AttributeOptionViewFromJson(Map<String, dynamic> json) =>
    _AttributeOptionView(
      id: json['id'] as String,
      code: json['code'] as String,
      label: Localized.fromJson(json['label'] as Map<String, dynamic>),
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AttributeOptionViewToJson(
  _AttributeOptionView instance,
) => <String, dynamic>{
  'id': instance.id,
  'code': instance.code,
  'label': instance.label,
  'sortOrder': instance.sortOrder,
};

_AttributeView _$AttributeViewFromJson(Map<String, dynamic> json) =>
    _AttributeView(
      id: json['id'] as String,
      code: json['code'] as String,
      label: Localized.fromJson(json['label'] as Map<String, dynamic>),
      dataType:
          $enumDecodeNullable(
            _$AttributeTypeEnumMap,
            json['dataType'],
            unknownValue: AttributeType.unknown,
          ) ??
          AttributeType.unknown,
      canonicalUnit: json['canonicalUnit'] as String?,
      decimalPlaces: (json['decimalPlaces'] as num?)?.toInt(),
      isFilterable: json['isFilterable'] as bool? ?? true,
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      options:
          (json['options'] as List<dynamic>?)
              ?.map(
                (e) => AttributeOptionView.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <AttributeOptionView>[],
    );

Map<String, dynamic> _$AttributeViewToJson(_AttributeView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'label': instance.label,
      'dataType': _$AttributeTypeEnumMap[instance.dataType],
      'canonicalUnit': instance.canonicalUnit,
      'decimalPlaces': instance.decimalPlaces,
      'isFilterable': instance.isFilterable,
      'sortOrder': instance.sortOrder,
      'options': instance.options,
    };

const _$AttributeTypeEnumMap = {
  AttributeType.number: 'NUMBER',
  AttributeType.enumeration: 'ENUM',
  AttributeType.text: 'TEXT',
  AttributeType.unknown: null,
};
