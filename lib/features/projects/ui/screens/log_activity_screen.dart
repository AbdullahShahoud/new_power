
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
import '../widgets/option_picker_field.dart';
import '../widgets/attachment_picker.dart';
import '../widgets/pending_attachment.dart';
import '../widgets/project_enum_labels.dart';

const _maxAttachments = 10;

/// Workflow 4 (§10) — "one form, a kind toggle; only four things differ."
/// Pops with the log-submission's `suggestion` string (`"SET_DORMANT"` or
/// `null`) so the caller (`project_detail_screen.dart`) can offer "park
/// this project" using the `ProjectsBloc` instance it already owns —
/// this screen doesn't need its own copy of that Bloc for one follow-up.
class LogActivityScreen extends StatelessWidget {
  final String projectId;
  final List<StakeholderRefView> stakeholders;

  const LogActivityScreen({
    super.key,
    required this.projectId,
    required this.stakeholders,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ActivitiesBloc>()),
        BlocProvider(create: (_) => getIt<FileUploadBloc>()),
      ],
      child: _LogActivityView(projectId: projectId, stakeholders: stakeholders),
    );
  }
}

class _LogActivityView extends StatefulWidget {
  final String projectId;
  final List<StakeholderRefView> stakeholders;

  const _LogActivityView({required this.projectId, required this.stakeholders});

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

  List<PrimaryContactRefView> get _availableContacts => widget.stakeholders
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
    return BlocListener<ActivitiesBloc, ActivitiesState>(
      listenWhen: (previous, current) =>
          previous.mutationStatus != current.mutationStatus,
      listener: (context, state) {
        switch (state.mutationStatus) {
          case ActivityMutationStatus.success:
            context.pop(state.lastLogSuggestion);
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
                              hintText: context.tr('log_activity_channel_hint'),
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
                          if (_kind == ActivityKind.visit) ...[
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
