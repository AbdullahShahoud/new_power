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
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_dialog.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/contact_view.dart';
import '../../data/models/omit.dart';
import '../../data/models/patch_contact_request.dart';
import '../../data/models/set_decision_maker_request.dart';
import '../../logic/accounts_bloc/accounts_bloc.dart';
import '../../logic/accounts_bloc/accounts_event.dart';
import '../../logic/accounts_bloc/accounts_state.dart';
import '../../logic/stakeholder_mutation_status.dart';
import '../../logic/stakeholders_bloc/stakeholders_bloc.dart';
import '../../logic/stakeholders_bloc/stakeholders_event.dart';
import '../../logic/stakeholders_bloc/stakeholders_state.dart';

/// `GET /accounts/{id}/contacts` (A5) — everyone this rep has recorded at
/// one company on this project, with add / edit / make-decision-maker.
///
/// **The roster is narrowed to the rep's own contacts.** A rep who added
/// nobody here sees an empty list, not an error — and the account row's
/// `contactCount` counts *everyone*, so the two legitimately disagree.
/// That's why no "showing X of Y" is rendered anywhere on this screen.
class AccountContactsScreen extends StatelessWidget {
  final String projectId;
  final String accountId;
  final String accountName;

  const AccountContactsScreen({
    super.key,
    required this.projectId,
    required this.accountId,
    required this.accountName,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AccountsBloc>()
            ..add(AccountsEvent.contactsListRequested(accountId)),
        ),
        BlocProvider(create: (_) => getIt<StakeholdersBloc>()),
      ],
      child: _AccountContactsView(
        projectId: projectId,
        accountId: accountId,
        accountName: accountName,
      ),
    );
  }
}

class _AccountContactsView extends StatelessWidget {
  final String projectId;
  final String accountId;
  final String accountName;

  const _AccountContactsView({
    required this.projectId,
    required this.accountId,
    required this.accountName,
  });

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _openAddContact(BuildContext context) async {
    final bloc = context.read<AccountsBloc>();
    final created = await context.pushNamed(
      Routes.addContactScreen,
      arguments: {'accountId': accountId},
    );
    if (created is ContactView) {
      bloc.add(AccountsEvent.contactsListRequested(accountId));
    }
  }

  /// Only the fields `PATCH /contacts/{id}` accepts. `company` is absent by
  /// design — it's the raw capture of what the person said and is not
  /// editable; the account name wins on read anyway.
  Future<void> _openEdit(BuildContext context, ContactView contact) async {
    final bloc = context.read<AccountsBloc>();
    final firstName = TextEditingController(text: contact.firstName);
    final lastName = TextEditingController(text: contact.lastName);
    final position = TextEditingController(text: contact.position ?? '');
    final phone = TextEditingController(text: contact.phone ?? '');
    final formKey = GlobalKey<FormState>();

    final saved = await AppDialog.show<bool>(
      context: context,
      title: context.tr('contact_edit_title'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
              hintText: context.tr('add_contact_first_name_hint'),
              controller: firstName,
              validator: (v) => (v ?? '').trim().isEmpty
                  ? context.tr('add_contact_name_error')
                  : null,
            ),
            verticalSpace(10.h),
            AppTextField(
              hintText: context.tr('add_contact_last_name_hint'),
              controller: lastName,
              validator: (v) => (v ?? '').trim().isEmpty
                  ? context.tr('add_contact_name_error')
                  : null,
            ),
            verticalSpace(10.h),
            AppTextField(
              hintText: context.tr('add_contact_position_hint'),
              controller: position,
            ),
            verticalSpace(10.h),
            AppTextField(
              hintText: context.tr('add_contact_phone_hint'),
              controller: phone,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
      actions: [
        AppDialogButton.secondary(
          label: context.tr('cancel'),
          onPressed: () => context.pop(),
        ),
        AppDialogButton.primary(
          label: context.tr('confirm'),
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            context.pop(true);
          },
        ),
      ],
    );
    if (saved != true) return;

    // Emptied optional boxes send `null` (clear it); untouched ones would
    // send `omit`, but this dialog always shows both so a diff isn't needed.
    bloc.add(
      AccountsEvent.contactPatchSubmitted(
        contactId: contact.id,
        request: PatchContactRequest(
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          position: position.text.trim().isEmpty ? null : position.text.trim(),
          phone: phone.text.trim().isEmpty ? null : phone.text.trim(),
          notes: omit,
        ),
      ),
    );
  }

  /// `PUT /projects/{id}/decision-maker`. The contact's account must have a
  /// live link on this project — it does, since this screen is only ever
  /// opened from one of the project's own stakeholders.
  Future<void> _setDecisionMaker(
    BuildContext context,
    ContactView contact,
  ) async {
    final bloc = context.read<StakeholdersBloc>();
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    // A reason is required on every *move*, and omitted when naming the
    // first one. The screen can't know which case it's in without the
    // current flag, so it always asks and lets an empty box mean "first".
    final reason = await AppDialog.show<String>(
      context: context,
      title: context.tr('decision_maker_move_reason_title'),
      content: Form(
        key: formKey,
        child: AppTextField(
          hintText: context.tr('decision_maker_move_reason_hint'),
          controller: controller,
          maxLines: 3,
          validator: (value) {
            final trimmed = value?.trim() ?? '';
            if (trimmed.isEmpty) return null;
            if (trimmed.length < 10 || trimmed.length > 500) {
              return context.tr('decision_maker_move_reason_error');
            }
            return null;
          },
        ),
      ),
      actions: [
        AppDialogButton.secondary(
          label: context.tr('cancel'),
          onPressed: () => context.pop(),
        ),
        AppDialogButton.primary(
          label: context.tr('confirm'),
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            context.pop(controller.text.trim());
          },
        ),
      ],
    );
    if (reason == null) return;

