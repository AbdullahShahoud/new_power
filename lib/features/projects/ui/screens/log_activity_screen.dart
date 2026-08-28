import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/config/feature_flags.dart';
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
import '../../data/models/activity_location_dto.dart';
import '../../data/models/enums.dart';
import '../../data/models/log_activity_request.dart';
import '../../data/models/project_detail_view.dart';
import '../../data/models/stakeholder_link_view.dart';
import '../../data/models/sync_activity_item.dart';
import '../../data/models/uploaded_file_dto.dart';
import '../../logic/activities_bloc/activities_bloc.dart';
import '../../logic/activities_bloc/activities_event.dart';
import '../../logic/activities_bloc/activities_state.dart';
import '../../logic/file_upload_bloc/file_upload_bloc.dart';
import '../../logic/file_upload_bloc/file_upload_event.dart';
import '../../logic/file_upload_bloc/file_upload_state.dart';
import '../../logic/offline_sync_bloc/offline_sync_bloc.dart';
import '../../logic/offline_sync_bloc/offline_sync_event.dart';
import '../../logic/stakeholders_bloc/stakeholders_bloc.dart';
import '../../logic/stakeholders_bloc/stakeholders_event.dart';
import '../../logic/stakeholders_bloc/stakeholders_state.dart';
import '../widgets/option_picker_field.dart';
import '../widgets/attachment_picker.dart';
import '../widgets/pending_attachment.dart';
import '../widgets/project_enum_labels.dart';

const _maxAttachments = 10;

/// What this screen hands back to the caller when it closes.
///
/// Both fields are follow-ups the caller performs with the `ProjectsBloc`
/// it already owns — this screen deliberately doesn't hold a copy of that
/// Bloc just to fire two one-shot events, and the caller is the side that
/// knows the project's current `version` for the optimistic-concurrency
/// check anyway.
typedef LogActivityResult = ({
  /// `"SET_DORMANT"` when the server suggests parking the project, else
  /// `null`.
  String? suggestion,

  /// The funnel stage the rep set on the way out, or `null` if they left it
  /// alone. Always `null` on a communication — the stage question is asked
  /// on visits only.
  ProjectStage? stage,
});

/// Workflow 4 (§10) — "one form, a kind toggle; only four things differ."
class LogActivityScreen extends StatelessWidget {
  final String projectId;
  final List<StakeholderRefView> stakeholders;

  /// The project's funnel stage as the detail screen last read it. Shown on
  /// a visit and editable there — a visit is exactly the moment a rep learns
  /// the deal moved, and making them back out to the project screen to say
  /// so is how a funnel goes stale.
  final ProjectStage currentStage;

  const LogActivityScreen({
    super.key,
    required this.projectId,
    required this.stakeholders,
    required this.currentStage,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ActivitiesBloc>()),
        BlocProvider(create: (_) => getIt<FileUploadBloc>()),
        // Only used to re-read the roster after the rep adds someone from
        // here — the add itself happens on `AddStakeholderLinkScreen`, which
        // owns its own Bloc.
        BlocProvider(create: (_) => getIt<StakeholdersBloc>()),
      ],
      child: _LogActivityView(
        projectId: projectId,
        stakeholders: stakeholders,
        currentStage: currentStage,
      ),
    );
  }
}

class _LogActivityView extends StatefulWidget {
  final String projectId;
  final List<StakeholderRefView> stakeholders;
  final ProjectStage currentStage;

  const _LogActivityView({
    required this.projectId,
    required this.stakeholders,
    required this.currentStage,
  });

  @override
  State<_LogActivityView> createState() => _LogActivityViewState();
}

