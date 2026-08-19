import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'actor_view.dart';
import 'enums.dart';
import 'project_image_view.dart';
import 'stored_file.dart';

part 'project_view.freezed.dart';
part 'project_view.g.dart';

/// §9 `ProjectView` — returned by `PATCH /projects/{id}`, `PUT …/stage`,
/// `PUT …/status`, `PUT …/location`. Every `…By`/`…ByUser` field is
/// nullable/optional: stripped entirely for a `REPRESENTATIVE` (§1.7).
@freezed
abstract class ProjectView with _$ProjectView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory ProjectView({
    required String id,
    required String name,
    required BuildingType buildingType,
    required String description,
    required double latitude,
    required double longitude,
    String? addressLine,
    String? territoryId,
    TerritoryRefView? territory,
    @Default(false) bool outsideTerritory,
    required ConstructionPhase constructionPhase,
    required ProjectStage stage,
    required ProjectStatus status,
    required String ownerId,
    ActorView? owner,
    int? unitCount,
    double? estimatedValue,
    String? currency,
    String? notes,
    DateTime? lastActivityAt,
    DateTime? nextActionAt,
    DateTime? closedAt,
    String? closedBy,
    required int version,
    String? createdBy,
    ActorView? createdByUser,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ProjectView;

  factory ProjectView.fromJson(Map<String, dynamic> json) =>
      _$ProjectViewFromJson(json);
}

/// §9 `ProjectSummaryView` — `GET /projects` list rows. `distanceM` is only
/// present on a `near=` query; do not assume the key exists otherwise.
@freezed
abstract class ProjectSummaryView with _$ProjectSummaryView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory ProjectSummaryView({
    required String id,
    required String name,
    required BuildingType buildingType,
    required String description,
    required double latitude,
    required double longitude,
    String? addressLine,
    String? territoryId,
    TerritoryRefView? territory,
    @Default(false) bool outsideTerritory,
    required ConstructionPhase constructionPhase,
    required ProjectStage stage,
    required ProjectStatus status,
    required String ownerId,
    ActorView? owner,
    int? unitCount,
    double? estimatedValue,
    String? currency,
    String? notes,
    DateTime? lastActivityAt,
    DateTime? nextActionAt,
    DateTime? closedAt,
    String? closedBy,
    required int version,
    String? createdBy,
    ActorView? createdByUser,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int imageCount,
    required int activityCount,
    required int stakeholderCount,
    double? distanceM,

    /// The list row's thumbnail. Added server-side after the reference doc
    /// was written — §5 still describes list rows as carrying `imageCount`
    /// but no photo, which is why the client used to fall back to a
    /// placeholder here.
    ///
    /// `url` is a **signed, expiring** Cloudinary link (`urlExpiresAt`), not
    /// a stable one — so it is fine to render immediately but must never be
    /// cached past that timestamp or persisted as if permanent.
    StoredFileView? coverImage,

    /// Kept as a fallback for the same reason it was added: the list
    /// endpoint is not documented to return photos at all, so neither shape
    /// is guaranteed. [ProjectSummaryViewX.thumbnailUrl] prefers
    /// [coverImage] and falls back to this.
    @Default(<ProjectImageView>[]) List<ProjectImageView> images,
  }) = _ProjectSummaryView;

  factory ProjectSummaryView.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummaryViewFromJson(json);
}

extension ProjectSummaryViewX on ProjectSummaryView {
  /// The best photo URL this row can offer, or `null` for the placeholder.
  ///
  /// Prefers `coverImage` (what the server actually sends today) and falls
  /// back to the first entry of `images`. An unsigned photo is skipped
  /// rather than rendered: it stays in the array with `url: null` while it
  /// is still being processed.
  String? get thumbnailUrl {
    final cover = coverImage?.url;
    if (cover != null && cover.isNotEmpty) return cover;
    for (final image in images) {
      final url = image.url;
      if (url != null && url.isNotEmpty) return url;
    }
    return null;
  }
}
