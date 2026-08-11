import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';
import 'location_dto.dart';
import 'stored_file.dart';

part 'register_project_request.freezed.dart';
part 'register_project_request.g.dart';

/// §4 `ProjectStakeholderRefDto` — a stakeholder at registration. Modeled
/// now for wire-contract completeness; the register-project screen's
/// stakeholder picker itself is Phase 6 (implementation map §2, Phase 6),
/// so this ships with an empty default and no UI sends it yet.
@freezed
abstract class ProjectStakeholderRefDto with _$ProjectStakeholderRefDto {
  const factory ProjectStakeholderRefDto({
    required String accountId,
    required StakeholderRole role,
    String? primaryContactId,
    String? note,
  }) = _ProjectStakeholderRefDto;

  factory ProjectStakeholderRefDto.fromJson(Map<String, dynamic> json) =>
      _$ProjectStakeholderRefDtoFromJson(json);
}

extension ProjectStakeholderRefDtoValidation on ProjectStakeholderRefDto {
  void validate() {
    final trimmedNote = note?.trim();
    if (trimmedNote != null && trimmedNote.length > 500) {
      throw ArgumentError('stakeholder note cannot exceed 500 characters');
    }
  }
}

/// §5 `POST /projects` body. `currency` is required exactly when
/// `estimatedValue` is present — enforced by `AppValidators.validateMoney`
/// in `.validate()`, not by the type system.
@freezed
abstract class RegisterProjectRequest with _$RegisterProjectRequest {
  const factory RegisterProjectRequest({
    required String name,
    required BuildingType buildingType,
    required String description,
    required LocationDto location,
    required ConstructionPhase constructionPhase,
    required List<ProjectFileRefDto> files,
    String? addressLine,
    int? unitCount,
    double? estimatedValue,
    String? currency,
    @Default(<ProjectStakeholderRefDto>[])
    List<ProjectStakeholderRefDto> stakeholders,
    String? decisionMakerContactId,
    String? notes,
  }) = _RegisterProjectRequest;

  factory RegisterProjectRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterProjectRequestFromJson(json);
}

extension RegisterProjectRequestValidation on RegisterProjectRequest {
  /// Mirrors the auth module's per-model `.validate()` extension pattern —
  /// called before the network request, server response is the fallback.
  void validate() {
    final trimmedName = name.trim();
    if (trimmedName.length < 3 || trimmedName.length > 200) {
      throw ArgumentError('name must be 3-200 characters');
    }
    final trimmedDescription = description.trim();
    if (trimmedDescription.length < 10 || trimmedDescription.length > 2000) {
      throw ArgumentError('description must be 10-2000 characters');
    }
    location.validate();
    if (files.isEmpty || files.length > 10) {
      throw ArgumentError('files must contain 1-10 items');
    }
    for (final file in files) {
      file.validate();
    }
    final trimmedAddress = addressLine?.trim();
    if (trimmedAddress != null && trimmedAddress.length > 500) {
      throw ArgumentError('addressLine cannot exceed 500 characters');
    }
    if (unitCount != null && (unitCount! < 1 || unitCount! > 100000)) {
      throw ArgumentError('unitCount must be 1-100000');
    }
    AppValidators.validateMoney(
      amount: estimatedValue,
      currency: currency,
      fieldName: 'estimatedValue',
    );
    if (stakeholders.length > 20) {
      throw ArgumentError('stakeholders cannot exceed 20 items');
    }
    for (final stakeholder in stakeholders) {
      stakeholder.validate();
    }
    final trimmedNotes = notes?.trim();
    if (trimmedNotes != null && trimmedNotes.length > 2000) {
      throw ArgumentError('notes cannot exceed 2000 characters');
    }
  }
}
