import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/models/change_password_request.dart';
import '../../data/models/change_username_request.dart';
import '../../data/repo/user_repository.dart';
import 'account_settings_state.dart';

/// users.md self-service. One cubit for both actions — they share a state
/// shape and are never in flight at the same time (each owns its own
/// screen, and each screen gets a fresh instance from the factory).
class AccountSettingsCubit extends Cubit<AccountSettingsState> {
  final UserRepository _userRepository;

  AccountSettingsCubit(this._userRepository)
    : super(const AccountSettingsState.initial());

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    bool logoutOtherSessions = true,
  }) async {
    emit(const AccountSettingsState.loading());
    final result = await _userRepository.changePassword(
      ChangePasswordRequest(
        currentPassword: currentPassword,
        newPassword: newPassword,
        logoutOtherSessions: logoutOtherSessions,
      ),
    );
    if (isClosed) return;
    switch (result) {
      case Success(data: final message):
        emit(AccountSettingsState.success(message: message));
      case Failure(error: final error):
        emit(_mapError(error));
    }
  }

  Future<void> changeUsername(String username) async {
    emit(const AccountSettingsState.loading());
    final result = await _userRepository.changeUsername(
      ChangeUsernameRequest(username: username.trim()),
    );
    if (isClosed) return;
    switch (result) {
      case Success(data: final newUsername):
        emit(AccountSettingsState.success(message: newUsername));
      case Failure(error: final error):
        emit(_mapError(error));
    }
  }

  /// users.md's documented error codes for both routes, mapped onto the
  /// states the screens branch on. Anything unlisted keeps the server's own
  /// message — it's usually more specific than a generic fallback.
  AccountSettingsState _mapError(ApiErrorModel error) {
    switch (error.code) {
      case 'USER_INCORRECT_PASSWORD':
        return const AccountSettingsState.incorrectPassword();
      case 'USER_SAME_PASSWORD':
        return const AccountSettingsState.samePassword();
      case 'USERNAME_ALREADY_EXISTS':
        return const AccountSettingsState.usernameTaken();
      case 'USERNAME_ALREADY_CHANGED':
        return const AccountSettingsState.usernameAlreadyChanged();
      case 'RATE_LIMIT_EXCEEDED':
        return AccountSettingsState.rateLimited(
          retryAfterSeconds: error.retryAfter,
        );
      default:
        return AccountSettingsState.error(error.message ?? '');
    }
  }
}