    bloc.add(
      StakeholdersEvent.decisionMakerSetSubmitted(
        projectId: projectId,
        request: SetDecisionMakerRequest(
          contactId: contact.id,
          reason: reason.isEmpty ? null : reason,
        ),
      ),
    );
  }

  Future<void> _openActions(BuildContext context, ContactView contact) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (sheetContext) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: Text(sheetContext.tr('contact_action_edit')),
              onTap: () => sheetContext.pop('edit'),
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium_outlined),
              title: Text(sheetContext.tr('contact_action_decision_maker')),
              onTap: () => sheetContext.pop('decision'),
            ),
            verticalSpace(8.h),
          ],
        ),
      ),
    );
    if (!context.mounted || action == null) return;
    if (action == 'edit') {
      await _openEdit(context, contact);
    } else {
      await _setDecisionMaker(context, contact);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MultiBlocListener(
      listeners: [
        BlocListener<AccountsBloc, AccountsState>(
          listenWhen: (p, c) =>
              p.contactMutationStatus != c.contactMutationStatus,
          listener: (context, state) {
            if (state.contactMutationStatus ==
                StakeholderMutationStatus.success) {
              _showSnack(context, context.tr('contact_saved'));
            } else if (state.contactMutationStatus !=
                    StakeholderMutationStatus.idle &&
                state.contactMutationStatus !=
                    StakeholderMutationStatus.inProgress) {
              _showSnack(
                context,
                state.contactMutationErrorMessage ??
                    context.tr('error_unexpected'),
              );
            }
          },
        ),
        BlocListener<StakeholdersBloc, StakeholdersState>(
          listenWhen: (p, c) =>
              p.decisionMakerMutationStatus != c.decisionMakerMutationStatus,
          listener: (context, state) {
            if (state.decisionMakerMutationStatus ==
                StakeholderMutationStatus.success) {
              _showSnack(context, context.tr('decision_maker_set_done'));
              // Tells the project detail to re-read: its decision-maker
              // card is now stale.
              context.pop(true);
            } else if (state.decisionMakerMutationStatus !=
                    StakeholderMutationStatus.idle &&
                state.decisionMakerMutationStatus !=
                    StakeholderMutationStatus.inProgress) {
              _showSnack(
                context,
                state.decisionMakerMutationErrorMessage ??
                    context.tr('error_unexpected'),
              );
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: accountName),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 8.h),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: PressableScale(
                    onTap: () => _openAddContact(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person_add_alt_1_outlined,
                          size: 18.sp,
                          color: colors.brand600,
                        ),
                        horizontalSpace(6),
                        Text(
                          context.tr('contact_picker_add_cta'),
                          style: context.textStyles.smBold.copyWith(
                            color: colors.brand600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<AccountsBloc, AccountsState>(
                  builder: (context, state) {
                    return switch (state.contactsStatus) {
                      ContactsFeedStatus.initial ||
                      ContactsFeedStatus.loading => const ShimmerCardList(),
                      ContactsFeedStatus.networkError => Center(
                        child: Text(
                          state.contactsErrorMessage ??
                              context.tr('error_unexpected'),
                          style: context.textStyles.smMedium,
                        ),
                      ),
                      ContactsFeedStatus.empty => EmptyState(
                        icon: Icons.people_outline,
                        title: context.tr('contact_picker_empty_title'),
                        subtitle: context.tr('contact_picker_empty_subtitle'),
                      ),
                      ContactsFeedStatus.loaded => ListView.builder(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) {
                          final contact = state.contacts[index];
                          return _ContactRow(
                            contact: contact,
                            onTap: () => _openActions(context, contact),
                          );
                        },
                      ),
                    };
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final ContactView contact;
  final VoidCallback onTap;

  const _ContactRow({required this.contact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: AppShadows.card,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contact.fullName, style: context.textStyles.smBold),
                  if (contact.position != null) ...[
                    verticalSpace(2.h),
                    Text(
                      contact.position!,
                      style: context.textStyles.xsMedium,
                    ),
                  ],
                  if (contact.phone != null) ...[
                    verticalSpace(2.h),
                    Text(
                      contact.phone!,
                      style: context.textStyles.xsMedium.copyWith(
                        color: colors.ink400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (contact.isPrimary)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: colors.statusWon.badgeBg,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(
                  context.tr('contact_picker_primary'),
                  style: context.textStyles.xsSemibold.copyWith(
                    color: colors.statusWon.badgeText,
                  ),
                ),
              ),
            horizontalSpace(6),
            Icon(
              Icons.more_vert_rounded,
              size: 18.sp,
              color: colors.textColor70,
            ),
          ],
        ),
      ),
    );
  }
}
