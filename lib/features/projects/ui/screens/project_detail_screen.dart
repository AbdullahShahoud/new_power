import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_dialog.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/image_viewer_screen.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/activity_view.dart';
import '../../data/models/change_stage_request.dart';
import '../../data/models/change_status_request.dart';
import '../../data/models/close_stakeholder_link_request.dart';
import '../../data/models/contact_view.dart';
import '../../data/models/enums.dart';
import '../../data/models/outcome_view.dart';
import 'log_activity_screen.dart';
import '../../data/models/project_detail_view.dart';
import '../../data/models/project_history_entry_view.dart';
import '../../data/models/project_image_view.dart';
import '../../data/models/reason_request.dart';
import '../../data/models/set_decision_maker_request.dart';
import '../../data/models/stored_file.dart';
import '../../logic/file_upload_bloc/file_upload_bloc.dart';
import '../../logic/file_upload_bloc/file_upload_event.dart';
import '../../logic/file_upload_bloc/file_upload_state.dart';
import '../../logic/projects_bloc/projects_bloc.dart';
import '../../logic/projects_bloc/projects_event.dart';
import '../../logic/projects_bloc/projects_state.dart';
import '../../logic/stakeholder_mutation_status.dart';
import '../../logic/stakeholders_bloc/stakeholders_bloc.dart';
import '../../logic/stakeholders_bloc/stakeholders_event.dart';
import '../../logic/stakeholders_bloc/stakeholders_state.dart';
import '../widgets/expandable_section.dart';
import 'add_stakeholder_link_screen.dart' show ProjectCompanyOption;
import '../widgets/option_picker_field.dart';
import '../widgets/project_enum_labels.dart';
import '../widgets/project_summary_card.dart';

/// `GET /projects/{id}` — the card, photo gallery, read-only activity/
/// stakeholder sections (full features land in Phase 2/6), stage/status
/// controls, history, version-conflict re-read-and-reapply flow (Workflow 9).
class ProjectDetailScreen extends StatelessWidget {
  final String projectId;
  const ProjectDetailScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<ProjectsBloc>()
            ..add(ProjectsEvent.detailRequested(projectId))
            ..add(ProjectsEvent.historyRequested(projectId)),
        ),
        BlocProvider(create: (_) => getIt<FileUploadBloc>()),
      ],
      child: _ProjectDetailView(projectId: projectId),
    );
  }
}

class _ProjectDetailView extends StatelessWidget {
  final String projectId;
  const _ProjectDetailView({required this.projectId});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<ProjectsBloc, ProjectsState>(
      listenWhen: (previous, current) =>
          previous.mutationStatus != current.mutationStatus,
      listener: (context, state) => _handleMutation(context, state),
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: BlocBuilder<ProjectsBloc, ProjectsState>(
            buildWhen: (previous, current) =>
                previous.detailStatus != current.detailStatus ||
                previous.selectedProject != current.selectedProject,
            builder: (context, state) {
              return switch (state.detailStatus) {
                ProjectDetailStatus.idle ||
                ProjectDetailStatus.loading => const _ProjectDetailSkeleton(),
                ProjectDetailStatus.notFound => _DetailMessage(
                  icon: Icons.search_off_rounded,
                  message: context.tr('projects_detail_not_found'),
                ),
                ProjectDetailStatus.networkError => _DetailMessage(
                  icon: Icons.wifi_off_rounded,
                  message: context.tr('projects_detail_error'),
                  onRetry: () => context.read<ProjectsBloc>().add(
                    ProjectsEvent.detailRequested(projectId),
                  ),
                ),
                ProjectDetailStatus.loaded => _ProjectDetailBody(
                  project: state.selectedProject!,
                ),
              };
            },
          ),
        ),
      ),
    );
  }

  void _handleMutation(BuildContext context, ProjectsState state) {
    switch (state.mutationStatus) {
      case ProjectMutationStatus.success:
        context.read<ProjectsBloc>().add(
          ProjectsEvent.detailRefreshed(projectId),
        );
      case ProjectMutationStatus.versionConflict:
        AppDialog.show<void>(
          context: context,
          title: context.tr('projects_version_conflict_title'),
          message: context.tr('projects_version_conflict_message'),
          actions: [
            AppDialogButton.primary(
              label: context.tr('projects_version_conflict_refresh'),
              onPressed: () {
                context.pop();
                context.read<ProjectsBloc>().add(
                  ProjectsEvent.detailRefreshed(projectId),
                );
              },
            ),
          ],
        );
      case ProjectMutationStatus.lastImageRequired:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr('projects_last_image_required'))),
        );
      case ProjectMutationStatus.notFound:
        // The project (or the image within it) is gone — re-read so the
        // screen falls into `ProjectDetailStatus.notFound`'s dedicated
        // empty state (§1.8: rendered identically whether "gone" or "not
        // yours"), rather than leaving a stale, now-broken card on screen.
        context.read<ProjectsBloc>().add(
          ProjectsEvent.detailRequested(projectId),
        );
      case ProjectMutationStatus.inProgress:
      case ProjectMutationStatus.idle:
        break;
      default:
        if (state.mutationErrorMessage != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.mutationErrorMessage!)));
        }
    }
  }
}

class _DetailMessage extends StatelessWidget {
  final IconData icon;
  final String message;
  final VoidCallback? onRetry;

