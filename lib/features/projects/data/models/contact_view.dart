import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_view.freezed.dart';
part 'contact_view.g.dart';

/// stakeholders.md `/accounts/{id}/contacts` — narrowed to a rep's own
/// contacts server-side (`404`, not `403`, for anyone else's), so this
/// client never does its own ownership check on top.
@freezed
abstract class ContactView with _$ContactView {
  const factory ContactView({
    required String id,
    required String accountId,
    required String firstName,
    required String lastName,
    String? position,
    String? phone,
    String? email,
    @Default(false) bool isPrimary,
    DateTime? archivedAt,
  }) = _ContactView;

  factory ContactView.fromJson(Map<String, dynamic> json) =>
      _$ContactViewFromJson(json);
}
