import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

/// GET /auth/me response — `data` is nullable per auth.md: "If the user
/// vanished between token issue and this call, `data` is `null` with a `200`."
@freezed
abstract class UserResponse with _$UserResponse {
  const factory UserResponse({
    required String message,
    UserModel? data,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