  const _DetailMessage({
    required this.icon,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Row(
            children: [
              PressableScale(
                onTap: () => context.pop(),
                child: Container(
                  width: 38.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: colors.colorHeader,
                    borderRadius: BorderRadius.circular(AppRadius.field),
                    border: Border.all(color: colors.ink200),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: colors.iconColor,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 40.sp, color: colors.textColor70),
                  verticalSpace(12.h),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: context.textStyles.smMedium,
                  ),
                  if (onRetry != null) ...[
                    verticalSpace(12.h),
                    AppButton(
                      text: context.tr('retry'),
                      variant: AppButtonVariant.secondary,
                      size: AppButtonSize.sm,
                      onPressed: onRetry,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ProjectDetailBody extends StatelessWidget {
  final ProjectDetailView project;

  const _ProjectDetailBody({required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 0),
          child: Row(
            children: [
              PressableScale(
                onTap: () => context.pop(),
                child: Container(
                  width: 38.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    color: colors.colorHeader,
                    borderRadius: BorderRadius.circular(AppRadius.field),
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
              Expanded(
                child: Text(
                  project.name,
                  style: context.textStyles.baseBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              final bloc = context.read<ProjectsBloc>();
              // `ProjectDetailRefreshed` isn't itself awaitable — its
              // handler (`_loadDetail`) emits exactly once, success or
              // failure, so waiting on the next state emission is
              // equivalent and keeps `RefreshIndicator`'s spinner honest.
              final nextState = bloc.stream.first;
              bloc.add(ProjectsEvent.detailRefreshed(project.id));
              await nextState;
            },
            // Summary card pinned at the top, then everything else folded
            // into collapsible sections — the screen opens scannable rather
            // than as one long wall of every field at once.
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
              children: [
                ProjectSummaryCard(project: project),
                verticalSpace(12.h),

                // Says once, at the top, what every hidden control below
                // would otherwise have to explain on tap.
                if (project.isClosed) ...[
                  _ClosedBanner(stage: project.stage),
                  verticalSpace(12.h),
                ],

                ExpandableSection(
                  icon: Icons.info_outline_rounded,
                  title: context.tr('projects_detail_section_basic'),
                  // The one section open by default: it answers the
                  // questions a rep opens this screen for most often.
                  initiallyExpanded: true,
                  child: _CardSection(project: project),
                ),
                verticalSpace(12.h),

                ExpandableSection(
                  icon: Icons.groups_outlined,
                  title: context.tr('projects_detail_section_stakeholders'),
                  trailingLabel: '${project.stakeholders.length}',
                  child: _StakeholdersSection(
                    projectId: project.id,
                    stakeholders: project.stakeholders,
                    decisionMaker: project.decisionMaker,
                    isClosed: project.isClosed,
                  ),
                ),
                verticalSpace(12.h),

                ExpandableSection(
                  icon: Icons.event_note_outlined,
                  title: context.tr('projects_detail_section_activities'),
                  trailingLabel: '${project.activities.length}',
                  child: _ActivitiesSection(
                    projectId: project.id,
                    activities: project.activities,
                    stakeholders: project.stakeholders,
                    currentStage: project.stage,
                    version: project.version,
                    isClosed: project.isClosed,
                  ),
                ),
                verticalSpace(12.h),

                ExpandableSection(
                  icon: Icons.flag_outlined,
                  title: context.tr('projects_detail_section_stage_status'),
                  trailingLabel: context.tr(project.stage.labelKey),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _StageControl(project: project),
                      verticalSpace(16.h),
                      _StatusControl(project: project),
                    ],
                  ),
                ),
                verticalSpace(12.h),

                ExpandableSection(
                  icon: Icons.photo_library_outlined,
                  title: context.tr('projects_detail_section_images'),
                  // §9: `imageCount` is the live count against the 10-photo
                  // ceiling and is deliberately *not* `images.length` (an
                  // unsigned photo stays in the array with `url: null`).
                  trailingLabel: '${project.imageCount}',
                  child: _GallerySection(
                    projectId: project.id,
                    images: project.images,
                    imageCount: project.imageCount,
                    isClosed: project.isClosed,
                  ),
                ),
                verticalSpace(12.h),

                ExpandableSection(
                  icon: Icons.history_rounded,
                  title: context.tr('projects_detail_section_history'),
                  child: _HistorySection(projectId: project.id),
                ),

                if (project.stage != ProjectStage.won &&
                    project.stage != ProjectStage.lost) ...[
                  verticalSpace(12.h),
                  ExpandableSection(
                    icon: Icons.emoji_events_outlined,
                    title: context.tr('projects_detail_section_outcome'),
                    child: _OutcomeSection(project: project),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Text(text, style: context.textStyles.smBold),
    );
  }
}

// ── Gallery ────────────────────────────────────────────────────────────

class _GallerySection extends StatelessWidget {
  final String projectId;
  final List<dynamic> images; // ProjectImageView
  final int imageCount;

  /// Settled project: photos stay viewable but can no longer be added or
  /// removed — they are part of the record the outcome was approved on.
  final bool isClosed;

  const _GallerySection({
    required this.projectId,
    required this.images,
    required this.imageCount,
    required this.isClosed,
  });

  Future<void> _addPhotos(BuildContext context) async {
    final remaining = 10 - imageCount;
    if (remaining <= 0) return;
    final picker = ImagePicker();
    final picked = await picker.pickMultiImage(imageQuality: 85);
    if (picked.isEmpty || !context.mounted) return;

    final fileUploadBloc = context.read<FileUploadBloc>();
    const uuid = Uuid();
    final localIds = <String>[];
    for (final xFile in picked.take(remaining)) {
      final localId = uuid.v4();
      localIds.add(localId);
      fileUploadBloc.add(
        FileUploadEvent.uploadRequested(
          localId: localId,
          file: File(xFile.path),
        ),
      );
    }

    // Wait for every upload started here to leave the "uploading" status,
    // then submit whichever succeeded — matches the register screen's
    // "wait for uploads" rule, just without a persistent picker grid.
    final projectsBloc = context.read<ProjectsBloc>();
    await fileUploadBloc.stream.firstWhere((s) {
      return localIds.every((id) {
        final item = s.uploads[id];
        return item != null && item.status != FileUploadItemStatus.uploading;
      });
    });
    if (!context.mounted) return;
    final uploaded = localIds
        .map((id) => fileUploadBloc.state.uploads[id]?.file)
        .whereType<StoredFileView>()
        .map((f) => ProjectFileRefDto(key: f.key, name: f.name))
        .toList();
    if (uploaded.isEmpty) return;
    projectsBloc.add(
      ProjectsEvent.imagesAddSubmitted(id: projectId, files: uploaded),
    );
  }

  /// Opens the full-screen viewer starting at [tapped]. Only signed photos
  /// are passed through, and the start index is computed against that
  /// filtered list so it still lands on the right one.
  void _openViewer(BuildContext context, ProjectImageView tapped) {
    final viewable = images
        .cast<ProjectImageView>()
        .where((image) => image.url != null)
        .toList();
    final startIndex = viewable.indexWhere((image) => image.id == tapped.id);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ImageViewerScreen(
          images: [
            for (final image in viewable)
              ViewableImage.network(image.url!, caption: image.caption),
          ],
          initialIndex: startIndex < 0 ? 0 : startIndex,
        ),
      ),
    );
  }

  void _removePhoto(BuildContext context, String imageId) {
    context.read<ProjectsBloc>().add(
      ProjectsEvent.imageRemoveSubmitted(id: projectId, imageId: imageId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final canDelete = imageCount > 1 && !isClosed;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 88.w,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final image in images.cast<ProjectImageView>())
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Stack(
                    children: [
                      GestureDetector(
                        // Opens the full-screen viewer at this photo, with
                        // the rest of the gallery swipeable from there.
                        // Unsigned photos (`url == null`) aren't openable —
                        // there's nothing to show.
                        onTap: image.url == null
                            ? null
                            : () => _openViewer(context, image),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(AppRadius.field),
                          child: SizedBox(
                            width: 80.w,
                            height: 80.w,
                            child: image.url != null
                                ? Image.network(image.url!, fit: BoxFit.cover)
                                : Container(
                                    color: colors.ink100,
                                    child: Icon(
                                      Icons.image_not_supported_outlined,
                                      color: colors.textColor70,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      if (canDelete)
                        Positioned(
                          top: 2.h,
                          right: 2.w,
                          child: GestureDetector(
                            onTap: () => _removePhoto(context, image.id),
                            child: Container(
                              padding: EdgeInsets.all(2.w),
                              decoration: const BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                size: 14.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              if (imageCount < 10 && !isClosed)
                PressableScale(
                  onTap: () => _addPhotos(context),
                  child: Container(
                    width: 80.w,
                    height: 80.w,
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(AppRadius.field),
                      border: Border.all(color: colors.ink200),
                    ),
                    child: Icon(
                      Icons.add_a_photo_outlined,
                      color: colors.textColor70,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Card fields ──────────────────────────────────────────────────────────

class _CardSection extends StatelessWidget {
  final ProjectDetailView project;
  const _CardSection({required this.project});

  /// `PATCH /projects/{id}` covers exactly the fields shown here, so the
  /// edit affordance belongs on this section rather than the screen header.
  /// A `true` result means something changed (or the local copy went stale)
  /// and the detail needs re-reading.
  Future<void> _openEdit(BuildContext context) async {
    final bloc = context.read<ProjectsBloc>();
    final changed = await context.pushNamed(
      Routes.editProjectScreen,
      arguments: {'project': project},
    );
    if (changed == true) {
      bloc.add(ProjectsEvent.detailRefreshed(project.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The edit button rides on the first field's row rather than sitting
        // alone above it — on its own line it had nothing opposite it and
        // read as a stray control.
        //
        // Hidden outright once the project is closed: a confirmed outcome
        // moves the stage to WON/LOST in the same transaction as the
        // manager's approval, and the record is then history. See
        // [ProjectDetailViewX.isClosed].
        _InfoRow(
          label: context.tr('projects_register_building_type'),
          value: context.tr(project.buildingType.labelKey),
          trailing: project.isClosed
              ? null
              : PressableScale(
                  onTap: () => _openEdit(context),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 5.h,
                    ),
                    decoration: BoxDecoration(
                      color: colors.brand50,
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          size: 14.sp,
                          color: colors.brand600,
                        ),
                        horizontalSpace(4),
                        Text(
                          context.tr('edit_project_cta'),
                          style: context.textStyles.xsSemibold.copyWith(
                            color: colors.brand600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
        _InfoRow(
          label: context.tr('projects_register_construction_phase'),
          value: context.tr(project.constructionPhase.labelKey),
        ),
        _InfoRow(
          label: context.tr('projects_register_description'),
          value: project.description,
        ),
        if (project.addressLine != null)
          _InfoRow(
            label: context.tr('projects_register_address'),
            value: project.addressLine!,
          ),
        if (project.territory != null)
          _InfoRow(
            label: context.tr('projects_detail_territory'),
            value: project.territory!.name,
          ),
        if (project.unitCount != null)
          _InfoRow(
            label: context.tr('projects_register_unit_count'),
            value: '${project.unitCount}',
          ),
        if (project.estimatedValue != null)
          _InfoRow(
            label: context.tr('projects_register_estimated_value'),
            value: '${project.estimatedValue} ${project.currency ?? ''}',
          ),
        if (project.notes != null)
          _InfoRow(
            label: context.tr('projects_register_notes'),
            value: project.notes!,
          ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  /// Optional action pinned to the row's trailing edge, so a control can sit
  /// opposite a field instead of alone on a line of its own.
  final Widget? trailing;

  const _InfoRow({required this.label, required this.value, this.trailing});

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.textStyles.xsMedium),
        Text(value, style: context.textStyles.smMedium),
      ],
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: trailing == null
          ? content
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: content),
                horizontalSpace(10),
                trailing!,
              ],
            ),
    );
  }
}

// ── Stage control ────────────────────────────────────────────────────────

class _StageControl extends StatelessWidget {
  final ProjectDetailView project;
  const _StageControl({required this.project});

  bool get _isTerminal => project.isClosed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(context.tr('projects_detail_stage')),
        if (_isTerminal)
          Text(
            context.tr('projects_detail_stage_terminal_note'),
            style: context.textStyles.xsMedium,
          )
        else
          OptionPickerField<ProjectStage>(
            hintText: context.tr('projects_register_stage_hint'),
            value: project.stage,
            options: openProjectStages,
            labelOf: (v) => context.tr(v.labelKey),
            onChanged: (stage) {
              if (stage == project.stage) return;
              context.read<ProjectsBloc>().add(
                ProjectsEvent.stageChangeSubmitted(
                  id: project.id,
                  request: ChangeStageRequest(
                    stage: stage,
                    expectedVersion: project.version,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

// ── Outcome section ──────────────────────────────────────────────────────

/// §5 `POST /projects/{id}/won` and `.../lost` entry point — opens
/// `SubmitOutcomeScreen`.
///
/// Unless a claim is already pending. `ProjectDetailView.pendingOutcome`
/// carries the one the rep (or a colleague) already filed and a manager has
/// not yet decided; while it is there the button is replaced by the claim
/// itself. The server would refuse a second submission anyway
/// (`OUTCOME_ALREADY_OPEN`, handled on the submit screen), but only after
/// the rep had filled the entire form a second time — and without ever
/// showing them what the first one said.
class _OutcomeSection extends StatelessWidget {
  final ProjectDetailView project;
  const _OutcomeSection({required this.project});

  /// No `initialType`: the submit screen defaults to `lost` and lets the rep
  /// choose, rather than this button deciding for them.
  void _open(BuildContext context) {
    context.pushNamed(
      Routes.submitOutcomeScreen,
      arguments: {'projectId': project.id},
    );
  }

  @override
  Widget build(BuildContext context) {
    final pending = project.pendingOutcome;
    if (project.hasPendingOutcome && pending != null) {
      return _PendingOutcomeCard(outcome: pending);
    }

    // One button, not two. The submit screen already carries its own
    // won/lost selector, so a pair here only asked the same question twice —
    // and pre-answering it makes the rep more likely to submit the outcome
    // they clicked rather than the one that happened.
    return AppButton(
      text: context.tr('projects_detail_submit_outcome'),
      onPressed: () => _open(context),
    );
  }
}

/// The claim already filed on this project, shown in place of the submit
/// button while a manager decides.
///
/// Renders what was actually claimed — not just "a request is pending" —
/// because the rep's next question after "why can't I submit?" is always
/// "what did it say?", and answering it here saves a round trip to the
/// outcome screen.
class _PendingOutcomeCard extends StatelessWidget {
  final OutcomeView outcome;

  const _PendingOutcomeCard({required this.outcome});

  static String _formatDate(DateTime value) {
    final local = value.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-${two(local.month)}-${two(local.day)}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final won = outcome.type == OutcomeType.won;
    // Amber, not the won/lost colour: nothing has been decided yet, and
    // painting a pending claim green would read as an approval.
    final status = colors.statusFollowUp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: status.badgeBg,
            borderRadius: BorderRadius.circular(AppRadius.card),
            border: Border.all(color: status.core.withValues(alpha: 0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.hourglass_top_rounded,
                    size: 18.sp,
                    color: status.core,
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context
                              .tr('projects_detail_outcome_pending_title')
                              .replaceAll(
                                '{type}',
                                context.tr(outcome.type.labelKey),
                              ),
                          style: context.textStyles.smBold.copyWith(
                            color: status.badgeText,
                          ),
                        ),
                        verticalSpace(3.h),
                        Text(
                          context.tr('projects_detail_outcome_pending_lock'),
                          style: context.textStyles.xsMedium.copyWith(
                            color: status.badgeText,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(12.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.field),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InfoRow(
                      label: context.tr('projects_detail_outcome_submitted_at'),
                      value: _formatDate(outcome.submittedAt),
                    ),
                    if (won) ...[
                      if (outcome.distributor != null)
                        _InfoRow(
                          label: context.tr('submit_won_distributor'),
                          value: outcome.distributor!.name,
                        ),
                      if (outcome.value != null)
                        _InfoRow(
                          label: context.tr('submit_won_value'),
                          value:
                              '${outcome.value!.toStringAsFixed(0)}'
                                      ' ${outcome.currency ?? ''}'
                                  .trim(),
                        ),
                      if (outcome.unitsSupplied != null &&
                          outcome.unitsTotal != null)
                        _InfoRow(
                          label: context.tr('submit_won_units_supplied'),
                          value:
                              '${outcome.unitsSupplied} / ${outcome.unitsTotal}',
                        ),
                      // The count, not the files: these URLs expire, and
                      // re-signing a whole list to render thumbnails nobody
                      // asked for spends requests for nothing. The outcome
                      // screen opens them properly.
                      if (outcome.attachments.isNotEmpty)
                        _InfoRow(
                          label: context.tr('submit_won_files'),
                          value: '${outcome.attachments.length}',
                        ),
                    ] else ...[
                      if (outcome.lossReason != null)
                        _InfoRow(
                          label: context.tr('submit_outcome_reason'),
                          value: context.tr(outcome.lossReason!.labelKey),
                        ),
                      if (outcome.competitor != null)
                        _InfoRow(
                          label: context.tr('submit_outcome_competitor'),
                          value: outcome.competitor!.name,
                        ),
                      if (outcome.narrative != null &&
                          outcome.narrative!.trim().isNotEmpty)
                        _InfoRow(
                          label: context.tr('submit_outcome_narrative'),
                          value: outcome.narrative!.trim(),
                        ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        verticalSpace(12.h),
        AppButton(
          text: context.tr('projects_detail_outcome_pending_open'),
          onPressed: () => context.pushNamed(
            Routes.outcomeDetailScreen,
            arguments: {'outcomeId': outcome.id},
          ),
        ),
      ],
    );
  }
}

// ── Status control ──────────────────────────────────────────────────────

class _StatusControl extends StatelessWidget {
  final ProjectDetailView project;
  const _StatusControl({required this.project});

  Future<void> _changeStatus(
    BuildContext context,
    ProjectStatus newStatus,
  ) async {
    final reason = await _promptReason(context);
    if (reason == null || !context.mounted) return;
    context.read<ProjectsBloc>().add(
      ProjectsEvent.statusChangeSubmitted(
        id: project.id,
        request: ChangeStatusRequest(
          status: newStatus,
          reason: reason,
          expectedVersion: project.version,
        ),
      ),
    );
  }

  Future<String?> _promptReason(BuildContext context) async {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return AppDialog.show<String>(
      context: context,
      title: context.tr('projects_detail_status_reason_title'),
      content: Form(
        key: formKey,
        child: AppTextField(
          hintText: context.tr('projects_detail_status_reason_hint'),
          controller: controller,
          maxLines: 3,
          validator: (value) {
            final trimmed = value?.trim() ?? '';
            if (trimmed.length < 10 || trimmed.length > 500) {
              return context.tr('projects_detail_status_reason_error');
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(context.tr('projects_detail_status')),
        // Same lock as the stage picker above: once an outcome is confirmed
        // the record is history, so the status buttons become a plain label.
        if (project.isClosed)
          Text(
            context.tr(project.status.labelKey),
            style: context.textStyles.smMedium,
          )
        else
          switch (project.status) {
            ProjectStatus.active => Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: context.tr('projects_detail_set_dormant'),
                    variant: AppButtonVariant.secondary,
                    size: AppButtonSize.sm,
                    onPressed: () =>
                        _changeStatus(context, ProjectStatus.dormant),
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: AppButton(
                    text: context.tr('projects_detail_set_cancelled'),
                    variant: AppButtonVariant.secondary,
                    size: AppButtonSize.sm,
                    onPressed: () =>
                        _changeStatus(context, ProjectStatus.cancelled),
                  ),
                ),
              ],
            ),
            ProjectStatus.dormant => Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: context.tr('projects_detail_resume'),
                    variant: AppButtonVariant.secondary,
                    size: AppButtonSize.sm,
                    onPressed: () =>
                        _changeStatus(context, ProjectStatus.active),
                  ),
                ),
                horizontalSpace(10),
                Expanded(
                  child: AppButton(
                    text: context.tr('projects_detail_set_cancelled'),
                    variant: AppButtonVariant.secondary,
                    size: AppButtonSize.sm,
                    onPressed: () =>
                        _changeStatus(context, ProjectStatus.cancelled),
                  ),
                ),
              ],
            ),
            ProjectStatus.cancelled => Text(
              context.tr('projects_detail_cancelled_note'),
              style: context.textStyles.xsMedium,
            ),
          },
      ],
    );
  }
}

// ── Activities (read-only, Phase 2 owns the full feature) ────────────────

class _ActivitiesSection extends StatelessWidget {
  final String projectId;
  final List<ActivityView> activities;
  final List<StakeholderRefView> stakeholders;

  /// Passed down so the visit form can show — and let the rep move — the
  /// funnel stage without a second round trip to read it.
  final ProjectStage currentStage;

  /// For the optimistic-concurrency check on a stage change the log screen
  /// asks for. Kept on this side because the log screen has no `ProjectsBloc`
  /// and therefore no view of the project's version.
  final int version;

  /// A confirmed WON/LOST outcome makes the project a closed record: the
  /// feed stays readable — those visits genuinely happened and are what the
  /// outcome was judged on — but nothing new can be logged against it.
  final bool isClosed;

  const _ActivitiesSection({
    required this.projectId,
    required this.activities,
    required this.stakeholders,
    required this.currentStage,
    required this.version,
    required this.isClosed,
  });

  Future<void> _openLogActivity(BuildContext context) async {
    final result = await context.pushNamed(
      Routes.logActivityScreen,
      arguments: {
        'projectId': projectId,
        'stakeholders': stakeholders,
        'currentStage': currentStage,
      },
    );
    if (!context.mounted) return;

    // The offline branch pops bare, so a non-record result is expected.
    final logResult = result is LogActivityResult ? result : null;
    final newStage = logResult?.stage;

    final bloc = context.read<ProjectsBloc>();
    if (newStage != null && newStage != currentStage) {
      // Not followed by a `detailRefreshed`: the stage change responds with
      // the updated project and the Bloc folds it into `selectedProject`.
      // Firing both would race, and the refresh could land first and be
      // overwritten by a staler read.
      bloc.add(
        ProjectsEvent.stageChangeSubmitted(
          id: projectId,
          request: ChangeStageRequest(
            stage: newStage,
            expectedVersion: version,
          ),
        ),
      );
    } else {
      bloc.add(ProjectsEvent.detailRefreshed(projectId));
    }

    if (logResult?.suggestion == 'SET_DORMANT') {
      _promptSetDormant(context);
    }
  }

  Future<void> _promptSetDormant(BuildContext context) async {
    final controller = TextEditingController(
      text: context.tr('projects_detail_work_stopped_default_reason'),
    );
    await AppDialog.show<void>(
      context: context,
      title: context.tr('projects_detail_set_dormant_prompt_title'),
      message: context.tr('projects_detail_set_dormant_prompt_message'),
      actions: [
        AppDialogButton.secondary(
          label: context.tr('cancel'),
          onPressed: () => context.pop(),
        ),
        AppDialogButton.primary(
          label: context.tr('projects_detail_set_dormant'),
          onPressed: () {
            context.pop();
            context.read<ProjectsBloc>().add(
              ProjectsEvent.statusChangeSubmitted(
                id: projectId,
                request: ChangeStatusRequest(
                  status: ProjectStatus.dormant,
                  reason: controller.text.trim(),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The section's own title now lives on the ExpandableSection header,
        // so this row keeps only its action, right-aligned.
        //
        // Hidden rather than disabled on a closed project: a greyed button
        // invites a tap and then explains itself, while the banner at the
        // top of the screen has already said why nothing here is editable.
        if (!isClosed) ...[
          Row(
            children: [
              const Spacer(),
              PressableScale(
                onTap: () => _openLogActivity(context),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: colors.brand50,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add, size: 14.sp, color: colors.brand600),
                      horizontalSpace(4),
                      Text(
                        context.tr('projects_detail_log_activity'),
                        style: context.textStyles.xsSemibold.copyWith(
                          color: colors.brand600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(4.h),
        ],
        if (activities.isEmpty)
          _InlineEmptyHint(
            icon: Icons.event_note_outlined,
            label: context.tr('projects_detail_activities_empty'),
          )
        else
          for (var i = 0; i < activities.length; i++)
            _ActivityTimelineTile(
              activity: activities[i],
              isLast: i == activities.length - 1,
              isClosed: isClosed,
            ),
      ],
    );
  }
}

/// One entry in the activity feed, drawn as a timeline row: a dot and a
/// connector rail on the leading edge, the entry's content beside it.
///
/// §9 orders `activities` newest-first by `occurredAt`, and the doc is
/// explicit that `occurredAt` (when it happened) is the one to show — not
/// `capturedAt` (when it was typed), which differs constantly because reps
/// log a whole day in one evening batch.
class _ActivityTimelineTile extends StatelessWidget {
  final ActivityView activity;
  final bool isLast;

  /// Carried through to the detail screen, which hides its edit button on a
  /// closed project. The row itself stays tappable — reading an entry is
  /// exactly what a closed project is still for.
  final bool isClosed;

  const _ActivityTimelineTile({
    required this.activity,
    required this.isLast,
    required this.isClosed,
  });

  String _formatOccurredAt(DateTime value) {
    final local = value.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${local.year}-${two(local.month)}-${two(local.day)}'
        '  ${two(local.hour)}:${two(local.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isVisit = activity.kind == ActivityKind.visit;
    // Visit vs communication is the one distinction worth a colour here —
    // it maps to "I was on site" vs "I called", which reads at a glance.
    final accent = isVisit ? colors.statusVisit.core : colors.brand500;

    return PressableScale(
      onTap: () => context.pushNamed(
        Routes.activityDetailScreen,
        arguments: {'activityId': activity.id, 'projectClosed': isClosed},
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rail: dot + connector. The connector is omitted on the last
            // row so the timeline visibly terminates.
            Column(
              children: [
                Container(
                  width: 10.w,
                  height: 10.w,
                  margin: EdgeInsets.only(top: 4.h),
                  decoration: BoxDecoration(
                    color: accent,
                    shape: BoxShape.circle,
                    border: Border.all(color: colors.surface, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: accent.withValues(alpha: 0.25),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1.5,
                      margin: EdgeInsets.symmetric(vertical: 3.h),
                      color: colors.ink200,
                    ),
                  ),
              ],
            ),
            horizontalSpace(10),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: isLast ? 0 : 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          isVisit
                              ? Icons.location_on_outlined
                              : Icons.call_outlined,
                          size: 13.sp,
                          color: accent,
                        ),
                        horizontalSpace(4),
                        Expanded(
                          child: Text(
                            context.tr(activity.kind.labelKey),
                            style: context.textStyles.xsSemibold,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          _formatOccurredAt(activity.occurredAt),
                          style: context.textStyles.xsMedium.copyWith(
                            color: colors.ink400,
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(3.h),
                    Text(
                      activity.notes,
                      style: context.textStyles.xsMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpace(4.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            context.tr(activity.outcome.labelKey),
                            style: context.textStyles.xsMedium.copyWith(
                              color: colors.textColor70,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 15.sp,
                          color: colors.textColor70,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Stakeholders ──────────────────────────────────────────────────────
//
// stakeholders.md — all nine `/projects/{projectId}` sub-routes are open to
// a REPRESENTATIVE, so unlike most role-gated controls elsewhere in this
// app, every action here is always shown (no "hide, don't rely on the
// error" gating needed). The list itself stays the embedded
// `ProjectDetailView.stakeholders`/`.decisionMaker` snapshot — mutations go
// through their own `StakeholdersBloc` instance and, on success, ask
// `ProjectsBloc` to refresh the project detail (same pattern as "Log
// activity"), rather than this section owning a second, parallel list.
class _StakeholdersSection extends StatefulWidget {
  final String projectId;
  final List<StakeholderRefView> stakeholders;
  final DecisionMakerRefView? decisionMaker;

  /// A confirmed WON/LOST outcome freezes the roster. Who was involved and
  /// who decided is part of the record the outcome was judged on, so it
  /// stays fully readable — but nobody can be added, replaced, unlinked, or
  /// promoted to decision maker after the fact.
  final bool isClosed;

  const _StakeholdersSection({
    required this.projectId,
    required this.stakeholders,
    required this.decisionMaker,
    required this.isClosed,
  });

  @override
  State<_StakeholdersSection> createState() => _StakeholdersSectionState();
}

class _StakeholdersSectionState extends State<_StakeholdersSection> {
  late final StakeholdersBloc _bloc = getIt<StakeholdersBloc>();

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _refreshProject() {
    context.read<ProjectsBloc>().add(
      ProjectsEvent.detailRefreshed(widget.projectId),
    );
  }

  Future<void> _openAddStakeholder() async {
    final added = await context.pushNamed(
      Routes.addStakeholderLinkScreen,
      arguments: {
        'projectId': widget.projectId,
        // Lets the form offer companies already on this project, so the
        // second person a rep meets is filed under the existing account
        // rather than a near-duplicate of it.
        'existingLinks': <ProjectCompanyOption>[
          for (final link in widget.stakeholders)
            (accountId: link.accountId, name: link.accountName),
        ],
      },
    );
    if (added == true && mounted) _refreshProject();
  }

  Future<void> _openEditLink(StakeholderRefView link) async {
    final edited = await context.pushNamed(
      Routes.editStakeholderLinkScreen,
      arguments: {
        'projectId': widget.projectId,
        'linkId': link.linkId,
        'accountId': link.accountId,
        'initialContactName': link.primaryContact == null
            ? null
            : '${link.primaryContact!.firstName} ${link.primaryContact!.lastName}',
        'initialNote': link.note,
      },
    );
    if (edited == true && mounted) _refreshProject();
  }

  Future<void> _openReplaceLink(StakeholderRefView link) async {
    final replaced = await context.pushNamed(
      Routes.replaceStakeholderLinkScreen,
      arguments: {
        'projectId': widget.projectId,
        'linkId': link.linkId,
        'outgoingAccountName': link.accountName,
        'roleLabel': context.tr(link.role.labelKey),
      },
    );
    if (replaced == true && mounted) _refreshProject();
  }

  Future<void> _promptCloseLink(StakeholderRefView link) async {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final reason = await AppDialog.show<String>(
      context: context,
      title: context.tr('stakeholder_close_title'),
      content: Form(
        key: formKey,
        child: AppTextField(
          hintText: context.tr('stakeholder_close_hint'),
          controller: controller,
          maxLines: 3,
          validator: (value) {
            final trimmed = value?.trim() ?? '';
            if (trimmed.length < 10 || trimmed.length > 500) {
              return context.tr('stakeholder_close_error');
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
          label: context.tr('stakeholder_close_cta'),
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            context.pop(controller.text.trim());
          },
        ),
      ],
    );
    if (reason == null || !mounted) return;
    _bloc.add(
      StakeholdersEvent.linkCloseSubmitted(
        projectId: widget.projectId,
        linkId: link.linkId,
        request: CloseStakeholderLinkRequest(reason: reason),
      ),
    );
  }

  Future<void> _openLinkActions(StakeholderRefView link) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (sheetContext) {
        final colors = sheetContext.colors;
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _SheetAction(
                icon: Icons.people_alt_outlined,
                label: sheetContext.tr('stakeholder_action_contacts'),
                onTap: () => sheetContext.pop('contacts'),
              ),
              _SheetAction(
                icon: Icons.edit_outlined,
                label: sheetContext.tr('stakeholder_action_edit'),
                onTap: () => sheetContext.pop('edit'),
              ),
              _SheetAction(
                icon: Icons.swap_horiz_rounded,
                label: sheetContext.tr('stakeholder_action_replace'),
                onTap: () => sheetContext.pop('replace'),
              ),
              _SheetAction(
                icon: Icons.link_off_rounded,
                label: sheetContext.tr('stakeholder_action_close'),
                color: colors.statusLost.core,
                onTap: () => sheetContext.pop('close'),
              ),
              verticalSpace(8.h),
            ],
          ),
        );
      },
    );
    if (!mounted || action == null) return;
    switch (action) {
      case 'contacts':
        // Pops `true` after a decision-maker change, which is the one
        // action there that invalidates the detail screen's own data.
        final changed = await context.pushNamed(
          Routes.accountContactsScreen,
          arguments: {
            'projectId': widget.projectId,
            'accountId': link.accountId,
            'accountName': link.accountName,
          },
        );
        if (changed == true && mounted) _refreshProject();
      case 'edit':
        await _openEditLink(link);
      case 'replace':
        await _openReplaceLink(link);
      case 'close':
        await _promptCloseLink(link);
    }
  }

  Future<void> _promptSetDecisionMaker() async {
    if (widget.stakeholders.isEmpty) {
      _showSnack(context.tr('decision_maker_needs_stakeholder'));
      return;
    }
    // A stakeholder *is* a person here, so the sheet names people (with
    // their company as the subtitle) and the flag targets that person
    // directly — no second "now pick a contact" hop.
    final chosenLink = await showModalBottomSheet<StakeholderRefView>(
      context: context,
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (final link in widget.stakeholders)
                _SheetAction(
                  icon: Icons.person_outline_rounded,
                  label: link.primaryContact == null
                      ? link.accountName
                      : '${link.primaryContact!.firstName} '
                            '${link.primaryContact!.lastName} — '
                            '${link.accountName}',
                  onTap: () => sheetContext.pop(link),
                ),
              verticalSpace(8.h),
            ],
          ),
        );
      },
    );
    if (chosenLink == null || !mounted) return;

    // Links created through the unified add-stakeholder form always carry a
    // primary contact. Older links (or ones created company-first) may not,
    // so fall back to the contact picker rather than dead-ending.
    String? contactId = chosenLink.primaryContact?.contactId;
    if (contactId == null) {
      final picked = await context.pushNamed(
        Routes.contactPickerScreen,
        arguments: {'accountId': chosenLink.accountId},
      );
      if (picked is! ContactView || !mounted) return;
      contactId = picked.id;
    }

    String? reason;
    if (widget.decisionMaker != null) {
      final controller = TextEditingController();
      final formKey = GlobalKey<FormState>();
      reason = await AppDialog.show<String>(
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
      if (reason == null || !mounted) return;
    }

    _bloc.add(
      StakeholdersEvent.decisionMakerSetSubmitted(
        projectId: widget.projectId,
        request: SetDecisionMakerRequest(contactId: contactId, reason: reason),
      ),
    );
  }

  Future<void> _promptRemoveDecisionMaker() async {
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    final reason = await AppDialog.show<String>(
      context: context,
      title: context.tr('decision_maker_remove_title'),
      content: Form(
        key: formKey,
        child: AppTextField(
          hintText: context.tr('decision_maker_remove_hint'),
          controller: controller,
          maxLines: 3,
          validator: (value) {
            final trimmed = value?.trim() ?? '';
            if (trimmed.length < 10 || trimmed.length > 500) {
              return context.tr('decision_maker_remove_error');
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
          label: context.tr('decision_maker_remove_cta'),
          onPressed: () {
            if (!formKey.currentState!.validate()) return;
            context.pop(controller.text.trim());
          },
        ),
      ],
    );
    if (reason == null || !mounted) return;
    _bloc.add(
      StakeholdersEvent.decisionMakerRemoveSubmitted(
        projectId: widget.projectId,
        request: ReasonRequest(reason: reason),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<StakeholdersBloc, StakeholdersState>(
        listenWhen: (previous, current) =>
            previous.linkMutationStatus != current.linkMutationStatus ||
            previous.decisionMakerMutationStatus !=
                current.decisionMakerMutationStatus,
        listener: (context, state) {
          if (state.linkMutationStatus == StakeholderMutationStatus.success) {
            _refreshProject();
          } else if (state.linkMutationStatus !=
                  StakeholderMutationStatus.idle &&
              state.linkMutationStatus !=
                  StakeholderMutationStatus.inProgress) {
            _showSnack(
              state.linkMutationErrorMessage ?? context.tr('error_unexpected'),
            );
          }
          if (state.decisionMakerMutationStatus ==
              StakeholderMutationStatus.success) {
            _refreshProject();
          } else if (state.decisionMakerMutationStatus !=
                  StakeholderMutationStatus.idle &&
              state.decisionMakerMutationStatus !=
                  StakeholderMutationStatus.inProgress) {
            _showSnack(
              state.decisionMakerMutationErrorMessage ??
                  context.tr('error_unexpected'),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title lives on the ExpandableSection header now.
            if (!widget.isClosed)
              Row(
                children: [
                  const Spacer(),
                  PressableScale(
                    onTap: _openAddStakeholder,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.brand50,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add,
                            size: 14.sp,
                            color: context.colors.brand600,
                          ),
                          horizontalSpace(4),
                          Text(
                            context.tr('add_stakeholder_cta'),
                            style: context.textStyles.xsSemibold.copyWith(
                              color: context.colors.brand600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            verticalSpace(4.h),
            if (widget.stakeholders.isEmpty)
              _InlineEmptyHint(
                icon: Icons.groups_outlined,
                label: context.tr('projects_detail_stakeholders_empty'),
              )
            else
              for (final stakeholder in widget.stakeholders)
                PressableScale(
                  // The actions sheet is edit/replace/unlink plus "view
                  // contacts", so on a closed project it is suppressed
                  // whole — the roster below still reads normally.
                  onTap: widget.isClosed
                      ? null
                      : () => _openLinkActions(stakeholder),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      children: [
                        // Person first, company + role underneath — a
                        // stakeholder is read as "who", not "which firm".
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                stakeholder.primaryContact == null
                                    ? stakeholder.accountName
                                    : '${stakeholder.primaryContact!.firstName} '
                                          '${stakeholder.primaryContact!.lastName}',
                                style: context.textStyles.xsSemibold,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                stakeholder.primaryContact == null
                                    ? context.tr(stakeholder.role.labelKey)
                                    : '${stakeholder.accountName} · '
                                          '${context.tr(stakeholder.role.labelKey)}',
                                style: context.textStyles.xsMedium.copyWith(
                                  color: context.colors.textColor70,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          size: 16.sp,
                          color: context.colors.textColor70,
                        ),
                      ],
                    ),
                  ),
                ),
            verticalSpace(12.h),
            Row(
              children: [
                Expanded(
                  child: Text(
                    context.tr('projects_detail_decision_maker'),
                    style: context.textStyles.smBold,
                  ),
                ),
                PressableScale(
                  onTap: () => context.pushNamed(
                    Routes.decisionMakerHistoryScreen,
                    arguments: {'projectId': widget.projectId},
                  ),
                  child: Text(
                    context.tr('decision_maker_history_cta'),
                    style: context.textStyles.xsSemibold.copyWith(
                      color: context.colors.brand600,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(6.h),
            if (widget.decisionMaker == null)
              _InlineEmptyHint(
                icon: Icons.person_search_outlined,
                label: context.tr('decision_maker_empty'),
              )
            else
              Padding(
                padding: EdgeInsets.only(bottom: 6.h),
                child: Text(
                  '${widget.decisionMaker!.contactName} — '
                  '${widget.decisionMaker!.accountName}',
                  style: context.textStyles.xsSemibold,
                ),
              ),
            verticalSpace(8.h),
            if (!widget.isClosed)
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _promptSetDecisionMaker,
                      child: Text(
                        widget.decisionMaker == null
                            ? context.tr('decision_maker_set_cta')
                            : context.tr('decision_maker_change_cta'),
                      ),
                    ),
                  ),
                  if (widget.decisionMaker != null) ...[
                    horizontalSpace(8),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _promptRemoveDecisionMaker,
                        child: Text(context.tr('decision_maker_remove_cta')),
                      ),
                    ),
                  ],
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _SheetAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback onTap;
  const _SheetAction({
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ListTile(
      leading: Icon(icon, color: color ?? colors.iconColor),
      title: Text(
        label,
        style: context.textStyles.smMedium.copyWith(color: color),
      ),
      onTap: onTap,
    );
  }
}

// ── History ───────────────────────────────────────────────────────────

class _HistorySection extends StatelessWidget {
  final String projectId;

  const _HistorySection({required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      buildWhen: (previous, current) =>
          previous.historyStatus != current.historyStatus ||
          previous.history != current.history,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.historyStatus == PagedFeedStatus.loading)
              AppShimmer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonBox(width: double.infinity, height: 12.h),
                    verticalSpace(8.h),
                    SkeletonBox(width: 180.w, height: 12.h),
                  ],
                ),
              )
            else if (state.history.isEmpty)
              _InlineEmptyHint(
                icon: Icons.history_outlined,
                label: context.tr('projects_detail_history_empty'),
              )
            else
              for (final entry in state.history)
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: switch (entry) {
                    ProjectStageHistoryEntryView() => Text(
                      context
                          .tr('projects_history_stage_entry')
                          .replaceAll(
                            '{stage}',
                            context.tr(entry.toStage.labelKey),
                          ),
                      style: context.textStyles.xsMedium,
                    ),
                    ProjectStatusHistoryEntryView() => Text(
                      context
                          .tr('projects_history_status_entry')
                          .replaceAll(
                            '{status}',
                            context.tr(entry.toStatus.labelKey),
                          ),
                      style: context.textStyles.xsMedium,
                    ),
                  },
                ),
            if (state.historyStatus == PagedFeedStatus.paginationLoading)
              const Center(child: CircularProgressIndicator())
            else if (state.historyPagination != null &&
                state.historyPagination!.page <
                    state.historyPagination!.totalPages)
              Center(
                child: TextButton(
                  onPressed: () => context.read<ProjectsBloc>().add(
                    ProjectsEvent.historyNextPageRequested(projectId),
                  ),
                  child: Text(context.tr('projects_detail_history_load_more')),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// A compact "nothing here yet" row for a section that lives inside a
/// larger scroll (unlike `EmptyState`, which owns the whole screen) —
/// activities/stakeholders/history all read the same way: a muted icon,
/// then the hint, instead of a bare line of text.
class _InlineEmptyHint extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InlineEmptyHint({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: colors.textColor70),
        horizontalSpace(8),
        Expanded(child: Text(label, style: context.textStyles.xsMedium)),
      ],
    );
  }
}

/// Rough shape of `_ProjectDetailBody` (badge row + a few stacked section
/// cards) — not pixel-perfect per section, just enough that the loaded
/// layout doesn't visually jump in once real data replaces it.
class _ProjectDetailSkeleton extends StatelessWidget {
  const _ProjectDetailSkeleton();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    Widget card(double height) => Container(
      width: double.infinity,
      height: height,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
    );
    return AppShimmer(
      child: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
        children: [
          Row(
            children: [
              SkeletonBox(width: 70.w, height: 20.h, radius: AppRadius.full),
              horizontalSpace(8),
              SkeletonBox(width: 70.w, height: 20.h, radius: AppRadius.full),
            ],
          ),
          verticalSpace(16.h),
          card(160.h),
          card(120.h),
          card(140.h),
          card(180.h),
        ],
      ),
    );
  }
}

/// Shown at the top of a project whose outcome a manager has confirmed.
///
/// The stage reaching `WON`/`LOST` is only ever the result of
/// `POST /outcomes/{id}/confirm`, which moves the project in the same
/// transaction — so this state means "a second person signed this off", not
/// "the rep marked it done". That is why the record freezes rather than
/// merely warning: it is now evidence, and the activities and stakeholders
/// on it are what the decision was judged against.
class _ClosedBanner extends StatelessWidget {
  final ProjectStage stage;

  const _ClosedBanner({required this.stage});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final won = stage == ProjectStage.won;
    final status = won ? colors.statusWon : colors.statusLost;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: status.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: status.core.withValues(alpha: 0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.lock_outline_rounded, size: 18.sp, color: status.core),
          horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context
                      .tr('projects_detail_closed_title')
                      .replaceAll('{outcome}', context.tr(stage.labelKey)),
                  style: context.textStyles.smBold.copyWith(
                    color: status.badgeText,
                  ),
                ),
                verticalSpace(3.h),
                Text(
                  context.tr('projects_detail_closed_subtitle'),
                  style: context.textStyles.xsMedium.copyWith(
                    color: status.badgeText,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
