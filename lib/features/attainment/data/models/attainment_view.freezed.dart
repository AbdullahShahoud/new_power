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

 String get targetId; AttainmentMetric get metric;/// ISO-4217, e.g. `"SYP"`. **Null for both count metrics** and always
/// present for `SALES_VALUE`. Read per row — never off `targets[0]`.
 String? get currency;/// `"YYYY-MM-DD"`, inclusive at both ends. Kept as the raw string: a
/// `DateTime.parse` + local-time render turns 1 July into 30 June for
/// any negative-offset reader.
 String get periodStart; String get periodEnd;/// `true` ⟺ the target's *lifecycle status* is CLOSED — **not** the
/// calendar. A period whose end has passed but which a manager has not
/// closed is still `false` and still carries pace.
 bool get closed; String get target; String get attained;/// A JSON number, display-only, ≤ 1 decimal. `num` because a whole
/// percentage serialises as `100`, not `100.0`.
 num get attainedPct;/// **Floored at `"0.00"`** — never negative. For the overshoot on an
/// overachieved target, use [AttainmentViewX.overshoot].
 String get remaining;// ── the four pace fields: present together, absent together ──────
 String? get expectedToDate; num? get expectedToDatePct; int? get elapsedDays; int? get totalDays;@JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown) AttainmentTargetStatus get status;/// How many confirmed, won outcomes were counted into `attained`.
/// ⚠️ Outcomes in a *different* currency to the target are dropped from
/// both this count and `attained`, and this route does not say how many.
 int? get confirmedOutcomes;
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
 String targetId, AttainmentMetric metric, String? currency, String periodStart, String periodEnd, bool closed, String target, String attained, num attainedPct, String remaining, String? expectedToDate, num? expectedToDatePct, int? elapsedDays, int? totalDays,@JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown) AttainmentTargetStatus status, int? confirmedOutcomes
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
as AttainmentMetric,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
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
as AttainmentTargetStatus,confirmedOutcomes: freezed == confirmedOutcomes ? _self.confirmedOutcomes : confirmedOutcomes // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String targetId,  AttainmentMetric metric,  String? currency,  String periodStart,  String periodEnd,  bool closed,  String target,  String attained,  num attainedPct,  String remaining,  String? expectedToDate,  num? expectedToDatePct,  int? elapsedDays,  int? totalDays, @JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown)  AttainmentTargetStatus status,  int? confirmedOutcomes)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String targetId,  AttainmentMetric metric,  String? currency,  String periodStart,  String periodEnd,  bool closed,  String target,  String attained,  num attainedPct,  String remaining,  String? expectedToDate,  num? expectedToDatePct,  int? elapsedDays,  int? totalDays, @JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown)  AttainmentTargetStatus status,  int? confirmedOutcomes)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String targetId,  AttainmentMetric metric,  String? currency,  String periodStart,  String periodEnd,  bool closed,  String target,  String attained,  num attainedPct,  String remaining,  String? expectedToDate,  num? expectedToDatePct,  int? elapsedDays,  int? totalDays, @JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown)  AttainmentTargetStatus status,  int? confirmedOutcomes)?  $default,) {final _that = this;
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
  const _AttainmentView({this.targetId = '', this.metric = AttainmentMetric.salesValue, this.currency, this.periodStart = '', this.periodEnd = '', this.closed = false, this.target = '0.00', this.attained = '0.00', this.attainedPct = 0, this.remaining = '0.00', this.expectedToDate, this.expectedToDatePct, this.elapsedDays, this.totalDays, @JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown) this.status = AttainmentTargetStatus.unknown, this.confirmedOutcomes});
  factory _AttainmentView.fromJson(Map<String, dynamic> json) => _$AttainmentViewFromJson(json);

