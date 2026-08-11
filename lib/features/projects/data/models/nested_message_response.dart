import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';

part 'nested_message_response.freezed.dart';
part 'nested_message_response.g.dart';

/// §1.4 "the nested-message shape" — a handler that returns no payload
/// still wraps a message as `data: { message }`. Read `data.message`, never
/// the top-level `message`. Used by `DELETE /projects/{id}/images/{imageId}`
/// in Phase 1; the doc flags this as a recurring pattern across the module,
/// so this is shared rather than redeclared per delete-style endpoint.
@freezed
abstract class NestedMessageResponse with _$NestedMessageResponse {
  const factory NestedMessageResponse({
    bool? success,
    String? message,
    required NestedMessage data,
    ApiResponseMeta? meta,
  }) = _NestedMessageResponse;

  factory NestedMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$NestedMessageResponseFromJson(json);
}

@freezed
abstract class NestedMessage with _$NestedMessage {
  const factory NestedMessage({required String message}) = _NestedMessage;

  factory NestedMessage.fromJson(Map<String, dynamic> json) =>
      _$NestedMessageFromJson(json);
}
