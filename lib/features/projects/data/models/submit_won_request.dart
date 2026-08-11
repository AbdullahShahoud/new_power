import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';

part 'submit_won_request.freezed.dart';
part 'submit_won_request.g.dart';

/// §5 `POST /projects/{projectId}/won` body. An unappointed outlet is
/// accepted (`isAuthorized: false` comes back on the response) — only a
/// missing/non-`DISTRIBUTOR` account is refused server-side
/// (`PROJECT_DISTRIBUTOR_NOT_FOUND`).
@freezed
abstract class SubmitWonRequest with _$SubmitWonRequest {
  const factory SubmitWonRequest({
    required String distributorAccountId,
    double? value,
    String? currency,
    DateTime? soldAt,
    @Default(<ProductCategory>[]) List<ProductCategory> categories,
    int? unitsSupplied,
    int? unitsTotal,
    String? buyerContactId,
    String? notes,
  }) = _SubmitWonRequest;

  factory SubmitWonRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitWonRequestFromJson(json);
}

extension SubmitWonRequestValidation on SubmitWonRequest {
  void validate() {
    AppValidators.validateUuid(
      distributorAccountId,
      fieldName: 'distributorAccountId',
    );
    AppValidators.validateMoney(
      amount: value,
      currency: currency,
      fieldName: 'value',
    );
    if (categories.length > 20) {
      throw ArgumentError('categories cannot exceed 20 items');
    }
    if (unitsSupplied != null && unitsSupplied! < 0) {
      throw ArgumentError('unitsSupplied must be >= 0');
    }
    if (unitsTotal != null && unitsTotal! < 0) {
      throw ArgumentError('unitsTotal must be >= 0');
    }
    if (unitsSupplied != null &&
        unitsTotal != null &&
        unitsSupplied! > unitsTotal!) {
      throw ArgumentError('unitsSupplied cannot exceed unitsTotal');
    }
    if (buyerContactId != null) {
      AppValidators.validateUuid(buyerContactId!, fieldName: 'buyerContactId');
    }
    final trimmedNotes = notes?.trim();
    if (trimmedNotes != null && trimmedNotes.length > 2000) {
      throw ArgumentError('notes cannot exceed 2000 characters');
    }
  }
}
