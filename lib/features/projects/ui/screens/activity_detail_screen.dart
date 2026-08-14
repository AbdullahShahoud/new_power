import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_dialog.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/activity_detail_view.dart';
import '../../data/models/enums.dart';
import '../../data/models/patch_activity_request.dart';
import '../../logic/activities_bloc/activities_bloc.dart';
import '../../logic/activities_bloc/activities_event.dart';
import '../../logic/activities_bloc/activities_state.dart';
import '../widgets/option_picker_field.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../widgets/attachment_opener.dart';
import '../widgets/project_enum_labels.dart';

/// `GET /activities/{id}` — full card + `revisions[]` (Workflow 6/13).
/// Edit is always offered (author-only is enforced server-side as
/// `403 ACTIVITY_NOT_AUTHOR`) — a `REPRESENTATIVE` has no field to compare
/// against locally (`createdBy` is stripped for a rep, §1.7), so "hide,
/// don't rely on the error" isn't achievable here the way it is for the
/// role-gated Project controls in Phase 1.
class ActivityDetailScreen extends StatelessWidget {
  final String activityId;
  const ActivityDetailScreen({super.key, required this.activityId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ActivitiesBloc>()
            ..add(ActivitiesEvent.detailRequested(activityId)),
      child: _ActivityDetailView(activityId: activityId),
    );
  }
}

class _ActivityDetailView extends StatelessWidget {
  final String activityId;
  const _ActivityDetailView({required this.activityId});

