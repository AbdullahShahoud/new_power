import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/utc_date_time_converter.dart';
import '../../../../core/helpers/validators.dart';
import 'enums.dart';
import 'uploaded_file_dto.dart';

part 'submit_won_request.freezed.dart';
part 'submit_won_request.g.dart';

/// §5 `POST /projects/{projectId}/won` body. An unappointed outlet is
/// accepted (`isAuthorized: false` comes back on the response) — only a
/// missing/non-`DISTRIBUTOR` account is refused server-side
/// (`PROJECT_DISTRIBUTOR_NOT_FOUND`).
@freezed
abstract class SubmitWonRequest with _$SubmitWonRequest {
  /// `includeIfNull: false` is load-bearing, not tidiness. json_serializable
  /// emits *every* key by default, so an untouched optional field would go
  /// out as an explicit `"currency": null` — and the server validates
  /// present-but-null against its ISO-4217 rule and rejects the whole
  /// request. "Omitted" and "explicitly null" are different statements to
  /// this API (the same distinction the `omit` sentinel encodes on the PATCH
  /// requests); optional-and-absent has to actually be absent.
  ///
  /// Must sit on the **constructor**, not the class — freezed owns the
  /// class-level annotation and generation fails outright if it's moved
  /// there. The `invalid_annotation_target` warning this raises is
  /// suppressed per-file below; the generator honours it regardless.
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false, converters: [UtcDateTimeConverter()])
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

    /// Supporting documents for the claim — a signed contract, a delivery
    /// note, the approval scan. Same `{key, name}` shape as an activity's
    /// attachments: upload through `POST /files` first, then quote the keys
    /// it returns.
    ///
    /// Capped at 10 to match every other `files` array in this API. Empty by
    /// default and, with `includeIfNull: false`, an empty list still
    /// serialises as `"files": []` — harmless, since the server treats the
    /// array as optional.
    @Default(<UploadedFileDto>[]) List<UploadedFileDto> files,
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
    if (files.length > 10) {
      throw ArgumentError('files cannot exceed 10 items');
    }
    for (final file in files) {
      file.validate();
    }
  }
}
