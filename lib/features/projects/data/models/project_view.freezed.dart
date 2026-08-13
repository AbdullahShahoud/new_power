// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectView {

 String get id; String get name; BuildingType get buildingType; String get description; double get latitude; double get longitude; String? get addressLine; String? get territoryId; TerritoryRefView? get territory; bool get outsideTerritory; ConstructionPhase get constructionPhase; ProjectStage get stage; ProjectStatus get status; String get ownerId; ActorView? get owner; int? get unitCount; double? get estimatedValue; String? get currency; String? get notes; DateTime? get lastActivityAt; DateTime? get nextActionAt; DateTime? get closedAt; String? get closedBy; int get version; String? get createdBy; ActorView? get createdByUser; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectViewCopyWith<ProjectView> get copyWith => _$ProjectViewCopyWithImpl<ProjectView>(this as ProjectView, _$identity);

  /// Serializes this ProjectView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.territoryId, territoryId) || other.territoryId == territoryId)&&(identical(other.territory, territory) || other.territory == territory)&&(identical(other.outsideTerritory, outsideTerritory) || other.outsideTerritory == outsideTerritory)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.closedBy, closedBy) || other.closedBy == closedBy)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,buildingType,description,latitude,longitude,addressLine,territoryId,territory,outsideTerritory,constructionPhase,stage,status,ownerId,owner,unitCount,estimatedValue,currency,notes,lastActivityAt,nextActionAt,closedAt,closedBy,version,createdBy,createdByUser,createdAt,updatedAt]);

