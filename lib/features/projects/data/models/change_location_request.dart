import '../../../../core/helpers/validators.dart';
import 'location_dto.dart';
import 'omit.dart';

/// §5 `PUT /projects/{id}/location` body — `SALES_MANAGER` only. Plain
/// class (not `@freezed`) so `addressLine`'s omit-vs-null distinction can be
/// hand-serialized — see `omit.dart`.
class ChangeLocationRequest {
  final LocationDto location;
  final String reason;

  /// `String?` value, or the [omit] sentinel to leave the current
  /// `addressLine` untouched.
  final Object? addressLine;

  const ChangeLocationRequest({
    required this.location,
    required this.reason,
    this.addressLine = omit,
  });

  void validate() {
    location.validate();
    AppValidators.validateReason(reason, fieldName: 'reason');
    if (addressLine is String && (addressLine as String).trim().length > 500) {
      throw ArgumentError('addressLine cannot exceed 500 characters');
    }
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'location': location.toJson(),
      'reason': reason,
    };
    if (addressLine != omit) {
      json['addressLine'] = addressLine;
    }
    return json;
  }
}
