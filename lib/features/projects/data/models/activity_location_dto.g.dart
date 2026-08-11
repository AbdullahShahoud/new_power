// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_location_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ActivityLocationDto _$ActivityLocationDtoFromJson(Map<String, dynamic> json) =>
    _ActivityLocationDto(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      accuracyM: (json['accuracyM'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ActivityLocationDtoToJson(
  _ActivityLocationDto instance,
) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
  'accuracyM': instance.accuracyM,
};
