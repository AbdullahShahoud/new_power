import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/account_view.dart';
import '../models/add_contact_request.dart';
import '../models/add_stakeholder_link_request.dart';
import '../models/close_stakeholder_link_request.dart';
import '../models/contact_view.dart';
import '../models/decision_maker_history_entry.dart';
import '../models/decision_maker_view.dart';
import '../models/enums.dart';
import '../models/patch_contact_request.dart';
import '../models/patch_stakeholder_link_request.dart';
import '../models/reason_request.dart';
import '../models/register_account_request.dart';
import '../models/register_account_response.dart';
import '../models/set_contact_account_request.dart';
import '../models/replace_stakeholder_link_request.dart';
import '../models/set_decision_maker_request.dart';
import '../models/stakeholder_link_view.dart';

/// Every `REPRESENTATIVE`-reachable stakeholders.md endpoint (Phase 6). The
/// route gate refuses a rep outright on everything else under `/accounts`
/// (`GET/PATCH /accounts/{id}`, `verify`, `DELETE`, `.../projects`) and all
/// of `/account-merges` — those aren't wired here at all, not even as
/// unused-but-ready methods, since a rep-only client has no plausible path
/// to ever call them (projects-implementation-map.md §10).
class StakeholdersRepository {
  final ApiService _apiService;

  StakeholdersRepository(this._apiService);

  ApiResult<T> _validationFailure<T>(ArgumentError e) => ApiResult.failure(
    ApiErrorModel(
      message: e.message ?? 'Validation failed',
      code: 'VALIDATION_ERROR',
    ),
  );

  // ── accounts ─────────────────────────────────────────────────────────

