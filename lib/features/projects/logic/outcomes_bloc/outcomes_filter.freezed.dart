// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outcomes_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OutcomesFilter {

 OutcomeStatus? get status; OutcomeType? get type; String? get projectId; String? get submittedBy;
/// Create a copy of OutcomesFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomesFilterCopyWith<OutcomesFilter> get copyWith => _$OutcomesFilterCopyWithImpl<OutcomesFilter>(this as OutcomesFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomesFilter&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.submittedBy, submittedBy) || other.submittedBy == submittedBy));
}


@override
int get hashCode => Object.hash(runtimeType,status,type,projectId,submittedBy);

@override
String toString() {
  return 'OutcomesFilter(status: $status, type: $type, projectId: $projectId, submittedBy: $submittedBy)';
}


}

/// @nodoc
abstract mixin class $OutcomesFilterCopyWith<$Res>  {
  factory $OutcomesFilterCopyWith(OutcomesFilter value, $Res Function(OutcomesFilter) _then) = _$OutcomesFilterCopyWithImpl;
@useResult
$Res call({
 OutcomeStatus? status, OutcomeType? type, String? projectId, String? submittedBy
});




}
/// @nodoc
class _$OutcomesFilterCopyWithImpl<$Res>
    implements $OutcomesFilterCopyWith<$Res> {
  _$OutcomesFilterCopyWithImpl(this._self, this._then);

  final OutcomesFilter _self;
  final $Res Function(OutcomesFilter) _then;

/// Create a copy of OutcomesFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? type = freezed,Object? projectId = freezed,Object? submittedBy = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OutcomeStatus?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OutcomeType?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,submittedBy: freezed == submittedBy ? _self.submittedBy : submittedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OutcomesFilter].
extension OutcomesFilterPatterns on OutcomesFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutcomesFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutcomesFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutcomesFilter value)  $default,){
final _that = this;
switch (_that) {
case _OutcomesFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutcomesFilter value)?  $default,){
final _that = this;
switch (_that) {
case _OutcomesFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OutcomeStatus? status,  OutcomeType? type,  String? projectId,  String? submittedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutcomesFilter() when $default != null:
return $default(_that.status,_that.type,_that.projectId,_that.submittedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OutcomeStatus? status,  OutcomeType? type,  String? projectId,  String? submittedBy)  $default,) {final _that = this;
switch (_that) {
case _OutcomesFilter():
return $default(_that.status,_that.type,_that.projectId,_that.submittedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OutcomeStatus? status,  OutcomeType? type,  String? projectId,  String? submittedBy)?  $default,) {final _that = this;
switch (_that) {
case _OutcomesFilter() when $default != null:
return $default(_that.status,_that.type,_that.projectId,_that.submittedBy);case _:
  return null;

}
}

}

/// @nodoc


class _OutcomesFilter implements OutcomesFilter {
  const _OutcomesFilter({this.status, this.type, this.projectId, this.submittedBy});
  

@override final  OutcomeStatus? status;
@override final  OutcomeType? type;
@override final  String? projectId;
@override final  String? submittedBy;

/// Create a copy of OutcomesFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutcomesFilterCopyWith<_OutcomesFilter> get copyWith => __$OutcomesFilterCopyWithImpl<_OutcomesFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutcomesFilter&&(identical(other.status, status) || other.status == status)&&(identical(other.type, type) || other.type == type)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.submittedBy, submittedBy) || other.submittedBy == submittedBy));
}


@override
int get hashCode => Object.hash(runtimeType,status,type,projectId,submittedBy);

@override
String toString() {
  return 'OutcomesFilter(status: $status, type: $type, projectId: $projectId, submittedBy: $submittedBy)';
}


}

/// @nodoc
abstract mixin class _$OutcomesFilterCopyWith<$Res> implements $OutcomesFilterCopyWith<$Res> {
  factory _$OutcomesFilterCopyWith(_OutcomesFilter value, $Res Function(_OutcomesFilter) _then) = __$OutcomesFilterCopyWithImpl;
@override @useResult
$Res call({
 OutcomeStatus? status, OutcomeType? type, String? projectId, String? submittedBy
});




}
/// @nodoc
class __$OutcomesFilterCopyWithImpl<$Res>
    implements _$OutcomesFilterCopyWith<$Res> {
  __$OutcomesFilterCopyWithImpl(this._self, this._then);

  final _OutcomesFilter _self;
  final $Res Function(_OutcomesFilter) _then;

/// Create a copy of OutcomesFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? type = freezed,Object? projectId = freezed,Object? submittedBy = freezed,}) {
  return _then(_OutcomesFilter(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OutcomeStatus?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OutcomeType?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String?,submittedBy: freezed == submittedBy ? _self.submittedBy : submittedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
