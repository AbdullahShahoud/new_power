import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/add_contact_request.dart';
import '../../data/models/enums.dart';
import '../../data/models/patch_contact_request.dart';
import '../../data/models/reason_request.dart';
import '../../data/models/register_account_request.dart';

part 'accounts_event.freezed.dart';

/// Backs `AccountPickerScreen` (search + create) and `ContactPickerScreen`
/// (a rep's own contacts under one account). Phase 6 —
/// projects-implementation-map.md §10.
@freezed
sealed class AccountsEvent with _$AccountsEvent {
  /// `GET /accounts` takes **`search` or `classification`, not both**. A
  /// classification on its own satisfies the "say what you're looking for"
  /// rule, which is what makes a distributor/competitor picker browsable
  /// with no query typed at all.
  const factory AccountsEvent.searchRequested({
    @Default('') String search,
    AccountClassification? classification,
  }) = AccountSearchRequested;

  /// `POST /accounts/{id}/classifications` — lets a rep tag an account they
  /// just found ("this is the outlet the deal went through") without
  /// leaving the picker.
  const factory AccountsEvent.accountClassified({
    required String accountId,
    required AccountClassification classification,
  }) = AccountClassified;

  const factory AccountsEvent.registerSubmitted(
    RegisterAccountRequest request,
  ) = AccountRegisterSubmitted;

  const factory AccountsEvent.contactsListRequested(String accountId) =
      AccountContactsListRequested;

  /// `POST /contacts` — the account (if any) travels *inside* the request
  /// now, since an unfiled person is a legitimate outcome.
  const factory AccountsEvent.contactAddSubmitted({
    required AddContactRequest request,
  }) = AccountContactAddSubmitted;

  /// Contacts are addressed by their own id — they're no longer nested
  /// under an account path.
  const factory AccountsEvent.contactPatchSubmitted({
    required String contactId,
    required PatchContactRequest request,
  }) = AccountContactPatchSubmitted;

  const factory AccountsEvent.contactArchiveSubmitted({
    required String contactId,
    required ReasonRequest request,
  }) = AccountContactArchiveSubmitted;

  /// `PUT /contacts/{id}/account` — file an unfiled person, or move a
  /// misfiled one.
  const factory AccountsEvent.contactAccountSet({
    required String contactId,
    required String accountId,
  }) = AccountContactAccountSet;
}