  /// `POST /accounts` (A1) — may inline a classification and up to 20
  /// contacts, so "met a company, met a person there" is **one** call.
  ///
  /// Returns the whole payload rather than just the account, because the
  /// caller usually needs the created contact's id immediately (to hand to
  /// `POST /projects/{id}/stakeholders` as `primaryContactId`).
  Future<ApiResult<RegisterAccountData>> registerAccount(
    RegisterAccountRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.registerAccount(request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /accounts` (A2) — a rep must say what they're looking for:
  /// **`search` or `classification`, not both**. Sending neither returns an
  /// empty page (200), never a 403.
  ///
  /// `in` defaults to `both` server-side — matching accounts *and* the
  /// people behind them — "because that is the question a rep actually has:
  /// they remember the man, not the company."
  Future<ApiResult<List<AccountView>>> searchAccounts({
    String? search,
    AccountClassification? classification,
    AccountSearchIn? searchIn,
    bool? authorizedOnly,
    AccountType? type,
    String? city,
  }) async {
    try {
      final response = await _apiService.searchAccounts(
        search: search,
        classification: classification?.wireValue,
        searchIn: searchIn?.wireValue,
        authorizedOnly: authorizedOnly,
        type: type?.wireValue,
        city: city,
        // Capped to 25 for a rep whatever is asked for; sending it makes
        // the ceiling explicit rather than relying on a silent clamp.
        limit: 25,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `POST /accounts/{id}/classifications` (A4) — open to reps because
  /// "the rep standing in the shop is the one who knows the deal was
  /// supplied through it." A rep's DISTRIBUTOR arrives unappointed
  /// (`isAuthorized: false`), which is normal, not a problem.
  ///
  /// `409 ACCOUNT_ALREADY_CLASSIFIED` is mapped to **success**: the doc's
  /// own rule is "if you get the 409 anyway, treat it as
  /// success-with-refresh, not an error" — the account ends up in exactly
  /// the state the caller wanted either way.
  Future<ApiResult<AccountClassificationView?>> classifyAccount(
    String accountId,
    AccountClassification classification,
  ) async {
    try {
      final response = await _apiService.classifyAccount(
        accountId,
        ClassifyAccountRequest(classification: classification.wireValue),
      );
      return ApiResult.success(response.data);
    } catch (error) {
      final mapped = ApiErrorHandler.handle(error);
      if (mapped.code == 'ACCOUNT_ALREADY_CLASSIFIED') {
        return const ApiResult.success(null);
      }
      return ApiResult.failure(mapped);
    }
  }

  // ── contacts (own only, server-scoped) ──────────────────────────────

  /// `POST /contacts` (C1). `accountId` is **optional** — an unfiled
  /// person is a first-class state now, not a gap to be papered over with
  /// a throwaway "Unknown Contractor" account.
  Future<ApiResult<ContactView>> addContact(AddContactRequest request) async {
    try {
      request.validate();
      final response = await _apiService.addContact(request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /accounts/{id}/contacts` (A5) — the roster, **narrowed to
  /// contacts this rep added**. A rep who added nobody gets `[]`, not a
  /// 403.
  ///
  /// Note this legitimately disagrees with the account row's
  /// `contactCount`, which counts everyone. Never render "showing X of
  /// contactCount".
  Future<ApiResult<List<ContactView>>> getAccountContacts(
    String accountId, {
    bool? includeArchived,
  }) async {
    try {
      final response = await _apiService.getAccountContacts(
        accountId,
        includeArchived: includeArchived,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `GET /contacts` (C2) — own contacts only, `search` required.
  Future<ApiResult<List<ContactView>>> searchContacts(String search) async {
    try {
      final response = await _apiService.searchContacts(
        search: search,
        limit: 25,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `PATCH /contacts/{id}` (C4) — own records only.
  Future<ApiResult<ContactView>> patchContact(
    String contactId,
    PatchContactRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.patchContact(contactId, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `DELETE /contacts/{id}` (C5) — soft archive, own only, needs a reason.
  Future<ApiResult<ContactView>> archiveContact(
    String contactId,
    ReasonRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.archiveContact(contactId, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `PUT /contacts/{id}/account` (C6) — file an unfiled person, or move a
  /// misfiled one. Re-filing where they already are is a safe no-op.
  Future<ApiResult<ContactView>> setContactAccount(
    String contactId,
    String accountId,
  ) async {
    try {
      final request = SetContactAccountRequest(accountId: accountId);
      request.validate();
      final response = await _apiService.setContactAccount(contactId, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // ── project stakeholder links ───────────────────────────────────────

  /// **"New company" branch of the add-stakeholder flow — two calls.**
  ///
  /// A stakeholder is read as a *person* in the field; the company is an
  /// attribute of that person, not a thing the rep registers first. The API
  /// now supports that directly: `POST /accounts` inlines the contact, so
  /// this is account+contact in one write, then the link. It used to take
  /// three.
  ///
  /// The account is created with `PROJECT_STAKEHOLDER` so it shows up in a
  /// later classification-filtered search rather than only by name.
  ///
  /// Not transactional: if the link fails, the account and contact stand.
  /// Deliberate — they're inert, reusable records (the rep can retry the
  /// link, or reuse the company for the next person), and rolling back
  /// would need delete rights a `REPRESENTATIVE` doesn't have
  /// (`DELETE /accounts/{id}` is `SALES_ADMIN`+).
  Future<ApiResult<StakeholderLinkView>> addStakeholderWithNewCompany({
    required String projectId,
    required RegisterAccountRequest account,
    required StakeholderRole role,
    String? note,
  }) async {
    final accountResult = await registerAccount(account);
    if (accountResult is Failure<RegisterAccountData>) {
      return ApiResult.failure(accountResult.error);
    }
    final created = (accountResult as Success<RegisterAccountData>).data;

    return addStakeholderLink(
      projectId,
      AddStakeholderLinkRequest(
        accountId: created.account.id,
        role: role,
        // The inlined contact, if the form supplied one. `contacts` is
        // absent (not null) when none were sent, hence the empty-safe read.
        primaryContactId: created.contacts.isEmpty
            ? null
            : created.contacts.first.id,
        note: note,
      ),
    );
  }

  /// **"Company already on this project" branch — two calls.**
  ///
  /// The second person a rep meets usually works for a company already
  /// linked to the project, so the flow offers those first (from
  /// `GET /projects/{id}/stakeholders`) rather than creating a duplicate
  /// account. Files the new person under that existing account, then links
  /// them in their own role.
  ///
  /// Note the account may already be linked in a *different* role — that's
  /// allowed ("one account holding two roles: ✅"). Only the same
  /// (project, account, role) triple is refused, as
  /// `409 STAKEHOLDER_ALREADY_LINKED`.
  Future<ApiResult<StakeholderLinkView>> addStakeholderToExistingCompany({
    required String projectId,
    required String accountId,
    required AddContactRequest contact,
    required StakeholderRole role,
    String? note,
  }) async {
    final contactResult = await addContact(contact);
    if (contactResult is Failure<ContactView>) {
      return ApiResult.failure(contactResult.error);
    }
    final createdContact = (contactResult as Success<ContactView>).data;

    return addStakeholderLink(
      projectId,
      AddStakeholderLinkRequest(
        accountId: accountId,
        role: role,
        primaryContactId: createdContact.id,
        note: note,
      ),
    );
  }

  Future<ApiResult<StakeholderLinkView>> addStakeholderLink(
    String projectId,
    AddStakeholderLinkRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.addStakeholderLink(
        projectId,
        request,
      );
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// Active first, then newest (server-ordered); `includeClosed` adds ended
  /// links — "how 'who was the main contractor before this one' is
  /// answered."
  Future<ApiResult<List<StakeholderLinkView>>> getStakeholderLinks(
    String projectId, {
    bool includeClosed = false,
  }) async {
    try {
      final response = await _apiService.getStakeholderLinks(
        projectId,
        includeClosed: includeClosed,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `primaryContactId`/`note` only — the role can't change through this
  /// route (use [replaceStakeholderLink]).
  Future<ApiResult<StakeholderLinkView>> patchStakeholderLink(
    String projectId,
    String linkId,
    PatchStakeholderLinkRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.patchStakeholderLink(
        projectId,
        linkId,
        request,
      );
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// Closes with an end date — never deletes (S-E2).
  Future<ApiResult<StakeholderLinkView>> closeStakeholderLink(
    String projectId,
    String linkId,
    CloseStakeholderLinkRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.closeStakeholderLink(
        projectId,
        linkId,
        request,
      );
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// Rule SH4 — one business event, one transaction: closes the outgoing
  /// link, opens the incoming account in the same role, moves the
  /// decision-maker flag if the outgoing link held it.
  Future<ApiResult<StakeholderLinkView>> replaceStakeholderLink(
    String projectId,
    String linkId,
    ReplaceStakeholderLinkRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.replaceStakeholderLink(
        projectId,
        linkId,
        request,
      );
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  // ── decision maker ───────────────────────────────────────────────────

  /// Sets **or** moves the flag — the server decides which from whether the
  /// project already has one. Re-flagging the same contact is a no-op.
  Future<ApiResult<DecisionMakerView?>> setDecisionMaker(
    String projectId,
    SetDecisionMakerRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.setDecisionMaker(projectId, request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `data: null` when none is flagged — an ordinary state, not an error.
  Future<ApiResult<DecisionMakerView?>> getDecisionMaker(
    String projectId,
  ) async {
    try {
      final response = await _apiService.getDecisionMaker(projectId);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// Refused from `ENGAGEMENT` onwards (`DECISION_MAKER_REQUIRED_AT_STAGE`)
  /// — the flag is the Engagement gate, so emptying it after would leave
  /// the project in a stage it no longer qualifies for.
  Future<ApiResult<DecisionMakerView?>> removeDecisionMaker(
    String projectId,
    ReasonRequest request,
  ) async {
    try {
      request.validate();
      final response = await _apiService.removeDecisionMaker(
        projectId,
        request,
      );
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return _validationFailure(e);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<DecisionMakerHistoryEntry>>> getDecisionMakerHistory(
    String projectId, {
    int? page,
    int? limit,
  }) async {
    try {
      final response = await _apiService.getDecisionMakerHistory(
        projectId,
        page: page,
        limit: limit,
      );
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
