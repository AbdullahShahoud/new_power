import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/helpers/validators.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

/// projects-client-reference.md §4 — used by `POST /projects` and
/// `PUT /projects/{id}/location`. Sent nested as `location: { lat, lng }`.
@freezed
abstract class LocationDto with _$LocationDto {
  const factory LocationDto({required double lat, required double lng}) =
      _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
}

extension LocationDtoValidation on LocationDto {
  /// `PROJECT_INVALID_LOCATION`: off the earth, or `(0,0)` — a phone with no fix.
  void validate() {
    AppValidators.validateCoordinates(lat, lng);
  }
}
