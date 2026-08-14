import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/bottom_sheet_helper.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_dialog.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/enums.dart';
import '../../data/models/location_dto.dart';
import '../../data/models/nearby_project_card_view.dart';
import '../../data/models/register_project_request.dart';
import '../../data/models/stored_file.dart';
import '../../logic/file_upload_bloc/file_upload_bloc.dart';
import '../../logic/file_upload_bloc/file_upload_event.dart';
import '../../logic/file_upload_bloc/file_upload_state.dart';
import '../../logic/projects_bloc/projects_bloc.dart';
import '../../logic/projects_bloc/projects_event.dart';
import '../../logic/projects_bloc/projects_state.dart';
import '../widgets/option_picker_field.dart';
import '../widgets/photo_upload_grid.dart';
import '../widgets/project_enum_labels.dart';

const _maxPhotos = 10;
const _defaultCurrency = 'SAR';

/// Workflow 2 (§10) — register a building: GPS fix, 1-10 photos, required
/// fields, submit. `nearbyProjects`/`outsideTerritory` are surfaced from the
/// success payload, not treated as errors.
class RegisterProjectScreen extends StatelessWidget {
  const RegisterProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProjectsBloc>()),
        BlocProvider(create: (_) => getIt<FileUploadBloc>()),
      ],
      child: const _RegisterProjectView(),
    );
  }
}

class _RegisterProjectView extends StatefulWidget {
  const _RegisterProjectView();

  @override
  State<_RegisterProjectView> createState() => _RegisterProjectViewState();
}

