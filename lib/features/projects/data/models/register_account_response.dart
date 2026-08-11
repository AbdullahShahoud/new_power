import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'account_view.dart';

part 'register_account_response.freezed.dart';
part 'register_account_response.g.dart';

/// stakeholders.md `POST /accounts` — "`data` has up to two keys here,
/// unlike every other endpoint in this module": `account`, and (manager+
/// only) `duplicateCandidates`. A `REPRESENTATIVE` never receives the
/// second key at all — not modeled, since this client is rep-only and
/// would never see it populated.
@freezed
abstract class RegisterAccountData with _$RegisterAccountData {
  const factory RegisterAccountData({required AccountView account}) =
      _RegisterAccountData;

  factory RegisterAccountData.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountDataFromJson(json);
}

@freezed
abstract class RegisterAccountResponse with _$RegisterAccountResponse {
  const factory RegisterAccountResponse({
    bool? success,
    String? message,
    required RegisterAccountData data,
    ApiResponseMeta? meta,
  }) = _RegisterAccountResponse;

  factory RegisterAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterAccountResponseFromJson(json);
}