@override
String toString() {
  return 'ProjectView(id: $id, name: $name, buildingType: $buildingType, description: $description, latitude: $latitude, longitude: $longitude, addressLine: $addressLine, territoryId: $territoryId, territory: $territory, outsideTerritory: $outsideTerritory, constructionPhase: $constructionPhase, stage: $stage, status: $status, ownerId: $ownerId, owner: $owner, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, notes: $notes, lastActivityAt: $lastActivityAt, nextActionAt: $nextActionAt, closedAt: $closedAt, closedBy: $closedBy, version: $version, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProjectViewCopyWith<$Res>  {
  factory $ProjectViewCopyWith(ProjectView value, $Res Function(ProjectView) _then) = _$ProjectViewCopyWithImpl;
@useResult
$Res call({
 String id, String name, BuildingType buildingType, String description, double latitude, double longitude, String? addressLine, String? territoryId, TerritoryRefView? territory, bool outsideTerritory, ConstructionPhase constructionPhase, ProjectStage stage, ProjectStatus status, String ownerId, ActorView? owner, int? unitCount, double? estimatedValue, String? currency, String? notes, DateTime? lastActivityAt, DateTime? nextActionAt, DateTime? closedAt, String? closedBy, int version, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt
});


$TerritoryRefViewCopyWith<$Res>? get territory;$ActorViewCopyWith<$Res>? get owner;$ActorViewCopyWith<$Res>? get createdByUser;

}
/// @nodoc
class _$ProjectViewCopyWithImpl<$Res>
    implements $ProjectViewCopyWith<$Res> {
  _$ProjectViewCopyWithImpl(this._self, this._then);

  final ProjectView _self;
  final $Res Function(ProjectView) _then;

/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? buildingType = null,Object? description = null,Object? latitude = null,Object? longitude = null,Object? addressLine = freezed,Object? territoryId = freezed,Object? territory = freezed,Object? outsideTerritory = null,Object? constructionPhase = null,Object? stage = null,Object? status = null,Object? ownerId = null,Object? owner = freezed,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? notes = freezed,Object? lastActivityAt = freezed,Object? nextActionAt = freezed,Object? closedAt = freezed,Object? closedBy = freezed,Object? version = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,territoryId: freezed == territoryId ? _self.territoryId : territoryId // ignore: cast_nullable_to_non_nullable
as String?,territory: freezed == territory ? _self.territory : territory // ignore: cast_nullable_to_non_nullable
as TerritoryRefView?,outsideTerritory: null == outsideTerritory ? _self.outsideTerritory : outsideTerritory // ignore: cast_nullable_to_non_nullable
as bool,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as ActorView?,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedBy: freezed == closedBy ? _self.closedBy : closedBy // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerritoryRefViewCopyWith<$Res>? get territory {
    if (_self.territory == null) {
    return null;
  }

  return $TerritoryRefViewCopyWith<$Res>(_self.territory!, (value) {
    return _then(_self.copyWith(territory: value));
  });
}/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get createdByUser {
    if (_self.createdByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.createdByUser!, (value) {
    return _then(_self.copyWith(createdByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectView].
extension ProjectViewPatterns on ProjectView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectView value)  $default,){
final _that = this;
switch (_that) {
case _ProjectView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectView value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectView() when $default != null:
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProjectView():
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProjectView() when $default != null:
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _ProjectView implements ProjectView {
  const _ProjectView({required this.id, required this.name, required this.buildingType, required this.description, required this.latitude, required this.longitude, this.addressLine, this.territoryId, this.territory, this.outsideTerritory = false, required this.constructionPhase, required this.stage, required this.status, required this.ownerId, this.owner, this.unitCount, this.estimatedValue, this.currency, this.notes, this.lastActivityAt, this.nextActionAt, this.closedAt, this.closedBy, required this.version, this.createdBy, this.createdByUser, required this.createdAt, required this.updatedAt});
  factory _ProjectView.fromJson(Map<String, dynamic> json) => _$ProjectViewFromJson(json);

@override final  String id;
@override final  String name;
@override final  BuildingType buildingType;
@override final  String description;
@override final  double latitude;
@override final  double longitude;
@override final  String? addressLine;
@override final  String? territoryId;
@override final  TerritoryRefView? territory;
@override@JsonKey() final  bool outsideTerritory;
@override final  ConstructionPhase constructionPhase;
@override final  ProjectStage stage;
@override final  ProjectStatus status;
@override final  String ownerId;
@override final  ActorView? owner;
@override final  int? unitCount;
@override final  double? estimatedValue;
@override final  String? currency;
@override final  String? notes;
@override final  DateTime? lastActivityAt;
@override final  DateTime? nextActionAt;
@override final  DateTime? closedAt;
@override final  String? closedBy;
@override final  int version;
@override final  String? createdBy;
@override final  ActorView? createdByUser;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectViewCopyWith<_ProjectView> get copyWith => __$ProjectViewCopyWithImpl<_ProjectView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.territoryId, territoryId) || other.territoryId == territoryId)&&(identical(other.territory, territory) || other.territory == territory)&&(identical(other.outsideTerritory, outsideTerritory) || other.outsideTerritory == outsideTerritory)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.closedBy, closedBy) || other.closedBy == closedBy)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,buildingType,description,latitude,longitude,addressLine,territoryId,territory,outsideTerritory,constructionPhase,stage,status,ownerId,owner,unitCount,estimatedValue,currency,notes,lastActivityAt,nextActionAt,closedAt,closedBy,version,createdBy,createdByUser,createdAt,updatedAt]);

@override
String toString() {
  return 'ProjectView(id: $id, name: $name, buildingType: $buildingType, description: $description, latitude: $latitude, longitude: $longitude, addressLine: $addressLine, territoryId: $territoryId, territory: $territory, outsideTerritory: $outsideTerritory, constructionPhase: $constructionPhase, stage: $stage, status: $status, ownerId: $ownerId, owner: $owner, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, notes: $notes, lastActivityAt: $lastActivityAt, nextActionAt: $nextActionAt, closedAt: $closedAt, closedBy: $closedBy, version: $version, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProjectViewCopyWith<$Res> implements $ProjectViewCopyWith<$Res> {
  factory _$ProjectViewCopyWith(_ProjectView value, $Res Function(_ProjectView) _then) = __$ProjectViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, BuildingType buildingType, String description, double latitude, double longitude, String? addressLine, String? territoryId, TerritoryRefView? territory, bool outsideTerritory, ConstructionPhase constructionPhase, ProjectStage stage, ProjectStatus status, String ownerId, ActorView? owner, int? unitCount, double? estimatedValue, String? currency, String? notes, DateTime? lastActivityAt, DateTime? nextActionAt, DateTime? closedAt, String? closedBy, int version, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt
});


