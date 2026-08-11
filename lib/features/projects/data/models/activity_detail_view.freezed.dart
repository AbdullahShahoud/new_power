// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_detail_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivityRevisionView {

 String get id; String get activityId; Map<String, dynamic> get before; Map<String, dynamic> get after; List<String> get fields; DateTime get revisedAt; String? get revisedBy; ActorView? get revisedByUser;
/// Create a copy of ActivityRevisionView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityRevisionViewCopyWith<ActivityRevisionView> get copyWith => _$ActivityRevisionViewCopyWithImpl<ActivityRevisionView>(this as ActivityRevisionView, _$identity);

  /// Serializes this ActivityRevisionView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityRevisionView&&(identical(other.id, id) || other.id == id)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&const DeepCollectionEquality().equals(other.before, before)&&const DeepCollectionEquality().equals(other.after, after)&&const DeepCollectionEquality().equals(other.fields, fields)&&(identical(other.revisedAt, revisedAt) || other.revisedAt == revisedAt)&&(identical(other.revisedBy, revisedBy) || other.revisedBy == revisedBy)&&(identical(other.revisedByUser, revisedByUser) || other.revisedByUser == revisedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,activityId,const DeepCollectionEquality().hash(before),const DeepCollectionEquality().hash(after),const DeepCollectionEquality().hash(fields),revisedAt,revisedBy,revisedByUser);

@override
String toString() {
  return 'ActivityRevisionView(id: $id, activityId: $activityId, before: $before, after: $after, fields: $fields, revisedAt: $revisedAt, revisedBy: $revisedBy, revisedByUser: $revisedByUser)';
}


}

