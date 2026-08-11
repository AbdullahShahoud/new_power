import 'package:freezed_annotation/freezed_annotation.dart';

part 'counterparty_view.freezed.dart';
part 'counterparty_view.g.dart';

/// §9 — `OutcomeView.distributor`/`.competitor`. `isAuthorized` is
/// DISTRIBUTOR-only: "formally appointed, not merely real" — an
/// unappointed outlet is still accepted on a Won submission, just flagged.
@freezed
abstract class CounterpartyView with _$CounterpartyView {
  const factory CounterpartyView({
    required String accountId,
    required String name,
    String? city,
    required bool isAuthorized,
  }) = _CounterpartyView;

  factory CounterpartyView.fromJson(Map<String, dynamic> json) =>
      _$CounterpartyViewFromJson(json);
}
