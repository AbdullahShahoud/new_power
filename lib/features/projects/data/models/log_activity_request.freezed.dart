// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_activity_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LogActivityRequest {

 ActivityKind get kind; ActivityChannel? get channel; ActivityPurpose get purpose; ActivityOutcome get outcome; DateTime get occurredAt; String get notes; List<String> get personsMet; ActivityLocationDto? get location; ConstructionPhase? get constructionPhaseObserved; String? get competitorAccountId; DateTime? get nextActionAt; List<UploadedFileDto> get files;
/// Create a copy of LogActivityRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LogActivityRequestCopyWith<LogActivityRequest> get copyWith => _$LogActivityRequestCopyWithImpl<LogActivityRequest>(this as LogActivityRequest, _$identity);

  /// Serializes this LogActivityRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LogActivityRequest&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.personsMet, personsMet)&&(identical(other.location, location) || other.location == location)&&(identical(other.constructionPhaseObserved, constructionPhaseObserved) || other.constructionPhaseObserved == constructionPhaseObserved)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,channel,purpose,outcome,occurredAt,notes,const DeepCollectionEquality().hash(personsMet),location,constructionPhaseObserved,competitorAccountId,nextActionAt,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'LogActivityRequest(kind: $kind, channel: $channel, purpose: $purpose, outcome: $outcome, occurredAt: $occurredAt, notes: $notes, personsMet: $personsMet, location: $location, constructionPhaseObserved: $constructionPhaseObserved, competitorAccountId: $competitorAccountId, nextActionAt: $nextActionAt, files: $files)';
}


}

/// @nodoc
abstract mixin class $LogActivityRequestCopyWith<$Res>  {
  factory $LogActivityRequestCopyWith(LogActivityRequest value, $Res Function(LogActivityRequest) _then) = _$LogActivityRequestCopyWithImpl;
@useResult
$Res call({
 ActivityKind kind, ActivityChannel? channel, ActivityPurpose purpose, ActivityOutcome outcome, DateTime occurredAt, String notes, List<String> personsMet, ActivityLocationDto? location, ConstructionPhase? constructionPhaseObserved, String? competitorAccountId, DateTime? nextActionAt, List<UploadedFileDto> files
});


$ActivityLocationDtoCopyWith<$Res>? get location;

}
/// @nodoc
class _$LogActivityRequestCopyWithImpl<$Res>
    implements $LogActivityRequestCopyWith<$Res> {
  _$LogActivityRequestCopyWithImpl(this._self, this._then);

  final LogActivityRequest _self;
  final $Res Function(LogActivityRequest) _then;

/// Create a copy of LogActivityRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? channel = freezed,Object? purpose = null,Object? outcome = null,Object? occurredAt = null,Object? notes = null,Object? personsMet = null,Object? location = freezed,Object? constructionPhaseObserved = freezed,Object? competitorAccountId = freezed,Object? nextActionAt = freezed,Object? files = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ActivityKind,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ActivityChannel?,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as ActivityPurpose,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActivityOutcome,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,personsMet: null == personsMet ? _self.personsMet : personsMet // ignore: cast_nullable_to_non_nullable
as List<String>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ActivityLocationDto?,constructionPhaseObserved: freezed == constructionPhaseObserved ? _self.constructionPhaseObserved : constructionPhaseObserved // ignore: cast_nullable_to_non_nullable
as ConstructionPhase?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<UploadedFileDto>,
  ));
}
/// Create a copy of LogActivityRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLocationDtoCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $ActivityLocationDtoCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [LogActivityRequest].
extension LogActivityRequestPatterns on LogActivityRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LogActivityRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LogActivityRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LogActivityRequest value)  $default,){
final _that = this;
switch (_that) {
case _LogActivityRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LogActivityRequest value)?  $default,){
final _that = this;
switch (_that) {
case _LogActivityRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  String notes,  List<String> personsMet,  ActivityLocationDto? location,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  DateTime? nextActionAt,  List<UploadedFileDto> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LogActivityRequest() when $default != null:
return $default(_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.notes,_that.personsMet,_that.location,_that.constructionPhaseObserved,_that.competitorAccountId,_that.nextActionAt,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  String notes,  List<String> personsMet,  ActivityLocationDto? location,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  DateTime? nextActionAt,  List<UploadedFileDto> files)  $default,) {final _that = this;
switch (_that) {
case _LogActivityRequest():
return $default(_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.notes,_that.personsMet,_that.location,_that.constructionPhaseObserved,_that.competitorAccountId,_that.nextActionAt,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActivityKind kind,  ActivityChannel? channel,  ActivityPurpose purpose,  ActivityOutcome outcome,  DateTime occurredAt,  String notes,  List<String> personsMet,  ActivityLocationDto? location,  ConstructionPhase? constructionPhaseObserved,  String? competitorAccountId,  DateTime? nextActionAt,  List<UploadedFileDto> files)?  $default,) {final _that = this;
switch (_that) {
case _LogActivityRequest() when $default != null:
return $default(_that.kind,_that.channel,_that.purpose,_that.outcome,_that.occurredAt,_that.notes,_that.personsMet,_that.location,_that.constructionPhaseObserved,_that.competitorAccountId,_that.nextActionAt,_that.files);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false, converters: [UtcDateTimeConverter()])
class _LogActivityRequest implements LogActivityRequest {
  const _LogActivityRequest({required this.kind, this.channel, required this.purpose, required this.outcome, required this.occurredAt, required this.notes, required final  List<String> personsMet, this.location, this.constructionPhaseObserved, this.competitorAccountId, this.nextActionAt, final  List<UploadedFileDto> files = const <UploadedFileDto>[]}): _personsMet = personsMet,_files = files;
  factory _LogActivityRequest.fromJson(Map<String, dynamic> json) => _$LogActivityRequestFromJson(json);

@override final  ActivityKind kind;
@override final  ActivityChannel? channel;
@override final  ActivityPurpose purpose;
@override final  ActivityOutcome outcome;
@override final  DateTime occurredAt;
@override final  String notes;
 final  List<String> _personsMet;
@override List<String> get personsMet {
  if (_personsMet is EqualUnmodifiableListView) return _personsMet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_personsMet);
}

@override final  ActivityLocationDto? location;
@override final  ConstructionPhase? constructionPhaseObserved;
@override final  String? competitorAccountId;
@override final  DateTime? nextActionAt;
 final  List<UploadedFileDto> _files;
@override@JsonKey() List<UploadedFileDto> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of LogActivityRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LogActivityRequestCopyWith<_LogActivityRequest> get copyWith => __$LogActivityRequestCopyWithImpl<_LogActivityRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LogActivityRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LogActivityRequest&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.occurredAt, occurredAt) || other.occurredAt == occurredAt)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._personsMet, _personsMet)&&(identical(other.location, location) || other.location == location)&&(identical(other.constructionPhaseObserved, constructionPhaseObserved) || other.constructionPhaseObserved == constructionPhaseObserved)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.nextActionAt, nextActionAt) || other.nextActionAt == nextActionAt)&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,channel,purpose,outcome,occurredAt,notes,const DeepCollectionEquality().hash(_personsMet),location,constructionPhaseObserved,competitorAccountId,nextActionAt,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'LogActivityRequest(kind: $kind, channel: $channel, purpose: $purpose, outcome: $outcome, occurredAt: $occurredAt, notes: $notes, personsMet: $personsMet, location: $location, constructionPhaseObserved: $constructionPhaseObserved, competitorAccountId: $competitorAccountId, nextActionAt: $nextActionAt, files: $files)';
}


}

