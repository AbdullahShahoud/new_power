// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_history_entry_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ProjectHistoryEntryView _$ProjectHistoryEntryViewFromJson(
  Map<String, dynamic> json
) {
        switch (json['kind']) {
                  case 'STAGE':
          return ProjectStageHistoryEntryView.fromJson(
            json
          );
                case 'STATUS':
          return ProjectStatusHistoryEntryView.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'kind',
  'ProjectHistoryEntryView',
  'Invalid union type "${json['kind']}"!'
);
        }
      
}

/// @nodoc
mixin _$ProjectHistoryEntryView {

 String get id; String get projectId; DateTime get changedAt; String? get changedBy; ActorView? get changedByUser;
/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectHistoryEntryViewCopyWith<ProjectHistoryEntryView> get copyWith => _$ProjectHistoryEntryViewCopyWithImpl<ProjectHistoryEntryView>(this as ProjectHistoryEntryView, _$identity);

  /// Serializes this ProjectHistoryEntryView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectHistoryEntryView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.changedAt, changedAt) || other.changedAt == changedAt)&&(identical(other.changedBy, changedBy) || other.changedBy == changedBy)&&(identical(other.changedByUser, changedByUser) || other.changedByUser == changedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,changedAt,changedBy,changedByUser);

@override
String toString() {
  return 'ProjectHistoryEntryView(id: $id, projectId: $projectId, changedAt: $changedAt, changedBy: $changedBy, changedByUser: $changedByUser)';
}


}

/// @nodoc
abstract mixin class $ProjectHistoryEntryViewCopyWith<$Res>  {
  factory $ProjectHistoryEntryViewCopyWith(ProjectHistoryEntryView value, $Res Function(ProjectHistoryEntryView) _then) = _$ProjectHistoryEntryViewCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, DateTime changedAt, String? changedBy, ActorView? changedByUser
});


