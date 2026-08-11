import 'package:freezed_annotation/freezed_annotation.dart';

part 'stored_file.freezed.dart';
part 'stored_file.g.dart';

/// The one file shape (§9). Every response in this module that carries a
/// file returns this and adds fields to it rather than inventing a new
/// object — upload results, project photos, nearby-building photos and
/// (Phase 2) activity attachments are all this shape.
///
/// `url` renders it now; `key` renders it later (`POST /files/resolve` once
/// `urlExpiresAt` has passed). `url` can be `null` for documents stored
/// `raw` — branch on `contentType`, never assume `<img>`.
@Freezed(toStringOverride: false)
abstract class StoredFileView with _$StoredFileView {
  const factory StoredFileView({
    required String key,
    required String name,
    required String contentType,
    required int byteSize,
    String? url,
    DateTime? urlExpiresAt,
  }) = _StoredFileView;

  factory StoredFileView.fromJson(Map<String, dynamic> json) =>
      _$StoredFileViewFromJson(json);

  @override
  String toString() =>
      'StoredFileView(key: $key, name: $name, contentType: $contentType, byteSize: $byteSize)';
}

/// Request shape for a project photo (§4, extends the bare upload
/// key+name with a caption and client-read EXIF coordinates).
/// `contentType`/`byteSize` are never accepted from the client — read back
/// from storage server-side.
@freezed
abstract class ProjectFileRefDto with _$ProjectFileRefDto {
  const factory ProjectFileRefDto({
    required String key,
    required String name,
    String? caption,
    double? exifLatitude,
    double? exifLongitude,
  }) = _ProjectFileRefDto;

  factory ProjectFileRefDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectFileRefDtoFromJson(json);
}

extension ProjectFileRefDtoValidation on ProjectFileRefDto {
  void validate() {
    if (key.trim().isEmpty || key.length > 255) {
      throw ArgumentError('key must be 1-255 characters');
    }
    final trimmedName = name.trim();
    if (trimmedName.isEmpty || trimmedName.length > 255) {
      throw ArgumentError('name must be 1-255 characters');
    }
    final trimmedCaption = caption?.trim();
    if (trimmedCaption != null && trimmedCaption.length > 200) {
      throw ArgumentError('caption cannot exceed 200 characters');
    }
  }
}
