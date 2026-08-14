// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activities_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivitiesFilter {

 String? get projectId; ActivityKind? get kind; ActivityPurpose? get purpose; ActivityOutcome? get outcome; String? get createdBy; DateTime? get occurredFrom; DateTime? get occurredTo; bool? get editedAfterWindowOnly;
/// Create a copy of ActivitiesFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivitiesFilterCopyWith<ActivitiesFilter> get copyWith => _$ActivitiesFilterCopyWithImpl<ActivitiesFilter>(this as ActivitiesFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivitiesFilter&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.occurredFrom, occurredFrom) || other.occurredFrom == occurredFrom)&&(identical(other.occurredTo, occurredTo) || other.occurredTo == occurredTo)&&(identical(other.editedAfterWindowOnly, editedAfterWindowOnly) || other.editedAfterWindowOnly == editedAfterWindowOnly));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,kind,purpose,outcome,createdBy,occurredFrom,occurredTo,editedAfterWindowOnly);

@override
String toString() {
  return 'ActivitiesFilter(projectId: $projectId, kind: $kind, purpose: $purpose, outcome: $outcome, createdBy: $createdBy, occurredFrom: $occurredFrom, occurredTo: $occurredTo, editedAfterWindowOnly: $editedAfterWindowOnly)';
}


}

/// @nodoc
abstract mixin class $ActivitiesFilterCopyWith<$Res>  {
  factory $ActivitiesFilterCopyWith(ActivitiesFilter value, $Res Function(ActivitiesFilter) _then) = _$ActivitiesFilterCopyWithImpl;
@useResult
$Res call({
 String? projectId, ActivityKind? kind, ActivityPurpose? purpose, ActivityOutcome? outcome, String? createdBy, DateTime? occurredFrom, DateTime? occurredTo, bool? editedAfterWindowOnly
});




}
/// @nodoc
class _$ActivitiesFilterCopyWithImpl<$Res>
    implements $ActivitiesFilterCopyWith<$Res> {
  _$ActivitiesFilterCopyWithImpl(this._self, this._then);

  final ActivitiesFilter _self;
  final $Res Function(ActivitiesFilter) _then;

/// Create a copy of ActivitiesFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = freezed,Object? kind = freezed,Object? purpose = freezed,Object? outcome = freezed,Object? createdBy = freezed,Object? occurredFrom = freezed,Object? occurredTo = freezed,Object? editedAfterWindowOnly = freezed,}) {
  return _then(_self.copyWith(
projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ActivityKind?,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as ActivityPurpose?,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActivityOutcome?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,occurredFrom: freezed == occurredFrom ? _self.occurredFrom : occurredFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,occurredTo: freezed == occurredTo ? _self.occurredTo : occurredTo // ignore: cast_nullable_to_non_nullable
as DateTime?,editedAfterWindowOnly: freezed == editedAfterWindowOnly ? _self.editedAfterWindowOnly : editedAfterWindowOnly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ActivitiesFilter].
extension ActivitiesFilterPatterns on ActivitiesFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivitiesFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivitiesFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivitiesFilter value)  $default,){
final _that = this;
switch (_that) {
case _ActivitiesFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivitiesFilter value)?  $default,){
final _that = this;
switch (_that) {
case _ActivitiesFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? projectId,  ActivityKind? kind,  ActivityPurpose? purpose,  ActivityOutcome? outcome,  String? createdBy,  DateTime? occurredFrom,  DateTime? occurredTo,  bool? editedAfterWindowOnly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivitiesFilter() when $default != null:
return $default(_that.projectId,_that.kind,_that.purpose,_that.outcome,_that.createdBy,_that.occurredFrom,_that.occurredTo,_that.editedAfterWindowOnly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? projectId,  ActivityKind? kind,  ActivityPurpose? purpose,  ActivityOutcome? outcome,  String? createdBy,  DateTime? occurredFrom,  DateTime? occurredTo,  bool? editedAfterWindowOnly)  $default,) {final _that = this;
switch (_that) {
case _ActivitiesFilter():
return $default(_that.projectId,_that.kind,_that.purpose,_that.outcome,_that.createdBy,_that.occurredFrom,_that.occurredTo,_that.editedAfterWindowOnly);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? projectId,  ActivityKind? kind,  ActivityPurpose? purpose,  ActivityOutcome? outcome,  String? createdBy,  DateTime? occurredFrom,  DateTime? occurredTo,  bool? editedAfterWindowOnly)?  $default,) {final _that = this;
switch (_that) {
case _ActivitiesFilter() when $default != null:
return $default(_that.projectId,_that.kind,_that.purpose,_that.outcome,_that.createdBy,_that.occurredFrom,_that.occurredTo,_that.editedAfterWindowOnly);case _:
  return null;

}
}

}

