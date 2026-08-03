// lib/features/auth/data/models/forgot_password_response.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_response.freezed.dart';
part 'forgot_password_response.g.dart';

@freezed
abstract class ForgotPasswordResponse with _$ForgotPasswordResponse {
  const factory ForgotPasswordResponse({required String message}) =
      _ForgotPasswordResponse;

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordResponseFromJson(json);
}
