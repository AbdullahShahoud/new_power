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
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/contact_view.dart';
import '../../logic/accounts_bloc/accounts_bloc.dart';
import '../../logic/accounts_bloc/accounts_event.dart';
import '../../logic/accounts_bloc/accounts_state.dart';

/// stakeholders.md `/accounts/{id}/contacts` — "the people **they** added
/// there." Pops with the selected `ContactView`, or `null`. Used for
/// `primaryContactId` (stakeholder linking) and `contactId` (decision
/// maker) — "a rep who cannot record the purchasing manager they just met
/// cannot complete either" (SH6's argument extended to people).
class ContactPickerScreen extends StatelessWidget {
  final String accountId;
  const ContactPickerScreen({super.key, required this.accountId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccountsBloc>()
        ..add(AccountsEvent.contactsListRequested(accountId)),
      child: _ContactPickerView(accountId: accountId),
    );
  }
}

class _ContactPickerView extends StatelessWidget {
  final String accountId;
  const _ContactPickerView({required this.accountId});

  Future<void> _openAddContact(BuildContext context) async {
    final created = await context.pushNamed(
      Routes.addContactScreen,
      arguments: {'accountId': accountId},
    );
    if (created is ContactView && context.mounted) {
      context.pop(created);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: context.tr('contact_picker_title')),
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
                        return _ContactCard(
                          contact: contact,
                          onTap: () => context.pop(contact),
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
    );
  }
}

class _ContactCard extends StatelessWidget {
  final ContactView contact;
  final VoidCallback onTap;
  const _ContactCard({required this.contact, required this.onTap});

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
                  Text(
                    '${contact.firstName} ${contact.lastName}',
                    style: context.textStyles.smBold,
                  ),
                  if (contact.position != null) ...[
                    verticalSpace(2.h),
                    Text(
                      contact.position!,
                      style: context.textStyles.xsMedium,
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
          ],
        ),
      ),
    );
  }
}
