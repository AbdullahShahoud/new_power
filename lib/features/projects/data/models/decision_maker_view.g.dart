// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decision_maker_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DecisionMakerView _$DecisionMakerViewFromJson(Map<String, dynamic> json) =>
    _DecisionMakerView(
      periodId: json['periodId'] as String,
      projectId: json['projectId'] as String,
      linkId: json['linkId'] as String,
      accountId: json['accountId'] as String,
      account: StakeholderLinkAccountView.fromJson(
        json['account'] as Map<String, dynamic>,
      ),
      contactId: json['contactId'] as String,
      contact: StakeholderLinkContactView.fromJson(
        json['contact'] as Map<String, dynamic>,
      ),
      setAt: DateTime.parse(json['setAt'] as String),
    );

Map<String, dynamic> _$DecisionMakerViewToJson(_DecisionMakerView instance) =>
    <String, dynamic>{
      'periodId': instance.periodId,
      'projectId': instance.projectId,
      'linkId': instance.linkId,
      'accountId': instance.accountId,
      'account': instance.account,
      'contactId': instance.contactId,
      'contact': instance.contact,
      'setAt': instance.setAt.toIso8601String(),
    };
