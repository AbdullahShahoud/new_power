// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcome_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OutcomeView _$OutcomeViewFromJson(Map<String, dynamic> json) => _OutcomeView(
  id: json['id'] as String,
  projectId: json['projectId'] as String,
  projectName: json['projectName'] as String,
  type: $enumDecode(_$OutcomeTypeEnumMap, json['type']),
  status: $enumDecode(_$OutcomeStatusEnumMap, json['status']),
  distributorAccountId: json['distributorAccountId'] as String?,
  distributor: json['distributor'] == null
      ? null
      : CounterpartyView.fromJson(json['distributor'] as Map<String, dynamic>),
  value: (json['value'] as num?)?.toDouble(),
  soldAt: _$JsonConverterFromJson<String, DateTime>(
    json['soldAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  categories:
      (json['categories'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ProductCategoryEnumMap, e))
          .toList() ??
      const <ProductCategory>[],
  unitsSupplied: (json['unitsSupplied'] as num?)?.toInt(),
  unitsTotal: (json['unitsTotal'] as num?)?.toInt(),
  buyerContactId: json['buyerContactId'] as String?,
  competitorAccountId: json['competitorAccountId'] as String?,
  competitor: json['competitor'] == null
      ? null
      : CounterpartyView.fromJson(json['competitor'] as Map<String, dynamic>),
  lossReason: $enumDecodeNullable(_$LossReasonEnumMap, json['lossReason']),
  competitorPrice: (json['competitorPrice'] as num?)?.toDouble(),
  narrative: json['narrative'] as String?,
  currency: json['currency'] as String?,
  notes: json['notes'] as String?,
  submittedAt: const UtcDateTimeConverter().fromJson(
    json['submittedAt'] as String,
  ),
  submittedBy: json['submittedBy'] as String?,
  submittedByUser: json['submittedByUser'] == null
      ? null
      : ActorView.fromJson(json['submittedByUser'] as Map<String, dynamic>),
  confirmedAt: _$JsonConverterFromJson<String, DateTime>(
    json['confirmedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  confirmedBy: json['confirmedBy'] as String?,
  confirmedByUser: json['confirmedByUser'] == null
      ? null
      : ActorView.fromJson(json['confirmedByUser'] as Map<String, dynamic>),
  rejectedAt: _$JsonConverterFromJson<String, DateTime>(
    json['rejectedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  rejectedBy: json['rejectedBy'] as String?,
  rejectedByUser: json['rejectedByUser'] == null
      ? null
      : ActorView.fromJson(json['rejectedByUser'] as Map<String, dynamic>),
  rejectionReason: json['rejectionReason'] as String?,
  previousStage: $enumDecode(_$ProjectStageEnumMap, json['previousStage']),
);

Map<String, dynamic> _$OutcomeViewToJson(_OutcomeView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'type': _$OutcomeTypeEnumMap[instance.type]!,
      'status': _$OutcomeStatusEnumMap[instance.status]!,
      'distributorAccountId': instance.distributorAccountId,
      'distributor': instance.distributor,
      'value': instance.value,
      'soldAt': _$JsonConverterToJson<String, DateTime>(
        instance.soldAt,
        const UtcDateTimeConverter().toJson,
      ),
      'categories': instance.categories
          .map((e) => _$ProductCategoryEnumMap[e]!)
          .toList(),
      'unitsSupplied': instance.unitsSupplied,
      'unitsTotal': instance.unitsTotal,
      'buyerContactId': instance.buyerContactId,
      'competitorAccountId': instance.competitorAccountId,
      'competitor': instance.competitor,
      'lossReason': _$LossReasonEnumMap[instance.lossReason],
      'competitorPrice': instance.competitorPrice,
      'narrative': instance.narrative,
      'currency': instance.currency,
      'notes': instance.notes,
      'submittedAt': const UtcDateTimeConverter().toJson(instance.submittedAt),
      'submittedBy': instance.submittedBy,
      'submittedByUser': instance.submittedByUser,
      'confirmedAt': _$JsonConverterToJson<String, DateTime>(
        instance.confirmedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'confirmedBy': instance.confirmedBy,
      'confirmedByUser': instance.confirmedByUser,
      'rejectedAt': _$JsonConverterToJson<String, DateTime>(
        instance.rejectedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'rejectedBy': instance.rejectedBy,
      'rejectedByUser': instance.rejectedByUser,
      'rejectionReason': instance.rejectionReason,
      'previousStage': _$ProjectStageEnumMap[instance.previousStage]!,
    };

const _$OutcomeTypeEnumMap = {OutcomeType.won: 'WON', OutcomeType.lost: 'LOST'};

const _$OutcomeStatusEnumMap = {
  OutcomeStatus.pending: 'PENDING',
  OutcomeStatus.confirmed: 'CONFIRMED',
  OutcomeStatus.rejected: 'REJECTED',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

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

const _$LossReasonEnumMap = {
  LossReason.price: 'PRICE',
  LossReason.paymentTerms: 'PAYMENT_TERMS',
  LossReason.availability: 'AVAILABILITY',
  LossReason.specMismatch: 'SPEC_MISMATCH',
  LossReason.competitorRelationship: 'COMPETITOR_RELATIONSHIP',
  LossReason.consultantSpecifiedCompetitor: 'CONSULTANT_SPECIFIED_COMPETITOR',
  LossReason.lateEngagement: 'LATE_ENGAGEMENT',
  LossReason.outletDidNotStock: 'OUTLET_DID_NOT_STOCK',
  LossReason.other: 'OTHER',
};

const _$ProjectStageEnumMap = {
  ProjectStage.lead: 'LEAD',
  ProjectStage.qualified: 'QUALIFIED',
  ProjectStage.engagement: 'ENGAGEMENT',
  ProjectStage.approval: 'APPROVAL',
  ProjectStage.boqReceived: 'BOQ_RECEIVED',
  ProjectStage.quoteIssued: 'QUOTE_ISSUED',
  ProjectStage.committed: 'COMMITTED',
  ProjectStage.won: 'WON',
  ProjectStage.lost: 'LOST',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
