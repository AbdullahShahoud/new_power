import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

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
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/account_view.dart';
import '../../data/models/contact_view.dart';
import '../../data/models/enums.dart';
import '../../data/models/submit_lost_request.dart';
import '../../data/models/submit_won_request.dart';
import '../../data/models/uploaded_file_dto.dart';
import '../../logic/file_upload_bloc/file_upload_bloc.dart';
import '../../logic/file_upload_bloc/file_upload_event.dart';
import '../../logic/file_upload_bloc/file_upload_state.dart';
import '../../logic/outcomes_bloc/outcomes_bloc.dart';
import '../../logic/outcomes_bloc/outcomes_event.dart';
import '../../logic/outcomes_bloc/outcomes_state.dart';
import '../widgets/attachment_picker.dart';
import '../widgets/option_picker_field.dart';
import '../widgets/pending_attachment.dart';
import '../widgets/project_enum_labels.dart';

const _defaultCurrency = 'SAR';

/// §5 `POST /projects/{projectId}/won` and `.../lost` — Workflow 8's "won vs.
/// cancelled" branch. `someoneElseWon` is never offered as a choice on the
/// Lost side; it's always `true`. The Won side's distributor/buyer pickers
/// reuse the generic `AccountPickerScreen`/`ContactPickerScreen` (stakeholders.md)
/// rather than filtering by classification — `POST /accounts/{id}/
/// classifications` (how an account becomes a documented `DISTRIBUTOR`) has
/// no specification in either reference doc, so this screen leans on the
/// server's own real, already-mapped `PROJECT_DISTRIBUTOR_NOT_FOUND` check
/// instead of a client-side filter it can't build correctly
/// (projects-implementation-map.md §10).
class SubmitOutcomeScreen extends StatelessWidget {
  final String projectId;
  final OutcomeType initialType;
  const SubmitOutcomeScreen({
    super.key,
    required this.projectId,
    this.initialType = OutcomeType.lost,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<OutcomesBloc>()),
        // Won submissions carry proof — an award letter (تعميد), a signed
        // PO, a delivery note. Same upload route as everywhere else:
        // `POST /files` per file, then the returned keys are quoted in the
        // request body (Workflow 1 — one file per call, never batched).
        BlocProvider(create: (_) => getIt<FileUploadBloc>()),
      ],
      child: _SubmitOutcomeView(projectId: projectId, initialType: initialType),
    );
  }
}

class _SubmitOutcomeView extends StatefulWidget {
  final String projectId;
  final OutcomeType initialType;
  const _SubmitOutcomeView({
    required this.projectId,
    required this.initialType,
  });

  @override
  State<_SubmitOutcomeView> createState() => _SubmitOutcomeViewState();
}

class _SubmitOutcomeViewState extends State<_SubmitOutcomeView> {
  final _formKey = GlobalKey<FormState>();

  late OutcomeType _type = widget.initialType;

  // ── Lost fields ──────────────────────────────────────────────────────
  final _competitorPriceController = TextEditingController();
  final _narrativeController = TextEditingController();
  LossReason? _reason;
  AccountView? _competitor;

  // ── Won fields ───────────────────────────────────────────────────────
  AccountView? _distributor;
  ContactView? _buyerContact;
  final _valueController = TextEditingController();
  final _unitsSuppliedController = TextEditingController();
  final _unitsTotalController = TextEditingController();
  DateTime? _soldAt;

  /// Supporting documents for a won deal. Capped at 10 to match
  /// `SubmitWonRequest.validate()`, which rejects more server-side anyway.
  static const _maxFiles = 10;
  final _uuid = const Uuid();
  final List<PendingAttachment> _attachments = [];

  /// Mirrors `log_activity_screen`: the picker only produces the file, this
  /// assigns the tracking id and starts the upload so every attachment takes
  /// the same route through [FileUploadBloc].
  void _onAttachmentsAdded(List<PendingAttachment> added) {
    final fileUploadBloc = context.read<FileUploadBloc>();
    setState(() {
      for (final attachment in added) {
        if (_attachments.length >= _maxFiles) break;
        final localId = _uuid.v4();
        _attachments.add(
          PendingAttachment(
            localId: localId,
            file: attachment.file,
            kind: attachment.kind,
            duration: attachment.duration,
          ),
        );
        fileUploadBloc.add(
          FileUploadEvent.uploadRequested(
            localId: localId,
            file: attachment.file,
          ),
        );
      }
    });
  }

  void _removeAttachment(String localId) {
    context.read<FileUploadBloc>().add(
      FileUploadEvent.uploadCancelled(localId: localId),
    );
    setState(() => _attachments.removeWhere((a) => a.localId == localId));
  }

