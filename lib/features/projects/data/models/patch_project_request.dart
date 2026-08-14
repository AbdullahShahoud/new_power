import '../../../../core/helpers/validators.dart';
import 'enums.dart';
import 'omit.dart';

/// §5 `PATCH /projects/{id}` body. "Omitted fields are left alone; an
/// explicit `null` clears the field" (nullable fields only) — see
/// `omit.dart`. Not editable here: `location`, `stage`, `status`,
/// `constructionPhase`.
class PatchProjectRequest {
  final String? name;
  final BuildingType? buildingType;
  final String? description;

  /// `String?` value, or [omit] to leave `addressLine` unchanged.
  final Object? addressLine;

  /// `int?` value, or [omit] to leave `unitCount` unchanged.
  final Object? unitCount;

  /// `double?` value, or [omit] to leave `estimatedValue` unchanged.
  final Object? estimatedValue;

  /// `String?` value, or [omit] to leave `currency` unchanged. Send
  /// alongside `estimatedValue` when changing the amount.
  final Object? currency;

  /// `String?` value, or [omit] to leave `notes` unchanged.
  final Object? notes;

  final int? expectedVersion;

  const PatchProjectRequest({
    this.name,
    this.buildingType,
    this.description,
    this.addressLine = omit,
    this.unitCount = omit,
    this.estimatedValue = omit,
    this.currency = omit,
    this.notes = omit,
    this.expectedVersion,
  });

  void validate() {
    if (name != null) {
      final trimmed = name!.trim();
      if (trimmed.length < 3 || trimmed.length > 200) {
        throw ArgumentError('name must be 3-200 characters');
      }
    }
    if (description != null) {
      final trimmed = description!.trim();
      if (trimmed.length < 10 || trimmed.length > 2000) {
        throw ArgumentError('description must be 10-2000 characters');
      }
    }
    if (addressLine is String && (addressLine as String).trim().length > 500) {
      throw ArgumentError('addressLine cannot exceed 500 characters');
    }
    if (unitCount is int &&
        ((unitCount as int) < 1 || (unitCount as int) > 100000)) {
      throw ArgumentError('unitCount must be 1-100000');
    }
    if (estimatedValue != omit || currency != omit) {
      AppValidators.validateMoney(
        amount: estimatedValue == omit ? null : estimatedValue as double?,
        currency: currency == omit ? null : currency as String?,
        fieldName: 'estimatedValue',
      );
    }
    if (notes is String && (notes as String).trim().length > 2000) {
      throw ArgumentError('notes cannot exceed 2000 characters');
    }
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (name != null) json['name'] = name;
    if (buildingType != null) json['buildingType'] = buildingType!.wireValue;
    if (description != null) json['description'] = description;
    if (addressLine != omit) json['addressLine'] = addressLine;
    if (unitCount != omit) json['unitCount'] = unitCount;
    if (estimatedValue != omit) json['estimatedValue'] = estimatedValue;
    if (currency != omit) json['currency'] = currency;
    if (notes != omit) json['notes'] = notes;
    if (expectedVersion != null) json['expectedVersion'] = expectedVersion;
    return json;
  }
}
