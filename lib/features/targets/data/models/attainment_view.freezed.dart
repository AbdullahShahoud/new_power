// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attainment_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttainmentView {

 String get targetId;@JsonKey(unknownEnumValue: TargetMetric.unknown) TargetMetric get metric;/// Present only on `SALES_VALUE`; the server refuses it on a count
/// metric rather than dropping it.
 String? get currency; String get periodStart; String get periodEnd;/// ⚠️ **Branch on this**, never on whether `expectedToDate` is present.
/// The two agree, but one is a documented field and the other is an
/// absence.
 bool get closed;/// Decimal strings — see [DecimalAmount] for why they stay strings.
 String get target; String get attained;/// A JSON *number*, already rounded half-up to one decimal place
/// server-side so the screen and a manager's calculator agree.
 num get attainedPct;/// Floored at `"0.00"` — never negative, even when overachieved.
 String get remaining;// ── absent on a closed period ───────────────────────────────────
// There is no pace to miss once a period is over, and returning one
// would invite a projection line through a finished quarter.
 String? get expectedToDate; num? get expectedToDatePct; int? get elapsedDays; int? get totalDays;@JsonKey(unknownEnumValue: AttainmentStatus.unknown) AttainmentStatus get status; int? get confirmedOutcomes;
/// Create a copy of AttainmentView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttainmentViewCopyWith<AttainmentView> get copyWith => _$AttainmentViewCopyWithImpl<AttainmentView>(this as AttainmentView, _$identity);

  /// Serializes this AttainmentView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttainmentView&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.closed, closed) || other.closed == closed)&&(identical(other.target, target) || other.target == target)&&(identical(other.attained, attained) || other.attained == attained)&&(identical(other.attainedPct, attainedPct) || other.attainedPct == attainedPct)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.expectedToDate, expectedToDate) || other.expectedToDate == expectedToDate)&&(identical(other.expectedToDatePct, expectedToDatePct) || other.expectedToDatePct == expectedToDatePct)&&(identical(other.elapsedDays, elapsedDays) || other.elapsedDays == elapsedDays)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.status, status) || other.status == status)&&(identical(other.confirmedOutcomes, confirmedOutcomes) || other.confirmedOutcomes == confirmedOutcomes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetId,metric,currency,periodStart,periodEnd,closed,target,attained,attainedPct,remaining,expectedToDate,expectedToDatePct,elapsedDays,totalDays,status,confirmedOutcomes);

@override
String toString() {
  return 'AttainmentView(targetId: $targetId, metric: $metric, currency: $currency, periodStart: $periodStart, periodEnd: $periodEnd, closed: $closed, target: $target, attained: $attained, attainedPct: $attainedPct, remaining: $remaining, expectedToDate: $expectedToDate, expectedToDatePct: $expectedToDatePct, elapsedDays: $elapsedDays, totalDays: $totalDays, status: $status, confirmedOutcomes: $confirmedOutcomes)';
}


}