@override $TerritoryRefViewCopyWith<$Res>? get territory;@override $ActorViewCopyWith<$Res>? get owner;@override $ActorViewCopyWith<$Res>? get createdByUser;

}
/// @nodoc
class __$ProjectViewCopyWithImpl<$Res>
    implements _$ProjectViewCopyWith<$Res> {
  __$ProjectViewCopyWithImpl(this._self, this._then);

  final _ProjectView _self;
  final $Res Function(_ProjectView) _then;

/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? buildingType = null,Object? description = null,Object? latitude = null,Object? longitude = null,Object? addressLine = freezed,Object? territoryId = freezed,Object? territory = freezed,Object? outsideTerritory = null,Object? constructionPhase = null,Object? stage = null,Object? status = null,Object? ownerId = null,Object? owner = freezed,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? notes = freezed,Object? lastActivityAt = freezed,Object? nextActionAt = freezed,Object? closedAt = freezed,Object? closedBy = freezed,Object? version = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ProjectView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,territoryId: freezed == territoryId ? _self.territoryId : territoryId // ignore: cast_nullable_to_non_nullable
as String?,territory: freezed == territory ? _self.territory : territory // ignore: cast_nullable_to_non_nullable
as TerritoryRefView?,outsideTerritory: null == outsideTerritory ? _self.outsideTerritory : outsideTerritory // ignore: cast_nullable_to_non_nullable
as bool,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as ActorView?,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedBy: freezed == closedBy ? _self.closedBy : closedBy // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerritoryRefViewCopyWith<$Res>? get territory {
    if (_self.territory == null) {
    return null;
  }

  return $TerritoryRefViewCopyWith<$Res>(_self.territory!, (value) {
    return _then(_self.copyWith(territory: value));
  });
}/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of ProjectView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get createdByUser {
    if (_self.createdByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.createdByUser!, (value) {
    return _then(_self.copyWith(createdByUser: value));
  });
}
}


/// @nodoc
mixin _$ProjectSummaryView {

 String get id; String get name; BuildingType get buildingType; String get description; double get latitude; double get longitude; String? get addressLine; String? get territoryId; TerritoryRefView? get territory; bool get outsideTerritory; ConstructionPhase get constructionPhase; ProjectStage get stage; ProjectStatus get status; String get ownerId; ActorView? get owner; int? get unitCount; double? get estimatedValue; String? get currency; String? get notes; DateTime? get lastActivityAt; DateTime? get nextActionAt; DateTime? get closedAt; String? get closedBy; int get version; String? get createdBy; ActorView? get createdByUser; DateTime get createdAt; DateTime get updatedAt; int get imageCount; int get activityCount; int get stakeholderCount; double? get distanceM;/// §5 `GET /projects` documents list rows as carrying `imageCount` but
/// **no `images` array** ("fetch one project to get photos"). Modeled
/// as optional-with-empty-default anyway: if the backend does include
/// it, the list card shows a real thumbnail for free; if it doesn't,
/// this stays empty and the card falls back to a placeholder. The
/// alternative — one `GET /projects/{id}` per visible row just for a
/// thumbnail — is an N+1 the doc is explicitly steering away from.
 List<ProjectImageView> get images;
/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectSummaryViewCopyWith<ProjectSummaryView> get copyWith => _$ProjectSummaryViewCopyWithImpl<ProjectSummaryView>(this as ProjectSummaryView, _$identity);

  /// Serializes this ProjectSummaryView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectSummaryView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.territoryId, territoryId) || other.territoryId == territoryId)&&(identical(other.territory, territory) || other.territory == territory)&&(identical(other.outsideTerritory, outsideTerritory) || other.outsideTerritory == outsideTerritory)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.closedBy, closedBy) || other.closedBy == closedBy)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&(identical(other.activityCount, activityCount) || other.activityCount == activityCount)&&(identical(other.stakeholderCount, stakeholderCount) || other.stakeholderCount == stakeholderCount)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&const DeepCollectionEquality().equals(other.images, images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,buildingType,description,latitude,longitude,addressLine,territoryId,territory,outsideTerritory,constructionPhase,stage,status,ownerId,owner,unitCount,estimatedValue,currency,notes,lastActivityAt,nextActionAt,closedAt,closedBy,version,createdBy,createdByUser,createdAt,updatedAt,imageCount,activityCount,stakeholderCount,distanceM,const DeepCollectionEquality().hash(images)]);

@override
String toString() {
  return 'ProjectSummaryView(id: $id, name: $name, buildingType: $buildingType, description: $description, latitude: $latitude, longitude: $longitude, addressLine: $addressLine, territoryId: $territoryId, territory: $territory, outsideTerritory: $outsideTerritory, constructionPhase: $constructionPhase, stage: $stage, status: $status, ownerId: $ownerId, owner: $owner, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, notes: $notes, lastActivityAt: $lastActivityAt, nextActionAt: $nextActionAt, closedAt: $closedAt, closedBy: $closedBy, version: $version, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, imageCount: $imageCount, activityCount: $activityCount, stakeholderCount: $stakeholderCount, distanceM: $distanceM, images: $images)';
}


}

