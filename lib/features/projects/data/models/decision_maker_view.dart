import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'stakeholder_link_view.dart';

part 'decision_maker_view.freezed.dart';
part 'decision_maker_view.g.dart';

/// Confirmed against a live `PUT /projects/{projectId}/decision-maker`
/// response — **not** the flat `contactName`/`accountName` shape
/// `stakeholders.md`'s wording (mirroring `ProjectDetailView.
/// decisionMaker`'s documented `DecisionMakerRefView`) implied. Same class
/// of mismatch as `StakeholderLinkView` (projects-implementation-map.md
/// decision 20's sibling): the real payload nests `account`/`contact` and
/// uses `periodId` for this period's own id, not the `DecisionMakerRefView`
/// shape. Used for `PUT`/`GET`/`DELETE .../decision-maker` — all three
/// settle the same underlying "current period" record, so all three are
/// assumed to share this shape (only `PUT` has been observed directly).
@freezed
abstract class DecisionMakerView with _$DecisionMakerView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory DecisionMakerView({
    required String periodId,
    required String projectId,
    required String linkId,
    required String accountId,
    required StakeholderLinkAccountView account,
    required String contactId,
    required StakeholderLinkContactView contact,
    required DateTime setAt,
  }) = _DecisionMakerView;

  factory DecisionMakerView.fromJson(Map<String, dynamic> json) =>
      _$DecisionMakerViewFromJson(json);
}
