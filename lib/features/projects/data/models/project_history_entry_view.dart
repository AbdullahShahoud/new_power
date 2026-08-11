import 'package:freezed_annotation/freezed_annotation.dart';
import 'actor_view.dart';
import 'enums.dart';

part 'project_history_entry_view.freezed.dart';
part 'project_history_entry_view.g.dart';

/// §9 `ProjectHistoryEntryView` — a discriminated union on `kind`, newest
/// first, returned by `GET /projects/{id}/history`. `changedBy`/
/// `changedByUser` are stripped entirely for a `REPRESENTATIVE` (§1.7).
@Freezed(unionKey: 'kind')
sealed class ProjectHistoryEntryView with _$ProjectHistoryEntryView {
  @FreezedUnionValue('STAGE')
  const factory ProjectHistoryEntryView.stage({
    required String id,
    required String projectId,
    ProjectStage? fromStage,
    required ProjectStage toStage,
    required StageChangeSource source,
    String? note,
    required DateTime changedAt,
    String? changedBy,
    ActorView? changedByUser,
  }) = ProjectStageHistoryEntryView;

  @FreezedUnionValue('STATUS')
  const factory ProjectHistoryEntryView.status({
    required String id,
    required String projectId,
    required ProjectStatus fromStatus,
    required ProjectStatus toStatus,
    required String reason,
    required DateTime changedAt,
    String? changedBy,
    ActorView? changedByUser,
  }) = ProjectStatusHistoryEntryView;

  factory ProjectHistoryEntryView.fromJson(Map<String, dynamic> json) =>
      _$ProjectHistoryEntryViewFromJson(json);
}
