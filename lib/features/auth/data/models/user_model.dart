// ignore_for_file: override_on_non_overriding_member

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Reused for two different response bodies:
///  - `POST /auth/register`'s `data.user` (only id/email/firstName/lastName
///    are populated there).
///  - `GET /auth/me`'s `data` (the full profile, every field populated).
/// The extra fields are nullable so the smaller register payload still
/// parses cleanly without a second near-duplicate model.
/// ⚠️ SENSITIVE: Contains PII (email, firstName, lastName, phone)
@Freezed(toStringOverride: false)
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    String? username,
    DateTime? usernameChangedAt,
    String? role,
    String? status,
    bool? emailVerified,
    bool? phoneVerified,
    DateTime? createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  String toString() =>
      'UserModel(id: $id, firstName: ***HIDDEN***, email: ***HIDDEN***, lastName: ***HIDDEN***, '
      'username: $username, role: $role, status: $status)';
}
