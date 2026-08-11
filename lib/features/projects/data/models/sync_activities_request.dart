import 'package:freezed_annotation/freezed_annotation.dart';
import 'sync_activity_item.dart';

part 'sync_activities_request.freezed.dart';
part 'sync_activities_request.g.dart';

/// §6 `POST /activities/sync` body — `1…100` items. The Bloc/repository
/// land in Phase 2; the local queue that batches these in bulk offline is
/// Phase 4 (projects-implementation-map.md roadmap).
@freezed
abstract class SyncActivitiesRequest with _$SyncActivitiesRequest {
  const factory SyncActivitiesRequest({required List<SyncActivityItem> items}) =
      _SyncActivitiesRequest;

  factory SyncActivitiesRequest.fromJson(Map<String, dynamic> json) =>
      _$SyncActivitiesRequestFromJson(json);
}

extension SyncActivitiesRequestValidation on SyncActivitiesRequest {
  void validate() {
    if (items.isEmpty || items.length > 100) {
      throw ArgumentError('items must contain 1-100 items');
    }
    for (final item in items) {
      item.validate();
    }
  }
}
