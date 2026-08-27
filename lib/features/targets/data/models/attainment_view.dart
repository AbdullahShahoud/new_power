// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/networking/api_response_meta.dart';
import 'decimal_amount.dart';
import 'target_enums.dart';

part 'attainment_view.freezed.dart';
part 'attainment_view.g.dart';

/// §9 `AttainmentView` — one published target and how the rep is tracking
/// against it.
///
/// Every figure behind these numbers comes from **`CONFIRMED`, `WON`
/// outcomes on non-cancelled projects, counted by `soldAt`**. None of that
/// is a parameter, so there is nothing here to filter or re-derive
/// client-side — the screen's job is to render what it is given.
@freezed
abstract class AttainmentView with _$AttainmentView {
  const factory AttainmentView({
    required String targetId,
    @JsonKey(unknownEnumValue: TargetMetric.unknown)
    @Default(TargetMetric.unknown)
    TargetMetric metric,

    /// Present only on `SALES_VALUE`; the server refuses it on a count
    /// metric rather than dropping it.
    String? currency,
    required String periodStart,
    required String periodEnd,

    /// ⚠️ **Branch on this**, never on whether `expectedToDate` is present.
    /// The two agree, but one is a documented field and the other is an
    /// absence.
    @Default(false) bool closed,

    /// Decimal strings — see [DecimalAmount] for why they stay strings.
    @Default('0') String target,
    @Default('0') String attained,

    /// A JSON *number*, already rounded half-up to one decimal place
    /// server-side so the screen and a manager's calculator agree.
    @Default(0) num attainedPct,

    /// Floored at `"0.00"` — never negative, even when overachieved.
    @Default('0') String remaining,

    // ── absent on a closed period ───────────────────────────────────
    // There is no pace to miss once a period is over, and returning one
    // would invite a projection line through a finished quarter.
    String? expectedToDate,
    num? expectedToDatePct,
    int? elapsedDays,
    int? totalDays,

    @JsonKey(unknownEnumValue: AttainmentStatus.unknown)
    @Default(AttainmentStatus.unknown)
    AttainmentStatus status,
    int? confirmedOutcomes,
  }) = _AttainmentView;

  factory AttainmentView.fromJson(Map<String, dynamic> json) =>
      _$AttainmentViewFromJson(json);
}

extension AttainmentViewX on AttainmentView {
  DecimalAmount get targetAmount => DecimalAmount.parse(target);
  DecimalAmount get attainedAmount => DecimalAmount.parse(attained);
  DecimalAmount get remainingAmount => DecimalAmount.parse(remaining);

  /// Clamped for the progress arc only. `attainedPct` genuinely exceeds 100
  /// on an overachieved target, which is worth *saying* but not worth
  /// drawing as an arc that wraps past its own start.
  double get progress => (attainedPct / 100).clamp(0.0, 1.0).toDouble();

  double? get paceProgress => closed || expectedToDatePct == null
      ? null
      : (expectedToDatePct! / 100).clamp(0.0, 1.0).toDouble();
}

/// §6 `GET /attainment/me` — the **entire** target surface a representative
/// can reach. `GET /attainment`, `GET /targets` and every `/representatives/*`
/// route is a hard `403` for this role, so none of them is wired.
@freezed
abstract class MyAttainmentView with _$MyAttainmentView {
  const factory MyAttainmentView({
    String? asOf,

    /// ⚠️ **After a mid-period transfer this holds two entries** — both
    /// halves of the rep's own quarter, the one their old manager keeps and
    /// the one their new manager owns. They are one period made of two
    /// windows, and summing them is the honest total.
    ///
    /// An empty list is a normal answer: nothing published for that period
    /// yet, not a failure.
    @Default(<AttainmentView>[]) List<AttainmentView> targets,
  }) = _MyAttainmentView;

  factory MyAttainmentView.fromJson(Map<String, dynamic> json) =>
      _$MyAttainmentViewFromJson(json);
}

@freezed
abstract class MyAttainmentResponse with _$MyAttainmentResponse {
  const factory MyAttainmentResponse({
    bool? success,
    String? message,
    required MyAttainmentView data,
    ApiResponseMeta? meta,
  }) = _MyAttainmentResponse;

  factory MyAttainmentResponse.fromJson(Map<String, dynamic> json) =>
      _$MyAttainmentResponseFromJson(json);
}
