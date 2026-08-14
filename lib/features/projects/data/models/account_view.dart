import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import 'actor_view.dart';
import 'enums.dart';

part 'account_view.freezed.dart';
part 'account_view.g.dart';

/// directory-mobile-integration.md §6.3 — one open classification period.
///
/// `isAuthorized` is **DISTRIBUTOR-only** and means "formally appointed
/// NEWPOWER dealer". The doc is explicit that `false` is the *normal* state
/// ("most outlets a rep buys through are real and unappointed") and must
/// **not** be rendered as a warning.
@freezed
abstract class AccountClassificationView with _$AccountClassificationView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory AccountClassificationView({
    String? id,
    String? accountId,
    required AccountClassification classification,
    @Default(false) bool isAuthorized,
    DateTime? authorizedAt,
    DateTime? addedAt,
    DateTime? removedAt,
    String? removalReason,
  }) = _AccountClassificationView;

  factory AccountClassificationView.fromJson(Map<String, dynamic> json) =>
      _$AccountClassificationViewFromJson(json);
}

/// directory-mobile-integration.md §6.4 — the account as a rep can ever see
/// it.
///
/// **A rep cannot read a single account by id** (§2.3: `GET /accounts/{id}`
/// is `SALES_MANAGER`+ and answers 403). The search *list row* is therefore
/// the richest shape available to this client — and it carries everything
/// the manager-only detail does, **plus** open `classifications`. So an
/// account "detail" screen has to be built from a cached list row plus the
/// roster call, never from an id-based fetch.
///
/// [classifications] holds **open periods only, appointed first** — it
/// reads as *what this account currently is*. Closed periods live on the
/// endpoint a rep can't reach.
@freezed
abstract class AccountView with _$AccountView {
  // ignore: invalid_annotation_target
  @JsonSerializable(converters: [UtcDateTimeConverter()])
  const factory AccountView({
    required String id,
    required String name,
    required AccountType type,
    String? registrationNumber,
    String? phone,
    String? email,
    String? city,
    String? addressLine,
    String? notes,
    required bool isVerified,
    DateTime? verifiedAt,
    String? verifiedBy,
    ActorView? verifiedByUser,
    int? contactCount,
    int? activeLinkCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? archivedAt,
    String? mergedIntoId,
    DateTime? mergedAt,
    @Default(<AccountClassificationView>[])
    List<AccountClassificationView> classifications,
  }) = _AccountView;

  factory AccountView.fromJson(Map<String, dynamic> json) =>
      _$AccountViewFromJson(json);
}

extension AccountViewX on AccountView {
  bool hasClassification(AccountClassification classification) =>
      classifications.any((c) => c.classification == classification);

  /// Whether this outlet is a formally appointed dealer. Only meaningful
  /// for a DISTRIBUTOR; `false` is normal and not a problem.
  bool get isAuthorizedDistributor => classifications.any(
    (c) =>
        c.classification == AccountClassification.distributor && c.isAuthorized,
  );
}