  Future<void> _promptEdit(
    BuildContext context,
    ActivityDetailView activity,
  ) async {
    final purposeNotifier = ValueNotifier<ActivityPurpose>(activity.purpose);
    final outcomeNotifier = ValueNotifier<ActivityOutcome>(activity.outcome);
    final notesController = TextEditingController(text: activity.notes);
    final nextActionAtNotifier = ValueNotifier<DateTime?>(
      activity.nextActionAt,
    );
    final formKey = GlobalKey<FormState>();
    // §10 Workflow 6: "< 24h → edit silently, ≥ 24h → warn 'your manager
    // will see this change', then proceed." A late edit is never refused,
    // only flagged.
    final isLateEdit =
        DateTime.now().difference(activity.capturedAt).inHours >= 24;

    await AppDialog.show<void>(
      context: context,
      title: context.tr('activity_detail_edit_title'),
      content: StatefulBuilder(
        builder: (dialogContext, setDialogState) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isLateEdit) ...[
                  Text(
                    dialogContext.tr('activity_detail_late_edit_warning'),
                    style: dialogContext.textStyles.xsMedium.copyWith(
                      color: dialogContext.colors.statusFollowUp.core,
                    ),
                  ),
                  verticalSpace(12.h),
                ],
                Text(
                  dialogContext.tr('log_activity_purpose'),
                  style: dialogContext.textStyles.xsMedium,
                ),
                verticalSpace(4.h),
                OptionPickerField<ActivityPurpose>(
                  hintText: dialogContext.tr('log_activity_purpose_hint'),
                  value: purposeNotifier.value,
                  options: ActivityPurpose.values,
                  labelOf: (v) => dialogContext.tr(v.labelKey),
                  onChanged: (v) =>
                      setDialogState(() => purposeNotifier.value = v),
                ),
                verticalSpace(12.h),
                Text(
                  dialogContext.tr('log_activity_outcome'),
                  style: dialogContext.textStyles.xsMedium,
                ),
                verticalSpace(4.h),
                OptionPickerField<ActivityOutcome>(
                  hintText: dialogContext.tr('log_activity_outcome_hint'),
                  value: outcomeNotifier.value,
                  options: ActivityOutcome.values,
                  labelOf: (v) => dialogContext.tr(v.labelKey),
                  onChanged: (v) =>
                      setDialogState(() => outcomeNotifier.value = v),
                ),
                verticalSpace(12.h),
                AppTextField(
                  hintText: dialogContext.tr('log_activity_notes_hint'),
                  controller: notesController,
                  maxLines: 4,
                  validator: (value) {
                    final trimmed = value?.trim() ?? '';
                    if (trimmed.length < 20 || trimmed.length > 4000) {
                      return dialogContext.tr('log_activity_notes_error');
                    }
                    return null;
                  },
                ),
                verticalSpace(12.h),
                Text(
                  dialogContext.tr('log_activity_next_action'),
                  style: dialogContext.textStyles.xsMedium,
                ),
                verticalSpace(4.h),
                ValueListenableBuilder<DateTime?>(
                  valueListenable: nextActionAtNotifier,
                  builder: (context, nextActionAt, _) {
                    return _NextActionField(
                      value: nextActionAt,
                      hintText: dialogContext.tr(
                        'log_activity_next_action_hint',
                      ),
                      onTap: () async {
                        final date = await showDatePicker(
                          context: dialogContext,
                          initialDate:
                              nextActionAt ??
                              DateTime.now().add(const Duration(days: 1)),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(
                            const Duration(days: 365),
                          ),
                        );
                        if (date == null || !dialogContext.mounted) return;
                        final time = await showTimePicker(
                          context: dialogContext,
                          initialTime: TimeOfDay.fromDateTime(
                            nextActionAt ?? DateTime.now(),
                          ),
                        );
                        if (time == null) return;
                        nextActionAtNotifier.value = DateTime(
                          date.year,
                          date.month,
                          date.day,
                          time.hour,
                          time.minute,
                        );
                      },
                      onClear: nextActionAt == null
                          ? null
                          : () => nextActionAtNotifier.value = null,
                    );
                  },
                ),
              ],
            ),
          );
        },
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
            context.pop();
            context.read<ActivitiesBloc>().add(
              ActivitiesEvent.editSubmitted(
                id: activity.id,
                request: PatchActivityRequest(
                  purpose: purposeNotifier.value,
                  outcome: outcomeNotifier.value,
                  notes: notesController.text.trim(),
                  nextActionAt: nextActionAtNotifier.value,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<ActivitiesBloc, ActivitiesState>(
      listenWhen: (previous, current) =>
          previous.mutationStatus != current.mutationStatus,
      listener: (context, state) {
        switch (state.mutationStatus) {
          case ActivityMutationStatus.success:
            context.read<ActivitiesBloc>().add(
              ActivitiesEvent.detailRequested(activityId),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.tr('activity_detail_edit_saved'))),
            );
          case ActivityMutationStatus.inProgress:
          case ActivityMutationStatus.idle:
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
          child: BlocBuilder<ActivitiesBloc, ActivitiesState>(
            buildWhen: (previous, current) =>
                previous.detailStatus != current.detailStatus ||
                previous.selectedActivity != current.selectedActivity,
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    child: Row(
                      children: [
                        Container(
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
                        ).let(
                          (child) => GestureDetector(
                            onTap: () => context.pop(),
                            child: child,
                          ),
                        ),
                        horizontalSpace(12),
                        Text(
                          context.tr('activity_detail_title'),
                          style: context.textStyles.baseBold,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: switch (state.detailStatus) {
                      ActivityDetailStatus.idle ||
                      ActivityDetailStatus.loading =>
                        const ShimmerDetailStack(),
                      ActivityDetailStatus.notFound => Center(
                        child: Text(
                          context.tr('activity_detail_not_found'),
                          style: context.textStyles.smMedium,
                        ),
                      ),
                      ActivityDetailStatus.networkError => Center(
                        child: Text(
                          context.tr('activity_detail_error'),
                          style: context.textStyles.smMedium,
                        ),
                      ),
                      ActivityDetailStatus.loaded => _ActivityDetailBody(
                        activity: state.selectedActivity!,
                        onEdit: () =>
                            _promptEdit(context, state.selectedActivity!),
                      ),
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

extension _Let<T> on T {
  R let<R>(R Function(T) block) => block(this);
}

class _ActivityDetailBody extends StatelessWidget {
  final ActivityDetailView activity;
  final VoidCallback onEdit;
  const _ActivityDetailBody({required this.activity, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 32.h),
      children: [
        Row(
          children: [
            Icon(
              activity.kind == ActivityKind.visit
                  ? Icons.location_on_outlined
                  : Icons.call_outlined,
              color: colors.brand500,
            ),
            horizontalSpace(8),
            Text(
              context.tr(activity.kind.labelKey),
              style: context.textStyles.baseBold,
            ),
            if (activity.backdated) ...[
              horizontalSpace(8),
              _Tag(
                label: context.tr('activity_detail_backdated'),
                color: colors.statusFollowUp,
              ),
            ],
            if (activity.editedAfterWindow) ...[
              horizontalSpace(8),
              _Tag(
                label: context.tr('activity_detail_edited_after_window'),
                color: colors.statusVisit,
              ),
            ],
          ],
        ),
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
              _Row(
                label: context.tr('log_activity_purpose'),
                value: context.tr(activity.purpose.labelKey),
              ),
              _Row(
                label: context.tr('log_activity_outcome'),
                value: context.tr(activity.outcome.labelKey),
              ),
              if (activity.channel != null)
                _Row(
                  label: context.tr('log_activity_channel'),
                  value: context.tr(activity.channel!.labelKey),
                ),
              _Row(
                label: context.tr('log_activity_occurred_at'),
                value: activity.occurredAt.toLocal().toString(),
              ),
              if (activity.constructionPhaseObserved != null)
                _Row(
                  label: context.tr('log_activity_construction_phase_observed'),
                  value: context.tr(
                    activity.constructionPhaseObserved!.labelKey,
                  ),
                ),
              if (activity.competitorName != null)
                _Row(
                  label: context.tr('activity_detail_competitor'),
                  value: activity.competitorName!,
                ),
              if (activity.latitude != null && activity.longitude != null)
                _Row(
                  label: context.tr('log_activity_location'),
                  value:
                      '${activity.latitude!.toStringAsFixed(5)}, '
                      '${activity.longitude!.toStringAsFixed(5)}'
                      '${activity.locationVerified ? '' : ' ${context.tr('activity_detail_location_unverified')}'}',
                ),
              if (activity.nextActionAt != null)
                _Row(
                  label: context.tr('log_activity_next_action'),
                  value: activity.nextActionAt!.toLocal().toString(),
                ),
              _Row(
                label: context.tr('log_activity_notes'),
                value: activity.notes,
              ),
            ],
          ),
        ),
        verticalSpace(16.h),
        Text(
          context.tr(
            activity.kind == ActivityKind.visit
                ? 'activity_detail_persons_visit'
                : 'activity_detail_person_communication',
          ),
          style: context.textStyles.smBold,
        ),
        verticalSpace(8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: [
            for (final person in activity.personsMet)
              _Tag(
                label: '${person.firstName} ${person.lastName}',
                color: colors.statusNew,
              ),
          ],
        ),
        if (activity.attachments.isNotEmpty) ...[
          verticalSpace(16.h),
          Text(
            context.tr('log_activity_attachments'),
            style: context.textStyles.smBold,
          ),
          verticalSpace(8.h),
          // Tapping resolves the bare storage key into a signed URL and
          // opens it — photo in the viewer, voice note in a player, PDF in
          // the OS viewer (Workflow 11).
          for (final attachment in activity.attachments)
            PressableScale(
              onTap: () => AttachmentOpener.open(
                context,
                key: attachment.key,
                name: attachment.name,
                contentType: attachment.contentType,
                existingUrl: attachment.url,
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.attach_file,
                      size: 16.sp,
                      color: colors.textColor70,
                    ),
                    horizontalSpace(6),
                    Expanded(
                      child: Text(
                        attachment.name,
                        style: context.textStyles.xsMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      Icons.open_in_new_rounded,
                      size: 14.sp,
                      color: colors.brand600,
                    ),
                  ],
                ),
              ),
            ),
        ],
        if (activity.revisions.isNotEmpty) ...[
          verticalSpace(16.h),
          Text(
            context.tr('activity_detail_revisions'),
            style: context.textStyles.smBold,
          ),
          verticalSpace(8.h),
          for (final revision in activity.revisions)
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Text(
                '${revision.revisedAt.toLocal()} — '
                '${revision.fields.join(', ')}',
                style: context.textStyles.xsMedium,
              ),
            ),
        ],
        verticalSpace(24.h),
        BlocBuilder<ActivitiesBloc, ActivitiesState>(
          buildWhen: (previous, current) =>
              previous.mutationStatus != current.mutationStatus,
          builder: (context, state) {
            final submitting =
                state.mutationStatus == ActivityMutationStatus.inProgress;
            return AppButton(
              text: context.tr('activity_detail_edit_cta'),
              variant: AppButtonVariant.secondary,
              isLoading: submitting,
              onPressed: submitting ? null : onEdit,
            );
          },
        ),
      ],
    );
  }
}

class _NextActionField extends StatelessWidget {
  final DateTime? value;
  final String hintText;
  final VoidCallback onTap;
  final VoidCallback? onClear;
  const _NextActionField({
    required this.value,
    required this.hintText,
    required this.onTap,
    required this.onClear,
  });

  String _format(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
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
            Icon(Icons.event_outlined, size: 18.sp, color: colors.textColor70),
            horizontalSpace(8),
            Expanded(
              child: Text(
                value == null ? hintText : _format(value!),
                style: context.textStyles.smRegular.copyWith(
                  color: value == null ? colors.ink400 : colors.textColor,
                ),
              ),
            ),
            if (onClear != null)
              GestureDetector(
                onTap: onClear,
                child: Icon(
                  Icons.close_rounded,
                  size: 18.sp,
                  color: colors.textColor70,
                ),
              ),
          ],
        ),
      ),
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

class _Tag extends StatelessWidget {
  final String label;
  final StatusColor color;
  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: context.textStyles.xsSemibold.copyWith(color: color.badgeText),
      ),
    );
  }
}