/// @nodoc
abstract mixin class _$LogActivityRequestCopyWith<$Res> implements $LogActivityRequestCopyWith<$Res> {
  factory _$LogActivityRequestCopyWith(_LogActivityRequest value, $Res Function(_LogActivityRequest) _then) = __$LogActivityRequestCopyWithImpl;
@override @useResult
$Res call({
 ActivityKind kind, ActivityChannel? channel, ActivityPurpose purpose, ActivityOutcome outcome, DateTime occurredAt, String notes, List<String> personsMet, ActivityLocationDto? location, ConstructionPhase? constructionPhaseObserved, String? competitorAccountId, DateTime? nextActionAt, List<UploadedFileDto> files
});


@override $ActivityLocationDtoCopyWith<$Res>? get location;

}
/// @nodoc
class __$LogActivityRequestCopyWithImpl<$Res>
    implements _$LogActivityRequestCopyWith<$Res> {
  __$LogActivityRequestCopyWithImpl(this._self, this._then);

  final _LogActivityRequest _self;
  final $Res Function(_LogActivityRequest) _then;

/// Create a copy of LogActivityRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? channel = freezed,Object? purpose = null,Object? outcome = null,Object? occurredAt = null,Object? notes = null,Object? personsMet = null,Object? location = freezed,Object? constructionPhaseObserved = freezed,Object? competitorAccountId = freezed,Object? nextActionAt = freezed,Object? files = null,}) {
  return _then(_LogActivityRequest(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ActivityKind,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ActivityChannel?,purpose: null == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as ActivityPurpose,outcome: null == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActivityOutcome,occurredAt: null == occurredAt ? _self.occurredAt : occurredAt // ignore: cast_nullable_to_non_nullable
as DateTime,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,personsMet: null == personsMet ? _self._personsMet : personsMet // ignore: cast_nullable_to_non_nullable
as List<String>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ActivityLocationDto?,constructionPhaseObserved: freezed == constructionPhaseObserved ? _self.constructionPhaseObserved : constructionPhaseObserved // ignore: cast_nullable_to_non_nullable
as ConstructionPhase?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,nextActionAt: freezed == nextActionAt ? _self.nextActionAt : nextActionAt // ignore: cast_nullable_to_non_nullable
as DateTime?,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<UploadedFileDto>,
  ));
}

/// Create a copy of LogActivityRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityLocationDtoCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $ActivityLocationDtoCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
