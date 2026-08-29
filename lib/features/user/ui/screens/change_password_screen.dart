import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/password_text_field.dart';
import '../../logic/account_settings_cubit/account_settings_cubit.dart';
import '../../logic/account_settings_cubit/account_settings_state.dart';

/// users.md `PUT /users/me/password`.
///
/// `logoutOtherSessions` is surfaced as a switch rather than hidden at its
/// server default: the doc's side effect (every other device's access *and*
/// refresh tokens blacklisted) is significant enough that a rep should see
/// it stated before it happens.
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountSettingsCubit>(),
      child: const _ChangePasswordView(),
    );
  }
}

class _ChangePasswordView extends StatefulWidget {
  const _ChangePasswordView();

  @override
  State<_ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<_ChangePasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _currentController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _logoutOtherSessions = true;

  /// Set when the server rejects `currentPassword`, so the message lands on
  /// the field that's actually wrong instead of in a detached snackbar.
  String? _currentPasswordError;

  @override
  void dispose() {
    _currentController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _showSnack(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? context.colors.error : null,
      ),
    );
  }

  void _submit() {
    setState(() => _currentPasswordError = null);
    if (!_formKey.currentState!.validate()) return;
    context.read<AccountSettingsCubit>().changePassword(
      currentPassword: _currentController.text,
      newPassword: _newController.text,
      logoutOtherSessions: _logoutOtherSessions,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<AccountSettingsCubit, AccountSettingsState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            _showSnack(context.tr('change_password_success'));
            context.pop();
          },
          incorrectPassword: () {
            setState(
              () => _currentPasswordError = context.tr(
                'change_password_incorrect_current',
              ),
            );
            // Re-run validation so the field paints its error immediately.
            _formKey.currentState!.validate();
          },
          samePassword: () =>
              _showSnack(context.tr('change_password_same'), isError: true),
          error: (message) => _showSnack(
            message.isEmpty ? context.tr('error_unexpected') : message,
            isError: true,
          ),
        );
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: context.tr('change_password_title')),
              Expanded(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Label(context.tr('change_password_current')),
                          // Same control as the sign-in and reset screens:
                          // obscured, LTR, with a reveal toggle. Without the
                          // toggle a rep types three unseeable passwords and
                          // finds out only on submit which one they fumbled.
                          PasswordTextField(
                            hintText: context.tr(
                              'change_password_current_hint',
                            ),
                            controller: _currentController,
                            validator: (value) {
                              if (_currentPasswordError != null) {
                                return _currentPasswordError;
                              }
                              if ((value ?? '').isEmpty) {
                                return context.tr(
                                  'change_password_current_required',
                                );
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('change_password_new')),
                          PasswordTextField(
                            hintText: context.tr('change_password_new_hint'),
                            controller: _newController,
                            // Reuses the same complexity rule the auth
                            // screens already enforce — one source of truth.
                            validator: (value) =>
                                AppValidators.validatePassword(value, context),
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('change_password_confirm')),
                          PasswordTextField(
                            hintText: context.tr(
                              'change_password_confirm_hint',
                            ),
                            controller: _confirmController,
                            validator: (value) =>
                                AppValidators.validateConfirmPassword(
                                  context,
                                  value,
                                  _newController.text,
                                ),
                          ),
                          verticalSpace(16.h),
                          Row(
                            children: [
                              Switch(
                                value: _logoutOtherSessions,
                                activeTrackColor: colors.brand500,
                                onChanged: (value) => setState(
                                  () => _logoutOtherSessions = value,
                                ),
                              ),
                              horizontalSpace(8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.tr(
                                        'change_password_logout_others',
                                      ),
                                      style: context.textStyles.smMedium,
                                    ),
                                    Text(
                                      context.tr(
                                        'change_password_logout_others_hint',
                                      ),
                                      style: context.textStyles.xsMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(24.h),
                          BlocBuilder<
                            AccountSettingsCubit,
                            AccountSettingsState
                          >(
                            builder: (context, state) {
                              return AppButton(
                                text: context.tr('change_password_submit'),
                                isLoading: state.maybeWhen(
                                  loading: () => true,
                                  orElse: () => false,
                                ),
                                onPressed: _submit,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  final String label;
  const _Label(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(label, style: context.textStyles.smMedium),
    );
  }
}