$ActorViewCopyWith<$Res>? get changedByUser;

}
/// @nodoc
class _$ProjectHistoryEntryViewCopyWithImpl<$Res>
    implements $ProjectHistoryEntryViewCopyWith<$Res> {
  _$ProjectHistoryEntryViewCopyWithImpl(this._self, this._then);

  final ProjectHistoryEntryView _self;
  final $Res Function(ProjectHistoryEntryView) _then;

/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? changedAt = null,Object? changedBy = freezed,Object? changedByUser = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,changedAt: null == changedAt ? _self.changedAt : changedAt // ignore: cast_nullable_to_non_nullable
as DateTime,changedBy: freezed == changedBy ? _self.changedBy : changedBy // ignore: cast_nullable_to_non_nullable
as String?,changedByUser: freezed == changedByUser ? _self.changedByUser : changedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}
/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get changedByUser {
    if (_self.changedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.changedByUser!, (value) {
    return _then(_self.copyWith(changedByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProjectHistoryEntryView].
extension ProjectHistoryEntryViewPatterns on ProjectHistoryEntryView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProjectStageHistoryEntryView value)?  stage,TResult Function( ProjectStatusHistoryEntryView value)?  status,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProjectStageHistoryEntryView() when stage != null:
return stage(_that);case ProjectStatusHistoryEntryView() when status != null:
return status(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProjectStageHistoryEntryView value)  stage,required TResult Function( ProjectStatusHistoryEntryView value)  status,}){
final _that = this;
switch (_that) {
case ProjectStageHistoryEntryView():
return stage(_that);case ProjectStatusHistoryEntryView():
return status(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProjectStageHistoryEntryView value)?  stage,TResult? Function( ProjectStatusHistoryEntryView value)?  status,}){
final _that = this;
switch (_that) {
case ProjectStageHistoryEntryView() when stage != null:
return stage(_that);case ProjectStatusHistoryEntryView() when status != null:
return status(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String projectId,  ProjectStage? fromStage,  ProjectStage toStage,  StageChangeSource source,  String? note,  DateTime changedAt,  String? changedBy,  ActorView? changedByUser)?  stage,TResult Function( String id,  String projectId,  ProjectStatus fromStatus,  ProjectStatus toStatus,  String reason,  DateTime changedAt,  String? changedBy,  ActorView? changedByUser)?  status,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProjectStageHistoryEntryView() when stage != null:
return stage(_that.id,_that.projectId,_that.fromStage,_that.toStage,_that.source,_that.note,_that.changedAt,_that.changedBy,_that.changedByUser);case ProjectStatusHistoryEntryView() when status != null:
return status(_that.id,_that.projectId,_that.fromStatus,_that.toStatus,_that.reason,_that.changedAt,_that.changedBy,_that.changedByUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String projectId,  ProjectStage? fromStage,  ProjectStage toStage,  StageChangeSource source,  String? note,  DateTime changedAt,  String? changedBy,  ActorView? changedByUser)  stage,required TResult Function( String id,  String projectId,  ProjectStatus fromStatus,  ProjectStatus toStatus,  String reason,  DateTime changedAt,  String? changedBy,  ActorView? changedByUser)  status,}) {final _that = this;
switch (_that) {
case ProjectStageHistoryEntryView():
return stage(_that.id,_that.projectId,_that.fromStage,_that.toStage,_that.source,_that.note,_that.changedAt,_that.changedBy,_that.changedByUser);case ProjectStatusHistoryEntryView():
return status(_that.id,_that.projectId,_that.fromStatus,_that.toStatus,_that.reason,_that.changedAt,_that.changedBy,_that.changedByUser);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String projectId,  ProjectStage? fromStage,  ProjectStage toStage,  StageChangeSource source,  String? note,  DateTime changedAt,  String? changedBy,  ActorView? changedByUser)?  stage,TResult? Function( String id,  String projectId,  ProjectStatus fromStatus,  ProjectStatus toStatus,  String reason,  DateTime changedAt,  String? changedBy,  ActorView? changedByUser)?  status,}) {final _that = this;
switch (_that) {
case ProjectStageHistoryEntryView() when stage != null:
return stage(_that.id,_that.projectId,_that.fromStage,_that.toStage,_that.source,_that.note,_that.changedAt,_that.changedBy,_that.changedByUser);case ProjectStatusHistoryEntryView() when status != null:
return status(_that.id,_that.projectId,_that.fromStatus,_that.toStatus,_that.reason,_that.changedAt,_that.changedBy,_that.changedByUser);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class ProjectStageHistoryEntryView implements ProjectHistoryEntryView {
  const ProjectStageHistoryEntryView({required this.id, required this.projectId, this.fromStage, required this.toStage, required this.source, this.note, required this.changedAt, this.changedBy, this.changedByUser, final  String? $type}): $type = $type ?? 'STAGE';
  factory ProjectStageHistoryEntryView.fromJson(Map<String, dynamic> json) => _$ProjectStageHistoryEntryViewFromJson(json);

@override final  String id;
@override final  String projectId;
 final  ProjectStage? fromStage;
 final  ProjectStage toStage;
 final  StageChangeSource source;
 final  String? note;
@override final  DateTime changedAt;
@override final  String? changedBy;
@override final  ActorView? changedByUser;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStageHistoryEntryViewCopyWith<ProjectStageHistoryEntryView> get copyWith => _$ProjectStageHistoryEntryViewCopyWithImpl<ProjectStageHistoryEntryView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectStageHistoryEntryViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectStageHistoryEntryView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.fromStage, fromStage) || other.fromStage == fromStage)&&(identical(other.toStage, toStage) || other.toStage == toStage)&&(identical(other.source, source) || other.source == source)&&(identical(other.note, note) || other.note == note)&&(identical(other.changedAt, changedAt) || other.changedAt == changedAt)&&(identical(other.changedBy, changedBy) || other.changedBy == changedBy)&&(identical(other.changedByUser, changedByUser) || other.changedByUser == changedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,fromStage,toStage,source,note,changedAt,changedBy,changedByUser);

@override
String toString() {
  return 'ProjectHistoryEntryView.stage(id: $id, projectId: $projectId, fromStage: $fromStage, toStage: $toStage, source: $source, note: $note, changedAt: $changedAt, changedBy: $changedBy, changedByUser: $changedByUser)';
}


}

/// @nodoc
abstract mixin class $ProjectStageHistoryEntryViewCopyWith<$Res> implements $ProjectHistoryEntryViewCopyWith<$Res> {
  factory $ProjectStageHistoryEntryViewCopyWith(ProjectStageHistoryEntryView value, $Res Function(ProjectStageHistoryEntryView) _then) = _$ProjectStageHistoryEntryViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, ProjectStage? fromStage, ProjectStage toStage, StageChangeSource source, String? note, DateTime changedAt, String? changedBy, ActorView? changedByUser
});


