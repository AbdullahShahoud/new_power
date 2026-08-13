import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_meta.freezed.dart';
part 'api_response_meta.g.dart';

/// The `meta` envelope field shared by every endpoint across every module
/// (§1.2). Structurally identical to auth's per-response `*ResponseMeta`
/// classes (e.g. `LoginResponseMeta`) — factored out here so new modules
/// stop re-declaring it; existing auth response classes are left as-is
/// per "don't redesign existing architecture."
@freezed
abstract class ApiResponseMeta with _$ApiResponseMeta {
  const factory ApiResponseMeta({
    DateTime? timestamp,
    String? path,
    String? correlationId,
  }) = _ApiResponseMeta;

  factory ApiResponseMeta.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseMetaFromJson(json);
}
