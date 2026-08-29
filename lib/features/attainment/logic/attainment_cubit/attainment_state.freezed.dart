// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attainment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttainmentState {

 AttainmentStatus get status; MyAttainmentView? get view;/// What the current [view] was fetched with — not what is selected.
/// The selectors below change first and the fetch follows, so a
/// mid-flight rebuild must not label old numbers with a new period.
 AttainmentPeriod get period; AttainmentMetric get metric; AttainmentSort get sort;/// Set while a *reload* is in flight over rows that are already on
/// screen — the period/metric changed, or the rep pulled to refresh.
/// The old numbers stay visible underneath rather than collapsing to a
/// skeleton.
 bool get isRefreshing; String? get errorMessage;
/// Create a copy of AttainmentState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttainmentStateCopyWith<AttainmentState> get copyWith => _$AttainmentStateCopyWithImpl<AttainmentState>(this as AttainmentState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttainmentState&&(identical(other.status, status) || other.status == status)&&(identical(other.view, view) || other.view == view)&&(identical(other.period, period) || other.period == period)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,view,period,metric,sort,isRefreshing,errorMessage);

@override
String toString() {
  return 'AttainmentState(status: $status, view: $view, period: $period, metric: $metric, sort: $sort, isRefreshing: $isRefreshing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AttainmentStateCopyWith<$Res>  {
  factory $AttainmentStateCopyWith(AttainmentState value, $Res Function(AttainmentState) _then) = _$AttainmentStateCopyWithImpl;
@useResult
$Res call({
 AttainmentStatus status, MyAttainmentView? view, AttainmentPeriod period, AttainmentMetric metric, AttainmentSort sort, bool isRefreshing, String? errorMessage
});


$MyAttainmentViewCopyWith<$Res>? get view;

}
/// @nodoc
class _$AttainmentStateCopyWithImpl<$Res>
    implements $AttainmentStateCopyWith<$Res> {
  _$AttainmentStateCopyWithImpl(this._self, this._then);

  final AttainmentState _self;
  final $Res Function(AttainmentState) _then;

/// Create a copy of AttainmentState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? view = freezed,Object? period = null,Object? metric = null,Object? sort = null,Object? isRefreshing = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttainmentStatus,view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as MyAttainmentView?,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as AttainmentPeriod,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as AttainmentMetric,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as AttainmentSort,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AttainmentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyAttainmentViewCopyWith<$Res>? get view {
    if (_self.view == null) {
    return null;
  }

  return $MyAttainmentViewCopyWith<$Res>(_self.view!, (value) {
    return _then(_self.copyWith(view: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttainmentState].
extension AttainmentStatePatterns on AttainmentState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttainmentState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttainmentState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttainmentState value)  $default,){
final _that = this;
switch (_that) {
case _AttainmentState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttainmentState value)?  $default,){
final _that = this;
switch (_that) {
case _AttainmentState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AttainmentStatus status,  MyAttainmentView? view,  AttainmentPeriod period,  AttainmentMetric metric,  AttainmentSort sort,  bool isRefreshing,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttainmentState() when $default != null:
return $default(_that.status,_that.view,_that.period,_that.metric,_that.sort,_that.isRefreshing,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AttainmentStatus status,  MyAttainmentView? view,  AttainmentPeriod period,  AttainmentMetric metric,  AttainmentSort sort,  bool isRefreshing,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AttainmentState():
return $default(_that.status,_that.view,_that.period,_that.metric,_that.sort,_that.isRefreshing,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AttainmentStatus status,  MyAttainmentView? view,  AttainmentPeriod period,  AttainmentMetric metric,  AttainmentSort sort,  bool isRefreshing,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AttainmentState() when $default != null:
return $default(_that.status,_that.view,_that.period,_that.metric,_that.sort,_that.isRefreshing,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AttainmentState implements AttainmentState {
  const _AttainmentState({this.status = AttainmentStatus.initial, this.view, required this.period, this.metric = AttainmentMetric.salesValue, this.sort = AttainmentSort.periodAsc, this.isRefreshing = false, this.errorMessage});
  

@override@JsonKey() final  AttainmentStatus status;
@override final  MyAttainmentView? view;
/// What the current [view] was fetched with — not what is selected.
/// The selectors below change first and the fetch follows, so a
/// mid-flight rebuild must not label old numbers with a new period.
@override final  AttainmentPeriod period;
@override@JsonKey() final  AttainmentMetric metric;
@override@JsonKey() final  AttainmentSort sort;
/// Set while a *reload* is in flight over rows that are already on
/// screen — the period/metric changed, or the rep pulled to refresh.
/// The old numbers stay visible underneath rather than collapsing to a
/// skeleton.
@override@JsonKey() final  bool isRefreshing;
@override final  String? errorMessage;

/// Create a copy of AttainmentState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttainmentStateCopyWith<_AttainmentState> get copyWith => __$AttainmentStateCopyWithImpl<_AttainmentState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttainmentState&&(identical(other.status, status) || other.status == status)&&(identical(other.view, view) || other.view == view)&&(identical(other.period, period) || other.period == period)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.isRefreshing, isRefreshing) || other.isRefreshing == isRefreshing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,view,period,metric,sort,isRefreshing,errorMessage);

@override
String toString() {
  return 'AttainmentState(status: $status, view: $view, period: $period, metric: $metric, sort: $sort, isRefreshing: $isRefreshing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AttainmentStateCopyWith<$Res> implements $AttainmentStateCopyWith<$Res> {
  factory _$AttainmentStateCopyWith(_AttainmentState value, $Res Function(_AttainmentState) _then) = __$AttainmentStateCopyWithImpl;
@override @useResult
$Res call({
 AttainmentStatus status, MyAttainmentView? view, AttainmentPeriod period, AttainmentMetric metric, AttainmentSort sort, bool isRefreshing, String? errorMessage
});


@override $MyAttainmentViewCopyWith<$Res>? get view;

}
/// @nodoc
class __$AttainmentStateCopyWithImpl<$Res>
    implements _$AttainmentStateCopyWith<$Res> {
  __$AttainmentStateCopyWithImpl(this._self, this._then);

  final _AttainmentState _self;
  final $Res Function(_AttainmentState) _then;

/// Create a copy of AttainmentState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? view = freezed,Object? period = null,Object? metric = null,Object? sort = null,Object? isRefreshing = null,Object? errorMessage = freezed,}) {
  return _then(_AttainmentState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttainmentStatus,view: freezed == view ? _self.view : view // ignore: cast_nullable_to_non_nullable
as MyAttainmentView?,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as AttainmentPeriod,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as AttainmentMetric,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as AttainmentSort,isRefreshing: null == isRefreshing ? _self.isRefreshing : isRefreshing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AttainmentState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyAttainmentViewCopyWith<$Res>? get view {
    if (_self.view == null) {
    return null;
  }

  return $MyAttainmentViewCopyWith<$Res>(_self.view!, (value) {
    return _then(_self.copyWith(view: value));
  });
}
}

// dart format on