/// @nodoc
abstract mixin class $ActivityRevisionViewCopyWith<$Res>  {
  factory $ActivityRevisionViewCopyWith(ActivityRevisionView value, $Res Function(ActivityRevisionView) _then) = _$ActivityRevisionViewCopyWithImpl;
@useResult
$Res call({
 String id, String activityId, Map<String, dynamic> before, Map<String, dynamic> after, List<String> fields, DateTime revisedAt, String? revisedBy, ActorView? revisedByUser
});


$ActorViewCopyWith<$Res>? get revisedByUser;

}
/// @nodoc
class _$ActivityRevisionViewCopyWithImpl<$Res>
    implements $ActivityRevisionViewCopyWith<$Res> {
  _$ActivityRevisionViewCopyWithImpl(this._self, this._then);

  final ActivityRevisionView _self;
  final $Res Function(ActivityRevisionView) _then;

/// Create a copy of ActivityRevisionView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? activityId = null,Object? before = null,Object? after = null,Object? fields = null,Object? revisedAt = null,Object? revisedBy = freezed,Object? revisedByUser = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,activityId: null == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as String,before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,after: null == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>,revisedAt: null == revisedAt ? _self.revisedAt : revisedAt // ignore: cast_nullable_to_non_nullable
as DateTime,revisedBy: freezed == revisedBy ? _self.revisedBy : revisedBy // ignore: cast_nullable_to_non_nullable
as String?,revisedByUser: freezed == revisedByUser ? _self.revisedByUser : revisedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}
/// Create a copy of ActivityRevisionView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get revisedByUser {
    if (_self.revisedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.revisedByUser!, (value) {
    return _then(_self.copyWith(revisedByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActivityRevisionView].
extension ActivityRevisionViewPatterns on ActivityRevisionView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityRevisionView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityRevisionView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityRevisionView value)  $default,){
final _that = this;
switch (_that) {
case _ActivityRevisionView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityRevisionView value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityRevisionView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String activityId,  Map<String, dynamic> before,  Map<String, dynamic> after,  List<String> fields,  DateTime revisedAt,  String? revisedBy,  ActorView? revisedByUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityRevisionView() when $default != null:
return $default(_that.id,_that.activityId,_that.before,_that.after,_that.fields,_that.revisedAt,_that.revisedBy,_that.revisedByUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String activityId,  Map<String, dynamic> before,  Map<String, dynamic> after,  List<String> fields,  DateTime revisedAt,  String? revisedBy,  ActorView? revisedByUser)  $default,) {final _that = this;
switch (_that) {
case _ActivityRevisionView():
return $default(_that.id,_that.activityId,_that.before,_that.after,_that.fields,_that.revisedAt,_that.revisedBy,_that.revisedByUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String activityId,  Map<String, dynamic> before,  Map<String, dynamic> after,  List<String> fields,  DateTime revisedAt,  String? revisedBy,  ActorView? revisedByUser)?  $default,) {final _that = this;
switch (_that) {
case _ActivityRevisionView() when $default != null:
return $default(_that.id,_that.activityId,_that.before,_that.after,_that.fields,_that.revisedAt,_that.revisedBy,_that.revisedByUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityRevisionView implements ActivityRevisionView {
  const _ActivityRevisionView({required this.id, required this.activityId, required final  Map<String, dynamic> before, required final  Map<String, dynamic> after, required final  List<String> fields, required this.revisedAt, this.revisedBy, this.revisedByUser}): _before = before,_after = after,_fields = fields;
  factory _ActivityRevisionView.fromJson(Map<String, dynamic> json) => _$ActivityRevisionViewFromJson(json);

@override final  String id;
@override final  String activityId;
 final  Map<String, dynamic> _before;
@override Map<String, dynamic> get before {
  if (_before is EqualUnmodifiableMapView) return _before;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_before);
}

 final  Map<String, dynamic> _after;
@override Map<String, dynamic> get after {
  if (_after is EqualUnmodifiableMapView) return _after;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_after);
}

 final  List<String> _fields;
@override List<String> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}

@override final  DateTime revisedAt;
@override final  String? revisedBy;
@override final  ActorView? revisedByUser;

/// Create a copy of ActivityRevisionView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityRevisionViewCopyWith<_ActivityRevisionView> get copyWith => __$ActivityRevisionViewCopyWithImpl<_ActivityRevisionView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityRevisionViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityRevisionView&&(identical(other.id, id) || other.id == id)&&(identical(other.activityId, activityId) || other.activityId == activityId)&&const DeepCollectionEquality().equals(other._before, _before)&&const DeepCollectionEquality().equals(other._after, _after)&&const DeepCollectionEquality().equals(other._fields, _fields)&&(identical(other.revisedAt, revisedAt) || other.revisedAt == revisedAt)&&(identical(other.revisedBy, revisedBy) || other.revisedBy == revisedBy)&&(identical(other.revisedByUser, revisedByUser) || other.revisedByUser == revisedByUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,activityId,const DeepCollectionEquality().hash(_before),const DeepCollectionEquality().hash(_after),const DeepCollectionEquality().hash(_fields),revisedAt,revisedBy,revisedByUser);

@override
String toString() {
  return 'ActivityRevisionView(id: $id, activityId: $activityId, before: $before, after: $after, fields: $fields, revisedAt: $revisedAt, revisedBy: $revisedBy, revisedByUser: $revisedByUser)';
}


}

/// @nodoc
abstract mixin class _$ActivityRevisionViewCopyWith<$Res> implements $ActivityRevisionViewCopyWith<$Res> {
  factory _$ActivityRevisionViewCopyWith(_ActivityRevisionView value, $Res Function(_ActivityRevisionView) _then) = __$ActivityRevisionViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String activityId, Map<String, dynamic> before, Map<String, dynamic> after, List<String> fields, DateTime revisedAt, String? revisedBy, ActorView? revisedByUser
});


@override $ActorViewCopyWith<$Res>? get revisedByUser;

}
/// @nodoc
class __$ActivityRevisionViewCopyWithImpl<$Res>
    implements _$ActivityRevisionViewCopyWith<$Res> {
  __$ActivityRevisionViewCopyWithImpl(this._self, this._then);

  final _ActivityRevisionView _self;
  final $Res Function(_ActivityRevisionView) _then;

/// Create a copy of ActivityRevisionView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? activityId = null,Object? before = null,Object? after = null,Object? fields = null,Object? revisedAt = null,Object? revisedBy = freezed,Object? revisedByUser = freezed,}) {
  return _then(_ActivityRevisionView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,activityId: null == activityId ? _self.activityId : activityId // ignore: cast_nullable_to_non_nullable
as String,before: null == before ? _self._before : before // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,after: null == after ? _self._after : after // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>,revisedAt: null == revisedAt ? _self.revisedAt : revisedAt // ignore: cast_nullable_to_non_nullable
as DateTime,revisedBy: freezed == revisedBy ? _self.revisedBy : revisedBy // ignore: cast_nullable_to_non_nullable
as String?,revisedByUser: freezed == revisedByUser ? _self.revisedByUser : revisedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,
  ));
}

