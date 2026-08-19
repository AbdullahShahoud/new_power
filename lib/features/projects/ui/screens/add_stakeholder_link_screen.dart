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
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/enums.dart';
import '../../data/models/register_account_request.dart';
import '../../logic/stakeholder_mutation_status.dart';
import '../../logic/stakeholders_bloc/stakeholders_bloc.dart';
import '../../logic/stakeholders_bloc/stakeholders_event.dart';
import '../../logic/stakeholders_bloc/stakeholders_state.dart';
import '../../../auth/ui/widgets/phone_text_field.dart';
import '../widgets/option_picker_field.dart';
import '../widgets/project_enum_labels.dart';

/// A company already on this project, reduced to what the picker needs.
/// Kept model-agnostic so either roster shape can feed it.
typedef ProjectCompanyOption = ({String accountId, String name});

/// **One form: a person, and the company they belong to.**
///
/// In the field a stakeholder *is* a person — "who do I deal with on this
/// building" — and the company is an attribute of that person, not a
/// separate thing the rep registers first. The API models the two
/// separately, so the repository orchestrates the writes behind one form
/// submission and this screen never mentions "account" at all.
///
/// Always creates a **new** company with its first contact inlined in one
/// `POST /accounts`. Picking a company already on the project was offered
/// here once and removed on request ("إنشاء سجل جديد دائمًا"). Pops `true` on
/// success so the caller refreshes the project detail.
class AddStakeholderLinkScreen extends StatelessWidget {
  final String projectId;

  /// Companies already linked to this project, passed in from whatever
  /// roster the caller already holds. A plain record rather than a model
  /// type: the project-detail screen carries `StakeholderRefView` while
  /// the standalone stakeholders endpoint returns `StakeholderLinkView`,
  /// and this picker only needs the id and the name from either.
  final List<ProjectCompanyOption> existingLinks;

  const AddStakeholderLinkScreen({
    super.key,
    required this.projectId,
    this.existingLinks = const [],
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StakeholdersBloc>(),
      child: _AddStakeholderLinkView(
        projectId: projectId,
        existingLinks: existingLinks,
      ),
    );
  }
}

class _AddStakeholderLinkView extends StatefulWidget {
  final String projectId;
  final List<ProjectCompanyOption> existingLinks;

  const _AddStakeholderLinkView({
    required this.projectId,
    required this.existingLinks,
  });

  @override
  State<_AddStakeholderLinkView> createState() =>
      _AddStakeholderLinkViewState();
}

class _AddStakeholderLinkViewState extends State<_AddStakeholderLinkView> {
  final _formKey = GlobalKey<FormState>();

  final _companyNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _positionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _phoneFieldKey = GlobalKey<PhoneTextFieldState>();
  final _emailController = TextEditingController();
  final _noteController = TextEditingController();

  AccountType _accountType = AccountType.company;
  StakeholderRole? _role;

  @override
  void dispose() {
    _companyNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _positionController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _noteController.dispose();
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

  /// The number with its dial code, or `null` when the rep left it blank.
  ///
  /// The empty check reads the **controller**, not `fullPhoneNumber`: that
  /// getter concatenates the picker's dial code with the field, so an
  /// untouched field yields a bare `"+966"` — which would be stored as a
  /// phone number that cannot be called.
  String? get _phoneOrNull {
    if (_phoneController.text.trim().isEmpty) return null;
    return _phoneFieldKey.currentState?.fullPhoneNumber ??
        _phoneController.text.trim();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_role == null) {
      _showSnack(context.tr('add_stakeholder_role_required'));
      return;
    }

    final bloc = context.read<StakeholdersBloc>();

    // Always a new record. Reusing a company already on the project was
    // offered here once and removed on request (see the form above).
    bloc.add(
      StakeholdersEvent.stakeholderPersonAdded(
        projectId: widget.projectId,
        account: RegisterAccountRequest(
          name: _companyNameController.text.trim(),
          type: _accountType,
          phone: _phoneOrNull,
          // Marks the new company as a project stakeholder so it surfaces
          // in a later classification-filtered search, not only by name.
          classification: AccountClassification.projectStakeholder,
          // Inlined: `POST /accounts` creates the company *and* its first
          // person in one call, and returns both ids.
          contacts: [
            NewAccountContact(
              firstName: _firstNameController.text.trim(),
              lastName: _lastNameController.text.trim(),
              position: _textOrNull(_positionController),
              phone: _phoneOrNull,
              email: _textOrNull(_emailController),
              // The only person on a freshly created company is, by
              // definition, who to ask for there.
              isPrimary: true,
            ),
          ],
        ),
        role: _role!,
        note: _textOrNull(_noteController),
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
              state.linkMutationErrorMessage ?? context.tr('error_unexpected'),
            );
        }
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: context.tr('add_stakeholder_title')),
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
                          // ── Who ────────────────────────────────────────
                          _Label(context.tr('add_stakeholder_person_name')),
                          Row(
                            children: [
                              Expanded(
                                child: AppTextField(
                                  hintText: context.tr(
                                    'add_contact_first_name_hint',
                                  ),
                                  controller: _firstNameController,
                                  validator: (value) =>
                                      (value ?? '').trim().isEmpty
                                      ? context.tr('add_contact_name_error')
                                      : null,
                                ),
                              ),
                              horizontalSpace(12),
                              Expanded(
                                child: AppTextField(
                                  hintText: context.tr(
                                    'add_contact_last_name_hint',
                                  ),
                                  controller: _lastNameController,
                                  validator: (value) =>
                                      (value ?? '').trim().isEmpty
                                      ? context.tr('add_contact_name_error')
                                      : null,
                                ),
                              ),
                            ],
                          ),
                          verticalSpace(16.h),