class _RegisterProjectViewState extends State<_RegisterProjectView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _addressController = TextEditingController();
  final _unitCountController = TextEditingController();
  final _estimatedValueController = TextEditingController();
  final _notesController = TextEditingController();
  final _uuid = const Uuid();
  final _imagePicker = ImagePicker();

  BuildingType? _buildingType;
  ConstructionPhase? _constructionPhase;

  double? _latitude;
  double? _longitude;

  final List<String> _photoLocalIds = [];
  final Map<String, File> _pickedFiles = {};

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _addressController.dispose();
    _unitCountController.dispose();
    _estimatedValueController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  /// Opens the Google-map picker (long-press to drop/move a pin, or the
  /// map's own "locate me" button for a quick GPS fix) — replaces the old
  /// tap-to-auto-capture-GPS-only flow. No nearby-projects overlay here: a
  /// brand-new building has no prior pin to confuse itself with, and the
  /// server's own `nearbyProjects` duplicate-candidate response already
  /// covers that case after submit.
  Future<void> _pickLocation() async {
    final result = await context.pushNamed(
      Routes.mapPickerScreen,
      arguments: {
        'initialLatitude': _latitude,
        'initialLongitude': _longitude,
      },
    );
    if (result == null || !mounted) return;
    final picked = result as ({double lat, double lng});
    setState(() {
      _latitude = picked.lat;
      _longitude = picked.lng;
    });
  }

  Future<void> _pickPhotos() async {
    if (_photoLocalIds.length >= _maxPhotos) return;
    final source = await showAnimatedBottomSheet<ImageSource>(
      context: context,
      initialChildSize: 0.22,
      minChildSize: 0.22,
      builder: (sheetContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.photo_camera_outlined),
              title: Text(context.tr('projects_register_photo_camera')),
              onTap: () => Navigator.of(sheetContext).pop(ImageSource.camera),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(context.tr('projects_register_photo_gallery')),
              onTap: () => Navigator.of(sheetContext).pop(ImageSource.gallery),
            ),
          ],
        );
      },
    );
    if (source == null || !mounted) return;

    final remaining = _maxPhotos - _photoLocalIds.length;
    final picked = source == ImageSource.camera
        ? await _imagePicker
              .pickImage(source: ImageSource.camera, imageQuality: 85)
              .then((f) => f == null ? <XFile>[] : [f])
        : await _imagePicker.pickMultiImage(imageQuality: 85);
    if (!mounted || picked.isEmpty) return;

    final toUpload = picked.take(remaining);
    final fileUploadBloc = context.read<FileUploadBloc>();
    setState(() {
      for (final xFile in toUpload) {
        final localId = _uuid.v4();
        final file = File(xFile.path);
        _photoLocalIds.add(localId);
        _pickedFiles[localId] = file;
        fileUploadBloc.add(
          FileUploadEvent.uploadRequested(localId: localId, file: file),
        );
      }
    });
  }

  void _removePhoto(String localId) {
    context.read<FileUploadBloc>().add(
      FileUploadEvent.uploadCancelled(localId: localId),
    );
    setState(() {
      _photoLocalIds.remove(localId);
      _pickedFiles.remove(localId);
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    if (_buildingType == null) {
      _showSnack(context.tr('projects_register_building_type_required'));
      return;
    }
    if (_constructionPhase == null) {
      _showSnack(context.tr('projects_register_construction_phase_required'));
      return;
    }
    if (_latitude == null || _longitude == null) {
      _showSnack(context.tr('projects_register_location_required'));
      return;
    }

    final uploads = context.read<FileUploadBloc>().state.uploads;
    final uploadedFiles = <StoredFileView>[];
    for (final localId in _photoLocalIds) {
      final item = uploads[localId];
      if (item == null) continue;
      if (item.status == FileUploadItemStatus.uploading) {
        _showSnack(context.tr('projects_register_photos_still_uploading'));
        return;
      }
      if (item.status == FileUploadItemStatus.uploaded && item.file != null) {
        uploadedFiles.add(item.file!);
      }
    }
    if (uploadedFiles.isEmpty) {
      _showSnack(context.tr('projects_register_photo_required'));
      return;
    }

    final estimatedValueText = _estimatedValueController.text.trim();
    final estimatedValue = estimatedValueText.isEmpty
        ? null
        : double.tryParse(estimatedValueText);
    final unitCountText = _unitCountController.text.trim();
    final unitCount = unitCountText.isEmpty
        ? null
        : int.tryParse(unitCountText);

    final request = RegisterProjectRequest(
      name: _nameController.text.trim(),
      buildingType: _buildingType!,
      description: _descriptionController.text.trim(),
      location: LocationDto(lat: _latitude!, lng: _longitude!),
      constructionPhase: _constructionPhase!,
      files: uploadedFiles
          .map((f) => ProjectFileRefDto(key: f.key, name: f.name))
          .toList(),
      addressLine: _addressController.text.trim().isEmpty
          ? null
          : _addressController.text.trim(),
      unitCount: unitCount,
      estimatedValue: estimatedValue,
      currency: estimatedValue != null ? _defaultCurrency : null,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );

    context.read<ProjectsBloc>().add(ProjectsEvent.registerSubmitted(request));
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _showDuplicateCandidates(
    List<NearbyProjectCardView> candidates,
  ) async {
    await showAnimatedBottomSheet<void>(
      context: context,
      initialChildSize: 0.55,
      builder: (sheetContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sheetContext.tr('projects_register_duplicates_title'),
              style: sheetContext.textStyles.baseBold,
            ),
            verticalSpace(4.h),
            Text(
              sheetContext.tr('projects_register_duplicates_subtitle'),
              style: sheetContext.textStyles.smRegular,
            ),
            verticalSpace(12.h),
            for (final candidate in candidates)
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: sheetContext.colors.page,
                    borderRadius: BorderRadius.circular(AppRadius.field),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              candidate.name,
                              style: sheetContext.textStyles.smBold,
                            ),
                            Text(
                              '${candidate.distanceM.round()} ${sheetContext.tr('unit_meters_short')} · '
                              '${sheetContext.tr(candidate.stage.labelKey)}',
                              style: sheetContext.textStyles.xsMedium,
                            ),
                            Text(
                              '${sheetContext.tr('projects_register_duplicates_owner')}: '
                              '${candidate.owner.firstName} ${candidate.owner.lastName}',
                              style: sheetContext.textStyles.xsMedium,
                            ),
                          ],
                        ),
                      ),
                      if (candidate.isYours == true)
                        Icon(
                          Icons.check_circle,
                          color: sheetContext.colors.statusWon.core,
                        ),
                    ],
                  ),
                ),
              ),
            verticalSpace(4.h),
            AppButton(
              text: sheetContext.tr('projects_register_duplicates_continue'),
              variant: AppButtonVariant.secondary,
              onPressed: () => Navigator.of(sheetContext).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<ProjectsBloc, ProjectsState>(
      listenWhen: (previous, current) =>
          previous.mutationStatus != current.mutationStatus,
      listener: (context, state) async {
        switch (state.mutationStatus) {
          case ProjectMutationStatus.success:
            final result = state.lastRegistrationResult;
            if (result == null) return;
            if (result.nearbyProjects.isNotEmpty) {
              await _showDuplicateCandidates(result.nearbyProjects);
            }
            if (!context.mounted) return;
            context.pushReplacementNamed(
              Routes.projectDetailScreen,
              arguments: {'projectId': result.project.id},
            );
          case ProjectMutationStatus.territoryRejected:
            AppDialog.show<void>(
              context: context,
              title: context.tr('projects_register_territory_rejected_title'),
              message:
                  state.mutationErrorMessage ??
                  context.tr('projects_register_territory_rejected_message'),
              actions: [
                AppDialogButton.primary(
                  label: context.tr('confirm'),
                  onPressed: () => context.pop(),
                ),
              ],
            );
          case ProjectMutationStatus.imagesNotUploaded:
            // §10 Workflow 1: a quoted key wasn't found in storage — remove
            // and re-add the affected photo(s), then resubmit.
            _showSnack(context.tr('projects_register_images_not_uploaded'));
          case ProjectMutationStatus.inProgress:
          case ProjectMutationStatus.idle:
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
              AppHeader(title: context.tr('projects_register_title')),
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
                          _SectionLabel(context.tr('projects_register_name')),
                          AppTextField(
                            hintText: context.tr('projects_register_name_hint'),
                            controller: _nameController,
                            validator: (value) {
                              final trimmed = value?.trim() ?? '';
                              if (trimmed.length < 3 || trimmed.length > 200) {
                                return context.tr(
                                  'projects_register_name_error',
                                );
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(
                            context.tr('projects_register_building_type'),
                          ),
                          OptionPickerField<BuildingType>(
                            hintText: context.tr(
                              'projects_register_building_type_hint',
                            ),
                            value: _buildingType,
                            options: BuildingType.values,
                            labelOf: (v) => context.tr(v.labelKey),
                            onChanged: (v) => setState(() => _buildingType = v),
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(
                            context.tr('projects_register_construction_phase'),
                          ),
                          OptionPickerField<ConstructionPhase>(
                            hintText: context.tr(
                              'projects_register_construction_phase_hint',
                            ),
                            value: _constructionPhase,
                            options: ConstructionPhase.values,
                            labelOf: (v) => context.tr(v.labelKey),
                            onChanged: (v) =>
                                setState(() => _constructionPhase = v),
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(
                            context.tr('projects_register_description'),
                          ),
                          AppTextField(
                            hintText: context.tr(
                              'projects_register_description_hint',
                            ),
                            controller: _descriptionController,
                            maxLines: 4,
                            validator: (value) {
                              final trimmed = value?.trim() ?? '';
                              if (trimmed.length < 10 ||
                                  trimmed.length > 2000) {
                                return context.tr(
                                  'projects_register_description_error',
                                );
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(
                            context.tr('projects_register_location'),
                          ),
                          _LocationCapture(
                            latitude: _latitude,
                            longitude: _longitude,
                            onCapture: _pickLocation,
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(context.tr('projects_register_photos')),
                          PhotoUploadGrid(
                            localIds: _photoLocalIds,
                            pickedFiles: _pickedFiles,
                            maxPhotos: _maxPhotos,
                            onAdd: _pickPhotos,
                            onRemove: _removePhoto,
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(
                            context.tr('projects_register_address'),
                            optional: true,
                          ),
                          AppTextField(
                            hintText: context.tr(
                              'projects_register_address_hint',
                            ),
                            controller: _addressController,
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(
                            context.tr('projects_register_unit_count'),
                            optional: true,
                          ),
                          AppTextField(
                            hintText: context.tr(
                              'projects_register_unit_count_hint',
                            ),
                            controller: _unitCountController,
                            keyboardType: TextInputType.number,
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(
                            context.tr('projects_register_estimated_value'),
                          ),
                          AppTextField(
                            hintText: context.tr(
                              'projects_register_estimated_value_hint',
                            ),
                            controller: _estimatedValueController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            // Required by product decision, not by the API —
                            // §4 lists `estimatedValue` as optional, so the
                            // rule is enforced here in the form rather than
                            // in `RegisterProjectRequest.validate()` (which
                            // mirrors the documented contract).
                            validator: (value) {
                              final trimmed = value?.trim() ?? '';
                              if (trimmed.isEmpty) {
                                return context.tr(
                                  'projects_register_estimated_value_required',
                                );
                              }
                              final parsed = double.tryParse(trimmed);
                              if (parsed == null || parsed < 0) {
                                return context.tr(
                                  'projects_register_estimated_value_invalid',
                                );
                              }
                              return null;
                            },
                          ),
                          verticalSpace(16.h),
                          _SectionLabel(
                            context.tr('projects_register_notes'),
                            optional: true,
                          ),
                          AppTextField(
                            hintText: context.tr(
                              'projects_register_notes_hint',
                            ),
                            controller: _notesController,
                            maxLines: 3,
                          ),
                          verticalSpace(24.h),
                          BlocBuilder<ProjectsBloc, ProjectsState>(
                            builder: (context, state) {
                              return AppButton(
                                text: context.tr('projects_register_submit'),
                                isLoading:
                                    state.mutationStatus ==
                                    ProjectMutationStatus.inProgress,
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

class _SectionLabel extends StatelessWidget {
  final String label;
  final bool optional;
  const _SectionLabel(this.label, {this.optional = false});

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

/// Opens `MapPickerScreen` (long-press to place a pin, or its own "locate
/// me" button) — a picked coordinate is never wrong the way a bare GPS fix
/// taken indoors can be, since the rep sees exactly where the pin landed
/// and can drag/re-tap it before confirming.
class _LocationCapture extends StatelessWidget {
  final double? latitude;
  final double? longitude;
  final VoidCallback onCapture;

  const _LocationCapture({
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
                    : context.tr('projects_register_location_cta'),
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