  /// Collects the finished uploads as `{key, name}` pairs.
  ///
  /// Returns `null` — rather than an empty list — while any upload is still
  /// in flight, so the caller aborts instead of silently submitting a won
  /// outcome without the proof the rep just attached.
  List<UploadedFileDto>? _collectUploadedFiles() {
    final uploads = context.read<FileUploadBloc>().state.uploads;
    final files = <UploadedFileDto>[];
    for (final attachment in _attachments) {
      final item = uploads[attachment.localId];
      if (item == null) continue;
      if (item.status == FileUploadItemStatus.uploading) {
        _showSnack(context.tr('projects_register_photos_still_uploading'));
        return null;
      }
      if (item.status == FileUploadItemStatus.uploaded && item.file != null) {
        files.add(UploadedFileDto(key: item.file!.key, name: item.file!.name));
      }
    }
    return files;
  }
  final Set<ProductCategory> _categories = {};

  // ── Shared ───────────────────────────────────────────────────────────
  final _notesController = TextEditingController();

  @override
  void dispose() {
    _competitorPriceController.dispose();
    _narrativeController.dispose();
    _valueController.dispose();
    _unitsSuppliedController.dispose();
    _unitsTotalController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// §5 `narrative`/`notes` — optional, but `≤ 2000` chars when present.
  /// Inline feedback instead of waiting for the model's `.validate()` to
  /// reject it as a generic server error.
  String? _validateOptionalLongText(String? value) {
    if (value != null && value.trim().length > 2000) {
      return context.tr('submit_outcome_text_too_long');
    }
    return null;
  }

  Future<void> _pickDistributor() async {
    // Opens browsable, filtered to accounts already classified DISTRIBUTOR
    // — and lets the rep classify one on the spot if the outlet the deal
    // went through isn't tagged yet.
    final picked = await context.pushNamed(
      Routes.accountPickerScreen,
      arguments: {'classification': AccountClassification.distributor},
    );
    if (picked is AccountView) {
      setState(() {
        _distributor = picked;
        _buyerContact = null;
      });
    }
  }

  Future<void> _pickBuyerContact() async {
    final distributor = _distributor;
    if (distributor == null) return;
    final picked = await context.pushNamed(
      Routes.contactPickerScreen,
      arguments: {'accountId': distributor.id},
    );
    if (picked is ContactView) {
      setState(() => _buyerContact = picked);
    }
  }

  Future<void> _pickCompetitor() async {
    final picked = await context.pushNamed(
      Routes.accountPickerScreen,
      arguments: {'classification': AccountClassification.competitor},
    );
    if (picked is AccountView) {
      setState(() => _competitor = picked);
    }
  }

  Future<void> _pickSoldAt() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: _soldAt ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: now,
    );
    if (date != null) setState(() => _soldAt = date);
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_type == OutcomeType.won) {
      _submitWon();
    } else {
      _submitLost();
    }
  }

  void _submitWon() {
    final distributor = _distributor;
    if (distributor == null) {
      _showSnack(context.tr('submit_won_distributor_required'));
      return;
    }
    // Aborts while an upload is still running rather than submitting the
    // outcome without the proof the rep attached — a won outcome can only
    // be submitted once, so a silently file-less one is not recoverable.
    final files = _collectUploadedFiles();
    if (files == null) return;

    final valueText = _valueController.text.trim();
    final value = valueText.isEmpty ? null : double.tryParse(valueText);
    final unitsSupplied = int.tryParse(_unitsSuppliedController.text.trim());
    final unitsTotal = int.tryParse(_unitsTotalController.text.trim());

    final request = SubmitWonRequest(
      files: files,
      distributorAccountId: distributor.id,
      value: value,
      currency: value != null ? _defaultCurrency : null,
      soldAt: _soldAt,
      categories: _categories.toList(),
      unitsSupplied: unitsSupplied,
      unitsTotal: unitsTotal,
      buyerContactId: _buyerContact?.id,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );

    context.read<OutcomesBloc>().add(
      OutcomesEvent.wonSubmitted(projectId: widget.projectId, request: request),
    );
  }

  void _submitLost() {
    if (_reason == null) {
      _showSnack(context.tr('submit_outcome_reason_required'));
      return;
    }
    final priceText = _competitorPriceController.text.trim();
    if (_reason == LossReason.price && priceText.isEmpty) {
      _showSnack(context.tr('submit_outcome_price_required'));
      return;
    }
    final competitorPrice = priceText.isEmpty
        ? null
        : double.tryParse(priceText);

    final request = SubmitLostRequest(
      reason: _reason!,
      competitorPrice: competitorPrice,
      currency: competitorPrice != null ? _defaultCurrency : null,
      competitorAccountId: _competitor?.id,
      narrative: _narrativeController.text.trim().isEmpty
          ? null
          : _narrativeController.text.trim(),
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );

    context.read<OutcomesBloc>().add(
      OutcomesEvent.lostSubmitted(
        projectId: widget.projectId,
        request: request,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<OutcomesBloc, OutcomesState>(
      listenWhen: (previous, current) =>
          previous.mutationStatus != current.mutationStatus,
      listener: (context, state) {
        switch (state.mutationStatus) {
          case OutcomeMutationStatus.success:
            final outcome = state.lastMutatedOutcome;
            if (outcome == null) return;
            context.pushReplacementNamed(
              Routes.outcomeDetailScreen,
              arguments: {'outcomeId': outcome.id},
            );
          case OutcomeMutationStatus.alreadyOpen:
            _showSnack(context.tr('submit_outcome_already_open'));
          case OutcomeMutationStatus.projectCancelled:
            _showSnack(context.tr('submit_outcome_project_cancelled'));
          // The server's own text here is materially more useful than a
          // generic string ("That account is not one of our outlets.
          // Classify it as a DISTRIBUTOR first, or pick another.") — it
          // names the actual remedy, which this client can't offer itself
          // because no classification endpoint is documented. Prefer it,
          // and fall back to the localized line only if it's absent.
          case OutcomeMutationStatus.distributorNotFound:
            _showSnack(
              state.mutationErrorMessage ??
                  context.tr('submit_won_distributor_not_found'),
            );
          case OutcomeMutationStatus.unitsExceedTotal:
            _showSnack(context.tr('submit_won_units_exceed_total'));
          case OutcomeMutationStatus.competitorNotFound:
            _showSnack(context.tr('submit_outcome_competitor_not_found'));
          case OutcomeMutationStatus.lossRequiresWinner:
            _showSnack(context.tr('submit_outcome_loss_requires_winner'));
          case OutcomeMutationStatus.lossPriceRequired:
            _showSnack(context.tr('submit_outcome_price_required'));
          case OutcomeMutationStatus.inProgress:
          case OutcomeMutationStatus.idle:
            break;
          default:
            _showSnack(
              state.mutationErrorMessage ?? context.tr('error_unexpected'),
            );
        }
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: context.tr('submit_outcome_title')),
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
                          _TypeToggle(
                            type: _type,
                            onChanged: (v) => setState(() => _type = v),
                          ),
                          verticalSpace(16.h),
                          Text(
                            _type == OutcomeType.won
                                ? context.tr('submit_won_notice')
                                : context.tr('submit_outcome_lost_notice'),
                            style: context.textStyles.xsMedium.copyWith(
                              color: colors.textColor70,
                            ),
                          ),
                          verticalSpace(16.h),
                          if (_type == OutcomeType.won)
                            ..._buildWonFields(context)
                          else
                            ..._buildLostFields(context),
                          verticalSpace(16.h),
                          _Label(
                            context.tr('submit_outcome_notes'),
                            optional: true,
                          ),
                          AppTextField(
                            hintText: context.tr('submit_outcome_notes_hint'),
                            controller: _notesController,
                            maxLines: 3,
                            validator: _validateOptionalLongText,
                          ),
                          // Won only: `SubmitLostRequest` has no `files`
                          // field, so offering the picker on a loss would
                          // collect documents the request then silently
                          // drops.
                          if (_type == OutcomeType.won) ...[
                            verticalSpace(16.h),
                            _Label(
                              context.tr('submit_won_files'),
                              optional: true,
                            ),
                            AttachmentPicker(
                              attachments: _attachments,
                              maxAttachments: _maxFiles,
                              onAdded: _onAttachmentsAdded,
                              onRemove: _removeAttachment,
                            ),
                          ],
                          verticalSpace(24.h),
                          BlocBuilder<OutcomesBloc, OutcomesState>(
                            builder: (context, state) {
                              return AppButton(
                                text: context.tr('submit_outcome_submit'),
                                isLoading:
                                    state.mutationStatus ==
                                    OutcomeMutationStatus.inProgress,
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

  List<Widget> _buildLostFields(BuildContext context) {
    return [
      _Label(context.tr('submit_outcome_reason')),
      OptionPickerField<LossReason>(
        hintText: context.tr('submit_outcome_reason_hint'),
        value: _reason,
        options: LossReason.values,
        labelOf: (v) => context.tr(v.labelKey),
        onChanged: (v) => setState(() => _reason = v),
      ),
      if (_reason == LossReason.price) ...[
        verticalSpace(16.h),
        _Label(context.tr('submit_outcome_competitor_price')),
        AppTextField(
          hintText: context.tr('submit_outcome_competitor_price_hint'),
          controller: _competitorPriceController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
      ],
      verticalSpace(16.h),
      _Label(context.tr('submit_outcome_competitor'), optional: true),
      _PickerField(
        hintText: context.tr('submit_outcome_competitor_hint'),
        value: _competitor?.name,
        onTap: _pickCompetitor,
      ),
      verticalSpace(16.h),
      _Label(context.tr('submit_outcome_narrative'), optional: true),
      AppTextField(
        hintText: context.tr('submit_outcome_narrative_hint'),
        controller: _narrativeController,
        maxLines: 4,
        validator: _validateOptionalLongText,
      ),
    ];
  }

  List<Widget> _buildWonFields(BuildContext context) {
    return [
      _Label(context.tr('submit_won_distributor')),
      _PickerField(
        hintText: context.tr('submit_won_distributor_hint'),
        value: _distributor?.name,
        onTap: _pickDistributor,
      ),
      verticalSpace(16.h),
      _Label(context.tr('submit_won_buyer_contact'), optional: true),
      _PickerField(
        hintText: context.tr('submit_won_buyer_contact_hint'),
        value: _buyerContact == null
            ? null
            : '${_buyerContact!.firstName} ${_buyerContact!.lastName}',
        onTap: _distributor == null ? null : _pickBuyerContact,
      ),
      verticalSpace(16.h),
      _Label(context.tr('submit_won_value'), optional: true),
      AppTextField(
        hintText: context.tr('submit_won_value_hint'),
        controller: _valueController,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
      ),
      verticalSpace(16.h),
      _Label(context.tr('submit_won_sold_at'), optional: true),
      _PickerField(
        hintText: context.tr('submit_won_sold_at_hint'),
        value: _soldAt == null
            ? null
            : '${_soldAt!.year}-${_soldAt!.month.toString().padLeft(2, '0')}-${_soldAt!.day.toString().padLeft(2, '0')}',
        onTap: _pickSoldAt,
      ),
      verticalSpace(16.h),
      _Label(context.tr('submit_won_categories'), optional: true),
      Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: [
          for (final category in ProductCategory.values)
            _CategoryChip(
              label: context.tr(category.labelKey),
              selected: _categories.contains(category),
              onTap: () => setState(() {
                if (!_categories.remove(category)) {
                  _categories.add(category);
                }
              }),
            ),
        ],
      ),
      verticalSpace(16.h),
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Label(context.tr('submit_won_units_supplied'), optional: true),
                AppTextField(
                  hintText: '0',
                  controller: _unitsSuppliedController,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Label(context.tr('submit_won_units_total'), optional: true),
                AppTextField(
                  hintText: '0',
                  controller: _unitsTotalController,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
    ];
  }
}

class _TypeToggle extends StatelessWidget {
  final OutcomeType type;
  final ValueChanged<OutcomeType> onChanged;
  const _TypeToggle({required this.type, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colors.page,
        borderRadius: BorderRadius.circular(AppRadius.field),
        border: Border.all(color: colors.ink200),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TypeSegment(
              label: context.tr(OutcomeType.won.labelKey),
              selected: type == OutcomeType.won,
              onTap: () => onChanged(OutcomeType.won),
            ),
          ),
          Expanded(
            child: _TypeSegment(
              label: context.tr(OutcomeType.lost.labelKey),
              selected: type == OutcomeType.lost,
              onTap: () => onChanged(OutcomeType.lost),
            ),
          ),
        ],
      ),
    );
  }
}

class _TypeSegment extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _TypeSegment({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 8.h),
        decoration: BoxDecoration(
          color: selected ? colors.brand500 : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.field - 2),
        ),
        child: Text(
          label,
          style: context.textStyles.smBold.copyWith(
            color: selected ? colors.white : colors.textColor,
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: selected ? colors.brand500 : colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(
            color: selected ? colors.brand500 : colors.ink200,
          ),
        ),
        child: Text(
          label,
          style: context.textStyles.xsSemibold.copyWith(
            color: selected ? colors.white : colors.textColor,
          ),
        ),
      ),
    );
  }
}

class _PickerField extends StatelessWidget {
  final String hintText;
  final String? value;
  final VoidCallback? onTap;
  const _PickerField({required this.hintText, this.value, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Container(
          height: 44.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.field),
            border: Border.all(color: colors.ink200),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value ?? hintText,
                  style: context.textStyles.smRegular.copyWith(
                    color: value == null ? colors.ink400 : colors.textColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
