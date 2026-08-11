// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_decision_maker_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetDecisionMakerRequest _$SetDecisionMakerRequestFromJson(
  Map<String, dynamic> json,
) => _SetDecisionMakerRequest(
  contactId: json['contactId'] as String,
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$SetDecisionMakerRequestToJson(
  _SetDecisionMakerRequest instance,
) => <String, dynamic>{
  'contactId': instance.contactId,
  'reason': instance.reason,
};
