// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_lost_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubmitLostRequest _$SubmitLostRequestFromJson(Map<String, dynamic> json) =>
    _SubmitLostRequest(
      someoneElseWon: json['someoneElseWon'] as bool? ?? true,
      reason: $enumDecode(_$LossReasonEnumMap, json['reason']),
      competitorPrice: (json['competitorPrice'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
      competitorAccountId: json['competitorAccountId'] as String?,
      narrative: json['narrative'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$SubmitLostRequestToJson(_SubmitLostRequest instance) =>
    <String, dynamic>{
      'someoneElseWon': instance.someoneElseWon,
      'reason': _$LossReasonEnumMap[instance.reason]!,
      'competitorPrice': instance.competitorPrice,
      'currency': instance.currency,
      'competitorAccountId': instance.competitorAccountId,
      'narrative': instance.narrative,
      'notes': instance.notes,
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
