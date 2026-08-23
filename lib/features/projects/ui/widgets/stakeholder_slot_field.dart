import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/account_view.dart';
import '../../data/models/enums.dart';
import '../../data/models/register_project_request.dart';
import '../../data/repo/stakeholders_repository.dart';

/// What one slot currently holds. `null` means the rep has not filled it.
///
/// Deliberately not a `ProjectStakeholderRefDto`: the DTO's role comes from
/// the slot, not from anything the rep chooses, so keeping the two apart
/// stops the UI from ever inventing a role.
class StakeholderSlotValue {
  /// Set when the rep picked an account out of the search results.
  final AccountView? existing;

  /// Set when the rep is naming a company/person that is not in the
  /// directory yet.
  final String? newAccountName;

  /// The person to create. Optional — an individual owner is an account
  /// with no separate contact.
  final String? firstName;
  final String? lastName;
  final String? phone;

  const StakeholderSlotValue({
    this.existing,
    this.newAccountName,
    this.firstName,
    this.lastName,
    this.phone,
  });

  bool get isEmpty => existing == null && (newAccountName ?? '').isEmpty;

  String get displayName => existing?.name ?? newAccountName ?? '';

  /// Builds the wire element for this slot.
  ///
  /// The **role is passed in by the slot**, never chosen by the rep — that
  /// is the whole point of a fixed-role slot. And exactly one of
  /// `accountId`/`accountName` is set, which is the rule the server enforces
  /// and `ProjectStakeholderRefDto.validate()` mirrors.
  ProjectStakeholderRefDto? toDto(StakeholderRole role) {
    if (isEmpty) return null;

    final hasContact =
        (firstName ?? '').trim().isNotEmpty &&
        (lastName ?? '').trim().isNotEmpty;
    final contact = hasContact
        ? NewStakeholderContact(
            firstName: firstName!.trim(),
            lastName: lastName!.trim(),
            phone: (phone ?? '').trim().isEmpty ? null : phone!.trim(),
          )
        : null;

    if (existing != null) {
      // Picked from search: the account already exists, so this call only
      // creates the new face and links it to the id that was chosen.
      return ProjectStakeholderRefDto(
        accountId: existing!.id,
        role: role,
        contact: contact,
      );
    }
    // `accountType` is deliberately **not** sent. The company/individual
    // choice was removed from this sheet, so the client has nothing to base
    // it on — and the server already defaults to `COMPANY`. Asserting a type
    // the rep was never asked about would be inventing data; omitting it
    // lets the documented default apply.
    return ProjectStakeholderRefDto(
      accountName: newAccountName!.trim(),
      role: role,
      contact: contact,
    );
  }
}

/// One fixed-role stakeholder slot on the registration form.
///
/// A rep never picks a `StakeholderRole` here. The slot *is* the role —
/// "the developer", "the consulting office", "the contractor" — and the enum
/// value is attached when the request is built. That is what the brief asked
/// for: the role goes into the body without the user being aware of it.
///
/// Tapping the field searches the directory first (`GET /accounts?search=`).
/// Picking a result reuses that account; only if nothing matches does the
/// rep name a new one, which is what keeps near-duplicate accounts out of
/// the directory.
class StakeholderSlotField extends StatelessWidget {
  final String labelKey;
  final StakeholderSlotValue? value;
  final ValueChanged<StakeholderSlotValue?> onChanged;

  /// Whether this slot asks for a person as well as an account. An owner is
  /// often just a name; a contractor is a company you deal with someone at.
  final bool collectsContact;