class _LogActivityViewState extends State<_LogActivityView> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();
  final _uuid = const Uuid();

  ActivityKind _kind = ActivityKind.visit;
  ActivityChannel? _channel;
  ActivityPurpose? _purpose;
  ActivityOutcome? _outcome;
  DateTime _occurredAt = DateTime.now();
  DateTime? _nextActionAt;
  ConstructionPhase? _constructionPhaseObserved;
  final Set<String> _selectedPersonIds = {};

  double? _latitude;
  double? _longitude;
  int? _accuracyM;

  /// Photos, documents and voice notes alike — §Workflow 1 accepts all
  /// three, and each is uploaded through the same `POST /files` path.
  final List<PendingAttachment> _attachments = [];

  /// Mirrors the last `LogActivityRequest` submitted, as a `SyncActivityItem`
  /// (same fields + `projectId`/`clientRef`) — built alongside the online
  /// attempt so it's ready to hand to `OfflineSyncBloc` without rebuilding
  /// form state if that attempt comes back `ActivityMutationStatus.offline`
  /// (§10 Workflow 5).
  SyncActivityItem? _lastAttemptedItem;

  /// The funnel stage as it will be left when this screen closes. Seeded
  /// from the project and only sent back to the caller if the rep moved it.
  late ProjectStage _stage = widget.currentStage;

  /// The people the rep can say they met.
  ///
  /// Held in state rather than derived from `widget.stakeholders` because a
  /// rep can add a stakeholder from this screen — the roster they arrived
  /// with is a starting point, not a fixed list.
  late List<PrimaryContactRefView> _availableContacts = widget.stakeholders
      .map((s) => s.primaryContact)
      .whereType<PrimaryContactRefView>()
      .toList();

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _onKindChanged(ActivityKind kind) {
    setState(() {
      _kind = kind;
      if (kind == ActivityKind.visit) {
        _channel = null;
      } else {
        _constructionPhaseObserved = null;
        _latitude = null;
        _longitude = null;
        // The stage question is a visit question — a phone call is not
        // where a rep judges that the deal moved. Reset rather than keep a
        // pending edit the form no longer shows.
        _stage = widget.currentStage;
        // COMMUNICATION is exactly one person — drop extras if the rep
        // switched from VISIT with several already selected.
        if (_selectedPersonIds.length > 1) {
          final first = _selectedPersonIds.first;
          _selectedPersonIds
            ..clear()
            ..add(first);
        }
      }
    });
  }

  void _togglePerson(String contactId) {
    setState(() {
      if (_kind == ActivityKind.communication) {
        _selectedPersonIds
          ..clear()
          ..add(contactId);
      } else if (_selectedPersonIds.contains(contactId)) {
        _selectedPersonIds.remove(contactId);
      } else {
        _selectedPersonIds.add(contactId);
      }
    });
  }

  /// Adds a stakeholder to the project without leaving the activity.
  ///
  /// The roster a rep arrives with is whoever was linked before today, and a
  /// visit routinely introduces someone new — the site engineer, a second
  /// contractor. Without this the rep has to abandon a half-filled form,
  /// walk back to the project screen, add the link, and start over; in
  /// practice they instead pick the nearest wrong name, which quietly
  /// corrupts who-was-met on the record.
  ///
  /// `AddStakeholderLinkScreen` pops `true` on success but doesn't return
  /// the link it created, so the roster is re-read rather than patched
  /// locally — that also picks up anything a colleague added meanwhile.
  Future<void> _addStakeholder() async {
    final added = await context.pushNamed(
      Routes.addStakeholderLinkScreen,
      arguments: {'projectId': widget.projectId},
    );
    if (added != true || !mounted) return;
    context.read<StakeholdersBloc>().add(
      StakeholdersEvent.linksListRequested(projectId: widget.projectId),
    );
  }

  /// Folds a re-read roster into the picker.
  ///
  /// `GET /projects/{id}/stakeholders` answers with `StakeholderLinkView`,
  /// whose nested contact uses `id`; the embedded roster on the project
  /// detail uses `PrimaryContactRefView` with `contactId`. They are
  /// genuinely different response shapes (see `stakeholder_link_view.dart`),
  /// so the fresh one is mapped onto the shape this screen already renders
  /// instead of teaching the picker to hold both.
  ///
  /// Closed links are dropped: you cannot have met someone on behalf of a
  /// company that is no longer on the project.
  void _applyRefreshedRoster(List<StakeholderLinkView> links) {
    final contacts = <String, PrimaryContactRefView>{};
    for (final link in links) {
      if (!link.isActive) continue;
      final contact = link.primaryContact;
      if (contact == null) continue;
      contacts[contact.id] = PrimaryContactRefView(
        contactId: contact.id,
        accountId: contact.accountId,
        firstName: contact.firstName,
        lastName: contact.lastName,
        position: contact.position,
        phone: contact.phone,
        email: contact.email,
      );
    }
    if (contacts.isEmpty) return;
    setState(() {
      _availableContacts = contacts.values.toList();
      // A selection whose contact vanished from the refreshed roster would
      // otherwise be submitted as a `personsMet` id the server rejects.
      _selectedPersonIds.removeWhere((id) => !contacts.containsKey(id));
    });
  }

  /// Opens the Google-map picker with the rep's own nearby projects overlaid
  /// (§10 Workflow 4: "GPS is a signal, not a gate") — the pins give the rep
  /// a visual check that they're confirming the right building's location,
  /// not just trusting a raw device fix. A manually-placed pin has no
  /// device accuracy figure the way a GPS fix does, so `_accuracyM` is
  /// cleared when the location comes from here.
  Future<void> _pickLocation() async {
    final result = await context.pushNamed(
      Routes.mapPickerScreen,
      arguments: {
        'initialLatitude': _latitude,
        'initialLongitude': _longitude,
        'showNearbyProjects': true,
      },
    );
    if (result == null || !mounted) return;
    final picked = result as ({double lat, double lng});
    setState(() {
      _latitude = picked.lat;
      _longitude = picked.lng;
      _accuracyM = null;
    });
  }

  Future<void> _pickOccurredAt() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _occurredAt,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_occurredAt),
    );
    if (time == null) return;
    setState(() {
      _occurredAt = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<void> _pickNextActionAt() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _nextActionAt ?? DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_nextActionAt ?? DateTime.now()),
    );
    if (time == null) return;
    setState(() {
      _nextActionAt = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  /// `AttachmentPicker` handles the picking/recording; this only assigns the
  /// tracking id and kicks off the upload, so every attachment kind takes
  /// the same route through `FileUploadBloc` (Workflow 1: one file per
  /// call, never batched).
  void _onAttachmentsAdded(List<PendingAttachment> added) {
    final fileUploadBloc = context.read<FileUploadBloc>();
    setState(() {
      for (final attachment in added) {
        if (_attachments.length >= _maxAttachments) break;
        final localId = _uuid.v4();
        final tracked = PendingAttachment(
          localId: localId,
          file: attachment.file,
          kind: attachment.kind,
          duration: attachment.duration,
        );
        _attachments.add(tracked);
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
    setState(() {
      _attachments.removeWhere((a) => a.localId == localId);
    });
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_purpose == null) {
      _showSnack(context.tr('log_activity_purpose_required'));
      return;
    }
    if (_outcome == null) {
      _showSnack(context.tr('log_activity_outcome_required'));
      return;
    }
    if (_kind == ActivityKind.communication && _channel == null) {
      _showSnack(context.tr('log_activity_channel_required'));
      return;
    }
    if (_selectedPersonIds.isEmpty) {
      _showSnack(context.tr('log_activity_persons_required'));
      return;
    }
    if (_outcome == ActivityOutcome.tooEarlyRevisitLater &&
        _nextActionAt == null) {
      _showSnack(context.tr('log_activity_next_action_required'));
      return;
    }

    final uploads = context.read<FileUploadBloc>().state.uploads;
    final files = <UploadedFileDto>[];
    for (final attachment in _attachments) {
      final item = uploads[attachment.localId];
      if (item == null) continue;
      if (item.status == FileUploadItemStatus.uploading) {
        _showSnack(context.tr('projects_register_photos_still_uploading'));
        return;
      }
      if (item.status == FileUploadItemStatus.uploaded && item.file != null) {
        files.add(UploadedFileDto(key: item.file!.key, name: item.file!.name));
      }
    }

    final location = _kind == ActivityKind.visit && _latitude != null
        ? ActivityLocationDto(
            lat: _latitude!,
            lng: _longitude!,
            accuracyM: _accuracyM,
          )
        : null;
    final constructionPhaseObserved = _kind == ActivityKind.visit
        ? _constructionPhaseObserved
        : null;
    final notes = _notesController.text.trim();

    final request = LogActivityRequest(
      kind: _kind,
      channel: _kind == ActivityKind.communication ? _channel : null,
      purpose: _purpose!,
      outcome: _outcome!,
      occurredAt: _occurredAt,
      notes: notes,
      personsMet: _selectedPersonIds.toList(),
      location: location,
      constructionPhaseObserved: constructionPhaseObserved,
      nextActionAt: _nextActionAt,
      files: files,
    );

    // Built alongside the online attempt so it's ready if that attempt
    // comes back `ActivityMutationStatus.offline` — see `_lastAttemptedItem`.
    _lastAttemptedItem = SyncActivityItem(
      projectId: widget.projectId,
      clientRef: _uuid.v4(),
      kind: _kind,
      channel: _kind == ActivityKind.communication ? _channel : null,
      purpose: _purpose!,
      outcome: _outcome!,
      occurredAt: _occurredAt,
      notes: notes,
      personsMet: _selectedPersonIds.toList(),
      location: location,
      constructionPhaseObserved: constructionPhaseObserved,
      nextActionAt: _nextActionAt,
      files: files,
    );

    context.read<ActivitiesBloc>().add(
      ActivitiesEvent.logSubmitted(
        projectId: widget.projectId,
        request: request,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return MultiBlocListener(
      listeners: [
        // Roster re-read after the rep added someone — see
        // `_applyRefreshedRoster` for why the shapes differ.
        BlocListener<StakeholdersBloc, StakeholdersState>(
          listenWhen: (previous, current) =>
              previous.linksStatus != current.linksStatus,
          listener: (context, state) {
            if (state.linksStatus == StakeholderLinksFeedStatus.loaded) {
              _applyRefreshedRoster(state.links);
            }
          },
        ),
      ],
      child: BlocListener<ActivitiesBloc, ActivitiesState>(
        listenWhen: (previous, current) =>
            previous.mutationStatus != current.mutationStatus,
        listener: (context, state) {
          switch (state.mutationStatus) {
            case ActivityMutationStatus.success:
              // `stage` only when the rep actually moved it — an unchanged
              // value would have the caller fire a no-op `PUT .../stage`,
              // which still writes a stage-history entry.
              context.pop((
                suggestion: state.lastLogSuggestion,
                stage: _stage == widget.currentStage ? null : _stage,
              ));
            case ActivityMutationStatus.offline:
              // Suspended — see `FeatureFlags.offlineSyncEnabled`. With the
              // queue off, a connectivity failure has to be reported as a
              // plain failure and the form left intact so the rep can retry;
              // popping with a "saved" message would be a lie, since nothing
              // would be holding the activity.
              if (!FeatureFlags.offlineSyncEnabled) {
                _showSnack(context.tr('error_no_internet'));
                break;
              }
              final item = _lastAttemptedItem;
              if (item != null) {
                getIt<OfflineSyncBloc>().add(
                  OfflineSyncEvent.activityQueued(item: item),
                );
              }
              _showSnack(context.tr('log_activity_saved_offline'));
              context.pop();
            case ActivityMutationStatus.inProgress:
            case ActivityMutationStatus.idle:
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
                AppHeader(title: context.tr('log_activity_title')),
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
                            _KindToggle(kind: _kind, onChanged: _onKindChanged),
                            verticalSpace(16.h),
                            if (_kind == ActivityKind.communication) ...[
                              _Label(context.tr('log_activity_channel')),
                              OptionPickerField<ActivityChannel>(
                                hintText: context.tr(
                                  'log_activity_channel_hint',
                                ),
                                value: _channel,
                                options: ActivityChannel.values,
                                labelOf: (v) => context.tr(v.labelKey),
                                onChanged: (v) => setState(() => _channel = v),
                              ),
                              verticalSpace(16.h),
                            ],
                            _Label(context.tr('log_activity_purpose')),
                            OptionPickerField<ActivityPurpose>(
                              hintText: context.tr('log_activity_purpose_hint'),
                              value: _purpose,
                              options: ActivityPurpose.values,
                              labelOf: (v) => context.tr(v.labelKey),
                              onChanged: (v) => setState(() => _purpose = v),
                            ),
                            verticalSpace(16.h),
                            _Label(context.tr('log_activity_outcome')),
                            OptionPickerField<ActivityOutcome>(
                              hintText: context.tr('log_activity_outcome_hint'),
                              value: _outcome,
                              options: ActivityOutcome.values,
                              labelOf: (v) => context.tr(v.labelKey),
                              onChanged: (v) => setState(() => _outcome = v),
                            ),
                            if (_outcome ==
                                ActivityOutcome.tooEarlyRevisitLater) ...[
                              verticalSpace(16.h),
                              _Label(context.tr('log_activity_next_action')),
                              _DateTimeField(
                                value: _nextActionAt,
                                hintText: context.tr(
                                  'log_activity_next_action_hint',
                                ),
                                onTap: _pickNextActionAt,
                              ),
                            ],
                            verticalSpace(16.h),
                            _Label(context.tr('log_activity_occurred_at')),
                            _DateTimeField(
                              value: _occurredAt,
                              hintText: context.tr(
                                'log_activity_occurred_at_hint',
                              ),
                              onTap: _pickOccurredAt,
                            ),
                            verticalSpace(16.h),
                            _Label(context.tr('log_activity_notes')),
                            AppTextField(
                              hintText: context.tr('log_activity_notes_hint'),
                              controller: _notesController,
                              maxLines: 5,
                              validator: (value) {
                                final trimmed = value?.trim() ?? '';
                                if (trimmed.length < 20 ||
                                    trimmed.length > 4000) {
                                  return context.tr('log_activity_notes_error');
                                }
                                return null;
                              },
                            ),
                            verticalSpace(16.h),
                            _Label(
                              context.tr(
                                _kind == ActivityKind.communication
                                    ? 'log_activity_person_communication'
                                    : 'log_activity_persons_visit',
                              ),
                            ),
                            _PersonsMetPicker(
                              contacts: _availableContacts,
                              selectedIds: _selectedPersonIds,
                              onToggle: _togglePerson,
                            ),
                            verticalSpace(8.h),
                            _AddStakeholderButton(onTap: _addStakeholder),
                            if (_kind == ActivityKind.visit) ...[
                              verticalSpace(16.h),
                              // Prefilled from the project, not blank: the
                              // common case is that the visit confirmed the
                              // stage rather than moved it, and an empty
                              // picker would make "no change" cost a tap.
                              _Label(context.tr('log_activity_stage')),
                              OptionPickerField<ProjectStage>(
                                hintText: context.tr(
                                  'projects_register_stage_hint',
                                ),
                                value: _stage,
                                options: openProjectStages,
                                labelOf: (v) => context.tr(v.labelKey),
                                onChanged: (v) => setState(() => _stage = v),
                              ),
                              if (_stage != widget.currentStage) ...[
                                verticalSpace(6.h),
                                Text(
                                  context
                                      .tr('log_activity_stage_will_change')
                                      .replaceAll(
                                        '{from}',
                                        context.tr(
                                          widget.currentStage.labelKey,
                                        ),
                                      )
                                      .replaceAll(
                                        '{to}',
                                        context.tr(_stage.labelKey),
                                      ),
                                  style: context.textStyles.xsMedium.copyWith(
                                    color: colors.brand600,
                                  ),
                                ),
                              ],
                              verticalSpace(16.h),
                              _Label(
                                context.tr('log_activity_location'),
                                optional: true,
                              ),
                              _LocationChip(
                                latitude: _latitude,
                                longitude: _longitude,
                                onCapture: _pickLocation,
                              ),
                              verticalSpace(16.h),
                              _Label(
                                context.tr(
                                  'log_activity_construction_phase_observed',
                                ),
                                optional: true,
                              ),
                              OptionPickerField<ConstructionPhase>(
                                hintText: context.tr(
                                  'log_activity_construction_phase_hint',
                                ),
                                value: _constructionPhaseObserved,
                                options: ConstructionPhase.values,
                                labelOf: (v) => context.tr(v.labelKey),
                                onChanged: (v) => setState(
                                  () => _constructionPhaseObserved = v,
                                ),
                              ),
                            ],
                            verticalSpace(16.h),
                            _Label(
                              context.tr('log_activity_attachments'),
                              optional: true,
                            ),
                            AttachmentPicker(
                              attachments: _attachments,
                              maxAttachments: _maxAttachments,
                              onAdded: _onAttachmentsAdded,
                              onRemove: _removeAttachment,
                            ),
                            verticalSpace(24.h),
                            BlocBuilder<ActivitiesBloc, ActivitiesState>(
                              builder: (context, state) {
                                return AppButton(
                                  text: context.tr('log_activity_submit'),
                                  isLoading:
                                      state.mutationStatus ==
                                      ActivityMutationStatus.inProgress,
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
      ),
    );
  }
}

/// Adds a stakeholder to the project from inside the activity form.
///
/// Deliberately a quiet inline action rather than a filled button — it sits
/// under a list the rep will usually just pick from, and competing with the
/// form's real submit button for attention would be wrong.
class _AddStakeholderButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddStakeholderButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person_add_alt_1_rounded,
              size: 16.sp,
              color: colors.brand600,
            ),
            horizontalSpace(6),
            Text(
              context.tr('log_activity_add_stakeholder'),
              style: context.textStyles.smBold.copyWith(color: colors.brand600),
            ),
          ],
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

class _KindToggle extends StatelessWidget {
  final ActivityKind kind;
  final ValueChanged<ActivityKind> onChanged;
  const _KindToggle({required this.kind, required this.onChanged});

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
            child: _KindSegment(
              label: context.tr('log_activity_kind_visit'),
              selected: kind == ActivityKind.visit,
              onTap: () => onChanged(ActivityKind.visit),
            ),
          ),
          Expanded(
            child: _KindSegment(
              label: context.tr('log_activity_kind_communication'),
              selected: kind == ActivityKind.communication,
              onTap: () => onChanged(ActivityKind.communication),
            ),
          ),
        ],
      ),
    );
  }
}

class _KindSegment extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _KindSegment({
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

class _DateTimeField extends StatelessWidget {
  final DateTime? value;
  final String hintText;
  final VoidCallback onTap;
  const _DateTimeField({
    required this.value,
    required this.hintText,
    required this.onTap,
  });

  String _format(DateTime dt) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${dt.year}-${two(dt.month)}-${two(dt.day)} ${two(dt.hour)}:${two(dt.minute)}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
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
          ],
        ),
      ),
    );
  }
}