/// Create a copy of ActivityRevisionView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get revisedByUser {
    if (_self.revisedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.revisedByUser!, (value) {
    return _then(_self.copyWith(revisedByUser: value));
  });
}
}


/// @nodoc
mixin _$ActivityDetailView {

 String get id; String get projectId; String get projectName; ActivityKind get kind; ActivityChannel? get channel; ActivityPurpose get purpose; ActivityOutcome get outcome; DateTime get occurredAt; DateTime get capturedAt; double? get latitude; double? get longitude; double? get locationAccuracyM; bool get locationVerified; ConstructionPhase? get constructionPhaseObserved; String? get competitorAccountId; String? get competitorName; String get notes; List<PersonMetRefView> get personsMet; List<ActivityAttachmentView> get attachments; DateTime? get nextActionAt; DateTime? get nextActionDoneAt; bool get backdated; String? get backdateApprovedBy; bool get editedAfterWindow; String? get createdBy; ActorView? get createdByUser; DateTime get createdAt; DateTime get updatedAt; List<ActivityRevisionView> get revisions;
/// Create a copy of ActivityDetailView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivityDetailViewCopyWith<ActivityDetailView> get copyWith => _$ActivityDetailViewCopyWithImpl<ActivityDetailView>(this as ActivityDetailView, _$identity);

  /// Serializes this ActivityDetailView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivityDetailView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationAccuracyM, locationAccuracyM) || other.locationAccuracyM == locationAccuracyM)&&(identical(other.locationVerified, locationVerified) || other.locationVerified == locationVerified)&&(identical(other.constructionPhaseObserved, constructionPhaseObserved) || other.constructionPhaseObserved == constructionPhaseObserved)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.competitorName, competitorName) || other.competitorName == competitorName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.personsMet, personsMet)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.nextActionDoneAt, nextActionDoneAt) || other.nextActionDoneAt == nextActionDoneAt)&&(identical(other.backdated, backdated) || other.backdated == backdated)&&(identical(other.backdateApprovedBy, backdateApprovedBy) || other.backdateApprovedBy == backdateApprovedBy)&&(identical(other.editedAfterWindow, editedAfterWindow) || other.editedAfterWindow == editedAfterWindow)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.revisions, revisions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,projectId,projectName,kind,channel,purpose,outcome,occurredAt,capturedAt,latitude,longitude,locationAccuracyM,locationVerified,constructionPhaseObserved,competitorAccountId,competitorName,notes,const DeepCollectionEquality().hash(personsMet),const DeepCollectionEquality().hash(attachments),nextActionAt,nextActionDoneAt,backdated,backdateApprovedBy,editedAfterWindow,createdBy,createdByUser,createdAt,updatedAt,const DeepCollectionEquality().hash(revisions)]);

@override
String toString() {
  return 'ActivityDetailView(id: $id, projectId: $projectId, projectName: $projectName, kind: $kind, channel: $channel, purpose: $purpose, outcome: $outcome, occurredAt: $occurredAt, capturedAt: $capturedAt, latitude: $latitude, longitude: $longitude, locationAccuracyM: $locationAccuracyM, locationVerified: $locationVerified, constructionPhaseObserved: $constructionPhaseObserved, competitorAccountId: $competitorAccountId, competitorName: $competitorName, notes: $notes, personsMet: $personsMet, attachments: $attachments, nextActionAt: $nextActionAt, nextActionDoneAt: $nextActionDoneAt, backdated: $backdated, backdateApprovedBy: $backdateApprovedBy, editedAfterWindow: $editedAfterWindow, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, revisions: $revisions)';
}


}

