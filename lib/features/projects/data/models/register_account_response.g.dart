// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterAccountData _$RegisterAccountDataFromJson(Map<String, dynamic> json) =>
    _RegisterAccountData(
      account: AccountView.fromJson(json['account'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterAccountDataToJson(
  _RegisterAccountData instance,
) => <String, dynamic>{'account': instance.account};

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
