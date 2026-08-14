// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilterOptionView {

/// ⚠️ **Send this back verbatim.** It is already comma-escaped and
/// round-trips through the parser unchanged. Never compose one yourself
/// — a NUMBER option arrives as `65~65` (identity) and rewriting it as
/// `65` silently switches to overlap matching, which returns more rows
/// than the count advertised (§12.4).
 String get code; Localized get label;/// Distinct **products**, not value rows.
 int get count;
/// Create a copy of FilterOptionView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterOptionViewCopyWith<FilterOptionView> get copyWith => _$FilterOptionViewCopyWithImpl<FilterOptionView>(this as FilterOptionView, _$identity);

  /// Serializes this FilterOptionView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterOptionView&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,count);

@override
String toString() {
  return 'FilterOptionView(code: $code, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class $FilterOptionViewCopyWith<$Res>  {
  factory $FilterOptionViewCopyWith(FilterOptionView value, $Res Function(FilterOptionView) _then) = _$FilterOptionViewCopyWithImpl;
@useResult
$Res call({
 String code, Localized label, int count
});


$LocalizedCopyWith<$Res> get label;

}
/// @nodoc
class _$FilterOptionViewCopyWithImpl<$Res>
    implements $FilterOptionViewCopyWith<$Res> {
  _$FilterOptionViewCopyWithImpl(this._self, this._then);

  final FilterOptionView _self;
  final $Res Function(FilterOptionView) _then;

/// Create a copy of FilterOptionView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? label = null,Object? count = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of FilterOptionView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}


/// Adds pattern-matching-related methods to [FilterOptionView].
extension FilterOptionViewPatterns on FilterOptionView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterOptionView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterOptionView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterOptionView value)  $default,){
final _that = this;
switch (_that) {
case _FilterOptionView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterOptionView value)?  $default,){
final _that = this;
switch (_that) {
case _FilterOptionView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  Localized label,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterOptionView() when $default != null:
return $default(_that.code,_that.label,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  Localized label,  int count)  $default,) {final _that = this;
switch (_that) {
case _FilterOptionView():
return $default(_that.code,_that.label,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  Localized label,  int count)?  $default,) {final _that = this;
switch (_that) {
case _FilterOptionView() when $default != null:
return $default(_that.code,_that.label,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FilterOptionView implements FilterOptionView {
  const _FilterOptionView({required this.code, required this.label, this.count = 0});
  factory _FilterOptionView.fromJson(Map<String, dynamic> json) => _$FilterOptionViewFromJson(json);

/// ⚠️ **Send this back verbatim.** It is already comma-escaped and
/// round-trips through the parser unchanged. Never compose one yourself
/// — a NUMBER option arrives as `65~65` (identity) and rewriting it as
/// `65` silently switches to overlap matching, which returns more rows
/// than the count advertised (§12.4).
@override final  String code;
@override final  Localized label;
/// Distinct **products**, not value rows.
@override@JsonKey() final  int count;

/// Create a copy of FilterOptionView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterOptionViewCopyWith<_FilterOptionView> get copyWith => __$FilterOptionViewCopyWithImpl<_FilterOptionView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilterOptionViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterOptionView&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,count);

@override
String toString() {
  return 'FilterOptionView(code: $code, label: $label, count: $count)';
}


}

/// @nodoc
abstract mixin class _$FilterOptionViewCopyWith<$Res> implements $FilterOptionViewCopyWith<$Res> {
  factory _$FilterOptionViewCopyWith(_FilterOptionView value, $Res Function(_FilterOptionView) _then) = __$FilterOptionViewCopyWithImpl;
@override @useResult
$Res call({
 String code, Localized label, int count
});


@override $LocalizedCopyWith<$Res> get label;

}
/// @nodoc
class __$FilterOptionViewCopyWithImpl<$Res>
    implements _$FilterOptionViewCopyWith<$Res> {
  __$FilterOptionViewCopyWithImpl(this._self, this._then);

  final _FilterOptionView _self;
  final $Res Function(_FilterOptionView) _then;

/// Create a copy of FilterOptionView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,Object? count = null,}) {
  return _then(_FilterOptionView(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FilterOptionView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}


/// @nodoc
mixin _$FilterRange {

 num get min; num get max;
/// Create a copy of FilterRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterRangeCopyWith<FilterRange> get copyWith => _$FilterRangeCopyWithImpl<FilterRange>(this as FilterRange, _$identity);

  /// Serializes this FilterRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterRange&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min,max);

@override
String toString() {
  return 'FilterRange(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class $FilterRangeCopyWith<$Res>  {
  factory $FilterRangeCopyWith(FilterRange value, $Res Function(FilterRange) _then) = _$FilterRangeCopyWithImpl;
@useResult
$Res call({
 num min, num max
});




}
/// @nodoc
class _$FilterRangeCopyWithImpl<$Res>
    implements $FilterRangeCopyWith<$Res> {
  _$FilterRangeCopyWithImpl(this._self, this._then);

  final FilterRange _self;
  final $Res Function(FilterRange) _then;

/// Create a copy of FilterRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,}) {
  return _then(_self.copyWith(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as num,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [FilterRange].
extension FilterRangePatterns on FilterRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterRange value)  $default,){
final _that = this;
switch (_that) {
case _FilterRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterRange value)?  $default,){
final _that = this;
switch (_that) {
case _FilterRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num min,  num max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterRange() when $default != null:
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num min,  num max)  $default,) {final _that = this;
switch (_that) {
case _FilterRange():
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num min,  num max)?  $default,) {final _that = this;
switch (_that) {
case _FilterRange() when $default != null:
return $default(_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FilterRange implements FilterRange {
  const _FilterRange({required this.min, required this.max});
  factory _FilterRange.fromJson(Map<String, dynamic> json) => _$FilterRangeFromJson(json);

@override final  num min;
@override final  num max;

/// Create a copy of FilterRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterRangeCopyWith<_FilterRange> get copyWith => __$FilterRangeCopyWithImpl<_FilterRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilterRangeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterRange&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,min,max);

@override
String toString() {
  return 'FilterRange(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$FilterRangeCopyWith<$Res> implements $FilterRangeCopyWith<$Res> {
  factory _$FilterRangeCopyWith(_FilterRange value, $Res Function(_FilterRange) _then) = __$FilterRangeCopyWithImpl;
@override @useResult
$Res call({
 num min, num max
});




}
/// @nodoc
class __$FilterRangeCopyWithImpl<$Res>
    implements _$FilterRangeCopyWith<$Res> {
  __$FilterRangeCopyWithImpl(this._self, this._then);

  final _FilterRange _self;
  final $Res Function(_FilterRange) _then;

/// Create a copy of FilterRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,}) {
  return _then(_FilterRange(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as num,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}


/// @nodoc
mixin _$FilterView {

/// Send back as `attr[CODE]`.
 String get code; Localized get label;/// Storage type — picks **formatting and filter syntax**.
@JsonKey(unknownEnumValue: AttributeType.unknown) AttributeType get type;/// **Picks the control.**
@JsonKey(unknownEnumValue: FilterStrategy.unknown) FilterStrategy get strategy; String? get unit;/// DISCRETE only.
 List<FilterOptionView>? get options;/// DISCRETE only; **absent** when false. More distinct values exist than
/// the returned 24 — show a search box, not a complete list.
 bool get truncated;/// RANGE only.
 FilterRange? get range;/// Products in the current result set carrying this attribute **at all**.
/// ⚠️ Not the sum of the option counts — a two-tone fitting carries two
/// colours and is one product.
 int get count;
/// Create a copy of FilterView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FilterViewCopyWith<FilterView> get copyWith => _$FilterViewCopyWithImpl<FilterView>(this as FilterView, _$identity);

  /// Serializes this FilterView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FilterView&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.unit, unit) || other.unit == unit)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.truncated, truncated) || other.truncated == truncated)&&(identical(other.range, range) || other.range == range)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,type,strategy,unit,const DeepCollectionEquality().hash(options),truncated,range,count);

@override
String toString() {
  return 'FilterView(code: $code, label: $label, type: $type, strategy: $strategy, unit: $unit, options: $options, truncated: $truncated, range: $range, count: $count)';
}


}

/// @nodoc
abstract mixin class $FilterViewCopyWith<$Res>  {
  factory $FilterViewCopyWith(FilterView value, $Res Function(FilterView) _then) = _$FilterViewCopyWithImpl;
@useResult
$Res call({
 String code, Localized label,@JsonKey(unknownEnumValue: AttributeType.unknown) AttributeType type,@JsonKey(unknownEnumValue: FilterStrategy.unknown) FilterStrategy strategy, String? unit, List<FilterOptionView>? options, bool truncated, FilterRange? range, int count
});


$LocalizedCopyWith<$Res> get label;$FilterRangeCopyWith<$Res>? get range;

}
/// @nodoc
class _$FilterViewCopyWithImpl<$Res>
    implements $FilterViewCopyWith<$Res> {
  _$FilterViewCopyWithImpl(this._self, this._then);

  final FilterView _self;
  final $Res Function(FilterView) _then;

/// Create a copy of FilterView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? label = null,Object? type = null,Object? strategy = null,Object? unit = freezed,Object? options = freezed,Object? truncated = null,Object? range = freezed,Object? count = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AttributeType,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as FilterStrategy,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<FilterOptionView>?,truncated: null == truncated ? _self.truncated : truncated // ignore: cast_nullable_to_non_nullable
as bool,range: freezed == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as FilterRange?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of FilterView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of FilterView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterRangeCopyWith<$Res>? get range {
    if (_self.range == null) {
    return null;
  }

  return $FilterRangeCopyWith<$Res>(_self.range!, (value) {
    return _then(_self.copyWith(range: value));
  });
}
}


/// Adds pattern-matching-related methods to [FilterView].
extension FilterViewPatterns on FilterView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FilterView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FilterView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FilterView value)  $default,){
final _that = this;
switch (_that) {
case _FilterView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FilterView value)?  $default,){
final _that = this;
switch (_that) {
case _FilterView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  Localized label, @JsonKey(unknownEnumValue: AttributeType.unknown)  AttributeType type, @JsonKey(unknownEnumValue: FilterStrategy.unknown)  FilterStrategy strategy,  String? unit,  List<FilterOptionView>? options,  bool truncated,  FilterRange? range,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FilterView() when $default != null:
return $default(_that.code,_that.label,_that.type,_that.strategy,_that.unit,_that.options,_that.truncated,_that.range,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  Localized label, @JsonKey(unknownEnumValue: AttributeType.unknown)  AttributeType type, @JsonKey(unknownEnumValue: FilterStrategy.unknown)  FilterStrategy strategy,  String? unit,  List<FilterOptionView>? options,  bool truncated,  FilterRange? range,  int count)  $default,) {final _that = this;
switch (_that) {
case _FilterView():
return $default(_that.code,_that.label,_that.type,_that.strategy,_that.unit,_that.options,_that.truncated,_that.range,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  Localized label, @JsonKey(unknownEnumValue: AttributeType.unknown)  AttributeType type, @JsonKey(unknownEnumValue: FilterStrategy.unknown)  FilterStrategy strategy,  String? unit,  List<FilterOptionView>? options,  bool truncated,  FilterRange? range,  int count)?  $default,) {final _that = this;
switch (_that) {
case _FilterView() when $default != null:
return $default(_that.code,_that.label,_that.type,_that.strategy,_that.unit,_that.options,_that.truncated,_that.range,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FilterView implements FilterView {
  const _FilterView({required this.code, required this.label, @JsonKey(unknownEnumValue: AttributeType.unknown) this.type = AttributeType.unknown, @JsonKey(unknownEnumValue: FilterStrategy.unknown) this.strategy = FilterStrategy.unknown, this.unit, final  List<FilterOptionView>? options, this.truncated = false, this.range, this.count = 0}): _options = options;
  factory _FilterView.fromJson(Map<String, dynamic> json) => _$FilterViewFromJson(json);

/// Send back as `attr[CODE]`.
@override final  String code;
@override final  Localized label;
/// Storage type — picks **formatting and filter syntax**.
@override@JsonKey(unknownEnumValue: AttributeType.unknown) final  AttributeType type;
/// **Picks the control.**
@override@JsonKey(unknownEnumValue: FilterStrategy.unknown) final  FilterStrategy strategy;
@override final  String? unit;
/// DISCRETE only.
 final  List<FilterOptionView>? _options;
/// DISCRETE only.
@override List<FilterOptionView>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// DISCRETE only; **absent** when false. More distinct values exist than
/// the returned 24 — show a search box, not a complete list.
@override@JsonKey() final  bool truncated;
/// RANGE only.
@override final  FilterRange? range;
/// Products in the current result set carrying this attribute **at all**.
/// ⚠️ Not the sum of the option counts — a two-tone fitting carries two
/// colours and is one product.
@override@JsonKey() final  int count;

/// Create a copy of FilterView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FilterViewCopyWith<_FilterView> get copyWith => __$FilterViewCopyWithImpl<_FilterView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FilterViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FilterView&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.type, type) || other.type == type)&&(identical(other.strategy, strategy) || other.strategy == strategy)&&(identical(other.unit, unit) || other.unit == unit)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.truncated, truncated) || other.truncated == truncated)&&(identical(other.range, range) || other.range == range)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,type,strategy,unit,const DeepCollectionEquality().hash(_options),truncated,range,count);

@override
String toString() {
  return 'FilterView(code: $code, label: $label, type: $type, strategy: $strategy, unit: $unit, options: $options, truncated: $truncated, range: $range, count: $count)';
}


}

/// @nodoc
abstract mixin class _$FilterViewCopyWith<$Res> implements $FilterViewCopyWith<$Res> {
  factory _$FilterViewCopyWith(_FilterView value, $Res Function(_FilterView) _then) = __$FilterViewCopyWithImpl;
@override @useResult
$Res call({
 String code, Localized label,@JsonKey(unknownEnumValue: AttributeType.unknown) AttributeType type,@JsonKey(unknownEnumValue: FilterStrategy.unknown) FilterStrategy strategy, String? unit, List<FilterOptionView>? options, bool truncated, FilterRange? range, int count
});


@override $LocalizedCopyWith<$Res> get label;@override $FilterRangeCopyWith<$Res>? get range;

}
/// @nodoc
class __$FilterViewCopyWithImpl<$Res>
    implements _$FilterViewCopyWith<$Res> {
  __$FilterViewCopyWithImpl(this._self, this._then);

  final _FilterView _self;
  final $Res Function(_FilterView) _then;

/// Create a copy of FilterView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,Object? type = null,Object? strategy = null,Object? unit = freezed,Object? options = freezed,Object? truncated = null,Object? range = freezed,Object? count = null,}) {
  return _then(_FilterView(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as AttributeType,strategy: null == strategy ? _self.strategy : strategy // ignore: cast_nullable_to_non_nullable
as FilterStrategy,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<FilterOptionView>?,truncated: null == truncated ? _self.truncated : truncated // ignore: cast_nullable_to_non_nullable
as bool,range: freezed == range ? _self.range : range // ignore: cast_nullable_to_non_nullable
as FilterRange?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of FilterView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of FilterView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FilterRangeCopyWith<$Res>? get range {
    if (_self.range == null) {
    return null;
  }

  return $FilterRangeCopyWith<$Res>(_self.range!, (value) {
    return _then(_self.copyWith(range: value));
  });
}
}


/// @nodoc
mixin _$CategoryFiltersView {

/// Echo of the resolved category; `null` when `category` was omitted.
 String? get categoryId; List<FilterView> get filters;
/// Create a copy of CategoryFiltersView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryFiltersViewCopyWith<CategoryFiltersView> get copyWith => _$CategoryFiltersViewCopyWithImpl<CategoryFiltersView>(this as CategoryFiltersView, _$identity);

  /// Serializes this CategoryFiltersView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryFiltersView&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.filters, filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,const DeepCollectionEquality().hash(filters));

@override
String toString() {
  return 'CategoryFiltersView(categoryId: $categoryId, filters: $filters)';
}


}

/// @nodoc
abstract mixin class $CategoryFiltersViewCopyWith<$Res>  {
  factory $CategoryFiltersViewCopyWith(CategoryFiltersView value, $Res Function(CategoryFiltersView) _then) = _$CategoryFiltersViewCopyWithImpl;
@useResult
$Res call({
 String? categoryId, List<FilterView> filters
});




}
/// @nodoc
class _$CategoryFiltersViewCopyWithImpl<$Res>
    implements $CategoryFiltersViewCopyWith<$Res> {
  _$CategoryFiltersViewCopyWithImpl(this._self, this._then);

  final CategoryFiltersView _self;
  final $Res Function(CategoryFiltersView) _then;

/// Create a copy of CategoryFiltersView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = freezed,Object? filters = null,}) {
  return _then(_self.copyWith(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as List<FilterView>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryFiltersView].
extension CategoryFiltersViewPatterns on CategoryFiltersView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryFiltersView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryFiltersView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryFiltersView value)  $default,){
final _that = this;
switch (_that) {
case _CategoryFiltersView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryFiltersView value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryFiltersView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? categoryId,  List<FilterView> filters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryFiltersView() when $default != null:
return $default(_that.categoryId,_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? categoryId,  List<FilterView> filters)  $default,) {final _that = this;
switch (_that) {
case _CategoryFiltersView():
return $default(_that.categoryId,_that.filters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? categoryId,  List<FilterView> filters)?  $default,) {final _that = this;
switch (_that) {
case _CategoryFiltersView() when $default != null:
return $default(_that.categoryId,_that.filters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryFiltersView implements CategoryFiltersView {
  const _CategoryFiltersView({this.categoryId, final  List<FilterView> filters = const <FilterView>[]}): _filters = filters;
  factory _CategoryFiltersView.fromJson(Map<String, dynamic> json) => _$CategoryFiltersViewFromJson(json);

/// Echo of the resolved category; `null` when `category` was omitted.
@override final  String? categoryId;
 final  List<FilterView> _filters;
@override@JsonKey() List<FilterView> get filters {
  if (_filters is EqualUnmodifiableListView) return _filters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filters);
}


/// Create a copy of CategoryFiltersView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryFiltersViewCopyWith<_CategoryFiltersView> get copyWith => __$CategoryFiltersViewCopyWithImpl<_CategoryFiltersView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryFiltersViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryFiltersView&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other._filters, _filters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,const DeepCollectionEquality().hash(_filters));

@override
String toString() {
  return 'CategoryFiltersView(categoryId: $categoryId, filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$CategoryFiltersViewCopyWith<$Res> implements $CategoryFiltersViewCopyWith<$Res> {
  factory _$CategoryFiltersViewCopyWith(_CategoryFiltersView value, $Res Function(_CategoryFiltersView) _then) = __$CategoryFiltersViewCopyWithImpl;
@override @useResult
$Res call({
 String? categoryId, List<FilterView> filters
});




}
/// @nodoc
class __$CategoryFiltersViewCopyWithImpl<$Res>
    implements _$CategoryFiltersViewCopyWith<$Res> {
  __$CategoryFiltersViewCopyWithImpl(this._self, this._then);

  final _CategoryFiltersView _self;
  final $Res Function(_CategoryFiltersView) _then;

/// Create a copy of CategoryFiltersView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryId = freezed,Object? filters = null,}) {
  return _then(_CategoryFiltersView(
categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,filters: null == filters ? _self._filters : filters // ignore: cast_nullable_to_non_nullable
as List<FilterView>,
  ));
}


}

// dart format on
