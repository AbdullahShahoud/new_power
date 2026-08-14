import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/account_view.dart';
import '../../data/models/contact_view.dart';
import '../stakeholder_mutation_status.dart';

part 'accounts_state.freezed.dart';

enum AccountSearchStatus { initial, loading, loaded, empty, networkError }

enum ContactsFeedStatus { initial, loading, loaded, empty, networkError }

/// Search + create (`AccountPickerScreen`), contacts list + mutation
/// (`ContactPickerScreen`) — two independent sub-machines in one state,
/// same reasoning as every other module Bloc.
@freezed
sealed class AccountsState with _$AccountsState {
  const factory AccountsState({
    // ── search ────────────────────────────────────────────────────────
    @Default(AccountSearchStatus.initial) AccountSearchStatus searchStatus,
    @Default(<AccountView>[]) List<AccountView> accounts,
    String? searchErrorMessage,

    // ── register (create) ────────────────────────────────────────────
    @Default(StakeholderMutationStatus.idle)
    StakeholderMutationStatus registerStatus,
    AccountView? lastRegisteredAccount,
    String? registerErrorMessage,

    // ── contacts (own only, server-scoped) ──────────────────────────
    @Default(ContactsFeedStatus.initial) ContactsFeedStatus contactsStatus,
    @Default(<ContactView>[]) List<ContactView> contacts,
    String? contactsErrorMessage,

    // ── contact mutation (add / patch / archive) ─────────────────────
    @Default(StakeholderMutationStatus.idle)
    StakeholderMutationStatus contactMutationStatus,
    ContactView? lastMutatedContact,
    String? contactMutationErrorMessage,
  }) = _AccountsState;
}
