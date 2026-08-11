import 'package:freezed_annotation/freezed_annotation.dart';

part 'uploaded_file_dto.freezed.dart';
part 'uploaded_file_dto.g.dart';

/// §4 `UploadedFileDto` — an activity attachment. `contentType`/`byteSize`
/// are never accepted from the client. **Not** the same type as
/// `ProjectFileRefDto` — no caption/EXIF (projects-implementation-map.md §3).
@freezed
abstract class UploadedFileDto with _$UploadedFileDto {
  const factory UploadedFileDto({required String key, required String name}) =
      _UploadedFileDto;

  factory UploadedFileDto.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileDtoFromJson(json);
}

extension UploadedFileDtoValidation on UploadedFileDto {
  void validate() {
    if (key.trim().isEmpty || key.length > 255) {
      throw ArgumentError('key must be 1-255 characters');
    }
    final trimmedName = name.trim();
    if (trimmedName.isEmpty || trimmedName.length > 255) {
      throw ArgumentError('name must be 1-255 characters');
    }
  }
}