class _LocationChip extends StatelessWidget {
  final double? latitude;
  final double? longitude;
  final VoidCallback onCapture;
  const _LocationChip({
    required this.latitude,
    required this.longitude,
    required this.onCapture,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final captured = latitude != null && longitude != null;
    return PressableScale(
      onTap: onCapture,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.field),
          border: Border.all(
            color: captured ? colors.statusWon.core : colors.ink200,
          ),
        ),
        child: Row(
          children: [
            Icon(
              captured ? Icons.check_circle : Icons.map_outlined,
              color: captured ? colors.statusWon.core : colors.brand500,
            ),
            horizontalSpace(10),
            Expanded(
              child: Text(
                captured
                    ? '${latitude!.toStringAsFixed(5)}, ${longitude!.toStringAsFixed(5)}'
                    : context.tr('log_activity_location_cta'),
                style: context.textStyles.smMedium,
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
    );
  }
}

class _PersonsMetPicker extends StatelessWidget {
  final List<PrimaryContactRefView> contacts;
  final Set<String> selectedIds;
  final ValueChanged<String> onToggle;

  const _PersonsMetPicker({
    required this.contacts,
    required this.selectedIds,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (contacts.isEmpty) {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.field),
          border: Border.all(color: colors.ink200),
        ),
        child: Text(
          context.tr('log_activity_persons_empty'),
          style: context.textStyles.xsMedium,
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.field),
        border: Border.all(color: colors.ink200),
      ),
      child: Column(
        children: [
          for (final contact in contacts)
            _PersonRow(
              contact: contact,
              selected: selectedIds.contains(contact.contactId),
              onTap: () => onToggle(contact.contactId),
            ),
        ],
      ),
    );
  }
}

class _PersonRow extends StatelessWidget {
  final PrimaryContactRefView contact;
  final bool selected;
  final VoidCallback onTap;
  const _PersonRow({
    required this.contact,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        child: Row(
          children: [
            Icon(
              selected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: selected ? colors.brand500 : colors.ink300,
              size: 20.sp,
            ),
            horizontalSpace(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${contact.firstName} ${contact.lastName}',
                    style: context.textStyles.smMedium,
                  ),
                  if (contact.position != null)
                    Text(contact.position!, style: context.textStyles.xsMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
