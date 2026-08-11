import 'package:freezed_annotation/freezed_annotation.dart';
import 'actor_view.dart';
import 'enums.dart';

part 'account_view.freezed.dart';
part 'account_view.g.dart';

/// stakeholders.md `POST /accounts` / `GET /accounts` — the shared account
/// shape. A rep never reaches `GET /accounts/{id}` (`SALES_MANAGER`+), so
/// this only ever arrives from a creation response or a search row; fields
/// beyond what those two show are modeled nullable rather than assumed.
@freezed
abstract class AccountView with _$AccountView {
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
    DateTime? archivedAt,
  }) = _AccountView;

  factory AccountView.fromJson(Map<String, dynamic> json) =>
      _$AccountViewFromJson(json);
}
