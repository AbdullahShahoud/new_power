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
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_dialog.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/enums.dart';
import '../../data/models/outcome_view.dart';
import '../../data/models/reject_outcome_request.dart';
import '../../logic/outcomes_bloc/outcomes_bloc.dart';
import '../../logic/outcomes_bloc/outcomes_event.dart';
import '../../logic/outcomes_bloc/outcomes_state.dart';
import '../widgets/project_enum_labels.dart';

/// `GET /outcomes/{id}` — Workflow 8 client rules: driven by `status`, not
/// the project's stage. *Confirm* is never rendered here (this app has no
/// role plumbing to safely gate it — see `OutcomesRepository.confirm`'s
/// doc comment). *Reject* is always offered, labeled **Withdraw** — a rep
/// may take back their own `PENDING` submission at any rank.
class OutcomeDetailScreen extends StatelessWidget {
  final String outcomeId;
  const OutcomeDetailScreen({super.key, required this.outcomeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OutcomesBloc>()
        ..add(OutcomesEvent.detailRequested(outcomeId)),
      child: _OutcomeDetailView(outcomeId: outcomeId),
    );
  }
}

class _OutcomeDetailView extends StatelessWidget {
  final String outcomeId;
  const _OutcomeDetailView({required this.outcomeId});

  Future<void> _promptWithdraw(BuildContext context) async {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final reason = await AppDialog.show<String>(
      context: context,
      title: context.tr('outcome_detail_withdraw_title'),
      content: Form(
        key: formKey,
        child: AppTextField(
          hintText: context.tr('outcome_detail_withdraw_hint'),
          controller: controller,
          maxLines: 3,
          validator: (value) {
            final trimmed = value?.trim() ?? '';
            if (trimmed.length < 10 || trimmed.length > 500) {
              return context.tr('outcome_detail_withdraw_error');
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
          label: context.tr('outcome_detail_withdraw_cta'),
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            context.pop(controller.text.trim());
          },
        ),
      ],
    );
    if (reason == null || !context.mounted) return;
    context.read<OutcomesBloc>().add(
      OutcomesEvent.rejectSubmitted(
        id: outcomeId,
        request: RejectOutcomeRequest(reason: reason),
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
            context.read<OutcomesBloc>().add(
              OutcomesEvent.detailRequested(outcomeId),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.tr('outcome_detail_withdrawn')),
              ),
            );
          case OutcomeMutationStatus.inProgress:
          case OutcomeMutationStatus.idle:
            break;
          default:
            if (state.mutationErrorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.mutationErrorMessage!)),
              );
            }
        }
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 12.h,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        width: 38.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                          color: colors.colorHeader,
                          borderRadius: BorderRadius.circular(
                            AppRadius.field,
                          ),
                          border: Border.all(color: colors.ink200),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: colors.iconColor,
                          size: 18.sp,
                        ),
                      ),
                    ),
                    horizontalSpace(12),
                    Text(
                      context.tr('outcome_detail_title'),
                      style: context.textStyles.baseBold,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<OutcomesBloc, OutcomesState>(
                  buildWhen: (previous, current) =>
                      previous.detailStatus != current.detailStatus ||
                      previous.selectedOutcome != current.selectedOutcome,
                  builder: (context, state) {
                    return switch (state.detailStatus) {
                      OutcomeDetailStatus.idle ||
                      OutcomeDetailStatus.loading =>
                        const ShimmerDetailStack(),
                      OutcomeDetailStatus.notFound => Center(
                        child: Text(
                          context.tr('outcome_detail_not_found'),
                          style: context.textStyles.smMedium,
                        ),
                      ),
                      OutcomeDetailStatus.networkError => Center(
                        child: Text(
                          context.tr('outcome_detail_error'),
                          style: context.textStyles.smMedium,
                        ),
                      ),
                      OutcomeDetailStatus.loaded => _OutcomeDetailBody(
                        outcome: state.selectedOutcome!,
                        onWithdraw: () => _promptWithdraw(context),
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

class _OutcomeDetailBody extends StatelessWidget {
  final OutcomeView outcome;
  final VoidCallback onWithdraw;
  const _OutcomeDetailBody({required this.outcome, required this.onWithdraw});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isLost = outcome.type == OutcomeType.lost;
    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 32.h),
      children: [
        Row(
          children: [
            _StatusTag(status: outcome.status),
            horizontalSpace(8),
            Text(
              context.tr(outcome.type.labelKey),
              style: context.textStyles.baseBold,
            ),
          ],
        ),
        verticalSpace(6.h),
        Text(outcome.projectName, style: context.textStyles.smMedium),
        verticalSpace(16.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.card),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isLost) ...[
                if (outcome.lossReason != null)
                  _Row(
                    label: context.tr('submit_outcome_reason'),
                    value: context.tr(outcome.lossReason!.labelKey),
                  ),
                _Row(
                  label: context.tr('outcome_detail_competitor'),
                  value:
                      outcome.competitor?.name ??
                      context.tr('outcome_detail_competitor_unknown'),
                ),
                if (outcome.competitorPrice != null)
                  _Row(
                    label: context.tr('submit_outcome_competitor_price'),
                    value:
                        '${outcome.competitorPrice} ${outcome.currency ?? ''}',
                  ),
                if (outcome.narrative != null)
                  _Row(
                    label: context.tr('submit_outcome_narrative'),
                    value: outcome.narrative!,
                  ),
              ] else ...[
                if (outcome.distributor != null)
                  _Row(
                    label: context.tr('outcome_detail_distributor'),
                    value: outcome.distributor!.name,
                  ),
                if (outcome.value != null)
                  _Row(
                    label: context.tr('outcome_detail_value'),
                    value: '${outcome.value} ${outcome.currency ?? ''}',
                  ),
                if (outcome.unitsSupplied != null &&
                    outcome.unitsTotal != null)
                  _Row(
                    label: context.tr('outcome_detail_units'),
                    value: '${outcome.unitsSupplied}/${outcome.unitsTotal}',
                  ),
              ],
              if (outcome.notes != null)
                _Row(
                  label: context.tr('submit_outcome_notes'),
                  value: outcome.notes!,
                ),
              _Row(
                label: context.tr('outcome_detail_submitted_at'),
                value: outcome.submittedAt.toLocal().toString(),
              ),
              if (outcome.status == OutcomeStatus.rejected &&
                  outcome.rejectionReason != null)
                _Row(
                  label: context.tr('outcome_detail_rejection_reason'),
                  value: outcome.rejectionReason!,
                ),
            ],
          ),
        ),
        verticalSpace(24.h),
        if (outcome.status == OutcomeStatus.pending)
          BlocBuilder<OutcomesBloc, OutcomesState>(
            buildWhen: (previous, current) =>
                previous.mutationStatus != current.mutationStatus,
            builder: (context, state) {
              final submitting =
                  state.mutationStatus == OutcomeMutationStatus.inProgress;
              return AppButton(
                text: context.tr('outcome_detail_withdraw_cta'),
                variant: AppButtonVariant.secondary,
                isLoading: submitting,
                onPressed: submitting ? null : onWithdraw,
              );
            },
          ),
        // §10 Workflow 8: "a rejected outcome is meant to be superseded" —
        // offered for LOST only, since a WON resubmission has no screen yet
        // (Won UI is deferred to Phase 6, projects-implementation-map.md
        // §10 decision 11).
        if (outcome.status == OutcomeStatus.rejected &&
            outcome.type == OutcomeType.lost)
          AppButton(
            text: context.tr('outcome_detail_submit_again_cta'),
            onPressed: () => context.pushReplacementNamed(
              Routes.submitOutcomeScreen,
              arguments: {'projectId': outcome.projectId},
            ),
          ),
      ],
    );
  }
}

class _Row extends StatelessWidget {
  final String label;
  final String value;
  const _Row({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: context.textStyles.xsMedium),
          Text(value, style: context.textStyles.smMedium),
        ],
      ),
    );
  }
}

class _StatusTag extends StatelessWidget {
  final OutcomeStatus status;
  const _StatusTag({required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = switch (status) {
      OutcomeStatus.pending => colors.statusFollowUp,
      OutcomeStatus.confirmed => colors.statusWon,
      OutcomeStatus.rejected => colors.statusLost,
    };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        context.tr(status.labelKey),
        style: context.textStyles.xsSemibold.copyWith(color: color.badgeText),
      ),
    );
  }
}
