// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FilterOptionView _$FilterOptionViewFromJson(Map<String, dynamic> json) =>
    _FilterOptionView(
      code: json['code'] as String,
      label: Localized.fromJson(json['label'] as Map<String, dynamic>),
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FilterOptionViewToJson(_FilterOptionView instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'count': instance.count,
    };

_FilterRange _$FilterRangeFromJson(Map<String, dynamic> json) =>
    _FilterRange(min: json['min'] as num, max: json['max'] as num);

Map<String, dynamic> _$FilterRangeToJson(_FilterRange instance) =>
    <String, dynamic>{'min': instance.min, 'max': instance.max};

_FilterView _$FilterViewFromJson(Map<String, dynamic> json) => _FilterView(
  code: json['code'] as String,
  label: Localized.fromJson(json['label'] as Map<String, dynamic>),
  type:
      $enumDecodeNullable(
        _$AttributeTypeEnumMap,
        json['type'],
        unknownValue: AttributeType.unknown,
      ) ??
      AttributeType.unknown,
  strategy:
      $enumDecodeNullable(
        _$FilterStrategyEnumMap,
        json['strategy'],
        unknownValue: FilterStrategy.unknown,
      ) ??
      FilterStrategy.unknown,
  unit: json['unit'] as String?,
  options: (json['options'] as List<dynamic>?)
      ?.map((e) => FilterOptionView.fromJson(e as Map<String, dynamic>))
      .toList(),
  truncated: json['truncated'] as bool? ?? false,
  range: json['range'] == null
      ? null
      : FilterRange.fromJson(json['range'] as Map<String, dynamic>),
  count: (json['count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$FilterViewToJson(_FilterView instance) =>
    <String, dynamic>{
      'code': instance.code,
      'label': instance.label,
      'type': _$AttributeTypeEnumMap[instance.type],
      'strategy': _$FilterStrategyEnumMap[instance.strategy],
      'unit': instance.unit,
      'options': instance.options,
      'truncated': instance.truncated,
      'range': instance.range,
      'count': instance.count,
    };

const _$AttributeTypeEnumMap = {
  AttributeType.number: 'NUMBER',
  AttributeType.enumeration: 'ENUM',
  AttributeType.text: 'TEXT',
  AttributeType.unknown: null,
};

const _$FilterStrategyEnumMap = {
  FilterStrategy.none: 'NONE',
  FilterStrategy.discrete: 'DISCRETE',
  FilterStrategy.range: 'RANGE',
  FilterStrategy.unknown: null,
};

_CategoryFiltersView _$CategoryFiltersViewFromJson(Map<String, dynamic> json) =>
    _CategoryFiltersView(
      categoryId: json['categoryId'] as String?,
      filters:
          (json['filters'] as List<dynamic>?)
              ?.map((e) => FilterView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FilterView>[],
    );

Map<String, dynamic> _$CategoryFiltersViewToJson(
  _CategoryFiltersView instance,
) => <String, dynamic>{
  'categoryId': instance.categoryId,
  'filters': instance.filters,
};
