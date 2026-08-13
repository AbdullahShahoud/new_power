import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';

part 'user_message_response.freezed.dart';
part 'user_message_response.g.dart';

/// users.md `PUT /users/me/password` — `{ message, data: null }`. `data` is
/// literally null here (not the nested-message shape), so it isn't modeled
/// at all: there is nothing in it to read.
@freezed
abstract class UserMessageResponse with _$UserMessageResponse {
  const factory UserMessageResponse({
    bool? success,
    String? message,
    ApiResponseMeta? meta,
  }) = _UserMessageResponse;

  factory UserMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$UserMessageResponseFromJson(json);
}

/// users.md `PATCH /users/me/username` — `data: { username }`.
@freezed
abstract class ChangeUsernameData with _$ChangeUsernameData {
  const factory ChangeUsernameData({required String username}) =
      _ChangeUsernameData;

  factory ChangeUsernameData.fromJson(Map<String, dynamic> json) =>
      _$ChangeUsernameDataFromJson(json);
}

@freezed
abstract class ChangeUsernameResponse with _$ChangeUsernameResponse {
  const factory ChangeUsernameResponse({
    bool? success,
    String? message,
    required ChangeUsernameData data,
    ApiResponseMeta? meta,
  }) = _ChangeUsernameResponse;

  factory ChangeUsernameResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangeUsernameResponseFromJson(json);
}
