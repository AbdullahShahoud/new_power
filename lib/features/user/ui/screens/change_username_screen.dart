import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../logic/account_settings_cubit/account_settings_cubit.dart';
import '../../logic/account_settings_cubit/account_settings_state.dart';

/// users.md `PATCH /users/me/username` — **one-time only, permanent.**
///
/// The permanence is stated up front in a warning banner rather than buried
/// in a confirmation dialog after the fact: this is the only irreversible
/// self-service action in the app, and a rep should read it before typing,
/// not after submitting.
///
/// Pops the new username on success so the profile screen can update in
/// place without re-fetching `GET /auth/me`.
class ChangeUsernameScreen extends StatelessWidget {
  final String? currentUsername;

  const ChangeUsernameScreen({super.key, this.currentUsername});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountSettingsCubit>(),
      child: _ChangeUsernameView(currentUsername: currentUsername),
    );
  }
}

class _ChangeUsernameView extends StatefulWidget {
  final String? currentUsername;

  const _ChangeUsernameView({required this.currentUsername});

  @override
  State<_ChangeUsernameView> createState() => _ChangeUsernameViewState();
}

class _ChangeUsernameViewState extends State<_ChangeUsernameView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
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
    if (!_formKey.currentState!.validate()) return;
    context.read<AccountSettingsCubit>().changeUsername(
      _usernameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<AccountSettingsCubit, AccountSettingsState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (newUsername) {
            _showSnack(context.tr('change_username_success'));
            context.pop(newUsername);
          },
          usernameTaken: () =>
              _showSnack(context.tr('change_username_taken'), isError: true),
          usernameAlreadyChanged: () {
            _showSnack(
              context.tr('change_username_already_changed'),
              isError: true,
            );
            context.pop();
          },
          rateLimited: (seconds) => _showSnack(
            context.tr('error_too_many_requests'),
            isError: true,
          ),
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
              AppHeader(title: context.tr('change_username_title')),
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
                          _PermanentWarning(
                            text: context.tr('change_username_permanent'),
                          ),
                          verticalSpace(16.h),
                          if (widget.currentUsername != null) ...[
                            Text(
                              context.tr('change_username_current'),
                              style: context.textStyles.xsMedium,
                            ),
                            Text(
                              widget.currentUsername!,
                              style: context.textStyles.smBold,
                            ),
                            verticalSpace(16.h),
                          ],
                          Text(
                            context.tr('change_username_new'),
                            style: context.textStyles.smMedium,
                          ),
                          verticalSpace(6.h),
                          AppTextField(
                            hintText: context.tr('change_username_new_hint'),
                            controller: _usernameController,
                            validator: (value) {
                              final trimmed = value?.trim() ?? '';
                              if (trimmed.length < 6 || trimmed.length > 30) {
                                return context.tr(
                                  'change_username_length_error',
                                );
                              }
                              if (!RegExp(r'^[a-z0-9]+$').hasMatch(trimmed)) {
                                return context.tr(
                                  'change_username_format_error',
                                );
                              }
                              return null;
                            },
                          ),
                          verticalSpace(6.h),
                          Text(
                            context.tr('change_username_rules'),
                            style: context.textStyles.xsMedium,
                          ),
                          verticalSpace(24.h),
                          BlocBuilder<
                            AccountSettingsCubit,
                            AccountSettingsState
                          >(
                            builder: (context, state) {
                              return AppButton(
                                text: context.tr('change_username_submit'),
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

/// Uses the `statusFollowUp` token (the palette's "attention, not failure"
/// colour) rather than `error` — this is a caution about permanence, not a
/// report that something went wrong.
class _PermanentWarning extends StatelessWidget {
  final String text;

  const _PermanentWarning({required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: colors.statusFollowUp.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.field),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            size: 18.sp,
            color: colors.statusFollowUp.badgeText,
          ),
          horizontalSpace(8),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.xsMedium.copyWith(
                color: colors.statusFollowUp.badgeText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