/// @nodoc
abstract mixin class $ProjectSummaryViewCopyWith<$Res>  {
  factory $ProjectSummaryViewCopyWith(ProjectSummaryView value, $Res Function(ProjectSummaryView) _then) = _$ProjectSummaryViewCopyWithImpl;
@useResult
$Res call({
 String id, String name, BuildingType buildingType, String description, double latitude, double longitude, String? addressLine, String? territoryId, TerritoryRefView? territory, bool outsideTerritory, ConstructionPhase constructionPhase, ProjectStage stage, ProjectStatus status, String ownerId, ActorView? owner, int? unitCount, double? estimatedValue, String? currency, String? notes, DateTime? lastActivityAt, DateTime? nextActionAt, DateTime? closedAt, String? closedBy, int version, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt, int imageCount, int activityCount, int stakeholderCount, double? distanceM, List<ProjectImageView> images
});


$TerritoryRefViewCopyWith<$Res>? get territory;$ActorViewCopyWith<$Res>? get owner;$ActorViewCopyWith<$Res>? get createdByUser;

}
/// @nodoc
class _$ProjectSummaryViewCopyWithImpl<$Res>
    implements $ProjectSummaryViewCopyWith<$Res> {
  _$ProjectSummaryViewCopyWithImpl(this._self, this._then);

  final ProjectSummaryView _self;
  final $Res Function(ProjectSummaryView) _then;

/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? buildingType = null,Object? description = null,Object? latitude = null,Object? longitude = null,Object? addressLine = freezed,Object? territoryId = freezed,Object? territory = freezed,Object? outsideTerritory = null,Object? constructionPhase = null,Object? stage = null,Object? status = null,Object? ownerId = null,Object? owner = freezed,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? notes = freezed,Object? lastActivityAt = freezed,Object? nextActionAt = freezed,Object? closedAt = freezed,Object? closedBy = freezed,Object? version = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,Object? imageCount = null,Object? activityCount = null,Object? stakeholderCount = null,Object? distanceM = freezed,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,territoryId: freezed == territoryId ? _self.territoryId : territoryId // ignore: cast_nullable_to_non_nullable
as String?,territory: freezed == territory ? _self.territory : territory // ignore: cast_nullable_to_non_nullable
as TerritoryRefView?,outsideTerritory: null == outsideTerritory ? _self.outsideTerritory : outsideTerritory // ignore: cast_nullable_to_non_nullable
as bool,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as ActorView?,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedBy: freezed == closedBy ? _self.closedBy : closedBy // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,activityCount: null == activityCount ? _self.activityCount : activityCount // ignore: cast_nullable_to_non_nullable
as int,stakeholderCount: null == stakeholderCount ? _self.stakeholderCount : stakeholderCount // ignore: cast_nullable_to_non_nullable
as int,distanceM: freezed == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ProjectImageView>,
  ));
}
/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerritoryRefViewCopyWith<$Res>? get territory {
    if (_self.territory == null) {
    return null;
  }

  return $TerritoryRefViewCopyWith<$Res>(_self.territory!, (value) {
    return _then(_self.copyWith(territory: value));
  });
}/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get createdByUser {
    if (_self.createdByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.createdByUser!, (value) {
    return _then(_self.copyWith(createdByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectSummaryView].
extension ProjectSummaryViewPatterns on ProjectSummaryView {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectSummaryView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectSummaryView() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectSummaryView value)  $default,){
final _that = this;
switch (_that) {
case _ProjectSummaryView():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectSummaryView value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectSummaryView() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  int imageCount,  int activityCount,  int stakeholderCount,  double? distanceM,  List<ProjectImageView> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectSummaryView() when $default != null:
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.imageCount,_that.activityCount,_that.stakeholderCount,_that.distanceM,_that.images);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  int imageCount,  int activityCount,  int stakeholderCount,  double? distanceM,  List<ProjectImageView> images)  $default,) {final _that = this;
switch (_that) {
case _ProjectSummaryView():
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.imageCount,_that.activityCount,_that.stakeholderCount,_that.distanceM,_that.images);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  BuildingType buildingType,  String description,  double latitude,  double longitude,  String? addressLine,  String? territoryId,  TerritoryRefView? territory,  bool outsideTerritory,  ConstructionPhase constructionPhase,  ProjectStage stage,  ProjectStatus status,  String ownerId,  ActorView? owner,  int? unitCount,  double? estimatedValue,  String? currency,  String? notes,  DateTime? lastActivityAt,  DateTime? nextActionAt,  DateTime? closedAt,  String? closedBy,  int version,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  int imageCount,  int activityCount,  int stakeholderCount,  double? distanceM,  List<ProjectImageView> images)?  $default,) {final _that = this;
switch (_that) {
case _ProjectSummaryView() when $default != null:
return $default(_that.id,_that.name,_that.buildingType,_that.description,_that.latitude,_that.longitude,_that.addressLine,_that.territoryId,_that.territory,_that.outsideTerritory,_that.constructionPhase,_that.stage,_that.status,_that.ownerId,_that.owner,_that.unitCount,_that.estimatedValue,_that.currency,_that.notes,_that.lastActivityAt,_that.nextActionAt,_that.closedAt,_that.closedBy,_that.version,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.imageCount,_that.activityCount,_that.stakeholderCount,_that.distanceM,_that.images);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _ProjectSummaryView implements ProjectSummaryView {
  const _ProjectSummaryView({required this.id, required this.name, required this.buildingType, required this.description, required this.latitude, required this.longitude, this.addressLine, this.territoryId, this.territory, this.outsideTerritory = false, required this.constructionPhase, required this.stage, required this.status, required this.ownerId, this.owner, this.unitCount, this.estimatedValue, this.currency, this.notes, this.lastActivityAt, this.nextActionAt, this.closedAt, this.closedBy, required this.version, this.createdBy, this.createdByUser, required this.createdAt, required this.updatedAt, required this.imageCount, required this.activityCount, required this.stakeholderCount, this.distanceM, final  List<ProjectImageView> images = const <ProjectImageView>[]}): _images = images;
  factory _ProjectSummaryView.fromJson(Map<String, dynamic> json) => _$ProjectSummaryViewFromJson(json);

@override final  String id;
@override final  String name;
@override final  BuildingType buildingType;
@override final  String description;
@override final  double latitude;
@override final  double longitude;
@override final  String? addressLine;
@override final  String? territoryId;
@override final  TerritoryRefView? territory;
@override@JsonKey() final  bool outsideTerritory;
@override final  ConstructionPhase constructionPhase;
@override final  ProjectStage stage;
@override final  ProjectStatus status;
@override final  String ownerId;
@override final  ActorView? owner;
@override final  int? unitCount;
@override final  double? estimatedValue;
@override final  String? currency;
@override final  String? notes;
@override final  DateTime? lastActivityAt;
@override final  DateTime? nextActionAt;
@override final  DateTime? closedAt;
@override final  String? closedBy;
@override final  int version;
@override final  String? createdBy;
@override final  ActorView? createdByUser;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int imageCount;
@override final  int activityCount;
@override final  int stakeholderCount;
@override final  double? distanceM;
/// §5 `GET /projects` documents list rows as carrying `imageCount` but
/// **no `images` array** ("fetch one project to get photos"). Modeled
/// as optional-with-empty-default anyway: if the backend does include
/// it, the list card shows a real thumbnail for free; if it doesn't,
/// this stays empty and the card falls back to a placeholder. The
/// alternative — one `GET /projects/{id}` per visible row just for a
/// thumbnail — is an N+1 the doc is explicitly steering away from.
 final  List<ProjectImageView> _images;
/// §5 `GET /projects` documents list rows as carrying `imageCount` but
/// **no `images` array** ("fetch one project to get photos"). Modeled
/// as optional-with-empty-default anyway: if the backend does include
/// it, the list card shows a real thumbnail for free; if it doesn't,
/// this stays empty and the card falls back to a placeholder. The
/// alternative — one `GET /projects/{id}` per visible row just for a
/// thumbnail — is an N+1 the doc is explicitly steering away from.
@override@JsonKey() List<ProjectImageView> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}


/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectSummaryViewCopyWith<_ProjectSummaryView> get copyWith => __$ProjectSummaryViewCopyWithImpl<_ProjectSummaryView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectSummaryViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectSummaryView&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.addressLine, addressLine) || other.addressLine == addressLine)&&(identical(other.territoryId, territoryId) || other.territoryId == territoryId)&&(identical(other.territory, territory) || other.territory == territory)&&(identical(other.outsideTerritory, outsideTerritory) || other.outsideTerritory == outsideTerritory)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.unitCount, unitCount) || other.unitCount == unitCount)&&(identical(other.estimatedValue, estimatedValue) || other.estimatedValue == estimatedValue)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.closedAt, closedAt) || other.closedAt == closedAt)&&(identical(other.closedBy, closedBy) || other.closedBy == closedBy)&&(identical(other.version, version) || other.version == version)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.imageCount, imageCount) || other.imageCount == imageCount)&&(identical(other.activityCount, activityCount) || other.activityCount == activityCount)&&(identical(other.stakeholderCount, stakeholderCount) || other.stakeholderCount == stakeholderCount)&&(identical(other.distanceM, distanceM) || other.distanceM == distanceM)&&const DeepCollectionEquality().equals(other._images, _images));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,buildingType,description,latitude,longitude,addressLine,territoryId,territory,outsideTerritory,constructionPhase,stage,status,ownerId,owner,unitCount,estimatedValue,currency,notes,lastActivityAt,nextActionAt,closedAt,closedBy,version,createdBy,createdByUser,createdAt,updatedAt,imageCount,activityCount,stakeholderCount,distanceM,const DeepCollectionEquality().hash(_images)]);

