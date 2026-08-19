import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../data/models/enums.dart';
import '../../data/models/omit.dart';
import '../../data/models/patch_project_request.dart';
import '../../data/models/project_detail_view.dart';
import '../../logic/projects_bloc/projects_bloc.dart';
import '../../logic/projects_bloc/projects_event.dart';
import '../../logic/projects_bloc/projects_state.dart';
import '../widgets/option_picker_field.dart';
import '../widgets/project_enum_labels.dart';

const _defaultCurrency = 'SAR';

/// §5 `PATCH /projects/{id}` — the same form as registration, opened with
/// the project's current values already in it.
///
/// **Only changed fields are sent.** `PatchProjectRequest`'s `omit`
/// sentinel exists precisely so "left alone" and "cleared" are different
/// statements on the wire; diffing against the loaded project is what makes
/// that distinction real, and it also means two reps editing different
/// fields don't clobber each other's work.
///
/// Not editable here, by API design: `location`, `stage`, `status`,
/// `constructionPhase` — each has its own dedicated route and its own
/// control on the detail screen.
///
/// Carries `expectedVersion` for the optimistic-concurrency check
/// (Workflow 9); a `versionConflict` is surfaced as a reload prompt rather
/// than silently overwriting whatever changed underneath.
class EditProjectScreen extends StatelessWidget {
  final ProjectDetailView project;

  const EditProjectScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ProjectsBloc>(),
      child: _EditProjectView(project: project),
    );
  }
}

class _EditProjectView extends StatefulWidget {
  final ProjectDetailView project;

  const _EditProjectView({required this.project});

  @override
  State<_EditProjectView> createState() => _EditProjectViewState();
}

class _EditProjectViewState extends State<_EditProjectView> {
  final _formKey = GlobalKey<FormState>();

  late final _nameController = TextEditingController(text: widget.project.name);
  late final _descriptionController = TextEditingController(
    text: widget.project.description,
  );
  late final _addressController = TextEditingController(
    text: widget.project.addressLine ?? '',
  );
  late final _unitCountController = TextEditingController(
    text: widget.project.unitCount?.toString() ?? '',
  );
  late final _estimatedValueController = TextEditingController(
    text: widget.project.estimatedValue?.toString() ?? '',
  );
  late final _notesController = TextEditingController(
    text: widget.project.notes ?? '',
  );

  late BuildingType _buildingType = widget.project.buildingType;

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

  void _showSnack(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? context.colors.error : null,
      ),
    );
  }

  /// `null` when unchanged (so the key is omitted), the trimmed value
  /// otherwise. Used for the non-nullable text fields.
  String? _changedText(TextEditingController controller, String original) {
    final value = controller.text.trim();
    return value == original.trim() ? null : value;
  }

  /// [omit] when unchanged, else the new value — `null` meaning "clear it".
  /// Used for the nullable fields, where an emptied box is a real
  /// instruction, not an absence.
  Object? _changedNullableText(
    TextEditingController controller,
    String? original,
  ) {
    final value = controller.text.trim();
    final normalizedOriginal = (original ?? '').trim();
    if (value == normalizedOriginal) return omit;
    return value.isEmpty ? null : value;
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final unitCountText = _unitCountController.text.trim();
    final originalUnitCount = widget.project.unitCount?.toString() ?? '';
    final Object? unitCount = unitCountText == originalUnitCount
        ? omit
        : (unitCountText.isEmpty ? null : int.tryParse(unitCountText));

    final valueText = _estimatedValueController.text.trim();
    final originalValue = widget.project.estimatedValue?.toString() ?? '';
    final valueChanged = valueText != originalValue;
    final double? parsedValue = valueText.isEmpty
        ? null
        : double.tryParse(valueText);

    final request = PatchProjectRequest(
      name: _changedText(_nameController, widget.project.name),
      buildingType: _buildingType == widget.project.buildingType
          ? null
          : _buildingType,
      description: _changedText(
        _descriptionController,
        widget.project.description,
      ),
      addressLine: _changedNullableText(
        _addressController,
        widget.project.addressLine,
      ),
      unitCount: unitCount,
      estimatedValue: valueChanged ? parsedValue : omit,
      // §1 money rule: an amount and its currency travel together. Only
      // send a currency when the amount itself is changing, and clear it
      // alongside a cleared amount.
      currency: valueChanged
          ? (parsedValue == null
                ? null
                : (widget.project.currency ?? _defaultCurrency))
          : omit,
      notes: _changedNullableText(_notesController, widget.project.notes),
      expectedVersion: widget.project.version,
    );

    if (request.toJson().keys.every((key) => key == 'expectedVersion')) {
      _showSnack(context.tr('edit_project_no_changes'));
      return;
    }

    context.read<ProjectsBloc>().add(
      ProjectsEvent.patchSubmitted(id: widget.project.id, request: request),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<ProjectsBloc, ProjectsState>(
      listenWhen: (previous, current) =>
          previous.mutationStatus != current.mutationStatus,
      listener: (context, state) {
        switch (state.mutationStatus) {
          case ProjectMutationStatus.success:
            _showSnack(context.tr('edit_project_saved'));
            // `true` tells the detail screen to refresh — it owns the
            // canonical copy of this project, not this screen.
            context.pop(true);
          case ProjectMutationStatus.versionConflict:
            _showSnack(
              context.tr('projects_version_conflict_message'),
              isError: true,
            );
            context.pop(true);
          case ProjectMutationStatus.notFound:
            _showSnack(context.tr('projects_detail_not_found'), isError: true);
            context.pop(true);
          case ProjectMutationStatus.inProgress:
          case ProjectMutationStatus.idle:
            break;
          default:
            _showSnack(
              state.mutationErrorMessage ?? context.tr('error_unexpected'),
              isError: true,
            );
        }
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: context.tr('edit_project_title')),
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
                          _Label(context.tr('projects_register_name')),
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
                          _Label(context.tr('projects_register_building_type')),
                          Padding(
                            padding: const EdgeInsets.only(right: 9.0),
                            child: OptionPickerField<BuildingType>(
                              hintText: context.tr(
                                'projects_register_building_type_hint',
                              ),
                              value: _buildingType,
                              options: BuildingType.values,
                              labelOf: (v) => context.tr(v.labelKey),
                              onChanged: (v) =>
                                  setState(() => _buildingType = v),
                            ),
                          ),
                          verticalSpace(16.h),
                          _Label(context.tr('projects_register_description')),
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
                          _Label(
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
                          _Label(
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
                          _Label(
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
                          ),
                          verticalSpace(16.h),
                          _Label(
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
                                text: context.tr('edit_project_submit'),
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