  const StakeholderSlotField({
    super.key,
    required this.labelKey,
    required this.value,
    required this.onChanged,
    this.collectsContact = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final filled = value != null && !value!.isEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Row(
            children: [
              Text(context.tr(labelKey), style: context.textStyles.smMedium),
              horizontalSpace(4),
              Text(
                context.tr('projects_register_optional'),
                style: context.textStyles.xsMedium,
              ),
            ],
          ),
        ),
        PressableScale(
          onTap: () async {
            final picked = await _openSlotSheet(
              context: context,
              labelKey: labelKey,
              collectsContact: collectsContact,
              initial: value,
            );
            if (picked != null) onChanged(picked.isEmpty ? null : picked);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.field),
              border: Border.all(
                color: filled ? colors.statusWon.core : colors.ink200,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  filled ? Icons.check_circle : Icons.business_outlined,
                  size: 18.sp,
                  color: filled ? colors.statusWon.core : colors.brand500,
                ),
                horizontalSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        filled
                            ? value!.displayName
                            : context.tr('add_stakeholder_pick_hint'),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.smMedium,
                      ),
                      if (filled &&
                          (value!.firstName ?? '').trim().isNotEmpty) ...[
                        verticalSpace(2.h),
                        Text(
                          '${value!.firstName} ${value!.lastName ?? ''}'.trim(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.xsMedium.copyWith(
                            color: colors.ink400,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (filled)
                  PressableScale(
                    onTap: () => onChanged(null),
                    child: Icon(
                      Icons.close_rounded,
                      size: 18.sp,
                      color: colors.ink400,
                    ),
                  )
                else
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 18.sp,
                    color: colors.textColor70,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// The sheet: search, pick, or create — all without leaving the form.
Future<StakeholderSlotValue?> _openSlotSheet({
  required BuildContext context,
  required String labelKey,
  required bool collectsContact,
  required StakeholderSlotValue? initial,
}) {
  return showModalBottomSheet<StakeholderSlotValue>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _SlotSheet(
      labelKey: labelKey,
      collectsContact: collectsContact,
      initial: initial,
    ),
  );
}

class _SlotSheet extends StatefulWidget {
  final String labelKey;
  final bool collectsContact;
  final StakeholderSlotValue? initial;

  const _SlotSheet({
    required this.labelKey,
    required this.collectsContact,
    required this.initial,
  });

  @override
  State<_SlotSheet> createState() => _SlotSheetState();
}

class _SlotSheetState extends State<_SlotSheet> {
  final _searchController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();

  Timer? _debounce;
  List<AccountView> _results = const [];
  bool _searching = false;

  AccountView? _picked;

  /// True once the rep has decided nothing in the results matches. Only then
  /// is a new account offered — searching first is what stops the directory
  /// filling with near-duplicates of the same contractor.
  bool _creatingNew = false;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    if (initial != null) {
      _picked = initial.existing;
      _creatingNew = initial.existing == null && !initial.isEmpty;
      if (initial.newAccountName != null) {
        _searchController.text = initial.newAccountName!;
      }
      _firstNameController.text = initial.firstName ?? '';
      _lastNameController.text = initial.lastName ?? '';
      _phoneController.text = initial.phone ?? '';
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  /// Debounced: the directory shares the same 30-request-per-minute budget
  /// as the catalogue, and a search per keystroke would exhaust it.
  void _onSearchChanged(String value) {
    setState(() {
      _picked = null;
      _creatingNew = false;
    });
    _debounce?.cancel();
    if (value.trim().length < 2) {
      setState(() => _results = const []);
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 400), _runSearch);
  }

  Future<void> _runSearch() async {
    final term = _searchController.text.trim();
    if (term.length < 2) return;
    setState(() => _searching = true);
    final result = await getIt<StakeholdersRepository>().searchAccounts(
      search: term,
    );
    if (!mounted) return;
    setState(() {
      _searching = false;
      _results = result is Success<List<AccountView>>
          ? result.data
          : const [];
    });
  }

  void _submit() {
    if (_picked == null && !_creatingNew) return;
    Navigator.of(context).pop(
      StakeholderSlotValue(
        existing: _picked,
        newAccountName: _picked == null
            ? _searchController.text.trim()
            : null,
        firstName: _firstNameController.text.trim().isEmpty
            ? null
            : _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim().isEmpty
            ? null
            : _lastNameController.text.trim(),
        phone: _phoneController.text.trim().isEmpty
            ? null
            : _phoneController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final term = _searchController.text.trim();
    final canSubmit = _picked != null || (_creatingNew && term.length >= 2);

    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
        child: Column(
          children: [
            Text(
              context.tr(widget.labelKey),
              style: context.textStyles.baseBold,
            ),
            verticalSpace(12.h),
            AppTextField(
              hintText: context.tr('add_stakeholder_search_hint'),
              controller: _searchController,
              onChanged: _onSearchChanged,
              prefixIcon: Icon(Icons.search, color: colors.textColor70),
            ),
            verticalSpace(8.h),
            Expanded(
              child: ListView(
                controller: scrollController,
                children: [
                  if (_searching)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Center(
                        child: SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: colors.brand500,
                          ),
                        ),
                      ),
                    ),
                  for (final account in _results)
                    _AccountRow(
                      account: account,
                      selected: _picked?.id == account.id,
                      onTap: () => setState(() {
                        _picked = account;
                        _creatingNew = false;
                      }),
                    ),

                  // The "create new" affordance sits at the **end of the
                  // results**, so it is only reached after the rep has seen
                  // that nothing matches.
                  if (term.length >= 2 && !_searching)
                    PressableScale(
                      onTap: () => setState(() {
                        _creatingNew = true;
                        _picked = null;
                      }),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: _creatingNew
                              ? colors.brand50
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(AppRadius.field),
                          border: Border.all(
                            color: _creatingNew
                                ? colors.brand300
                                : colors.Color13,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              size: 18.sp,
                              color: colors.brand600,
                            ),
                            horizontalSpace(8),
                            Expanded(
                              child: Text(
                                context
                                    .tr('add_stakeholder_create_named')
                                    .replaceAll('{name}', term),
                                style: context.textStyles.smBold.copyWith(
                                  color: colors.brand600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  // Offered for both branches: a brand-new company needs its
                  // first contact, and an existing account often needs a new
                  // face on this particular project.
                  if (widget.collectsContact && canSubmit) ...[
                    verticalSpace(14.h),
                    Text(
                      context.tr('add_stakeholder_contact_optional'),
                      style: context.textStyles.smMedium,
                    ),
                    verticalSpace(8.h),
                    AppTextField(
                      hintText: context.tr('add_contact_first_name_hint'),
                      controller: _firstNameController,
                    ),
                    verticalSpace(8.h),
                    AppTextField(
                      hintText: context.tr('add_contact_last_name_hint'),
                      controller: _lastNameController,
                    ),
                    verticalSpace(8.h),
                    AppTextField(
                      hintText: context.tr('add_contact_phone_hint'),
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: SizedBox(
                width: double.infinity,
                child: PressableScale(
                  onTap: canSubmit ? _submit : null,
                  child: Container(
                    height: 46.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: canSubmit ? colors.brand500 : colors.ink300,
                      borderRadius: BorderRadius.circular(AppRadius.field),
                    ),
                    child: Text(
                      context.tr('confirm'),
                      style: context.textStyles.smBold.copyWith(
                        color: colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountRow extends StatelessWidget {
  final AccountView account;
  final bool selected;
  final VoidCallback onTap;

  const _AccountRow({
    required this.account,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: selected ? colors.brand50 : colors.page,
          borderRadius: BorderRadius.circular(AppRadius.field),
          border: Border.all(
            color: selected ? colors.brand300 : Colors.transparent,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(account.name, style: context.textStyles.smBold),
                  if (account.city != null) ...[
                    verticalSpace(2.h),
                    Text(
                      account.city!,
                      style: context.textStyles.xsMedium,
                    ),
                  ],
                ],
              ),
            ),
            if (selected)
              Icon(
                Icons.check_circle,
                size: 18.sp,
                color: colors.brand600,
              ),
          ],
        ),
      ),
    );
  }
}
