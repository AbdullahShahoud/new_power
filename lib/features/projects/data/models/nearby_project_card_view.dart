import 'package:freezed_annotation/freezed_annotation.dart';
import 'enums.dart';
import 'stored_file.dart';

part 'nearby_project_card_view.freezed.dart';
part 'nearby_project_card_view.g.dart';

/// §9 — a name to call/greet, not an id or email. `owner` survives the
/// `REPRESENTATIVE` attribution redaction because it doesn't end in `By`:
/// that rule hides who *did* things, and ownership is an ongoing fact.
@freezed
abstract class NearbyOwnerRefView with _$NearbyOwnerRefView {
  const factory NearbyOwnerRefView({
    required String firstName,
    required String lastName,
  }) = _NearbyOwnerRefView;

  factory NearbyOwnerRefView.fromJson(Map<String, dynamic> json) =>
      _$NearbyOwnerRefViewFromJson(json);
}

/// §9 `NearbyProjectCardView` — returned by `GET /projects/nearby` and,
/// extended with `projectId`/`isYours`, by `POST /projects`'s
/// `nearbyProjects`. **Not** a trimmed `ProjectSummaryView` — a
/// deliberately narrower type on purpose: no `id`, `ownerId`, `notes`,
/// `territory`, `version`, `createdBy`, counts, or timestamps, so a
/// cross-owner read stays safe.
@freezed
abstract class NearbyProjectCardView with _$NearbyProjectCardView {
  const factory NearbyProjectCardView({
    required String name,
    required BuildingType buildingType,
    required String description,
    required double latitude,
    required double longitude,
    String? addressLine,
    required ConstructionPhase constructionPhase,
    required ProjectStage stage,
    required ProjectStatus status,
    required NearbyOwnerRefView owner,
    int? unitCount,
    double? estimatedValue,
    String? currency,
    @Default(<StoredFileView>[]) List<StoredFileView> images,
    required double distanceM,
    String? projectId,
    bool? isYours,
  }) = _NearbyProjectCardView;

  factory NearbyProjectCardView.fromJson(Map<String, dynamic> json) =>
      _$NearbyProjectCardViewFromJson(json);
}