@override
String toString() {
  return 'ProjectSummaryView(id: $id, name: $name, buildingType: $buildingType, description: $description, latitude: $latitude, longitude: $longitude, addressLine: $addressLine, territoryId: $territoryId, territory: $territory, outsideTerritory: $outsideTerritory, constructionPhase: $constructionPhase, stage: $stage, status: $status, ownerId: $ownerId, owner: $owner, unitCount: $unitCount, estimatedValue: $estimatedValue, currency: $currency, notes: $notes, lastActivityAt: $lastActivityAt, nextActionAt: $nextActionAt, closedAt: $closedAt, closedBy: $closedBy, version: $version, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, imageCount: $imageCount, activityCount: $activityCount, stakeholderCount: $stakeholderCount, distanceM: $distanceM, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ProjectSummaryViewCopyWith<$Res> implements $ProjectSummaryViewCopyWith<$Res> {
  factory _$ProjectSummaryViewCopyWith(_ProjectSummaryView value, $Res Function(_ProjectSummaryView) _then) = __$ProjectSummaryViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, BuildingType buildingType, String description, double latitude, double longitude, String? addressLine, String? territoryId, TerritoryRefView? territory, bool outsideTerritory, ConstructionPhase constructionPhase, ProjectStage stage, ProjectStatus status, String ownerId, ActorView? owner, int? unitCount, double? estimatedValue, String? currency, String? notes, DateTime? lastActivityAt, DateTime? nextActionAt, DateTime? closedAt, String? closedBy, int version, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt, int imageCount, int activityCount, int stakeholderCount, double? distanceM, List<ProjectImageView> images
});


