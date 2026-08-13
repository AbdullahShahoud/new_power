import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'activity_location_dto.freezed.dart';
part 'activity_location_dto.g.dart';

/// §4 `ActivityLocationDto` — used by activity logging. Extends `LocationDto`
/// with `accuracyM`, modeled as its own class rather than forcing
/// `LocationDto` to carry a field unused everywhere else it appears
/// (projects-implementation-map.md §3).
@freezed
abstract class ActivityLocationDto with _$ActivityLocationDto {
  /// Optional-and-absent must actually be absent on the wire:
  /// json_serializable emits every key by default, and this API rejects
  /// present-but-null on validated optional fields (see
  /// `SubmitWonRequest` for the case that surfaced it).
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ActivityLocationDto({
    required double lat,
    required double lng,
    int? accuracyM,
  }) = _ActivityLocationDto;

  factory ActivityLocationDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityLocationDtoFromJson(json);
}

extension ActivityLocationDtoValidation on ActivityLocationDto {
  /// GPS is a signal, not a gate (§10 Workflow 4) — only range-checks the
  /// fix, unlike `LocationDto`'s `(0,0)`-rejecting `validateCoordinates`
  /// (that rule is `PROJECT_INVALID_LOCATION`, specific to a project's own
  /// location and not documented for `ActivityLocationDto`). A fix that's
  /// merely far from the project is never blocked — that's
  /// `locationVerified: false`, decided server-side.
  void validate() {
    AppValidators.validateLatitude(lat);
    AppValidators.validateLongitude(lng);
    if (accuracyM != null && accuracyM! < 0) {
      throw ArgumentError('accuracyM must be >= 0');
    }
  }
}
