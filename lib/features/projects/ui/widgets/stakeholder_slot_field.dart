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
import '../../../../core/widget/phone_text_field.dart';
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

  /// Whether a `required` slot is satisfied.
  ///
  /// ⚠️ Deliberately asymmetric, and it must stay in step with the
  /// `contactOk` rule in `_SlotSheetState.build`.
  ///
  /// Picking an **existing** account is enough on its own: the company is
  /// already in the directory with its own contacts, and demanding a fresh
  /// person here is what made the contractor slot impossible to satisfy by
  /// selection — the rep could only ever create a duplicate company.
  ///
  /// Naming a **new** account still requires the whole person, phone
  /// included: nothing else in the system knows who to call at a company
  /// that did not exist a moment ago.
  bool get hasFullContact =>
      existing != null ||
      ((firstName ?? '').trim().isNotEmpty &&
          (lastName ?? '').trim().isNotEmpty &&
          (phone ?? '').trim().isNotEmpty);

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
    // `accountType` is filled in here rather than asked for. The
    // company/individual toggle was removed from this sheet, and every slot
    // on this form names an organisation — the developer, the consulting
    // office, the contractor. Sent explicitly rather than leaning on the
    // server's `COMPANY` default so the body says what it means.
    return ProjectStakeholderRefDto(
      accountName: newAccountName!.trim(),
      accountType: AccountType.company,
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

  /// A slot the project cannot be registered without.
  ///
  /// A required slot demands the *whole* shape — the company name and a
  /// complete person, phone included. Elsewhere the phone is left optional
  /// because a rep standing on site often has the name before the number;
  /// here the number is the point, since this is the party the project will
  /// actually be worked through.
  final bool required;

  const StakeholderSlotField({
    super.key,
    required this.labelKey,
    required this.value,
    required this.onChanged,
    this.collectsContact = true,
    this.required = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final filled = value != null && !value!.isEmpty;
    // A required slot that was filled in before the rule tightened — or via
    // a path that skipped the phone — is shown as incomplete rather than
    // silently accepted.
    final incomplete = required && (!filled || !value!.hasFullContact);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Row(
            children: [
              Text(context.tr(labelKey), style: context.textStyles.smMedium),
              horizontalSpace(4),
              // A required slot said so only by *omitting* the "(optional)"
              // marker the other two carry — which asks the rep to notice
              // an absence. The contractor has always been enforced at
              // submit; this makes it visible before they get there.
              if (required)
                Text(
                  '*',
                  style: context.textStyles.smMedium.copyWith(
                    color: colors.error,
                  ),
                )
              else
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
              requirePhone: required,
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
                color: incomplete
                    ? colors.ink200
                    : (filled ? colors.statusWon.core : colors.ink200),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  filled && !incomplete
                      ? Icons.check_circle
                      : Icons.business_outlined,
                  size: 18.sp,
                  color: filled && !incomplete
                      ? colors.statusWon.core
                      : colors.brand500,
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

/// Characters before the directory is queried at all.
///
/// Four, not two: two letters match half the directory, so the rep pays a
/// request and a wait for a result set that cannot tell them anything. It
/// also gates the "create new" card — offering that against a two-letter
/// term is how near-duplicate accounts get created.
/// Characters required before a search fires.
///
/// Was 4, which is a lot for this directory: the server accepts account
/// names from 2 characters, Arabic company names are routinely short
/// ("بناء", "مها"), and an abbreviation like "MAS" never reached the
/// endpoint at all. Below the threshold the sheet shows neither results nor
/// the create-new row, so a rep typing a three-letter company saw an empty
/// panel and no way forward.
///
/// 2 matches the server's own minimum. The 400 ms debounce is what protects
/// the shared 30-request-per-minute budget, not this number.
const int _kMinSearchChars = 2;

/// The sheet: search, pick, or create — all without leaving the form.
Future<StakeholderSlotValue?> _openSlotSheet({
  required BuildContext context,
  required String labelKey,
  required bool collectsContact,
  required bool requirePhone,
  required StakeholderSlotValue? initial,
}) {
  return showModalBottomSheet<StakeholderSlotValue>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _SlotSheet(
      labelKey: labelKey,
      collectsContact: collectsContact,
      requirePhone: requirePhone,
      initial: initial,
    ),
  );
}

class _SlotSheet extends StatefulWidget {
  final String labelKey;
  final bool collectsContact;

  /// On a required slot the contact is mandatory in full — both names and
  /// the number — whether the account is new or picked out of the
  /// directory.
  final bool requirePhone;
  final StakeholderSlotValue? initial;

  const _SlotSheet({
    required this.labelKey,
    required this.collectsContact,
    required this.requirePhone,
    required this.initial,
  });

  @override
  State<_SlotSheet> createState() => _SlotSheetState();
}

class _SlotSheetState extends State<_SlotSheet> {
  final _searchController = TextEditingController();

  /// The name of the account being created — its own field, not the search
  /// box.
  ///
  /// They were the same control before, which meant `accountName` was
  /// whatever happened to be left in the search box: never labelled, never
  /// deliberately confirmed, and held only to the search box's own floor. A
  /// company gets created from this value, so the rep types it on purpose.
  final _accountNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();

  /// The dial code lives in the picker's own state, so the full number is
  /// read through this key rather than off `_phoneController`.
  final _phoneFieldKey = GlobalKey<PhoneTextFieldState>();

  Timer? _debounce;
  List<AccountView> _results = const [];
  bool _searching = false;

  /// Why the last search returned nothing, when the reason was a failure
  /// rather than a genuinely empty directory.
  ///
  /// ⚠️ These two states used to be indistinguishable. `_runSearch` kept
  /// `result is Success ? result.data : const []`, so a 400, a 403, a
  /// timeout and a response the models could not parse all rendered as
  /// "nothing found" — followed by the create-new affordance. The rep's
  /// reasonable conclusion was that the company was not in the directory,
  /// so they created a second copy of a company that was already there.
  /// A failed search must say it failed.
  String? _searchError;

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
        _accountNameController.text = initial.newAccountName!;
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
    _accountNameController.dispose();
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
      _searchError = null;
    });
    _debounce?.cancel();
    if (value.trim().length < _kMinSearchChars) {
      setState(() => _results = const []);
      return;
    }
    _debounce = Timer(const Duration(milliseconds: 400), _runSearch);
  }

  Future<void> _runSearch() async {
    final term = _searchController.text.trim();
    if (term.length < _kMinSearchChars) return;
    setState(() {
      _searching = true;
      _searchError = null;
    });
    final result = await getIt<StakeholdersRepository>().searchAccounts(
      search: term,
    );
    if (!mounted) return;
    setState(() {
      _searching = false;
      if (result is Success<List<AccountView>>) {
        _results = result.data;
        _searchError = null;
      } else {
        // Keep the failure. Showing it is what stops a rep reading a broken
        // search as an empty directory and creating a duplicate company.
        _results = const [];
        _searchError = (result as Failure<List<AccountView>>).error.message;
      }
    });
  }

  void _submit() {
    if (_picked == null && !_creatingNew) return;

    // An existing company carries no inline contact: the person form is not
    // shown for one (see the build method), so there is nothing the rep
    // could have deliberately entered. Guarded here as well as cleared on
    // pick, so a future edit that re-shows those fields cannot silently
    // start attaching contacts to accounts that already have them.
    final isExisting = _picked != null;

    Navigator.of(context).pop(
      StakeholderSlotValue(
        existing: _picked,
        newAccountName: _picked == null
            ? _accountNameController.text.trim()
            : null,
        firstName: isExisting || _firstNameController.text.trim().isEmpty
            ? null
            : _firstNameController.text.trim(),
        lastName: isExisting || _lastNameController.text.trim().isEmpty
            ? null
            : _lastNameController.text.trim(),
        // The dial code is picker state, not controller text — read the
        // assembled number, or the API receives a bare local number with no
        // country on it.
        phone: isExisting || _phoneController.text.trim().isEmpty
            ? null
            : (_phoneFieldKey.currentState?.fullPhoneNumber ??
                      _phoneController.text)
                  .trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final term = _searchController.text.trim();

    // An account has to be named one way or the other before anything else
    // matters. For a new one that means the account-name field itself, held
    // to the same 2–200 the server enforces — not whatever is sitting in the
    // search box.
    final newAccountName = _accountNameController.text.trim();
    final hasAccount =
        _picked != null ||
        (_creatingNew &&
            newAccountName.length >= 2 &&
            newAccountName.length <= 200);

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final phone = _phoneController.text.trim();
    final hasBothNames = firstName.isNotEmpty && lastName.isNotEmpty;

    // ⚠️ Branch on **which account** first, and only then on whether the
    // slot is required. The two used to be the other way round, and
    // `requirePhone` short-circuited everything: on the contractor slot —
    // the one required slot on the form — picking a company out of the
    // search results left Confirm greyed out until the rep typed a first
    // name, a last name and a phone number. Picking an existing company
    // therefore looked broken, and the only way forward was to create a
    // duplicate of a company that was already in the directory.
    //
    // Existing account: the contact is **optional**. The company is already
    // in the directory with its own people on it; this slot is linking it
    // to a project, not re-entering it. A half-typed name is still rejected
    // rather than silently dropped, because a first name with no last name
    // creates nothing useful.
    //
    // New account: the contact is **mandatory** — a brand-new company with
    // nobody attached is a directory entry nobody can act on — and the
    // phone joins it on a required slot, since that is the party the
    // project will actually be worked through.
    final contactOk = _picked != null
        // Nothing to satisfy: the person form is not rendered for a company
        // taken from the directory, so picking one completes the slot.
        ? true
        : (hasBothNames && (!widget.requirePhone || phone.isNotEmpty));

    final canSubmit =
        hasAccount && (!widget.collectsContact || contactOk);

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
        // ⚠️ Horizontal inset belongs to each child, **not** to this
        // container.
        //
        // `AppTextField` renders its focus ring through `GlowAnimation`,
        // which is a BoxShadow with `blurRadius: 12` and `spreadRadius: 2` —
        // ink that lands up to 14px *outside* the field's own box. With the
        // 20px inset on the container, the ListView below started exactly at
        // the field's edge, and a ListView clips at `Clip.hardEdge` by
        // default. So the moment a field took focus its glow was sliced off
        // flush against the list's boundary, and the field read as cut away
        // down its side.
        //
        // Insetting the children instead leaves the list's clip rectangle at
        // the sheet's full width, giving the glow 20px of room on each side —
        // comfortably more than the 14 it needs.
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                context.tr(widget.labelKey),
                style: context.textStyles.baseBold,
              ),
            ),
            verticalSpace(12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppTextField(
                hintText: context.tr('add_stakeholder_search_hint'),
                controller: _searchController,
                onChanged: _onSearchChanged,
                prefixIcon: Icon(Icons.search, color: colors.textColor70),
              ),
            ),
            verticalSpace(8.h),
            Expanded(
              child: ListView(
                controller: scrollController,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                        // The person form is hidden for an existing
                        // company, so anything typed into it before the
                        // rep picked one must go with it. Left behind, it
                        // would be submitted invisibly — creating a contact
                        // on an account the rep never meant to touch, from
                        // fields they can no longer see or correct.
                        _firstNameController.clear();
                        _lastNameController.clear();
                        _phoneController.clear();
                      }),
                    ),

                  // A failed search, said out loud.
                  if (_searchError != null && !_searching) ...[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: colors.error.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(AppRadius.field),
                        border: Border.all(
                          color: colors.error.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline_rounded,
                            size: 18.sp,
                            color: colors.error,
                          ),
                          horizontalSpace(8),
                          Expanded(
                            child: Text(
                              context.tr('add_stakeholder_search_failed'),
                              style: context.textStyles.xsMedium.copyWith(
                                color: colors.error,
                              ),
                            ),
                          ),
                          horizontalSpace(8),
                          PressableScale(
                            onTap: _runSearch,
                            child: Text(
                              context.tr('retry'),
                              style: context.textStyles.xsMedium.copyWith(
                                color: colors.error,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // The "create new" affordance sits at the **end of the
                  // results**, so it is only reached after the rep has seen
                  // that nothing matches.
                  //
                  // ⚠️ Gated on `_searchError == null` as well. Offering
                  // "create a new company" underneath a search that *failed*
                  // is what turns a transient network error into a permanent
                  // duplicate in the directory.
                  if (term.length >= _kMinSearchChars &&
                      !_searching &&
                      _searchError == null)
                    PressableScale(
                      onTap: () => setState(() {
                        _creatingNew = true;
                        _picked = null;
                        // Seeded from what they searched for, then editable
                        // — the search term is a starting point, not the
                        // company's name. Only seeded when blank so
                        // reopening the sheet never overwrites a name the
                        // rep already corrected.
                        if (_accountNameController.text.trim().isEmpty) {
                          _accountNameController.text = term;
                        }
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
                  // The account name, as a real field the rep fills in.
                  //
                  // Gated on `_creatingNew` rather than `hasAccount` — that
                  // now depends on this very field, so gating on it would be
                  // circular and the field could never appear.
                  if (_creatingNew) ...[
                    verticalSpace(14.h),
                    Text(
                      context.tr('add_stakeholder_account_name'),
                      style: context.textStyles.smMedium,
                    ),
                    verticalSpace(8.h),
                    AppTextField(
                      hintText: context.tr('add_stakeholder_account_name_hint'),
                      controller: _accountNameController,
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                  // Gated on `hasAccount`, **not** `canSubmit`: canSubmit now
                  // depends on these very fields, so gating them on it would
                  // be circular and they could never appear.
                  //
                  // `hasAccount` is also the "the rep has committed to a
                  // company" test — either a row was picked, or they pressed
                  // add-as-new and named it. The person form never appears
                  // before that decision.
                  // ⚠️ `_picked == null` — the person form belongs to
                  // **creating** a company, not to picking one.
                  //
                  // A company already in the directory already has its
                  // people on it. Offering "add the person you deal with"
                  // there asked the rep to re-enter a contact the system
                  // may well already hold, and made a slot that was
                  // finished look unfinished. Naming a company that does
                  // not exist yet is the only case where somebody has to
                  // supply the person, because nothing else can.
                  if (widget.collectsContact && hasAccount && _picked == null)
                    ...[
                    verticalSpace(14.h),
                    Text(
                      context.tr('add_stakeholder_contact_required'),
                      style: context.textStyles.smMedium,
                    ),
                    verticalSpace(8.h),
                    // Each rebuilds the sheet so the confirm button reflects
                    // what is typed — without this the button would stay
                    // disabled no matter what the rep enters.
                    AppTextField(
                      hintText: context.tr('add_contact_first_name_hint'),
                      controller: _firstNameController,
                      onChanged: (_) => setState(() {}),
                    ),
                    verticalSpace(8.h),
                    AppTextField(
                      hintText: context.tr('add_contact_last_name_hint'),
                      controller: _lastNameController,
                      onChanged: (_) => setState(() {}),
                    ),
                    verticalSpace(8.h),
                    // Mandatory on a required slot, optional everywhere else
                    // — see the `contactOk` note above.
                    //
                    // Same control as sign-up and the stakeholder-link
                    // screen: a country picker with a dial code, so the
                    // number reaches the API in full international form
                    // rather than whatever local shorthand the rep typed.
                    // A bare text field here meant the same contact was
                    // stored as "0501234567" from one screen and
                    // "+966501234567" from another, and nothing downstream
                    // could tell they were one person.
                    PhoneTextField(
                      key: _phoneFieldKey,
                      controller: _phoneController,
                      hintText: widget.requirePhone
                          ? context.tr('add_contact_phone_hint')
                          : context.tr('add_contact_phone_optional_hint'),
                      // Rebuilds the sheet so the confirm button tracks what
                      // is typed, like the name fields above it. On a
                      // required slot the button is gated on the phone, so
                      // without this it would never enable.
                      onChanged: (_) => setState(() {}),
                    ),
                  ],
                ],
              ),
            ),
            // Carries its own inset now that the container no longer does.
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
