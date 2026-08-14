import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../data/models/account_view.dart';
import '../../data/models/contact_view.dart';
import '../../data/models/replace_stakeholder_link_request.dart';
import '../../logic/stakeholder_mutation_status.dart';
import '../../logic/stakeholders_bloc/stakeholders_bloc.dart';
import '../../logic/stakeholders_bloc/stakeholders_event.dart';
import '../../logic/stakeholders_bloc/stakeholders_state.dart';

/// stakeholders.md `POST /projects/{projectId}/stakeholders/{linkId}/replace`
/// (rule SH4). `outgoingAccountName`/`role` are display-only context passed
/// in from the row the rep tapped. Pops `true` on success.
class ReplaceStakeholderLinkScreen extends StatelessWidget {
  final String projectId;
  final String linkId;
  final String outgoingAccountName;
  final String roleLabel;

  const ReplaceStakeholderLinkScreen({
    super.key,
    required this.projectId,
    required this.linkId,
    required this.outgoingAccountName,
    required this.roleLabel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StakeholdersBloc>(),
      child: _ReplaceStakeholderLinkView(
        projectId: projectId,
        linkId: linkId,
        outgoingAccountName: outgoingAccountName,
        roleLabel: roleLabel,
      ),
    );
  }
}

class _ReplaceStakeholderLinkView extends StatefulWidget {
  final String projectId;
  final String linkId;
  final String outgoingAccountName;
  final String roleLabel;

  const _ReplaceStakeholderLinkView({
    required this.projectId,
    required this.linkId,
    required this.outgoingAccountName,
    required this.roleLabel,
  });

  @override
  State<_ReplaceStakeholderLinkView> createState() =>
      _ReplaceStakeholderLinkViewState();
}

class _ReplaceStakeholderLinkViewState
    extends State<_ReplaceStakeholderLinkView> {
  final _formKey = GlobalKey<FormState>();
  final _noteController = TextEditingController();
  final _reasonController = TextEditingController();
  AccountView? _newAccount;
  ContactView? _newPrimaryContact;

  @override
  void dispose() {
    _noteController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pickAccount() async {
    final picked = await context.pushNamed(Routes.accountPickerScreen);
    if (picked is AccountView) {
      setState(() {
        _newAccount = picked;
        _newPrimaryContact = null;
      });
    }
  }

  Future<void> _pickContact() async {
    final account = _newAccount;
    if (account == null) return;
    final picked = await context.pushNamed(
      Routes.contactPickerScreen,
      arguments: {'accountId': account.id},
    );
    if (picked is ContactView) {
      setState(() => _newPrimaryContact = picked);
    }
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final newAccount = _newAccount;
    if (newAccount == null) {
      _showSnack(context.tr('replace_stakeholder_account_required'));
      return;
    }
    final note = _noteController.text.trim();
    context.read<StakeholdersBloc>().add(
      StakeholdersEvent.linkReplaceSubmitted(
        projectId: widget.projectId,
        linkId: widget.linkId,
        request: ReplaceStakeholderLinkRequest(
          newAccountId: newAccount.id,
          newPrimaryContactId: _newPrimaryContact?.id,
          note: note.isEmpty ? null : note,
          reason: _reasonController.text.trim(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<StakeholdersBloc, StakeholdersState>(
      listenWhen: (previous, current) =>
          previous.linkMutationStatus != current.linkMutationStatus,
      listener: (context, state) {
        switch (state.linkMutationStatus) {
          case StakeholderMutationStatus.success:
            context.pop(true);
          case StakeholderMutationStatus.inProgress:
          case StakeholderMutationStatus.idle:
            break;
          default:
            _showSnack(
              state.linkMutationErrorMessage ??
                  context.tr('error_unexpected'),
            );
        }
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: context.tr('replace_stakeholder_title')),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context
                              .tr('replace_stakeholder_outgoing')
                              .replaceAll('{account}', widget.outgoingAccountName)
                              .replaceAll('{role}', widget.roleLabel),
                          style: context.textStyles.xsMedium.copyWith(
                            color: colors.textColor70,
                          ),
                        ),
                        verticalSpace(16.h),
                        Text(
                          context.tr('replace_stakeholder_new_account'),
                          style: context.textStyles.smMedium,
                        ),
                        verticalSpace(6.h),
                        GestureDetector(
                          onTap: _pickAccount,
                          child: Container(
                            height: 44.h,
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: colors.surface,
                              borderRadius: BorderRadius.circular(
                                AppRadius.field,
                              ),
                              border: Border.all(color: colors.ink200),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    _newAccount?.name ??
                                        context.tr(
                                          'replace_stakeholder_new_account_hint',
                                        ),
                                    style: context.textStyles.smRegular
                                        .copyWith(
                                          color: _newAccount == null
                                              ? colors.ink400
                                              : colors.textColor,
                                        ),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  size: 18.sp,
                                  color: colors.textColor70,
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpace(16.h),
                        Text(
                          context.tr('replace_stakeholder_new_contact'),
                          style: context.textStyles.smMedium,
                        ),
                        verticalSpace(6.h),
                        GestureDetector(
                          onTap: _newAccount == null ? null : _pickContact,
                          child: Opacity(
                            opacity: _newAccount == null ? 0.5 : 1,
                            child: Container(
                              height: 44.h,
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                color: colors.surface,
                                borderRadius: BorderRadius.circular(
                                  AppRadius.field,
                                ),
                                border: Border.all(color: colors.ink200),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _newPrimaryContact == null
                                          ? context.tr(
                                              'replace_stakeholder_new_contact_hint',
                                            )
                                          : '${_newPrimaryContact!.firstName} ${_newPrimaryContact!.lastName}',
                                      style: context.textStyles.smRegular
                                          .copyWith(
                                            color: _newPrimaryContact == null
                                                ? colors.ink400
                                                : colors.textColor,
                                          ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    size: 18.sp,
                                    color: colors.textColor70,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(16.h),
                        Text(
                          context.tr('replace_stakeholder_note'),
                          style: context.textStyles.smMedium,
                        ),
                        verticalSpace(6.h),
                        AppTextField(
                          hintText: context.tr(
                            'replace_stakeholder_note_hint',
                          ),
                          controller: _noteController,
                          maxLines: 2,
                        ),
                        verticalSpace(16.h),
                        Text(
                          context.tr('replace_stakeholder_reason'),
                          style: context.textStyles.smMedium,
                        ),
                        verticalSpace(6.h),
                        AppTextField(
                          hintText: context.tr(
                            'replace_stakeholder_reason_hint',
                          ),
                          controller: _reasonController,
                          maxLines: 3,
                          validator: (value) {
                            final trimmed = value?.trim() ?? '';
                            if (trimmed.length < 10 || trimmed.length > 500) {
                              return context.tr(
                                'replace_stakeholder_reason_error',
                              );
                            }
                            return null;
                          },
                        ),
                        verticalSpace(24.h),
                        BlocBuilder<StakeholdersBloc, StakeholdersState>(
                          builder: (context, state) {
                            return AppButton(
                              text: context.tr('replace_stakeholder_submit'),
                              isLoading:
                                  state.linkMutationStatus ==
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
            ],
          ),
        ),
      ),
    );
  }
}
