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
import '../../data/models/enums.dart';
import '../../data/models/register_account_request.dart';
import '../../logic/accounts_bloc/accounts_bloc.dart';
import '../../logic/accounts_bloc/accounts_event.dart';
import '../../logic/accounts_bloc/accounts_state.dart';
import '../../logic/stakeholder_mutation_status.dart';
import '../widgets/option_picker_field.dart';
import '../widgets/project_enum_labels.dart';

/// stakeholders.md `POST /accounts` — "record a company they just met"
/// (SH6). Only `name` is required. Pops with the created `AccountView` on
/// success — the caller (`AccountPickerScreen`) propagates it up as the
/// pick.
class RegisterAccountScreen extends StatelessWidget {
  const RegisterAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountsBloc>(),
      child: const _RegisterAccountView(),
    );
  }
}

class _RegisterAccountView extends StatefulWidget {
  const _RegisterAccountView();

  @override
  State<_RegisterAccountView> createState() => _RegisterAccountViewState();
}

class _RegisterAccountViewState extends State<_RegisterAccountView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _registrationNumberController = TextEditingController();
  final _phoneController = TextEditingController();

  /// The dial code lives in the picker's state, so the full number is read
  /// through this key — never off `_phoneController`.
  final _phoneFieldKey = GlobalKey<PhoneTextFieldState>();
  final _emailController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();

  AccountType _type = AccountType.company;

  @override
  void dispose() {
    _nameController.dispose();
    _registrationNumberController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  String? _textOrNull(TextEditingController controller) {
    final trimmed = controller.text.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final request = RegisterAccountRequest(
      name: _nameController.text.trim(),
      type: _type,
      registrationNumber: _textOrNull(_registrationNumberController),
      // Assembled with its dial code — see PhoneTextField. Reading the
      // controller alone would post a local number with no country on it.
      phone: _phoneController.text.trim().isEmpty
          ? null
          : (_phoneFieldKey.currentState?.fullPhoneNumber ??
                    _phoneController.text)
                .trim(),
      email: _textOrNull(_emailController),
      city: _textOrNull(_cityController),
      addressLine: _textOrNull(_addressController),
      notes: _textOrNull(_notesController),
    );
    context.read<AccountsBloc>().add(AccountsEvent.registerSubmitted(request));
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<AccountsBloc, AccountsState>(
      listenWhen: (previous, current) => previous.registerStatus != current.registerStatus,
      listener: (context, state) {
        switch (state.registerStatus) {
          case StakeholderMutationStatus.success:
            context.pop(state.lastRegisteredAccount);
          case StakeholderMutationStatus.inProgress:
          case StakeholderMutationStatus.idle:
            break;
          default:
            _showSnack(state.registerErrorMessage ?? context.tr('error_unexpected'));
        }
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: context.tr('register_account_title')),
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
                          _Label(context.tr('register_account_name')),
                          AppTextField(
                            hintText: context.tr('register_account_name_hint'),
                            controller: _nameController,
                            validator: (value) {
                              final trimmed = value?.trim() ?? '';
                              if (trimmed.length < 2 || trimmed.length > 200) {
                                return context.tr('register_account_name_error');
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('register_account_type')),
                          OptionPickerField<AccountType>(
                            hintText: context.tr('register_account_type_hint'),
                            value: _type,
                            options: AccountTypeWire.selectable,
                            labelOf: (v) => context.tr(v.labelKey),
                            onChanged: (v) => setState(() => _type = v),
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('register_account_registration_number'), optional: true),
                          AppTextField(
                            hintText: context.tr('register_account_registration_number_hint'),
                            controller: _registrationNumberController,
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('register_account_phone'), optional: true),
                          PhoneTextField(
                            key: _phoneFieldKey,
                            controller: _phoneController,
                            hintText: context.tr('register_account_phone_hint'),
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('register_account_email'), optional: true),
                          AppTextField(
                            hintText: context.tr('register_account_email_hint'),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('register_account_city'), optional: true),
                          AppTextField(
                            hintText: context.tr('register_account_city_hint'),
                            controller: _cityController,
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('register_account_address'), optional: true),
                          AppTextField(
                            hintText: context.tr('register_account_address_hint'),
                            controller: _addressController,
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('register_account_notes'), optional: true),
                          AppTextField(
                            hintText: context.tr('register_account_notes_hint'),
                            controller: _notesController,
                            maxLines: 3,
                          ),
                          verticalSpace(24.h),
                          BlocBuilder<AccountsBloc, AccountsState>(
                            builder: (context, state) {
                              return AppButton(
                                text: context.tr('register_account_submit'),
                                isLoading: state.registerStatus == StakeholderMutationStatus.inProgress,
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
