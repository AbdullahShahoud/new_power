import 'package:freezed_annotation/freezed_annotation.dart';
import 'sync_activity_item.dart';

part 'queued_activity_record.freezed.dart';
part 'queued_activity_record.g.dart';

/// Local-only bookkeeping around a queued `SyncActivityItem` — never sent to
/// the server as-is (`item` is what gets sent, inside a `SyncActivitiesRequest`
/// batch). `lastErrorCode`/`lastErrorMessage` are set when the server comes
/// back with `status: "REJECTED"` for this `clientRef` (§10 Workflow 5):
/// the record stays in the queue so the rep doesn't lose what they typed,
/// flagged with why it didn't go through, until they discard it or fix and
/// resubmit as a new logged activity.
@freezed
abstract class QueuedActivityRecord with _$QueuedActivityRecord {
  const factory QueuedActivityRecord({
    required SyncActivityItem item,
    required DateTime queuedAt,
    String? lastErrorCode,
    String? lastErrorMessage,
  }) = _QueuedActivityRecord;

  factory QueuedActivityRecord.fromJson(Map<String, dynamic> json) =>
      _$QueuedActivityRecordFromJson(json);
}
