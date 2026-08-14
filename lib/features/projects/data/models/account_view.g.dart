// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_view.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountClassificationView _$AccountClassificationViewFromJson(
  Map<String, dynamic> json,
) => _AccountClassificationView(
  id: json['id'] as String?,
  accountId: json['accountId'] as String?,
  classification: $enumDecode(
    _$AccountClassificationEnumMap,
    json['classification'],
  ),
  isAuthorized: json['isAuthorized'] as bool? ?? false,
  authorizedAt: _$JsonConverterFromJson<String, DateTime>(
    json['authorizedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  addedAt: _$JsonConverterFromJson<String, DateTime>(
    json['addedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  removedAt: _$JsonConverterFromJson<String, DateTime>(
    json['removedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  removalReason: json['removalReason'] as String?,
);

Map<String, dynamic> _$AccountClassificationViewToJson(
  _AccountClassificationView instance,
) => <String, dynamic>{
  'id': instance.id,
  'accountId': instance.accountId,
  'classification': _$AccountClassificationEnumMap[instance.classification]!,
  'isAuthorized': instance.isAuthorized,
  'authorizedAt': _$JsonConverterToJson<String, DateTime>(
    instance.authorizedAt,
    const UtcDateTimeConverter().toJson,
  ),
  'addedAt': _$JsonConverterToJson<String, DateTime>(
    instance.addedAt,
    const UtcDateTimeConverter().toJson,
  ),
  'removedAt': _$JsonConverterToJson<String, DateTime>(
    instance.removedAt,
    const UtcDateTimeConverter().toJson,
  ),
  'removalReason': instance.removalReason,
};

const _$AccountClassificationEnumMap = {
  AccountClassification.projectStakeholder: 'PROJECT_STAKEHOLDER',
  AccountClassification.distributor: 'DISTRIBUTOR',
  AccountClassification.competitor: 'COMPETITOR',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

_AccountView _$AccountViewFromJson(Map<String, dynamic> json) => _AccountView(
  id: json['id'] as String,
  name: json['name'] as String,
  type: $enumDecode(_$AccountTypeEnumMap, json['type']),
  registrationNumber: json['registrationNumber'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  city: json['city'] as String?,
  addressLine: json['addressLine'] as String?,
  notes: json['notes'] as String?,
  isVerified: json['isVerified'] as bool,
  verifiedAt: _$JsonConverterFromJson<String, DateTime>(
    json['verifiedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  verifiedBy: json['verifiedBy'] as String?,
  verifiedByUser: json['verifiedByUser'] == null
      ? null
      : ActorView.fromJson(json['verifiedByUser'] as Map<String, dynamic>),
  contactCount: (json['contactCount'] as num?)?.toInt(),
  activeLinkCount: (json['activeLinkCount'] as num?)?.toInt(),
  createdAt: _$JsonConverterFromJson<String, DateTime>(
    json['createdAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  updatedAt: _$JsonConverterFromJson<String, DateTime>(
    json['updatedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  archivedAt: _$JsonConverterFromJson<String, DateTime>(
    json['archivedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  mergedIntoId: json['mergedIntoId'] as String?,
  mergedAt: _$JsonConverterFromJson<String, DateTime>(
    json['mergedAt'],
    const UtcDateTimeConverter().fromJson,
  ),
  classifications:
      (json['classifications'] as List<dynamic>?)
          ?.map(
            (e) =>
                AccountClassificationView.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <AccountClassificationView>[],
);

Map<String, dynamic> _$AccountViewToJson(_AccountView instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AccountTypeEnumMap[instance.type]!,
      'registrationNumber': instance.registrationNumber,
      'phone': instance.phone,
      'email': instance.email,
      'city': instance.city,
      'addressLine': instance.addressLine,
      'notes': instance.notes,
      'isVerified': instance.isVerified,
      'verifiedAt': _$JsonConverterToJson<String, DateTime>(
        instance.verifiedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'verifiedBy': instance.verifiedBy,
      'verifiedByUser': instance.verifiedByUser,
      'contactCount': instance.contactCount,
      'activeLinkCount': instance.activeLinkCount,
      'createdAt': _$JsonConverterToJson<String, DateTime>(
        instance.createdAt,
        const UtcDateTimeConverter().toJson,
      ),
      'updatedAt': _$JsonConverterToJson<String, DateTime>(
        instance.updatedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'archivedAt': _$JsonConverterToJson<String, DateTime>(
        instance.archivedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'mergedIntoId': instance.mergedIntoId,
      'mergedAt': _$JsonConverterToJson<String, DateTime>(
        instance.mergedAt,
        const UtcDateTimeConverter().toJson,
      ),
      'classifications': instance.classifications,
    };

const _$AccountTypeEnumMap = {
  AccountType.company: 'COMPANY',
  AccountType.individual: 'INDIVIDUAL',
};
