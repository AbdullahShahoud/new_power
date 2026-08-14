import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'account_view.dart';
import 'contact_view.dart';

part 'register_account_response.freezed.dart';
part 'register_account_response.g.dart';

/// directory-mobile-integration.md §6.1 `POST /accounts`.
///
/// `data` carries up to three keys. `classification` and `contacts` are
/// **spread in**, so each key is *absent* when not applicable rather than
/// `null` — and `duplicateCandidates` is absent **entirely** for a rep (not
/// `null`, not `[]`), because near-duplicates name accounts on another
/// rep's patch. Modeling the two we can receive as optional/defaulted
/// handles absence correctly either way; `duplicateCandidates` isn't
/// modeled at all, since this client can never be sent it.
@freezed
abstract class RegisterAccountData with _$RegisterAccountData {
  const factory RegisterAccountData({
    required AccountView account,
    AccountClassificationView? classification,
    @Default(<ContactView>[]) List<ContactView> contacts,
  }) = _RegisterAccountData;

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

/// §6.3 `POST /accounts/{id}/classifications` — `data` is the created
/// period.
@freezed
abstract class AccountClassificationResponse
    with _$AccountClassificationResponse {
  const factory AccountClassificationResponse({
    bool? success,
    String? message,
    required AccountClassificationView data,
    ApiResponseMeta? meta,
  }) = _AccountClassificationResponse;

  factory AccountClassificationResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountClassificationResponseFromJson(json);
}
