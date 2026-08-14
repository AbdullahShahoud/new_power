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
import '../../data/models/contact_view.dart';
import '../../data/models/omit.dart';
import '../../data/models/patch_stakeholder_link_request.dart';
import '../../logic/stakeholder_mutation_status.dart';
import '../../logic/stakeholders_bloc/stakeholders_bloc.dart';
import '../../logic/stakeholders_bloc/stakeholders_event.dart';
import '../../logic/stakeholders_bloc/stakeholders_state.dart';

/// stakeholders.md `PATCH /projects/{projectId}/stakeholders/{linkId}` —
/// "`primaryContactId` and `note` only." The role can't change here (use
/// Replace). Pops `true` on success.
class EditStakeholderLinkScreen extends StatelessWidget {
  final String projectId;
  final String linkId;
  final String accountId;
  final String? initialContactName;
  final String? initialNote;

  const EditStakeholderLinkScreen({
    super.key,
    required this.projectId,
    required this.linkId,
    required this.accountId,
    this.initialContactName,
    this.initialNote,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StakeholdersBloc>(),
      child: _EditStakeholderLinkView(
        projectId: projectId,
        linkId: linkId,
        accountId: accountId,
        initialContactName: initialContactName,
        initialNote: initialNote,
      ),
    );
  }
}

class _EditStakeholderLinkView extends StatefulWidget {
  final String projectId;
  final String linkId;
  final String accountId;
  final String? initialContactName;
  final String? initialNote;

  const _EditStakeholderLinkView({
    required this.projectId,
    required this.linkId,
    required this.accountId,
    required this.initialContactName,
    required this.initialNote,
  });

  @override
  State<_EditStakeholderLinkView> createState() =>
      _EditStakeholderLinkViewState();
}

class _EditStakeholderLinkViewState extends State<_EditStakeholderLinkView> {
  late final _noteController = TextEditingController(
    text: widget.initialNote ?? '',
  );
  ContactView? _newContact;
  String? _contactLabel;

  @override
  void initState() {
    super.initState();
    _contactLabel = widget.initialContactName;
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _pickContact() async {
    final picked = await context.pushNamed(
      Routes.contactPickerScreen,
      arguments: {'accountId': widget.accountId},
    );
    if (picked is ContactView) {
      setState(() {
        _newContact = picked;
        _contactLabel = '${picked.firstName} ${picked.lastName}';
      });
    }
  }

  void _submit() {
    final note = _noteController.text.trim();
    context.read<StakeholdersBloc>().add(
      StakeholdersEvent.linkPatchSubmitted(
        projectId: widget.projectId,
        linkId: widget.linkId,
        request: PatchStakeholderLinkRequest(
          primaryContactId: _newContact?.id ?? omit,
          note: note.isEmpty ? null : note,
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
              AppHeader(title: context.tr('edit_stakeholder_title')),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr('add_stakeholder_primary_contact'),
                        style: context.textStyles.smMedium,
                      ),
                      verticalSpace(6.h),
                      GestureDetector(
                        onTap: _pickContact,
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
                                  _contactLabel ??
                                      context.tr(
                                        'add_stakeholder_primary_contact_hint',
                                      ),
                                  style: context.textStyles.smRegular
                                      .copyWith(
                                        color: _contactLabel == null
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
                        context.tr('add_stakeholder_note'),
                        style: context.textStyles.smMedium,
                      ),
                      verticalSpace(6.h),
                      AppTextField(
                        hintText: context.tr('add_stakeholder_note_hint'),
                        controller: _noteController,
                        maxLines: 3,
                      ),
                      verticalSpace(24.h),
                      BlocBuilder<StakeholdersBloc, StakeholdersState>(
                        builder: (context, state) {
                          return AppButton(
                            text: context.tr('edit_stakeholder_submit'),
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
            ],
          ),
        ),
      ),
    );
  }
}