                          // ── Where they work ───────────────────────────
                          _Label(context.tr('add_stakeholder_company_name')),
                          // The row of companies already linked to this
                          // project used to sit here as reusable chips. It
                          // was removed on request: the confirmed model is
                          // "always create a new record", so offering an
                          // existing one to reuse contradicted it and made
                          // the form read as two competing ways to answer
                          // the same question.
                          _AccountTypeToggle(
                            type: _accountType,
                            onChanged: (v) =>
                                setState(() => _accountType = v),
                          ),
                          verticalSpace(8.h),
                          AppTextField(
                            hintText: context.tr(
                              'add_stakeholder_company_name_hint',
                            ),
                            controller: _companyNameController,
                            validator: (value) {
                              final trimmed = value?.trim() ?? '';
                              if (trimmed.length < 2 || trimmed.length > 200) {
                                return context.tr(
                                  'register_account_name_error',
                                );
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16.h),

                          // ── Their part on this project ────────────────
                          _Label(context.tr('add_stakeholder_role')),
                          OptionPickerField<StakeholderRole>(
                            hintText: context.tr('add_stakeholder_role_hint'),
                            value: _role,
                            options: stakeholderLinkableRoles,
                            labelOf: (v) => context.tr(v.labelKey),
                            onChanged: (v) => setState(() => _role = v),
                          ),
                          verticalSpace(16.h),

                          // ── Optional detail ───────────────────────────
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
                          // Same control as the sign-up screen: country
                          // picker with a dial code, so the number reaches
                          // the API in full international form instead of
                          // whatever local shorthand the rep typed.
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
                          _Label(
                            context.tr('add_stakeholder_note'),
                            optional: true,
                          ),
                          AppTextField(
                            hintText: context.tr('add_stakeholder_note_hint'),
                            controller: _noteController,
                            maxLines: 3,
                          ),
                          verticalSpace(24.h),
                          BlocBuilder<StakeholdersBloc, StakeholdersState>(
                            builder: (context, state) {
                              return AppButton(
                                text: context.tr('add_stakeholder_submit'),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// شركة / زبون فرد — the one structural choice the API needs that a rep
/// can answer without thinking about "accounts".
/// A selectable company already on this project (or the "new company"
/// escape hatch). Same visual language as the product-category chips on the
/// Won form.

class _AccountTypeToggle extends StatelessWidget {
  final AccountType type;
  final ValueChanged<AccountType> onChanged;
  const _AccountTypeToggle({required this.type, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: colors.page,
        borderRadius: BorderRadius.circular(AppRadius.field),
        border: Border.all(color: colors.ink200),
      ),
      child: Row(
        children: [
          for (final option in AccountType.values)
            Expanded(
              child: PressableScale(
                onTap: () => onChanged(option),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  decoration: BoxDecoration(
                    color: type == option
                        ? colors.brand500
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(AppRadius.field - 2),
                  ),
                  child: Text(
                    context.tr(option.labelKey),
                    style: context.textStyles.xsBold.copyWith(
                      color: type == option
                          ? colors.white
                          : colors.textColor,
                    ),
                  ),
                ),
              ),
            ),
        ],
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
