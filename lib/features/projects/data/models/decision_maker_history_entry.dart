import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'stakeholder_link_view.dart';

part 'decision_maker_history_entry.freezed.dart';
part 'decision_maker_history_entry.g.dart';

/// stakeholders.md `GET /projects/{projectId}/decision-maker/history` —
/// "every decision maker the project has had, newest first, each closed
/// period carrying who ended it and why." Shaped to match the *confirmed*
/// live `PUT .../decision-maker` response (`DecisionMakerView` — nested
/// `account`/`contact`, `periodId`, `setAt`), not directly observed for
/// this specific endpoint but extrapolated with reasonable confidence: same
/// backend, same "period" concept, and `endReason` (not `reason`) mirrors
/// `StakeholderLinkView`'s own confirmed close-out field naming. If this
/// still doesn't match once tested, the fix is here, not a guess from zero.
@freezed
abstract class DecisionMakerHistoryEntry with _$DecisionMakerHistoryEntry {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory DecisionMakerHistoryEntry({
    required String periodId,
    required String projectId,
    required String linkId,
    required String accountId,
    required StakeholderLinkAccountView account,
    required String contactId,
    required StakeholderLinkContactView contact,
    required DateTime setAt,
    DateTime? endedAt,
    String? endReason,
  }) = _DecisionMakerHistoryEntry;

  factory DecisionMakerHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$DecisionMakerHistoryEntryFromJson(json);
}
