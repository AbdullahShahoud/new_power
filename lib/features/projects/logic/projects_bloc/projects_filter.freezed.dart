// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProjectsFilter {

 ProjectStage? get stage; ProjectStatus? get status; ConstructionPhase? get constructionPhase; BuildingType? get buildingType; String? get territoryId; String? get search; String? get near; DateTime? get updatedSince;
/// Create a copy of ProjectsFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectsFilterCopyWith<ProjectsFilter> get copyWith => _$ProjectsFilterCopyWithImpl<ProjectsFilter>(this as ProjectsFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectsFilter&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.territoryId, territoryId) || other.territoryId == territoryId)&&(identical(other.search, search) || other.search == search)&&(identical(other.near, near) || other.near == near)&&(identical(other.updatedSince, updatedSince) || other.updatedSince == updatedSince));
}


@override
int get hashCode => Object.hash(runtimeType,stage,status,constructionPhase,buildingType,territoryId,search,near,updatedSince);

@override
String toString() {
  return 'ProjectsFilter(stage: $stage, status: $status, constructionPhase: $constructionPhase, buildingType: $buildingType, territoryId: $territoryId, search: $search, near: $near, updatedSince: $updatedSince)';
}


}

/// @nodoc
abstract mixin class $ProjectsFilterCopyWith<$Res>  {
  factory $ProjectsFilterCopyWith(ProjectsFilter value, $Res Function(ProjectsFilter) _then) = _$ProjectsFilterCopyWithImpl;
@useResult
$Res call({
 ProjectStage? stage, ProjectStatus? status, ConstructionPhase? constructionPhase, BuildingType? buildingType, String? territoryId, String? search, String? near, DateTime? updatedSince
});




}
/// @nodoc
class _$ProjectsFilterCopyWithImpl<$Res>
    implements $ProjectsFilterCopyWith<$Res> {
  _$ProjectsFilterCopyWithImpl(this._self, this._then);

  final ProjectsFilter _self;
  final $Res Function(ProjectsFilter) _then;

/// Create a copy of ProjectsFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stage = freezed,Object? status = freezed,Object? constructionPhase = freezed,Object? buildingType = freezed,Object? territoryId = freezed,Object? search = freezed,Object? near = freezed,Object? updatedSince = freezed,}) {
  return _then(_self.copyWith(
stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus?,constructionPhase: freezed == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase?,buildingType: freezed == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType?,territoryId: freezed == territoryId ? _self.territoryId : territoryId // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,near: freezed == near ? _self.near : near // ignore: cast_nullable_to_non_nullable
as String?,updatedSince: freezed == updatedSince ? _self.updatedSince : updatedSince // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectsFilter].
extension ProjectsFilterPatterns on ProjectsFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectsFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectsFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectsFilter value)  $default,){
final _that = this;
switch (_that) {
case _ProjectsFilter():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectsFilter value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectsFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProjectStage? stage,  ProjectStatus? status,  ConstructionPhase? constructionPhase,  BuildingType? buildingType,  String? territoryId,  String? search,  String? near,  DateTime? updatedSince)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectsFilter() when $default != null:
return $default(_that.stage,_that.status,_that.constructionPhase,_that.buildingType,_that.territoryId,_that.search,_that.near,_that.updatedSince);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProjectStage? stage,  ProjectStatus? status,  ConstructionPhase? constructionPhase,  BuildingType? buildingType,  String? territoryId,  String? search,  String? near,  DateTime? updatedSince)  $default,) {final _that = this;
switch (_that) {
case _ProjectsFilter():
return $default(_that.stage,_that.status,_that.constructionPhase,_that.buildingType,_that.territoryId,_that.search,_that.near,_that.updatedSince);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProjectStage? stage,  ProjectStatus? status,  ConstructionPhase? constructionPhase,  BuildingType? buildingType,  String? territoryId,  String? search,  String? near,  DateTime? updatedSince)?  $default,) {final _that = this;
switch (_that) {
case _ProjectsFilter() when $default != null:
return $default(_that.stage,_that.status,_that.constructionPhase,_that.buildingType,_that.territoryId,_that.search,_that.near,_that.updatedSince);case _:
  return null;

}
}

}

/// @nodoc


class _ProjectsFilter implements ProjectsFilter {
  const _ProjectsFilter({this.stage, this.status, this.constructionPhase, this.buildingType, this.territoryId, this.search, this.near, this.updatedSince});
  

@override final  ProjectStage? stage;
@override final  ProjectStatus? status;
@override final  ConstructionPhase? constructionPhase;
@override final  BuildingType? buildingType;
@override final  String? territoryId;
@override final  String? search;
@override final  String? near;
@override final  DateTime? updatedSince;

/// Create a copy of ProjectsFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectsFilterCopyWith<_ProjectsFilter> get copyWith => __$ProjectsFilterCopyWithImpl<_ProjectsFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectsFilter&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.status, status) || other.status == status)&&(identical(other.constructionPhase, constructionPhase) || other.constructionPhase == constructionPhase)&&(identical(other.buildingType, buildingType) || other.buildingType == buildingType)&&(identical(other.territoryId, territoryId) || other.territoryId == territoryId)&&(identical(other.search, search) || other.search == search)&&(identical(other.near, near) || other.near == near)&&(identical(other.updatedSince, updatedSince) || other.updatedSince == updatedSince));
}


@override
int get hashCode => Object.hash(runtimeType,stage,status,constructionPhase,buildingType,territoryId,search,near,updatedSince);

@override
String toString() {
  return 'ProjectsFilter(stage: $stage, status: $status, constructionPhase: $constructionPhase, buildingType: $buildingType, territoryId: $territoryId, search: $search, near: $near, updatedSince: $updatedSince)';
}


}

/// @nodoc
abstract mixin class _$ProjectsFilterCopyWith<$Res> implements $ProjectsFilterCopyWith<$Res> {
  factory _$ProjectsFilterCopyWith(_ProjectsFilter value, $Res Function(_ProjectsFilter) _then) = __$ProjectsFilterCopyWithImpl;
@override @useResult
$Res call({
 ProjectStage? stage, ProjectStatus? status, ConstructionPhase? constructionPhase, BuildingType? buildingType, String? territoryId, String? search, String? near, DateTime? updatedSince
});




}
/// @nodoc
class __$ProjectsFilterCopyWithImpl<$Res>
    implements _$ProjectsFilterCopyWith<$Res> {
  __$ProjectsFilterCopyWithImpl(this._self, this._then);

  final _ProjectsFilter _self;
  final $Res Function(_ProjectsFilter) _then;

/// Create a copy of ProjectsFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stage = freezed,Object? status = freezed,Object? constructionPhase = freezed,Object? buildingType = freezed,Object? territoryId = freezed,Object? search = freezed,Object? near = freezed,Object? updatedSince = freezed,}) {
  return _then(_ProjectsFilter(
stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as ProjectStage?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProjectStatus?,constructionPhase: freezed == constructionPhase ? _self.constructionPhase : constructionPhase // ignore: cast_nullable_to_non_nullable
as ConstructionPhase?,buildingType: freezed == buildingType ? _self.buildingType : buildingType // ignore: cast_nullable_to_non_nullable
as BuildingType?,territoryId: freezed == territoryId ? _self.territoryId : territoryId // ignore: cast_nullable_to_non_nullable
as String?,search: freezed == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String?,near: freezed == near ? _self.near : near // ignore: cast_nullable_to_non_nullable
as String?,updatedSince: freezed == updatedSince ? _self.updatedSince : updatedSince // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