@override $ActorViewCopyWith<$Res>? get changedByUser;

}
/// @nodoc
class _$ProjectStageHistoryEntryViewCopyWithImpl<$Res>
    implements $ProjectStageHistoryEntryViewCopyWith<$Res> {
  _$ProjectStageHistoryEntryViewCopyWithImpl(this._self, this._then);

  final ProjectStageHistoryEntryView _self;
  final $Res Function(ProjectStageHistoryEntryView) _then;

/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? fromStage = freezed,Object? toStage = null,Object? source = null,Object? note = freezed,Object? changedAt = null,Object? changedBy = freezed,Object? changedByUser = freezed,}) {
  return _then(ProjectStageHistoryEntryView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,fromStage: freezed == fromStage ? _self.fromStage : fromStage // ignore: cast_nullable_to_non_nullable
as ProjectStage?,toStage: null == toStage ? _self.toStage : toStage // ignore: cast_nullable_to_non_nullable
as ProjectStage,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as StageChangeSource,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,changedAt: null == changedAt ? _self.changedAt : changedAt // ignore: cast_nullable_to_non_nullable
as DateTime,changedBy: freezed == changedBy ? _self.changedBy : changedBy // ignore: cast_nullable_to_non_nullable
as String?,changedByUser: freezed == changedByUser ? _self.changedByUser : changedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}

/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get changedByUser {
    if (_self.changedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.changedByUser!, (value) {
    return _then(_self.copyWith(changedByUser: value));
  });
}
}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class ProjectStatusHistoryEntryView implements ProjectHistoryEntryView {
  const ProjectStatusHistoryEntryView({required this.id, required this.projectId, required this.fromStatus, required this.toStatus, required this.reason, required this.changedAt, this.changedBy, this.changedByUser, final  String? $type}): $type = $type ?? 'STATUS';
  factory ProjectStatusHistoryEntryView.fromJson(Map<String, dynamic> json) => _$ProjectStatusHistoryEntryViewFromJson(json);

@override final  String id;
@override final  String projectId;
 final  ProjectStatus fromStatus;
 final  ProjectStatus toStatus;
 final  String reason;
@override final  DateTime changedAt;
@override final  String? changedBy;
@override final  ActorView? changedByUser;

@JsonKey(name: 'kind')
final String $type;


/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectStatusHistoryEntryViewCopyWith<ProjectStatusHistoryEntryView> get copyWith => _$ProjectStatusHistoryEntryViewCopyWithImpl<ProjectStatusHistoryEntryView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectStatusHistoryEntryViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectStatusHistoryEntryView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.fromStatus, fromStatus) || other.fromStatus == fromStatus)&&(identical(other.toStatus, toStatus) || other.toStatus == toStatus)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.changedAt, changedAt) || other.changedAt == changedAt)&&(identical(other.changedBy, changedBy) || other.changedBy == changedBy)&&(identical(other.changedByUser, changedByUser) || other.changedByUser == changedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,projectId,fromStatus,toStatus,reason,changedAt,changedBy,changedByUser);

@override
String toString() {
  return 'ProjectHistoryEntryView.status(id: $id, projectId: $projectId, fromStatus: $fromStatus, toStatus: $toStatus, reason: $reason, changedAt: $changedAt, changedBy: $changedBy, changedByUser: $changedByUser)';
}


}

/// @nodoc
abstract mixin class $ProjectStatusHistoryEntryViewCopyWith<$Res> implements $ProjectHistoryEntryViewCopyWith<$Res> {
  factory $ProjectStatusHistoryEntryViewCopyWith(ProjectStatusHistoryEntryView value, $Res Function(ProjectStatusHistoryEntryView) _then) = _$ProjectStatusHistoryEntryViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, ProjectStatus fromStatus, ProjectStatus toStatus, String reason, DateTime changedAt, String? changedBy, ActorView? changedByUser
});


@override $ActorViewCopyWith<$Res>? get changedByUser;

}
/// @nodoc
class _$ProjectStatusHistoryEntryViewCopyWithImpl<$Res>
    implements $ProjectStatusHistoryEntryViewCopyWith<$Res> {
  _$ProjectStatusHistoryEntryViewCopyWithImpl(this._self, this._then);

  final ProjectStatusHistoryEntryView _self;
  final $Res Function(ProjectStatusHistoryEntryView) _then;

/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? fromStatus = null,Object? toStatus = null,Object? reason = null,Object? changedAt = null,Object? changedBy = freezed,Object? changedByUser = freezed,}) {
  return _then(ProjectStatusHistoryEntryView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,fromStatus: null == fromStatus ? _self.fromStatus : fromStatus // ignore: cast_nullable_to_non_nullable
as ProjectStatus,toStatus: null == toStatus ? _self.toStatus : toStatus // ignore: cast_nullable_to_non_nullable
as ProjectStatus,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,changedAt: null == changedAt ? _self.changedAt : changedAt // ignore: cast_nullable_to_non_nullable
as DateTime,changedBy: freezed == changedBy ? _self.changedBy : changedBy // ignore: cast_nullable_to_non_nullable
as String?,changedByUser: freezed == changedByUser ? _self.changedByUser : changedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}

/// Create a copy of ProjectHistoryEntryView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get changedByUser {
    if (_self.changedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.changedByUser!, (value) {
    return _then(_self.copyWith(changedByUser: value));
  });
}
}

// dart format on
