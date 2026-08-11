// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_won_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmitWonRequest _$SubmitWonRequestFromJson(Map<String, dynamic> json) =>
    _SubmitWonRequest(
      distributorAccountId: json['distributorAccountId'] as String,
      value: (json['value'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      soldAt: json['soldAt'] == null
          ? null
          : DateTime.parse(json['soldAt'] as String),
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$ProductCategoryEnumMap, e))
              .toList() ??
          const <ProductCategory>[],
      unitsSupplied: (json['unitsSupplied'] as num?)?.toInt(),
      unitsTotal: (json['unitsTotal'] as num?)?.toInt(),
      buyerContactId: json['buyerContactId'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$SubmitWonRequestToJson(_SubmitWonRequest instance) =>
    <String, dynamic>{
      'distributorAccountId': instance.distributorAccountId,
      'value': instance.value,
      'currency': instance.currency,
      'soldAt': instance.soldAt?.toIso8601String(),
      'categories': instance.categories
          .map((e) => _$ProductCategoryEnumMap[e]!)
          .toList(),
      'unitsSupplied': instance.unitsSupplied,
      'unitsTotal': instance.unitsTotal,
      'buyerContactId': instance.buyerContactId,
      'notes': instance.notes,
    };

const _$ProductCategoryEnumMap = {
  ProductCategory.socketsSwitches: 'SOCKETS_SWITCHES',
  ProductCategory.lighting: 'LIGHTING',
  ProductCategory.exhaustFans: 'EXHAUST_FANS',
  ProductCategory.cables: 'CABLES',
  ProductCategory.distributionBoards: 'DISTRIBUTION_BOARDS',
  ProductCategory.circuitBreakers: 'CIRCUIT_BREAKERS',
  ProductCategory.conduitTrunking: 'CONDUIT_TRUNKING',
  ProductCategory.accessories: 'ACCESSORIES',
  ProductCategory.other: 'OTHER',
};
