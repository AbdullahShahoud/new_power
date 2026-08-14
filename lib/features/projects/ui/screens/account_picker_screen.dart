import 'dart:async';

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
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/account_view.dart';
import '../../data/models/enums.dart';
import '../../logic/accounts_bloc/accounts_bloc.dart';
import '../../logic/accounts_bloc/accounts_event.dart';
import '../../logic/accounts_bloc/accounts_state.dart';
import '../widgets/project_enum_labels.dart';

/// directory-mobile-integration.md §6.4 `GET /accounts` — a rep's only
/// account read. Pops with the selected `AccountView`, or `null`.
///
/// Two modes, decided by [classification]:
///
///  - **Unfiltered** (stakeholder linking): opens as a search screen. An
///    empty state before the first query is correct, not a bug — a rep
///    "must say what they are looking for" (SH7, no bulk export).
///  - **Filtered** (Won distributor, Lost competitor): a classification
///    satisfies that requirement on its own, so the list opens *browsable*
///    with every matching account already loaded.
///
/// Because `search` and `classification` are mutually exclusive on the
/// wire, typing a query drops the filter — so results can include accounts
/// that don't carry it yet. Those rows get an inline "classify as …"
/// action, which is how a rep tags the outlet a deal actually went through
/// without leaving the picker.
class AccountPickerScreen extends StatelessWidget {
  /// Restricts (and pre-loads) the list, and enables the inline classify
  /// action. `null` for a plain by-name search.
  final AccountClassification? classification;

  const AccountPickerScreen({super.key, this.classification});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = getIt<AccountsBloc>();
        // A classification is a complete query on its own, so the filtered
        // picker can load immediately instead of waiting for typing.
        if (classification != null) {
          bloc.add(AccountsEvent.searchRequested(classification: classification));
        }
        return bloc;
      },
      child: _AccountPickerView(classification: classification),
    );
  }
}

class _AccountPickerView extends StatefulWidget {
  final AccountClassification? classification;

  const _AccountPickerView({required this.classification});

  @override
  State<_AccountPickerView> createState() => _AccountPickerViewState();
}

class _AccountPickerViewState extends State<_AccountPickerView> {
  final _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      context.read<AccountsBloc>().add(
        AccountsEvent.searchRequested(
          search: value,
          // Falls back to the filter when the box is cleared, so the
          // filtered picker returns to its browsable list rather than an
          // empty screen.
          classification: widget.classification,
        ),
      );
    });
  }

  Future<void> _openRegisterAccount(BuildContext context) async {
    final created = await context.pushNamed(Routes.registerAccountScreen);
    if (created is AccountView && context.mounted) {
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
            AppHeader(title: context.tr('account_picker_title')),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 8.h),
              child: AppTextField(
                hintText: context.tr('account_picker_search_hint'),
                controller: _searchController,
                prefixIcon: Icon(Icons.search, color: colors.textColor70),
                onChanged: _onSearchChanged,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: PressableScale(
                  onTap: () => _openRegisterAccount(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add_circle_outline, size: 18.sp, color: colors.brand600),
                      horizontalSpace(6),
                      Text(
                        context.tr('account_picker_create_cta'),
                        style: context.textStyles.smBold.copyWith(color: colors.brand600),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalSpace(8.h),
            Expanded(
              child: BlocBuilder<AccountsBloc, AccountsState>(
                builder: (context, state) {
                  return switch (state.searchStatus) {
                    AccountSearchStatus.initial => EmptyState(
                      icon: Icons.business_outlined,
                      title: context.tr('account_picker_prompt_title'),
                      subtitle: context.tr('account_picker_prompt_subtitle'),
                    ),
                    AccountSearchStatus.loading => const ShimmerCardList(),
                    AccountSearchStatus.networkError => Center(
                      child: Text(
                        state.searchErrorMessage ?? context.tr('error_unexpected'),
                        style: context.textStyles.smMedium,
                      ),
                    ),
                    AccountSearchStatus.empty => EmptyState(
                      icon: Icons.search_off_outlined,
                      title: context.tr('account_picker_empty_title'),
                      subtitle: context.tr('account_picker_empty_subtitle'),
                    ),
                    AccountSearchStatus.loaded => ListView.builder(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                      itemCount: state.accounts.length,
                      itemBuilder: (context, index) {
                        final account = state.accounts[index];
                        final required = widget.classification;
                        // Only offered when a classification is being asked
                        // for and this account doesn't carry it yet.
                        final needsClassifying =
                            required != null &&
                            !account.hasClassification(required);
                        return _AccountCard(
                          account: account,
                          onTap: () => context.pop(account),
                          classifyAs: needsClassifying ? required : null,
                          onClassify: needsClassifying
                              ? () => context.read<AccountsBloc>().add(
                                  AccountsEvent.accountClassified(
                                    accountId: account.id,
                                    classification: required,
                                  ),
                                )
                              : null,
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

class _AccountCard extends StatelessWidget {
  final AccountView account;
  final VoidCallback onTap;

  /// Set when the picker wants a classification this account lacks — shows
  /// the inline "classify as …" action.
  final AccountClassification? classifyAs;
  final VoidCallback? onClassify;

  const _AccountCard({
    required this.account,
    required this.onTap,
    this.classifyAs,
    this.onClassify,
  });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(account.name, style: context.textStyles.smBold),
                      if (account.city != null) ...[
                        verticalSpace(2.h),
                        Text(account.city!, style: context.textStyles.xsMedium),
                      ],
                    ],
                  ),
                ),
                if (!account.isVerified)
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: colors.statusFollowUp.badgeBg,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Text(
                      context.tr('account_picker_unverified'),
                      style: context.textStyles.xsSemibold.copyWith(
                        color: colors.statusFollowUp.badgeText,
                      ),
                    ),
                  ),
              ],
            ),
            if (account.classifications.isNotEmpty) ...[
              verticalSpace(8.h),
              Wrap(
                spacing: 6.w,
                runSpacing: 6.h,
                children: [
                  for (final c in account.classifications)
                    _ClassificationTag(
                      label: context.tr(c.classification.labelKey),
                      // "Appointed dealer" is worth surfacing; its absence
                      // is *not* a warning — most outlets a rep buys
                      // through are real and unappointed (§6.4).
                      highlighted: c.isAuthorized,
                    ),
                ],
              ),
            ],
            if (classifyAs != null) ...[
              verticalSpace(10.h),
              PressableScale(
                onTap: onClassify,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.local_offer_outlined,
                      size: 14.sp,
                      color: colors.brand600,
                    ),
                    horizontalSpace(4),
                    Text(
                      context
                          .tr('account_picker_classify_as')
                          .replaceAll(
                            '{classification}',
                            context.tr(classifyAs!.labelKey),
                          ),
                      style: context.textStyles.xsSemibold.copyWith(
                        color: colors.brand600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ClassificationTag extends StatelessWidget {
  final String label;
  final bool highlighted;

  const _ClassificationTag({required this.label, required this.highlighted});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: highlighted ? colors.statusWon.badgeBg : colors.ink100,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: context.textStyles.xsSemibold.copyWith(
          color: highlighted ? colors.statusWon.badgeText : colors.ink600,
        ),
      ),
    );
  }
}