/// @nodoc
abstract mixin class $ActivityDetailViewCopyWith<$Res>  {
  factory $ActivityDetailViewCopyWith(ActivityDetailView value, $Res Function(ActivityDetailView) _then) = _$ActivityDetailViewCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, String projectName, ActivityKind kind, ActivityChannel? channel, ActivityPurpose purpose, ActivityOutcome outcome, DateTime occurredAt, DateTime capturedAt, double? latitude, double? longitude, double? locationAccuracyM, bool locationVerified, ConstructionPhase? constructionPhaseObserved, String? competitorAccountId, String? competitorName, String notes, List<PersonMetRefView> personsMet, List<ActivityAttachmentView> attachments, DateTime? nextActionAt, DateTime? nextActionDoneAt, bool backdated, String? backdateApprovedBy, bool editedAfterWindow, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt, List<ActivityRevisionView> revisions
});


$ActorViewCopyWith<$Res>? get createdByUser;

}
/// @nodoc
class _$ActivityDetailViewCopyWithImpl<$Res>
    implements $ActivityDetailViewCopyWith<$Res> {
  _$ActivityDetailViewCopyWithImpl(this._self, this._then);

  final ActivityDetailView _self;
  final $Res Function(ActivityDetailView) _then;

/// Create a copy of ActivityDetailView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? projectName = null,Object? kind = null,Object? channel = freezed,Object? purpose = null,Object? outcome = null,Object? occurredAt = null,Object? capturedAt = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationAccuracyM = freezed,Object? locationVerified = null,Object? constructionPhaseObserved = freezed,Object? competitorAccountId = freezed,Object? competitorName = freezed,Object? notes = null,Object? personsMet = null,Object? attachments = null,Object? nextActionAt = freezed,Object? nextActionDoneAt = freezed,Object? backdated = null,Object? backdateApprovedBy = freezed,Object? editedAfterWindow = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,Object? revisions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ActivityKind,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ActivityChannel?,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as ActivityPurpose,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActivityOutcome,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,capturedAt: null == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationAccuracyM: freezed == locationAccuracyM ? _self.locationAccuracyM : locationAccuracyM // ignore: cast_nullable_to_non_nullable
as double?,locationVerified: null == locationVerified ? _self.locationVerified : locationVerified // ignore: cast_nullable_to_non_nullable
as bool,constructionPhaseObserved: freezed == constructionPhaseObserved ? _self.constructionPhaseObserved : constructionPhaseObserved // ignore: cast_nullable_to_non_nullable
as ConstructionPhase?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,competitorName: freezed == competitorName ? _self.competitorName : competitorName // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,personsMet: null == personsMet ? _self.personsMet : personsMet // ignore: cast_nullable_to_non_nullable
as List<PersonMetRefView>,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ActivityAttachmentView>,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionDoneAt: freezed == nextActionDoneAt ? _self.nextActionDoneAt : nextActionDoneAt // ignore: cast_nullable_to_non_nullable
as DateTime?,backdated: null == backdated ? _self.backdated : backdated // ignore: cast_nullable_to_non_nullable
as bool,backdateApprovedBy: freezed == backdateApprovedBy ? _self.backdateApprovedBy : backdateApprovedBy // ignore: cast_nullable_to_non_nullable
as String?,editedAfterWindow: null == editedAfterWindow ? _self.editedAfterWindow : editedAfterWindow // ignore: cast_nullable_to_non_nullable
as bool,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,revisions: null == revisions ? _self.revisions : revisions // ignore: cast_nullable_to_non_nullable
as List<ActivityRevisionView>,
  ));
}
/// Create a copy of ActivityDetailView
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


