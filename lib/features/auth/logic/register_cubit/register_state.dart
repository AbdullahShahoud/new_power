// lib/features/auth/logic/register_cubit/register_state.dart

import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;

  /// 201 Created — a verification code was emailed; no tokens issued
  /// (registration is closed / requires manager approval, per auth.md).
  const factory RegisterState.success({required String message}) = _Success;

  const factory RegisterState.rateLimited({required int seconds}) =
      _RateLimited;
  const factory RegisterState.error(String error, {String? errorCode}) = _Error;
}
