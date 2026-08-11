import 'package:freezed_annotation/freezed_annotation.dart';
import 'actor_view.dart';

part 'project_image_view.freezed.dart';
part 'project_image_view.g.dart';

/// §9 `ProjectImageView extends StoredFileView` — flattened here (Dart
/// freezed classes don't extend each other cleanly) rather than nesting a
/// `StoredFileView` field, matching how the doc itself lists it as "the one
/// file shape plus these extra fields," not a wrapper.
///
/// An image whose URL couldn't be signed is **not** dropped from the array —
/// it still arrives with `url: null` and its `key`. `imageCount` (on
/// `ProjectDetailView`) is the real count against the ten-photo ceiling;
/// never derive it from `images.length`.
@Freezed(toStringOverride: false)
abstract class ProjectImageView with _$ProjectImageView {
  const factory ProjectImageView({
    required String key,
    required String name,
    required String contentType,
    required int byteSize,
    String? url,
    DateTime? urlExpiresAt,
    required String id,
    String? caption,
    double? exifLatitude,
    double? exifLongitude,
    double? exifDistanceM,
    required int sortOrder,
    required DateTime uploadedAt,
    String? uploadedBy,
    ActorView? uploadedByUser,
  }) = _ProjectImageView;

  factory ProjectImageView.fromJson(Map<String, dynamic> json) =>
      _$ProjectImageViewFromJson(json);

  @override
  String toString() =>
      'ProjectImageView(id: $id, key: $key, name: $name, sortOrder: $sortOrder)';
}
