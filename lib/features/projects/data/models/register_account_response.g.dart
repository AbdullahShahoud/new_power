// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterAccountData _$RegisterAccountDataFromJson(Map<String, dynamic> json) =>
    _RegisterAccountData(
      account: AccountView.fromJson(json['account'] as Map<String, dynamic>),
      classification: json['classification'] == null
          ? null
          : AccountClassificationView.fromJson(
              json['classification'] as Map<String, dynamic>,
            ),
      contacts:
          (json['contacts'] as List<dynamic>?)
              ?.map((e) => ContactView.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ContactView>[],
    );

Map<String, dynamic> _$RegisterAccountDataToJson(
  _RegisterAccountData instance,
) => <String, dynamic>{
  'account': instance.account,
  'classification': instance.classification,
  'contacts': instance.contacts,
};

_RegisterAccountResponse _$RegisterAccountResponseFromJson(
  Map<String, dynamic> json,
) => _RegisterAccountResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: RegisterAccountData.fromJson(json['data'] as Map<String, dynamic>),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterAccountResponseToJson(
  _RegisterAccountResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};

_AccountClassificationResponse _$AccountClassificationResponseFromJson(
  Map<String, dynamic> json,
) => _AccountClassificationResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: AccountClassificationView.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
  meta: json['meta'] == null
      ? null
      : ApiResponseMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AccountClassificationResponseToJson(
  _AccountClassificationResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'meta': instance.meta,
};
