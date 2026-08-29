import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'activity_view.dart';
import 'actor_view.dart';
import 'counterparty_view.dart';
import 'enums.dart';

part 'outcome_view.freezed.dart';
part 'outcome_view.g.dart';

/// §9 `OutcomeView` — `POST /projects/{id}/won`, `/lost`,
/// `GET /outcomes[/{id}]`, `POST /outcomes/{id}/confirm`, `/reject` all
/// return this shape. `submittedBy`/`confirmedBy`/`rejectedBy` (+ their
/// `*User` companions) are stripped for a `REPRESENTATIVE` (§1.7) — a rep
/// still sees `confirmedAt`/`rejectedAt`/`rejectionReason`, just not by whom.
@freezed
abstract class OutcomeView with _$OutcomeView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory OutcomeView({
    required String id,
    required String projectId,
    required String projectName,
    required OutcomeType type,
    required OutcomeStatus status,

    // WON
    String? distributorAccountId,
    CounterpartyView? distributor,
    double? value,
    DateTime? soldAt,
    @Default(<ProductCategory>[]) List<ProductCategory> categories,
    int? unitsSupplied,
    int? unitsTotal,
    String? buyerContactId,

    // LOST — a null competitor means UNKNOWN and nothing else.
    String? competitorAccountId,
    CounterpartyView? competitor,
    LossReason? lossReason,
    double? competitorPrice,
    String? narrative,

    String? currency,
    String? notes,

    /// The proof filed with a WON claim — the award letter, the signed PO,
    /// the delivery note. Same `{id, key, name, contentType, byteSize, url,
    /// urlExpiresAt, uploadedAt, uploadedBy}` shape an activity attachment
    /// uses, so [ActivityAttachmentView] is reused rather than duplicated
    /// under a second name; nothing about it is activity-specific.
    ///
    /// Always empty on a LOST outcome — `POST /projects/{id}/lost` has no
    /// `files` field to fill it from.
    @Default(<ActivityAttachmentView>[])
    List<ActivityAttachmentView> attachments,

    required DateTime submittedAt,
    String? submittedBy,
    ActorView? submittedByUser,
    DateTime? confirmedAt,
    String? confirmedBy,
    ActorView? confirmedByUser,
    DateTime? rejectedAt,
    String? rejectedBy,
    ActorView? rejectedByUser,
    String? rejectionReason,

    required ProjectStage previousStage,
  }) = _OutcomeView;

  factory OutcomeView.fromJson(Map<String, dynamic> json) =>
      _$OutcomeViewFromJson(json);
}
