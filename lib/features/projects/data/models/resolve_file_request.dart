import 'package:freezed_annotation/freezed_annotation.dart';

part 'resolve_file_request.freezed.dart';
part 'resolve_file_request.g.dart';

/// §9 — `POST /files/resolve` body. Turns an expired `key` back into a
/// fresh signed `url` (`StoredFileView`) — see [FileResponse].
@freezed
abstract class ResolveFileRequest with _$ResolveFileRequest {
  const factory ResolveFileRequest({required String key}) = _ResolveFileRequest;

  factory ResolveFileRequest.fromJson(Map<String, dynamic> json) =>
      _$ResolveFileRequestFromJson(json);
}

extension ResolveFileRequestValidation on ResolveFileRequest {
  void validate() {
    if (key.trim().isEmpty) {
      throw ArgumentError('key cannot be empty');
    }
  }
}
