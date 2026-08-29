import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/phone_text_field.dart';
import '../../data/models/add_contact_request.dart';
import '../../logic/accounts_bloc/accounts_bloc.dart';
import '../../logic/accounts_bloc/accounts_event.dart';
import '../../logic/accounts_bloc/accounts_state.dart';
import '../../logic/stakeholder_mutation_status.dart';

/// stakeholders.md `POST /accounts/{id}/contacts` — "record a person at
/// that company." Both name parts required. Pops with the created
/// `ContactView` on success.
class AddContactScreen extends StatelessWidget {
  final String accountId;
  const AddContactScreen({super.key, required this.accountId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountsBloc>(),
      child: _AddContactView(accountId: accountId),
    );
  }
}

class _AddContactView extends StatefulWidget {
  final String accountId;
  const _AddContactView({required this.accountId});

  @override
  State<_AddContactView> createState() => _AddContactViewState();
}

class _AddContactViewState extends State<_AddContactView> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _positionController = TextEditingController();
  final _phoneController = TextEditingController();

  /// The dial code lives in the picker's state, so the full number is read
  /// through this key — never off `_phoneController`.
  final _phoneFieldKey = GlobalKey<PhoneTextFieldState>();
  final _emailController = TextEditingController();
  bool _isPrimary = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _positionController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  String? _textOrNull(TextEditingController controller) {
    final trimmed = controller.text.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final request = AddContactRequest(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      // The account now travels inside the body rather than the path —
      // `POST /contacts` accepts an unfiled person too, though this screen
      // is always opened from an account so it always has one.
      accountId: widget.accountId,
      position: _textOrNull(_positionController),
      // Assembled with its dial code — see PhoneTextField. Reading the
      // controller alone would post a local number with no country on it.
      phone: _phoneController.text.trim().isEmpty
          ? null
          : (_phoneFieldKey.currentState?.fullPhoneNumber ??
                    _phoneController.text)
                .trim(),
      email: _textOrNull(_emailController),
      isPrimary: _isPrimary,
    );
    context.read<AccountsBloc>().add(
      AccountsEvent.contactAddSubmitted(request: request),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<AccountsBloc, AccountsState>(
      listenWhen: (previous, current) =>
          previous.contactMutationStatus != current.contactMutationStatus,
      listener: (context, state) {
        switch (state.contactMutationStatus) {
          case StakeholderMutationStatus.success:
            context.pop(state.lastMutatedContact);
          case StakeholderMutationStatus.inProgress:
          case StakeholderMutationStatus.idle:
            break;
          default:
            _showSnack(
              state.contactMutationErrorMessage ??
                  context.tr('error_unexpected'),
            );
        }
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: context.tr('add_contact_title')),
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
                          _Label(context.tr('add_contact_first_name')),
                          AppTextField(
                            hintText: context.tr(
                              'add_contact_first_name_hint',
                            ),
                            controller: _firstNameController,
                            validator: (value) {
                              if ((value ?? '').trim().isEmpty) {
                                return context.tr('add_contact_name_error');
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('add_contact_last_name')),
                          AppTextField(
                            hintText: context.tr(
                              'add_contact_last_name_hint',
                            ),
                            controller: _lastNameController,
                            validator: (value) {
                              if ((value ?? '').trim().isEmpty) {
                                return context.tr('add_contact_name_error');
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16.h),
                          _Label(
                            context.tr('add_contact_position'),
                            optional: true,
                          ),
                          AppTextField(
                            hintText: context.tr('add_contact_position_hint'),
                            controller: _positionController,
                          ),
                          verticalSpace(16.h),
                          _Label(
                            context.tr('add_contact_phone'),
                            optional: true,
                          ),
                          PhoneTextField(
                            key: _phoneFieldKey,
                            controller: _phoneController,
                            hintText: context.tr('add_contact_phone_hint'),
                          ),
                          verticalSpace(16.h),
                          _Label(
                            context.tr('add_contact_email'),
                            optional: true,
                          ),
                          AppTextField(
                            hintText: context.tr('add_contact_email_hint'),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          verticalSpace(16.h),
                          Row(
                            children: [
                              Switch(
                                value: _isPrimary,
                                activeTrackColor: colors.brand500,
                                onChanged: (value) =>
                                    setState(() => _isPrimary = value),
                              ),
                              horizontalSpace(8),
                              Expanded(
                                child: Text(
                                  context.tr('add_contact_is_primary'),
                                  style: context.textStyles.smMedium,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(24.h),
                          BlocBuilder<AccountsBloc, AccountsState>(
                            builder: (context, state) {
                              return AppButton(
                                text: context.tr('add_contact_submit'),
                                isLoading:
                                    state.contactMutationStatus ==
                                    StakeholderMutationStatus.inProgress,
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
  final bool optional;
  const _Label(this.label, {this.optional = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Row(
        children: [
          Text(label, style: context.textStyles.smMedium),
          if (optional) ...[
            horizontalSpace(4),
            Text(
              context.tr('projects_register_optional'),
              style: context.textStyles.xsMedium,
            ),
          ],
        ],
      ),
    );
  }
}
