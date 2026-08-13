// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stakeholder_link_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StakeholderLinkAccountView _$StakeholderLinkAccountViewFromJson(
  Map<String, dynamic> json,
) => _StakeholderLinkAccountView(
  id: json['id'] as String,
  name: json['name'] as String,
  type: json['type'] as String,
);

Map<String, dynamic> _$StakeholderLinkAccountViewToJson(
  _StakeholderLinkAccountView instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
};

_StakeholderLinkContactView _$StakeholderLinkContactViewFromJson(
  Map<String, dynamic> json,
) => _StakeholderLinkContactView(
  id: json['id'] as String,
  accountId: json['accountId'] as String,
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  position: json['position'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$StakeholderLinkContactViewToJson(
  _StakeholderLinkContactView instance,
) => <String, dynamic>{
  'id': instance.id,
  'accountId': instance.accountId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'position': instance.position,
  'phone': instance.phone,
  'email': instance.email,
};

_StakeholderLinkView _$StakeholderLinkViewFromJson(Map<String, dynamic> json) =>
    _StakeholderLinkView(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      accountId: json['accountId'] as String,
      account: StakeholderLinkAccountView.fromJson(
        json['account'] as Map<String, dynamic>,
      ),
      role: $enumDecode(_$StakeholderRoleEnumMap, json['role']),
      primaryContactId: json['primaryContactId'] as String?,
      primaryContact: json['primaryContact'] == null
          ? null
          : StakeholderLinkContactView.fromJson(
              json['primaryContact'] as Map<String, dynamic>,
            ),
      note: json['note'] as String?,
      startedAt: const UtcDateTimeConverter().fromJson(
        json['startedAt'] as String,
      ),
      endedAt: _$JsonConverterFromJson<String, DateTime>(
        json['endedAt'],
        const UtcDateTimeConverter().fromJson,
      ),
      endReason: json['endReason'] as String?,
      replacedByLinkId: json['replacedByLinkId'] as String?,
      isActive: json['isActive'] as bool? ?? true,
    );

Map<String, dynamic> _$StakeholderLinkViewToJson(
  _StakeholderLinkView instance,
) => <String, dynamic>{
  'id': instance.id,
  'projectId': instance.projectId,
  'accountId': instance.accountId,
  'account': instance.account,
  'role': _$StakeholderRoleEnumMap[instance.role]!,
  'primaryContactId': instance.primaryContactId,
  'primaryContact': instance.primaryContact,
  'note': instance.note,
  'startedAt': const UtcDateTimeConverter().toJson(instance.startedAt),
  'endedAt': _$JsonConverterToJson<String, DateTime>(
    instance.endedAt,
    const UtcDateTimeConverter().toJson,
  ),
  'endReason': instance.endReason,
  'replacedByLinkId': instance.replacedByLinkId,
  'isActive': instance.isActive,
};

const _$StakeholderRoleEnumMap = {
  StakeholderRole.owner: 'OWNER',
  StakeholderRole.mainContractor: 'MAIN_CONTRACTOR',
  StakeholderRole.electricalMepSubcontractor: 'ELECTRICAL_MEP_SUBCONTRACTOR',
  StakeholderRole.consultantEngineeringOffice: 'CONSULTANT_ENGINEERING_OFFICE',
  StakeholderRole.purchasingManager: 'PURCHASING_MANAGER',
  StakeholderRole.siteElectrician: 'SITE_ELECTRICIAN',
  StakeholderRole.electricalEngineer: 'ELECTRICAL_ENGINEER',
  StakeholderRole.siteSupervisor: 'SITE_SUPERVISOR',
  StakeholderRole.other: 'OTHER',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
