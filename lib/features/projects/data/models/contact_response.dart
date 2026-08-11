import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_response_meta.dart';
import 'contact_view.dart';

part 'contact_response.freezed.dart';
part 'contact_response.g.dart';

/// stakeholders.md — `data` is a bare `ContactView`. Shared by `POST`,
/// `GET .../{contactId}`, `PATCH .../{contactId}`.
@freezed
abstract class ContactResponse with _$ContactResponse {
  const factory ContactResponse({
    bool? success,
    String? message,
    required ContactView data,
    ApiResponseMeta? meta,
  }) = _ContactResponse;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
}

/// `GET /accounts/{id}/contacts` — no pagination documented (a rep's own
/// contact list under one account is inherently small), unlike every
/// paginated list elsewhere in this module.
@freezed
abstract class ContactsListResponse with _$ContactsListResponse {
  const factory ContactsListResponse({
    bool? success,
    String? message,
    @Default(<ContactView>[]) List<ContactView> data,
    ApiResponseMeta? meta,
  }) = _ContactsListResponse;

  factory ContactsListResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsListResponseFromJson(json);
}
