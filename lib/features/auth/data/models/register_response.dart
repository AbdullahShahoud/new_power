// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
// tokens_model not used here

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
abstract class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    required RegisterData data,
    required String message,
  }) = _RegisterResponse;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

/// Registration response data with verification challenge
/// ⚠️ SENSITIVE: Contains verificationId (authentication secret)
@Freezed(toStringOverride: false)
abstract class RegisterData with _$RegisterData {
  const factory RegisterData({
    required UserModel user,
    required String verificationId,
  }) = _RegisterData;

  factory RegisterData.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataFromJson(json);

  @override
  String toString() =>
      'RegisterData(user: ${user.id}, verificationId: ***HIDDEN***)';
}
