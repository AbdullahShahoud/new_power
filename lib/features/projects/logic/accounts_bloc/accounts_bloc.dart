import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_result.dart';
import '../../data/models/account_view.dart';
import '../../data/repo/stakeholders_repository.dart';
import '../stakeholder_mutation_status.dart';
import 'accounts_event.dart';
import 'accounts_state.dart';

/// Phase 6 — account search/create + a rep's own contacts under one
/// account. Fresh per screen (factory), same as every other module Bloc.
class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final StakeholdersRepository _repository;

  AccountsBloc(this._repository) : super(const AccountsState()) {
    on<AccountSearchRequested>(_onSearchRequested);
    on<AccountRegisterSubmitted>(_onRegisterSubmitted);
    on<AccountContactsListRequested>(_onContactsListRequested);
    on<AccountContactAddSubmitted>(_onContactAddSubmitted);
    on<AccountContactPatchSubmitted>(_onContactPatchSubmitted);
    on<AccountContactArchiveSubmitted>(_onContactArchiveSubmitted);
    on<AccountContactAccountSet>(_onContactAccountSet);
    on<AccountClassified>(_onAccountClassified);
  }

  /// Tags an account in place and patches the row locally, so the picker's
  /// list reflects it without a re-search. A `409 ALREADY_CLASSIFIED` is
  /// already mapped to success by the repository — the account ends up
  /// carrying the classification either way, which is all the caller wanted.
  Future<void> _onAccountClassified(
    AccountClassified event,
    Emitter<AccountsState> emit,
  ) async {
    emit(
      state.copyWith(
        registerStatus: StakeholderMutationStatus.inProgress,
        registerErrorMessage: null,
      ),
    );
    final result = await _repository.classifyAccount(
      event.accountId,
      event.classification,
    );
    switch (result) {
      case Success(data: final created):
        final updated = [
          for (final account in state.accounts)
            if (account.id == event.accountId)
              account.copyWith(
                classifications: [
                  ...account.classifications,
                  created ??
                      AccountClassificationView(
                        classification: event.classification,
                      ),
                ],
              )
            else
              account,
        ];
        emit(
          state.copyWith(
            registerStatus: StakeholderMutationStatus.success,
            accounts: updated,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            registerStatus: stakeholderMutationStatusFor(error),
            registerErrorMessage: error.message,
          ),
        );
    }
  }

  /// Files an unfiled person under an account, or moves a misfiled one.
  /// Shares the contact-mutation state because it is one from the UI's
  /// point of view — the row updates in place either way.
  Future<void> _onContactAccountSet(
    AccountContactAccountSet event,
    Emitter<AccountsState> emit,
  ) async {
    emit(
      state.copyWith(
        contactMutationStatus: StakeholderMutationStatus.inProgress,
        contactMutationErrorMessage: null,
      ),
    );
    final result = await _repository.setContactAccount(
      event.contactId,
      event.accountId,
    );
    _emitContactMutationResult(result, emit);
  }

  Future<void> _onSearchRequested(
    AccountSearchRequested event,
    Emitter<AccountsState> emit,
  ) async {
    final query = event.search.trim();
    // With no query *and* no classification there is nothing to ask for —
    // the API would answer with an empty page, so skip the round trip and
    // sit in the "type something" state.
    if (query.isEmpty && event.classification == null) {
      emit(
        state.copyWith(
          searchStatus: AccountSearchStatus.initial,
          accounts: const [],
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        searchStatus: AccountSearchStatus.loading,
        searchErrorMessage: null,
      ),
    );
    // `search` and `classification` are mutually exclusive server-side. A
    // typed query wins: the rep is looking for something specific, and the
    // results are then offered a "classify this one" action instead.
    final result = await _repository.searchAccounts(
      search: query.isEmpty ? null : query,
      classification: query.isEmpty ? event.classification : null,
    );
    switch (result) {
      case Success(data: final accounts):
        emit(
          state.copyWith(
            searchStatus: accounts.isEmpty
                ? AccountSearchStatus.empty
                : AccountSearchStatus.loaded,
            accounts: accounts,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            searchStatus: AccountSearchStatus.networkError,
            searchErrorMessage: error.message,
          ),
        );
    }
  }

  Future<void> _onRegisterSubmitted(
    AccountRegisterSubmitted event,
    Emitter<AccountsState> emit,
  ) async {
    emit(
      state.copyWith(
        registerStatus: StakeholderMutationStatus.inProgress,
        registerErrorMessage: null,
      ),
    );
    final result = await _repository.registerAccount(event.request);
    switch (result) {
      case Success(data: final created):
        emit(
          state.copyWith(
            registerStatus: StakeholderMutationStatus.success,
            lastRegisteredAccount: created.account,
            // Any inlined contacts came back on the same response, so a
            // caller that created a company *and* its first person doesn't
            // need a follow-up roster fetch to learn their ids.
            contacts: created.contacts,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            registerStatus: stakeholderMutationStatusFor(error),
            registerErrorMessage: error.message,
          ),
        );
    }
  }

  Future<void> _onContactsListRequested(
    AccountContactsListRequested event,
    Emitter<AccountsState> emit,
  ) async {
    emit(
      state.copyWith(
        contactsStatus: ContactsFeedStatus.loading,
        contactsErrorMessage: null,
      ),
    );
    final result = await _repository.getAccountContacts(event.accountId);
    switch (result) {
      case Success(data: final contacts):
        emit(
          state.copyWith(
            contactsStatus: contacts.isEmpty
                ? ContactsFeedStatus.empty
                : ContactsFeedStatus.loaded,
            contacts: contacts,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            contactsStatus: ContactsFeedStatus.networkError,
            contactsErrorMessage: error.message,
          ),
        );
    }
  }

  Future<void> _onContactAddSubmitted(
    AccountContactAddSubmitted event,
    Emitter<AccountsState> emit,
  ) async {
    emit(
      state.copyWith(
        contactMutationStatus: StakeholderMutationStatus.inProgress,
        contactMutationErrorMessage: null,
      ),
    );
    final result = await _repository.addContact(event.request);
    _emitContactMutationResult(result, emit);
  }

  Future<void> _onContactPatchSubmitted(
    AccountContactPatchSubmitted event,
    Emitter<AccountsState> emit,
  ) async {
    emit(
      state.copyWith(
        contactMutationStatus: StakeholderMutationStatus.inProgress,
        contactMutationErrorMessage: null,
      ),
    );
    final result = await _repository.patchContact(event.contactId, event.request);
    _emitContactMutationResult(result, emit);
  }

  Future<void> _onContactArchiveSubmitted(
    AccountContactArchiveSubmitted event,
    Emitter<AccountsState> emit,
  ) async {
    emit(
      state.copyWith(
        contactMutationStatus: StakeholderMutationStatus.inProgress,
        contactMutationErrorMessage: null,
      ),
    );
    final result = await _repository.archiveContact(
      event.contactId,
      event.request,
    );
    _emitContactMutationResult(result, emit);
  }

  void _emitContactMutationResult(
    ApiResult<dynamic> result,
    Emitter<AccountsState> emit,
  ) {
    switch (result) {
      case Success(data: final contact):
        final updatedContacts = [...state.contacts];
        final index = updatedContacts.indexWhere((c) => c.id == contact.id);
        if (index >= 0) {
          updatedContacts[index] = contact;
        } else {
          updatedContacts.add(contact);
        }
        emit(
          state.copyWith(
            contactMutationStatus: StakeholderMutationStatus.success,
            lastMutatedContact: contact,
            contacts: updatedContacts,
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            contactMutationStatus: stakeholderMutationStatusFor(error),
            contactMutationErrorMessage: error.message,
          ),
        );
    }
  }
}
