import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'stored_file.dart';

part 'file_response.freezed.dart';
part 'file_response.g.dart';

/// §9 — `POST /files` and `POST /files/resolve` both return a bare
/// `StoredFileView` as `data` (see the "What each context adds" table:
/// "nothing — the bare shape"), so one envelope class covers both.
@freezed
abstract class FileResponse with _$FileResponse {
  const factory FileResponse({
    bool? success,
    String? message,
    required StoredFileView data,
    ApiResponseMeta? meta,
  }) = _FileResponse;

  factory FileResponse.fromJson(Map<String, dynamic> json) =>
      _$FileResponseFromJson(json);
}