/// @nodoc


class _ActivitiesFilter implements ActivitiesFilter {
  const _ActivitiesFilter({this.projectId, this.kind, this.purpose, this.outcome, this.createdBy, this.occurredFrom, this.occurredTo, this.editedAfterWindowOnly});
  

@override final  String? projectId;
@override final  ActivityKind? kind;
@override final  ActivityPurpose? purpose;
@override final  ActivityOutcome? outcome;
@override final  String? createdBy;
@override final  DateTime? occurredFrom;
@override final  DateTime? occurredTo;
@override final  bool? editedAfterWindowOnly;

/// Create a copy of ActivitiesFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivitiesFilterCopyWith<_ActivitiesFilter> get copyWith => __$ActivitiesFilterCopyWithImpl<_ActivitiesFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivitiesFilter&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.purpose, purpose) || other.purpose == purpose)&&(identical(other.outcome, outcome) || other.outcome == outcome)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.occurredFrom, occurredFrom) || other.occurredFrom == occurredFrom)&&(identical(other.occurredTo, occurredTo) || other.occurredTo == occurredTo)&&(identical(other.editedAfterWindowOnly, editedAfterWindowOnly) || other.editedAfterWindowOnly == editedAfterWindowOnly));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,kind,purpose,outcome,createdBy,occurredFrom,occurredTo,editedAfterWindowOnly);

@override
String toString() {
  return 'ActivitiesFilter(projectId: $projectId, kind: $kind, purpose: $purpose, outcome: $outcome, createdBy: $createdBy, occurredFrom: $occurredFrom, occurredTo: $occurredTo, editedAfterWindowOnly: $editedAfterWindowOnly)';
}


}

/// @nodoc
abstract mixin class _$ActivitiesFilterCopyWith<$Res> implements $ActivitiesFilterCopyWith<$Res> {
  factory _$ActivitiesFilterCopyWith(_ActivitiesFilter value, $Res Function(_ActivitiesFilter) _then) = __$ActivitiesFilterCopyWithImpl;
@override @useResult
$Res call({
 String? projectId, ActivityKind? kind, ActivityPurpose? purpose, ActivityOutcome? outcome, String? createdBy, DateTime? occurredFrom, DateTime? occurredTo, bool? editedAfterWindowOnly
});




}
/// @nodoc
class __$ActivitiesFilterCopyWithImpl<$Res>
    implements _$ActivitiesFilterCopyWith<$Res> {
  __$ActivitiesFilterCopyWithImpl(this._self, this._then);

  final _ActivitiesFilter _self;
  final $Res Function(_ActivitiesFilter) _then;

/// Create a copy of ActivitiesFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = freezed,Object? kind = freezed,Object? purpose = freezed,Object? outcome = freezed,Object? createdBy = freezed,Object? occurredFrom = freezed,Object? occurredTo = freezed,Object? editedAfterWindowOnly = freezed,}) {
  return _then(_ActivitiesFilter(
projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as ActivityKind?,purpose: freezed == purpose ? _self.purpose : purpose // ignore: cast_nullable_to_non_nullable
as ActivityPurpose?,outcome: freezed == outcome ? _self.outcome : outcome // ignore: cast_nullable_to_non_nullable
as ActivityOutcome?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,occurredFrom: freezed == occurredFrom ? _self.occurredFrom : occurredFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,occurredTo: freezed == occurredTo ? _self.occurredTo : occurredTo // ignore: cast_nullable_to_non_nullable
as DateTime?,editedAfterWindowOnly: freezed == editedAfterWindowOnly ? _self.editedAfterWindowOnly : editedAfterWindowOnly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