/// Adds pattern-matching-related methods to [ActivityDetailView].
extension ActivityDetailViewPatterns on ActivityDetailView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivityDetailView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivityDetailView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivityDetailView value)  $default,){
final _that = this;
switch (_that) {
case _ActivityDetailView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivityDetailView value)?  $default,){
final _that = this;
switch (_that) {
case _ActivityDetailView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String projectId,  String projectName,  ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  DateTime capturedAt,  double? latitude,  double? longitude,  double? locationAccuracyM,  bool locationVerified,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  String? competitorName,  String notes,  List<PersonMetRefView> personsMet,  List<ActivityAttachmentView> attachments,  DateTime? nextActionAt,  DateTime? nextActionDoneAt,  bool backdated,  String? backdateApprovedBy,  bool editedAfterWindow,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  List<ActivityRevisionView> revisions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivityDetailView() when $default != null:
return $default(_that.id,_that.projectId,_that.projectName,_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.capturedAt,_that.latitude,_that.longitude,_that.locationAccuracyM,_that.locationVerified,_that.constructionPhaseObserved,_that.competitorAccountId,_that.competitorName,_that.notes,_that.personsMet,_that.attachments,_that.nextActionAt,_that.nextActionDoneAt,_that.backdated,_that.backdateApprovedBy,_that.editedAfterWindow,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.revisions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String projectId,  String projectName,  ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  DateTime capturedAt,  double? latitude,  double? longitude,  double? locationAccuracyM,  bool locationVerified,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  String? competitorName,  String notes,  List<PersonMetRefView> personsMet,  List<ActivityAttachmentView> attachments,  DateTime? nextActionAt,  DateTime? nextActionDoneAt,  bool backdated,  String? backdateApprovedBy,  bool editedAfterWindow,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  List<ActivityRevisionView> revisions)  $default,) {final _that = this;
switch (_that) {
case _ActivityDetailView():
return $default(_that.id,_that.projectId,_that.projectName,_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.capturedAt,_that.latitude,_that.longitude,_that.locationAccuracyM,_that.locationVerified,_that.constructionPhaseObserved,_that.competitorAccountId,_that.competitorName,_that.notes,_that.personsMet,_that.attachments,_that.nextActionAt,_that.nextActionDoneAt,_that.backdated,_that.backdateApprovedBy,_that.editedAfterWindow,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.revisions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String projectId,  String projectName,  ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  DateTime capturedAt,  double? latitude,  double? longitude,  double? locationAccuracyM,  bool locationVerified,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  String? competitorName,  String notes,  List<PersonMetRefView> personsMet,  List<ActivityAttachmentView> attachments,  DateTime? nextActionAt,  DateTime? nextActionDoneAt,  bool backdated,  String? backdateApprovedBy,  bool editedAfterWindow,  String? createdBy,  ActorView? createdByUser,  DateTime createdAt,  DateTime updatedAt,  List<ActivityRevisionView> revisions)?  $default,) {final _that = this;
switch (_that) {
case _ActivityDetailView() when $default != null:
return $default(_that.id,_that.projectId,_that.projectName,_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.capturedAt,_that.latitude,_that.longitude,_that.locationAccuracyM,_that.locationVerified,_that.constructionPhaseObserved,_that.competitorAccountId,_that.competitorName,_that.notes,_that.personsMet,_that.attachments,_that.nextActionAt,_that.nextActionDoneAt,_that.backdated,_that.backdateApprovedBy,_that.editedAfterWindow,_that.createdBy,_that.createdByUser,_that.createdAt,_that.updatedAt,_that.revisions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ActivityDetailView implements ActivityDetailView {
  const _ActivityDetailView({required this.id, required this.projectId, required this.projectName, required this.kind, this.channel, required this.purpose, required this.outcome, required this.occurredAt, required this.capturedAt, this.latitude, this.longitude, this.locationAccuracyM, this.locationVerified = false, this.constructionPhaseObserved, this.competitorAccountId, this.competitorName, required this.notes, final  List<PersonMetRefView> personsMet = const <PersonMetRefView>[], final  List<ActivityAttachmentView> attachments = const <ActivityAttachmentView>[], this.nextActionAt, this.nextActionDoneAt, this.backdated = false, this.backdateApprovedBy, this.editedAfterWindow = false, this.createdBy, this.createdByUser, required this.createdAt, required this.updatedAt, final  List<ActivityRevisionView> revisions = const <ActivityRevisionView>[]}): _personsMet = personsMet,_attachments = attachments,_revisions = revisions;
  factory _ActivityDetailView.fromJson(Map<String, dynamic> json) => _$ActivityDetailViewFromJson(json);

@override final  String id;
@override final  String projectId;
@override final  String projectName;
@override final  ActivityKind kind;
@override final  ActivityChannel? channel;
@override final  ActivityPurpose purpose;
@override final  ActivityOutcome outcome;
@override final  DateTime occurredAt;
@override final  DateTime capturedAt;
@override final  double? latitude;
@override final  double? longitude;
@override final  double? locationAccuracyM;
@override@JsonKey() final  bool locationVerified;
@override final  ConstructionPhase? constructionPhaseObserved;
@override final  String? competitorAccountId;
@override final  String? competitorName;
@override final  String notes;
 final  List<PersonMetRefView> _personsMet;
@override@JsonKey() List<PersonMetRefView> get personsMet {
  if (_personsMet is EqualUnmodifiableListView) return _personsMet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personsMet);
}

 final  List<ActivityAttachmentView> _attachments;
@override@JsonKey() List<ActivityAttachmentView> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override final  DateTime? nextActionAt;
@override final  DateTime? nextActionDoneAt;
@override@JsonKey() final  bool backdated;
@override final  String? backdateApprovedBy;
@override@JsonKey() final  bool editedAfterWindow;
@override final  String? createdBy;
@override final  ActorView? createdByUser;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
 final  List<ActivityRevisionView> _revisions;
@override@JsonKey() List<ActivityRevisionView> get revisions {
  if (_revisions is EqualUnmodifiableListView) return _revisions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_revisions);
}


/// Create a copy of ActivityDetailView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivityDetailViewCopyWith<_ActivityDetailView> get copyWith => __$ActivityDetailViewCopyWithImpl<_ActivityDetailView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ActivityDetailViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivityDetailView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.capturedAt, capturedAt) || other.capturedAt == capturedAt)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.locationAccuracyM, locationAccuracyM) || other.locationAccuracyM == locationAccuracyM)&&(identical(other.locationVerified, locationVerified) || other.locationVerified == locationVerified)&&(identical(other.constructionPhaseObserved, constructionPhaseObserved) || other.constructionPhaseObserved == constructionPhaseObserved)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.competitorName, competitorName) || other.competitorName == competitorName)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._personsMet, _personsMet)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&(identical(other.nextActionDoneAt, nextActionDoneAt) || other.nextActionDoneAt == nextActionDoneAt)&&(identical(other.backdated, backdated) || other.backdated == backdated)&&(identical(other.backdateApprovedBy, backdateApprovedBy) || other.backdateApprovedBy == backdateApprovedBy)&&(identical(other.editedAfterWindow, editedAfterWindow) || other.editedAfterWindow == editedAfterWindow)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdByUser, createdByUser) || other.createdByUser == createdByUser)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other._revisions, _revisions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,projectId,projectName,kind,channel,purpose,outcome,occurredAt,capturedAt,latitude,longitude,locationAccuracyM,locationVerified,constructionPhaseObserved,competitorAccountId,competitorName,notes,const DeepCollectionEquality().hash(_personsMet),const DeepCollectionEquality().hash(_attachments),nextActionAt,nextActionDoneAt,backdated,backdateApprovedBy,editedAfterWindow,createdBy,createdByUser,createdAt,updatedAt,const DeepCollectionEquality().hash(_revisions)]);

@override
String toString() {
  return 'ActivityDetailView(id: $id, projectId: $projectId, projectName: $projectName, kind: $kind, channel: $channel, purpose: $purpose, outcome: $outcome, occurredAt: $occurredAt, capturedAt: $capturedAt, latitude: $latitude, longitude: $longitude, locationAccuracyM: $locationAccuracyM, locationVerified: $locationVerified, constructionPhaseObserved: $constructionPhaseObserved, competitorAccountId: $competitorAccountId, competitorName: $competitorName, notes: $notes, personsMet: $personsMet, attachments: $attachments, nextActionAt: $nextActionAt, nextActionDoneAt: $nextActionDoneAt, backdated: $backdated, backdateApprovedBy: $backdateApprovedBy, editedAfterWindow: $editedAfterWindow, createdBy: $createdBy, createdByUser: $createdByUser, createdAt: $createdAt, updatedAt: $updatedAt, revisions: $revisions)';
}


}

/// @nodoc
abstract mixin class _$ActivityDetailViewCopyWith<$Res> implements $ActivityDetailViewCopyWith<$Res> {
  factory _$ActivityDetailViewCopyWith(_ActivityDetailView value, $Res Function(_ActivityDetailView) _then) = __$ActivityDetailViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, String projectName, ActivityKind kind, ActivityChannel? channel, ActivityPurpose purpose, ActivityOutcome outcome, DateTime occurredAt, DateTime capturedAt, double? latitude, double? longitude, double? locationAccuracyM, bool locationVerified, ConstructionPhase? constructionPhaseObserved, String? competitorAccountId, String? competitorName, String notes, List<PersonMetRefView> personsMet, List<ActivityAttachmentView> attachments, DateTime? nextActionAt, DateTime? nextActionDoneAt, bool backdated, String? backdateApprovedBy, bool editedAfterWindow, String? createdBy, ActorView? createdByUser, DateTime createdAt, DateTime updatedAt, List<ActivityRevisionView> revisions
});


@override $ActorViewCopyWith<$Res>? get createdByUser;

}
/// @nodoc
class __$ActivityDetailViewCopyWithImpl<$Res>
    implements _$ActivityDetailViewCopyWith<$Res> {
  __$ActivityDetailViewCopyWithImpl(this._self, this._then);

  final _ActivityDetailView _self;
  final $Res Function(_ActivityDetailView) _then;

/// Create a copy of ActivityDetailView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? projectName = null,Object? kind = null,Object? channel = freezed,Object? purpose = null,Object? outcome = null,Object? occurredAt = null,Object? capturedAt = null,Object? latitude = freezed,Object? longitude = freezed,Object? locationAccuracyM = freezed,Object? locationVerified = null,Object? constructionPhaseObserved = freezed,Object? competitorAccountId = freezed,Object? competitorName = freezed,Object? notes = null,Object? personsMet = null,Object? attachments = null,Object? nextActionAt = freezed,Object? nextActionDoneAt = freezed,Object? backdated = null,Object? backdateApprovedBy = freezed,Object? editedAfterWindow = null,Object? createdBy = freezed,Object? createdByUser = freezed,Object? createdAt = null,Object? updatedAt = null,Object? revisions = null,}) {
  return _then(_ActivityDetailView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ActivityKind,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ActivityChannel?,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as ActivityPurpose,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActivityOutcome,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,capturedAt: null == capturedAt ? _self.capturedAt : capturedAt // ignore: cast_nullable_to_non_nullable
as DateTime,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,locationAccuracyM: freezed == locationAccuracyM ? _self.locationAccuracyM : locationAccuracyM // ignore: cast_nullable_to_non_nullable
as double?,locationVerified: null == locationVerified ? _self.locationVerified : locationVerified // ignore: cast_nullable_to_non_nullable
as bool,constructionPhaseObserved: freezed == constructionPhaseObserved ? _self.constructionPhaseObserved : constructionPhaseObserved // ignore: cast_nullable_to_non_nullable
as ConstructionPhase?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,competitorName: freezed == competitorName ? _self.competitorName : competitorName // ignore: cast_nullable_to_non_nullable
as String?,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,personsMet: null == personsMet ? _self._personsMet : personsMet // ignore: cast_nullable_to_non_nullable
as List<PersonMetRefView>,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ActivityAttachmentView>,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,nextActionDoneAt: freezed == nextActionDoneAt ? _self.nextActionDoneAt : nextActionDoneAt // ignore: cast_nullable_to_non_nullable
as DateTime?,backdated: null == backdated ? _self.backdated : backdated // ignore: cast_nullable_to_non_nullable
as bool,backdateApprovedBy: freezed == backdateApprovedBy ? _self.backdateApprovedBy : backdateApprovedBy // ignore: cast_nullable_to_non_nullable
as String?,editedAfterWindow: null == editedAfterWindow ? _self.editedAfterWindow : editedAfterWindow // ignore: cast_nullable_to_non_nullable
as bool,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdByUser: freezed == createdByUser ? _self.createdByUser : createdByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,revisions: null == revisions ? _self._revisions : revisions // ignore: cast_nullable_to_non_nullable
as List<ActivityRevisionView>,
  ));
}

/// Create a copy of ActivityDetailView
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