@override@JsonKey() final  String targetId;
@override@JsonKey() final  AttainmentMetric metric;
/// ISO-4217, e.g. `"SYP"`. **Null for both count metrics** and always
/// present for `SALES_VALUE`. Read per row — never off `targets[0]`.
@override final  String? currency;
/// `"YYYY-MM-DD"`, inclusive at both ends. Kept as the raw string: a
/// `DateTime.parse` + local-time render turns 1 July into 30 June for
/// any negative-offset reader.
@override@JsonKey() final  String periodStart;
@override@JsonKey() final  String periodEnd;
/// `true` ⟺ the target's *lifecycle status* is CLOSED — **not** the
/// calendar. A period whose end has passed but which a manager has not
/// closed is still `false` and still carries pace.
@override@JsonKey() final  bool closed;
@override@JsonKey() final  String target;
@override@JsonKey() final  String attained;
/// A JSON number, display-only, ≤ 1 decimal. `num` because a whole
/// percentage serialises as `100`, not `100.0`.
@override@JsonKey() final  num attainedPct;
/// **Floored at `"0.00"`** — never negative. For the overshoot on an
/// overachieved target, use [AttainmentViewX.overshoot].
@override@JsonKey() final  String remaining;
// ── the four pace fields: present together, absent together ──────
@override final  String? expectedToDate;
@override final  num? expectedToDatePct;
@override final  int? elapsedDays;
@override final  int? totalDays;
@override@JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown) final  AttainmentTargetStatus status;
/// How many confirmed, won outcomes were counted into `attained`.
/// ⚠️ Outcomes in a *different* currency to the target are dropped from
/// both this count and `attained`, and this route does not say how many.
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
 String targetId, AttainmentMetric metric, String? currency, String periodStart, String periodEnd, bool closed, String target, String attained, num attainedPct, String remaining, String? expectedToDate, num? expectedToDatePct, int? elapsedDays, int? totalDays,@JsonKey(unknownEnumValue: AttainmentTargetStatus.unknown) AttainmentTargetStatus status, int? confirmedOutcomes
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
as AttainmentMetric,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
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
as AttainmentTargetStatus,confirmedOutcomes: freezed == confirmedOutcomes ? _self.confirmedOutcomes : confirmedOutcomes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$MyAttainmentView {

/// `"YYYY-MM-DD"`, the **server's** calendar day, not the device's.
 String get asOf;/// The rep's **current** sales manager — never a target's snapshot
/// manager. It sits here, once, rather than on each row: after a
/// mid-period transfer the two rows belong to two different managers,
/// and labelling both with the current one would state the opposite of
/// what the split means.
///
/// ⚠️ `null` is a real, expected value (a stranded team, an account
/// approved without a manager, a dangling reporting line) — render the
/// absence, do not treat it as an error.
 String? get managerName; List<AttainmentView> get targets;
/// Create a copy of MyAttainmentView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyAttainmentViewCopyWith<MyAttainmentView> get copyWith => _$MyAttainmentViewCopyWithImpl<MyAttainmentView>(this as MyAttainmentView, _$identity);

  /// Serializes this MyAttainmentView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyAttainmentView&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.managerName, managerName) || other.managerName == managerName)&&const DeepCollectionEquality().equals(other.targets, targets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,asOf,managerName,const DeepCollectionEquality().hash(targets));

@override
String toString() {
  return 'MyAttainmentView(asOf: $asOf, managerName: $managerName, targets: $targets)';
}


}

/// @nodoc
abstract mixin class $MyAttainmentViewCopyWith<$Res>  {
  factory $MyAttainmentViewCopyWith(MyAttainmentView value, $Res Function(MyAttainmentView) _then) = _$MyAttainmentViewCopyWithImpl;
@useResult
$Res call({
 String asOf, String? managerName, List<AttainmentView> targets
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
@pragma('vm:prefer-inline') @override $Res call({Object? asOf = null,Object? managerName = freezed,Object? targets = null,}) {
  return _then(_self.copyWith(
asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as String,managerName: freezed == managerName ? _self.managerName : managerName // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String asOf,  String? managerName,  List<AttainmentView> targets)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MyAttainmentView() when $default != null:
return $default(_that.asOf,_that.managerName,_that.targets);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String asOf,  String? managerName,  List<AttainmentView> targets)  $default,) {final _that = this;
switch (_that) {
case _MyAttainmentView():
return $default(_that.asOf,_that.managerName,_that.targets);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String asOf,  String? managerName,  List<AttainmentView> targets)?  $default,) {final _that = this;
switch (_that) {
case _MyAttainmentView() when $default != null:
return $default(_that.asOf,_that.managerName,_that.targets);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MyAttainmentView implements MyAttainmentView {
  const _MyAttainmentView({this.asOf = '', this.managerName, final  List<AttainmentView> targets = const <AttainmentView>[]}): _targets = targets;
  factory _MyAttainmentView.fromJson(Map<String, dynamic> json) => _$MyAttainmentViewFromJson(json);

/// `"YYYY-MM-DD"`, the **server's** calendar day, not the device's.
@override@JsonKey() final  String asOf;
/// The rep's **current** sales manager — never a target's snapshot
/// manager. It sits here, once, rather than on each row: after a
/// mid-period transfer the two rows belong to two different managers,
/// and labelling both with the current one would state the opposite of
/// what the split means.
///
/// ⚠️ `null` is a real, expected value (a stranded team, an account
/// approved without a manager, a dangling reporting line) — render the
/// absence, do not treat it as an error.
@override final  String? managerName;
 final  List<AttainmentView> _targets;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyAttainmentView&&(identical(other.asOf, asOf) || other.asOf == asOf)&&(identical(other.managerName, managerName) || other.managerName == managerName)&&const DeepCollectionEquality().equals(other._targets, _targets));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,asOf,managerName,const DeepCollectionEquality().hash(_targets));

@override
String toString() {
  return 'MyAttainmentView(asOf: $asOf, managerName: $managerName, targets: $targets)';
}


}

/// @nodoc
abstract mixin class _$MyAttainmentViewCopyWith<$Res> implements $MyAttainmentViewCopyWith<$Res> {
  factory _$MyAttainmentViewCopyWith(_MyAttainmentView value, $Res Function(_MyAttainmentView) _then) = __$MyAttainmentViewCopyWithImpl;
@override @useResult
$Res call({
 String asOf, String? managerName, List<AttainmentView> targets
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
@override @pragma('vm:prefer-inline') $Res call({Object? asOf = null,Object? managerName = freezed,Object? targets = null,}) {
  return _then(_MyAttainmentView(
asOf: null == asOf ? _self.asOf : asOf // ignore: cast_nullable_to_non_nullable
as String,managerName: freezed == managerName ? _self.managerName : managerName // ignore: cast_nullable_to_non_nullable
as String?,targets: null == targets ? _self._targets : targets // ignore: cast_nullable_to_non_nullable
as List<AttainmentView>,
  ));
}


}

// dart format on
