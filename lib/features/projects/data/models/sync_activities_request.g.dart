// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_activities_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncActivitiesRequest _$SyncActivitiesRequestFromJson(
  Map<String, dynamic> json,
) => _SyncActivitiesRequest(
  items: (json['items'] as List<dynamic>)
      .map((e) => SyncActivityItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SyncActivitiesRequestToJson(
  _SyncActivitiesRequest instance,
) => <String, dynamic>{'items': instance.items};