@override $TerritoryRefViewCopyWith<$Res>? get territory;@override $ActorViewCopyWith<$Res>? get owner;@override $ActorViewCopyWith<$Res>? get createdByUser;

}
/// @nodoc
class __$ProjectSummaryViewCopyWithImpl<$Res>
    implements _$ProjectSummaryViewCopyWith<$Res> {
  __$ProjectSummaryViewCopyWithImpl(this._self, this._then);

  final _ProjectSummaryView _self;
  final $Res Function(_ProjectSummaryView) _then;

/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? buildingType = null,Object? description = null,Object? latitude = null,Object? longitude = null,Object? addressLine = freezed,Object? territoryId = freezed,Object? territory = freezed,Object? outsideTerritory = null,Object? constructionPhase = null,Object? stage = null,Object? status = null,Object? ownerId = null,Object? owner = freezed,Object? unitCount = freezed,Object? estimatedValue = freezed,Object? currency = freezed,Object? notes = freezed,Object? lastActivityAt = freezed,Object? nextActionAt = freezed,Object? closedAt = freezed,Object? closedBy = freezed,Object? version = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,Object? imageCount = null,Object? activityCount = null,Object? stakeholderCount = null,Object? distanceM = freezed,Object? images = null,}) {
  return _then(_ProjectSummaryView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,buildingType: null == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,addressLine: freezed == addressLine ? _self.addressLine : addressLine // ignore: cast_nullable_to_non_nullable
as String?,territoryId: freezed == territoryId ? _self.territoryId : territoryId // ignore: cast_nullable_to_non_nullable
as String?,territory: freezed == territory ? _self.territory : territory // ignore: cast_nullable_to_non_nullable
as TerritoryRefView?,outsideTerritory: null == outsideTerritory ? _self.outsideTerritory : outsideTerritory // ignore: cast_nullable_to_non_nullable
as bool,constructionPhase: null == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,owner: freezed == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as ActorView?,unitCount: freezed == unitCount ? _self.unitCount : unitCount // ignore: cast_nullable_to_non_nullable
as int?,estimatedValue: freezed == estimatedValue ? _self.estimatedValue : estimatedValue // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedAt: freezed == closedAt ? _self.closedAt : closedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closedBy: freezed == closedBy ? _self.closedBy : closedBy // ignore: cast_nullable_to_non_nullable
as String?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,imageCount: null == imageCount ? _self.imageCount : imageCount // ignore: cast_nullable_to_non_nullable
as int,activityCount: null == activityCount ? _self.activityCount : activityCount // ignore: cast_nullable_to_non_nullable
as int,stakeholderCount: null == stakeholderCount ? _self.stakeholderCount : stakeholderCount // ignore: cast_nullable_to_non_nullable
as int,distanceM: freezed == distanceM ? _self.distanceM : distanceM // ignore: cast_nullable_to_non_nullable
as double?,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ProjectImageView>,
  ));
}

/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TerritoryRefViewCopyWith<$Res>? get territory {
    if (_self.territory == null) {
    return null;
  }

  return $TerritoryRefViewCopyWith<$Res>(_self.territory!, (value) {
    return _then(_self.copyWith(territory: value));
  });
}/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get owner {
    if (_self.owner == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.owner!, (value) {
    return _then(_self.copyWith(owner: value));
  });
}/// Create a copy of ProjectSummaryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get createdByUser {
    if (_self.createdByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.createdByUser!, (value) {
    return _then(_self.copyWith(createdByUser: value));
  });
}
}

// dart format on