/// @nodoc
abstract mixin class $AttainmentViewCopyWith<$Res>  {
  factory $AttainmentViewCopyWith(AttainmentView value, $Res Function(AttainmentView) _then) = _$AttainmentViewCopyWithImpl;
@useResult
$Res call({
 String targetId,@JsonKey(unknownEnumValue: TargetMetric.unknown) TargetMetric metric, String? currency, String periodStart, String periodEnd, bool closed, String target, String attained, num attainedPct, String remaining, String? expectedToDate, num? expectedToDatePct, int? elapsedDays, int? totalDays,@JsonKey(unknownEnumValue: AttainmentStatus.unknown) AttainmentStatus status, int? confirmedOutcomes
});




}
/// @nodoc
class _$AttainmentViewCopyWithImpl<$Res>
    implements $AttainmentViewCopyWith<$Res> {
  _$AttainmentViewCopyWithImpl(this._self, this._then);

  final AttainmentView _self;
  final $Res Function(AttainmentView) _then;

/// Create a copy of AttainmentView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetId = null,Object? metric = null,Object? currency = freezed,Object? periodStart = null,Object? periodEnd = null,Object? closed = null,Object? target = null,Object? attained = null,Object? attainedPct = null,Object? remaining = null,Object? expectedToDate = freezed,Object? expectedToDatePct = freezed,Object? elapsedDays = freezed,Object? totalDays = freezed,Object? status = null,Object? confirmedOutcomes = freezed,}) {
  return _then(_self.copyWith(
targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as TargetMetric,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String,periodEnd: null == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String,closed: null == closed ? _self.closed : closed // ignore: cast_nullable_to_non_nullable
as bool,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,attained: null == attained ? _self.attained : attained // ignore: cast_nullable_to_non_nullable
as String,attainedPct: null == attainedPct ? _self.attainedPct : attainedPct // ignore: cast_nullable_to_non_nullable
as num,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as String,expectedToDate: freezed == expectedToDate ? _self.expectedToDate : expectedToDate // ignore: cast_nullable_to_non_nullable
as String?,expectedToDatePct: freezed == expectedToDatePct ? _self.expectedToDatePct : expectedToDatePct // ignore: cast_nullable_to_non_nullable
as num?,elapsedDays: freezed == elapsedDays ? _self.elapsedDays : elapsedDays // ignore: cast_nullable_to_non_nullable
as int?,totalDays: freezed == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttainmentStatus,confirmedOutcomes: freezed == confirmedOutcomes ? _self.confirmedOutcomes : confirmedOutcomes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttainmentView].
extension AttainmentViewPatterns on AttainmentView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttainmentView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttainmentView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttainmentView value)  $default,){
final _that = this;
switch (_that) {
case _AttainmentView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttainmentView value)?  $default,){
final _that = this;
switch (_that) {
case _AttainmentView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String targetId, @JsonKey(unknownEnumValue: TargetMetric.unknown)  TargetMetric metric,  String? currency,  String periodStart,  String periodEnd,  bool closed,  String target,  String attained,  num attainedPct,  String remaining,  String? expectedToDate,  num? expectedToDatePct,  int? elapsedDays,  int? totalDays, @JsonKey(unknownEnumValue: AttainmentStatus.unknown)  AttainmentStatus status,  int? confirmedOutcomes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttainmentView() when $default != null:
return $default(_that.targetId,_that.metric,_that.currency,_that.periodStart,_that.periodEnd,_that.closed,_that.target,_that.attained,_that.attainedPct,_that.remaining,_that.expectedToDate,_that.expectedToDatePct,_that.elapsedDays,_that.totalDays,_that.status,_that.confirmedOutcomes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String targetId, @JsonKey(unknownEnumValue: TargetMetric.unknown)  TargetMetric metric,  String? currency,  String periodStart,  String periodEnd,  bool closed,  String target,  String attained,  num attainedPct,  String remaining,  String? expectedToDate,  num? expectedToDatePct,  int? elapsedDays,  int? totalDays, @JsonKey(unknownEnumValue: AttainmentStatus.unknown)  AttainmentStatus status,  int? confirmedOutcomes)  $default,) {final _that = this;
switch (_that) {
case _AttainmentView():
return $default(_that.targetId,_that.metric,_that.currency,_that.periodStart,_that.periodEnd,_that.closed,_that.target,_that.attained,_that.attainedPct,_that.remaining,_that.expectedToDate,_that.expectedToDatePct,_that.elapsedDays,_that.totalDays,_that.status,_that.confirmedOutcomes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String targetId, @JsonKey(unknownEnumValue: TargetMetric.unknown)  TargetMetric metric,  String? currency,  String periodStart,  String periodEnd,  bool closed,  String target,  String attained,  num attainedPct,  String remaining,  String? expectedToDate,  num? expectedToDatePct,  int? elapsedDays,  int? totalDays, @JsonKey(unknownEnumValue: AttainmentStatus.unknown)  AttainmentStatus status,  int? confirmedOutcomes)?  $default,) {final _that = this;
switch (_that) {
case _AttainmentView() when $default != null:
return $default(_that.targetId,_that.metric,_that.currency,_that.periodStart,_that.periodEnd,_that.closed,_that.target,_that.attained,_that.attainedPct,_that.remaining,_that.expectedToDate,_that.expectedToDatePct,_that.elapsedDays,_that.totalDays,_that.status,_that.confirmedOutcomes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttainmentView implements AttainmentView {
  const _AttainmentView({required this.targetId, @JsonKey(unknownEnumValue: TargetMetric.unknown) this.metric = TargetMetric.unknown, this.currency, required this.periodStart, required this.periodEnd, this.closed = false, this.target = '0', this.attained = '0', this.attainedPct = 0, this.remaining = '0', this.expectedToDate, this.expectedToDatePct, this.elapsedDays, this.totalDays, @JsonKey(unknownEnumValue: AttainmentStatus.unknown) this.status = AttainmentStatus.unknown, this.confirmedOutcomes});
  factory _AttainmentView.fromJson(Map<String, dynamic> json) => _$AttainmentViewFromJson(json);

@override final  String targetId;
@override@JsonKey(unknownEnumValue: TargetMetric.unknown) final  TargetMetric metric;
/// Present only on `SALES_VALUE`; the server refuses it on a count
/// metric rather than dropping it.
@override final  String? currency;
@override final  String periodStart;
@override final  String periodEnd;
/// ⚠️ **Branch on this**, never on whether `expectedToDate` is present.
/// The two agree, but one is a documented field and the other is an
/// absence.
@override@JsonKey() final  bool closed;
/// Decimal strings — see [DecimalAmount] for why they stay strings.
@override@JsonKey() final  String target;
@override@JsonKey() final  String attained;
/// A JSON *number*, already rounded half-up to one decimal place
/// server-side so the screen and a manager's calculator agree.
@override@JsonKey() final  num attainedPct;
/// Floored at `"0.00"` — never negative, even when overachieved.
@override@JsonKey() final  String remaining;
// ── absent on a closed period ───────────────────────────────────
// There is no pace to miss once a period is over, and returning one
// would invite a projection line through a finished quarter.
@override final  String? expectedToDate;
@override final  num? expectedToDatePct;
@override final  int? elapsedDays;
@override final  int? totalDays;
@override@JsonKey(unknownEnumValue: AttainmentStatus.unknown) final  AttainmentStatus status;
@override final  int? confirmedOutcomes;

/// Create a copy of AttainmentView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttainmentViewCopyWith<_AttainmentView> get copyWith => __$AttainmentViewCopyWithImpl<_AttainmentView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttainmentViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttainmentView&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.metric, metric) || other.metric == metric)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.periodStart, periodStart) || other.periodStart == periodStart)&&(identical(other.periodEnd, periodEnd) || other.periodEnd == periodEnd)&&(identical(other.closed, closed) || other.closed == closed)&&(identical(other.target, target) || other.target == target)&&(identical(other.attained, attained) || other.attained == attained)&&(identical(other.attainedPct, attainedPct) || other.attainedPct == attainedPct)&&(identical(other.remaining, remaining) || other.remaining == remaining)&&(identical(other.expectedToDate, expectedToDate) || other.expectedToDate == expectedToDate)&&(identical(other.expectedToDatePct, expectedToDatePct) || other.expectedToDatePct == expectedToDatePct)&&(identical(other.elapsedDays, elapsedDays) || other.elapsedDays == elapsedDays)&&(identical(other.totalDays, totalDays) || other.totalDays == totalDays)&&(identical(other.status, status) || other.status == status)&&(identical(other.confirmedOutcomes, confirmedOutcomes) || other.confirmedOutcomes == confirmedOutcomes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,targetId,metric,currency,periodStart,periodEnd,closed,target,attained,attainedPct,remaining,expectedToDate,expectedToDatePct,elapsedDays,totalDays,status,confirmedOutcomes);

@override
String toString() {
  return 'AttainmentView(targetId: $targetId, metric: $metric, currency: $currency, periodStart: $periodStart, periodEnd: $periodEnd, closed: $closed, target: $target, attained: $attained, attainedPct: $attainedPct, remaining: $remaining, expectedToDate: $expectedToDate, expectedToDatePct: $expectedToDatePct, elapsedDays: $elapsedDays, totalDays: $totalDays, status: $status, confirmedOutcomes: $confirmedOutcomes)';
}


}

/// @nodoc
abstract mixin class _$AttainmentViewCopyWith<$Res> implements $AttainmentViewCopyWith<$Res> {
  factory _$AttainmentViewCopyWith(_AttainmentView value, $Res Function(_AttainmentView) _then) = __$AttainmentViewCopyWithImpl;
@override @useResult
$Res call({
 String targetId,@JsonKey(unknownEnumValue: TargetMetric.unknown) TargetMetric metric, String? currency, String periodStart, String periodEnd, bool closed, String target, String attained, num attainedPct, String remaining, String? expectedToDate, num? expectedToDatePct, int? elapsedDays, int? totalDays,@JsonKey(unknownEnumValue: AttainmentStatus.unknown) AttainmentStatus status, int? confirmedOutcomes
});




}
/// @nodoc
class __$AttainmentViewCopyWithImpl<$Res>
    implements _$AttainmentViewCopyWith<$Res> {
  __$AttainmentViewCopyWithImpl(this._self, this._then);

  final _AttainmentView _self;
  final $Res Function(_AttainmentView) _then;

/// Create a copy of AttainmentView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetId = null,Object? metric = null,Object? currency = freezed,Object? periodStart = null,Object? periodEnd = null,Object? closed = null,Object? target = null,Object? attained = null,Object? attainedPct = null,Object? remaining = null,Object? expectedToDate = freezed,Object? expectedToDatePct = freezed,Object? elapsedDays = freezed,Object? totalDays = freezed,Object? status = null,Object? confirmedOutcomes = freezed,}) {
  return _then(_AttainmentView(
targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,metric: null == metric ? _self.metric : metric // ignore: cast_nullable_to_non_nullable
as TargetMetric,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,periodStart: null == periodStart ? _self.periodStart : periodStart // ignore: cast_nullable_to_non_nullable
as String,periodEnd: null == periodEnd ? _self.periodEnd : periodEnd // ignore: cast_nullable_to_non_nullable
as String,closed: null == closed ? _self.closed : closed // ignore: cast_nullable_to_non_nullable
as bool,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,attained: null == attained ? _self.attained : attained // ignore: cast_nullable_to_non_nullable
as String,attainedPct: null == attainedPct ? _self.attainedPct : attainedPct // ignore: cast_nullable_to_non_nullable
as num,remaining: null == remaining ? _self.remaining : remaining // ignore: cast_nullable_to_non_nullable
as String,expectedToDate: freezed == expectedToDate ? _self.expectedToDate : expectedToDate // ignore: cast_nullable_to_non_nullable
as String?,expectedToDatePct: freezed == expectedToDatePct ? _self.expectedToDatePct : expectedToDatePct // ignore: cast_nullable_to_non_nullable
as num?,elapsedDays: freezed == elapsedDays ? _self.elapsedDays : elapsedDays // ignore: cast_nullable_to_non_nullable
as int?,totalDays: freezed == totalDays ? _self.totalDays : totalDays // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AttainmentStatus,confirmedOutcomes: freezed == confirmedOutcomes ? _self.confirmedOutcomes : confirmedOutcomes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$MyAttainmentView {

 String? get asOf;/// ⚠️ **After a mid-period transfer this holds two entries** — both
/// halves of the rep's own quarter, the one their old manager keeps and
/// the one their new manager owns. They are one period made of two
/// windows, and summing them is the honest total.
///
/// An empty list is a normal answer: nothing published for that period
/// yet, not a failure.
 List<AttainmentView> get targets;
/// Create a copy of MyAttainmentView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyAttainmentViewCopyWith<MyAttainmentView> get copyWith => _$MyAttainmentViewCopyWithImpl<MyAttainmentView>(this as MyAttainmentView, _$identity);

  /// Serializes this MyAttainmentView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAttainmentView&&(identical(other.asOf, asOf) || other.asOf == asOf)&&const DeepCollectionEquality().equals(other.targets, targets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,asOf,const DeepCollectionEquality().hash(targets));

@override
String toString() {
  return 'MyAttainmentView(asOf: $asOf, targets: $targets)';
}


}

/// @nodoc
abstract mixin class $MyAttainmentViewCopyWith<$Res>  {
  factory $MyAttainmentViewCopyWith(MyAttainmentView value, $Res Function(MyAttainmentView) _then) = _$MyAttainmentViewCopyWithImpl;
@useResult
$Res call({
 String? asOf, List<AttainmentView> targets
});




}
/// @nodoc
class _$MyAttainmentViewCopyWithImpl<$Res>
    implements $MyAttainmentViewCopyWith<$Res> {
  _$MyAttainmentViewCopyWithImpl(this._self, this._then);

  final MyAttainmentView _self;
  final $Res Function(MyAttainmentView) _then;

/// Create a copy of MyAttainmentView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? asOf = freezed,Object? targets = null,}) {
  return _then(_self.copyWith(
asOf: freezed == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as String?,targets: null == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as List<AttainmentView>,
  ));
}

}


/// Adds pattern-matching-related methods to [MyAttainmentView].
extension MyAttainmentViewPatterns on MyAttainmentView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyAttainmentView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyAttainmentView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyAttainmentView value)  $default,){
final _that = this;
switch (_that) {
case _MyAttainmentView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyAttainmentView value)?  $default,){
final _that = this;
switch (_that) {
case _MyAttainmentView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? asOf,  List<AttainmentView> targets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyAttainmentView() when $default != null:
return $default(_that.asOf,_that.targets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? asOf,  List<AttainmentView> targets)  $default,) {final _that = this;
switch (_that) {
case _MyAttainmentView():
return $default(_that.asOf,_that.targets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? asOf,  List<AttainmentView> targets)?  $default,) {final _that = this;
switch (_that) {
case _MyAttainmentView() when $default != null:
return $default(_that.asOf,_that.targets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyAttainmentView implements MyAttainmentView {
  const _MyAttainmentView({this.asOf, final  List<AttainmentView> targets = const <AttainmentView>[]}): _targets = targets;
  factory _MyAttainmentView.fromJson(Map<String, dynamic> json) => _$MyAttainmentViewFromJson(json);

@override final  String? asOf;
/// ⚠️ **After a mid-period transfer this holds two entries** — both
/// halves of the rep's own quarter, the one their old manager keeps and
/// the one their new manager owns. They are one period made of two
/// windows, and summing them is the honest total.
///
/// An empty list is a normal answer: nothing published for that period
/// yet, not a failure.
 final  List<AttainmentView> _targets;
/// ⚠️ **After a mid-period transfer this holds two entries** — both
/// halves of the rep's own quarter, the one their old manager keeps and
/// the one their new manager owns. They are one period made of two
/// windows, and summing them is the honest total.
///
/// An empty list is a normal answer: nothing published for that period
/// yet, not a failure.
@override@JsonKey() List<AttainmentView> get targets {
  if (_targets is EqualUnmodifiableListView) return _targets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targets);
}


/// Create a copy of MyAttainmentView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyAttainmentViewCopyWith<_MyAttainmentView> get copyWith => __$MyAttainmentViewCopyWithImpl<_MyAttainmentView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyAttainmentViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyAttainmentView&&(identical(other.asOf, asOf) || other.asOf == asOf)&&const DeepCollectionEquality().equals(other._targets, _targets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,asOf,const DeepCollectionEquality().hash(_targets));

@override
String toString() {
  return 'MyAttainmentView(asOf: $asOf, targets: $targets)';
}


}

/// @nodoc
abstract mixin class _$MyAttainmentViewCopyWith<$Res> implements $MyAttainmentViewCopyWith<$Res> {
  factory _$MyAttainmentViewCopyWith(_MyAttainmentView value, $Res Function(_MyAttainmentView) _then) = __$MyAttainmentViewCopyWithImpl;
@override @useResult
$Res call({
 String? asOf, List<AttainmentView> targets
});




}
/// @nodoc
class __$MyAttainmentViewCopyWithImpl<$Res>
    implements _$MyAttainmentViewCopyWith<$Res> {
  __$MyAttainmentViewCopyWithImpl(this._self, this._then);

  final _MyAttainmentView _self;
  final $Res Function(_MyAttainmentView) _then;

/// Create a copy of MyAttainmentView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? asOf = freezed,Object? targets = null,}) {
  return _then(_MyAttainmentView(
asOf: freezed == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as String?,targets: null == targets ? _self._targets : targets // ignore: cast_nullable_to_non_nullable
as List<AttainmentView>,
  ));
}


}


/// @nodoc
mixin _$MyAttainmentResponse {

 bool? get success; String? get message; MyAttainmentView get data; ApiResponseMeta? get meta;
/// Create a copy of MyAttainmentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyAttainmentResponseCopyWith<MyAttainmentResponse> get copyWith => _$MyAttainmentResponseCopyWithImpl<MyAttainmentResponse>(this as MyAttainmentResponse, _$identity);

  /// Serializes this MyAttainmentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAttainmentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'MyAttainmentResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $MyAttainmentResponseCopyWith<$Res>  {
  factory $MyAttainmentResponseCopyWith(MyAttainmentResponse value, $Res Function(MyAttainmentResponse) _then) = _$MyAttainmentResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, MyAttainmentView data, ApiResponseMeta? meta
});


$MyAttainmentViewCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$MyAttainmentResponseCopyWithImpl<$Res>
    implements $MyAttainmentResponseCopyWith<$Res> {
  _$MyAttainmentResponseCopyWithImpl(this._self, this._then);

  final MyAttainmentResponse _self;
  final $Res Function(MyAttainmentResponse) _then;

/// Create a copy of MyAttainmentResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MyAttainmentView,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of MyAttainmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyAttainmentViewCopyWith<$Res> get data {
  
  return $MyAttainmentViewCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MyAttainmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ApiResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [MyAttainmentResponse].
extension MyAttainmentResponsePatterns on MyAttainmentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MyAttainmentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MyAttainmentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MyAttainmentResponse value)  $default,){
final _that = this;
switch (_that) {
case _MyAttainmentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MyAttainmentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MyAttainmentResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  MyAttainmentView data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyAttainmentResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  MyAttainmentView data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _MyAttainmentResponse():
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  MyAttainmentView data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _MyAttainmentResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyAttainmentResponse implements MyAttainmentResponse {
  const _MyAttainmentResponse({this.success, this.message, required this.data, this.meta});
  factory _MyAttainmentResponse.fromJson(Map<String, dynamic> json) => _$MyAttainmentResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  MyAttainmentView data;
@override final  ApiResponseMeta? meta;

/// Create a copy of MyAttainmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyAttainmentResponseCopyWith<_MyAttainmentResponse> get copyWith => __$MyAttainmentResponseCopyWithImpl<_MyAttainmentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyAttainmentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyAttainmentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'MyAttainmentResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$MyAttainmentResponseCopyWith<$Res> implements $MyAttainmentResponseCopyWith<$Res> {
  factory _$MyAttainmentResponseCopyWith(_MyAttainmentResponse value, $Res Function(_MyAttainmentResponse) _then) = __$MyAttainmentResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, MyAttainmentView data, ApiResponseMeta? meta
});


@override $MyAttainmentViewCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$MyAttainmentResponseCopyWithImpl<$Res>
    implements _$MyAttainmentResponseCopyWith<$Res> {
  __$MyAttainmentResponseCopyWithImpl(this._self, this._then);

  final _MyAttainmentResponse _self;
  final $Res Function(_MyAttainmentResponse) _then;

/// Create a copy of MyAttainmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_MyAttainmentResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MyAttainmentView,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of MyAttainmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MyAttainmentViewCopyWith<$Res> get data {
  
  return $MyAttainmentViewCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of MyAttainmentResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ApiResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
