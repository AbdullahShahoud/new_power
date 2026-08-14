// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attribute_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttributeOptionView {

 String get id;/// The exact token to send back in `attr[CODE]=…`.
 String get code; Localized get label; int get sortOrder;
/// Create a copy of AttributeOptionView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeOptionViewCopyWith<AttributeOptionView> get copyWith => _$AttributeOptionViewCopyWithImpl<AttributeOptionView>(this as AttributeOptionView, _$identity);

  /// Serializes this AttributeOptionView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeOptionView&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,label,sortOrder);

@override
String toString() {
  return 'AttributeOptionView(id: $id, code: $code, label: $label, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $AttributeOptionViewCopyWith<$Res>  {
  factory $AttributeOptionViewCopyWith(AttributeOptionView value, $Res Function(AttributeOptionView) _then) = _$AttributeOptionViewCopyWithImpl;
@useResult
$Res call({
 String id, String code, Localized label, int sortOrder
});


$LocalizedCopyWith<$Res> get label;

}
/// @nodoc
class _$AttributeOptionViewCopyWithImpl<$Res>
    implements $AttributeOptionViewCopyWith<$Res> {
  _$AttributeOptionViewCopyWithImpl(this._self, this._then);

  final AttributeOptionView _self;
  final $Res Function(AttributeOptionView) _then;

/// Create a copy of AttributeOptionView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? label = null,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of AttributeOptionView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttributeOptionView].
extension AttributeOptionViewPatterns on AttributeOptionView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttributeOptionView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttributeOptionView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttributeOptionView value)  $default,){
final _that = this;
switch (_that) {
case _AttributeOptionView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttributeOptionView value)?  $default,){
final _that = this;
switch (_that) {
case _AttributeOptionView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  Localized label,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttributeOptionView() when $default != null:
return $default(_that.id,_that.code,_that.label,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  Localized label,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _AttributeOptionView():
return $default(_that.id,_that.code,_that.label,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  Localized label,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _AttributeOptionView() when $default != null:
return $default(_that.id,_that.code,_that.label,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttributeOptionView implements AttributeOptionView {
  const _AttributeOptionView({required this.id, required this.code, required this.label, this.sortOrder = 0});
  factory _AttributeOptionView.fromJson(Map<String, dynamic> json) => _$AttributeOptionViewFromJson(json);

@override final  String id;
/// The exact token to send back in `attr[CODE]=…`.
@override final  String code;
@override final  Localized label;
@override@JsonKey() final  int sortOrder;

/// Create a copy of AttributeOptionView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributeOptionViewCopyWith<_AttributeOptionView> get copyWith => __$AttributeOptionViewCopyWithImpl<_AttributeOptionView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributeOptionViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttributeOptionView&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,label,sortOrder);

@override
String toString() {
  return 'AttributeOptionView(id: $id, code: $code, label: $label, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$AttributeOptionViewCopyWith<$Res> implements $AttributeOptionViewCopyWith<$Res> {
  factory _$AttributeOptionViewCopyWith(_AttributeOptionView value, $Res Function(_AttributeOptionView) _then) = __$AttributeOptionViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, Localized label, int sortOrder
});


@override $LocalizedCopyWith<$Res> get label;

}
/// @nodoc
class __$AttributeOptionViewCopyWithImpl<$Res>
    implements _$AttributeOptionViewCopyWith<$Res> {
  __$AttributeOptionViewCopyWithImpl(this._self, this._then);

  final _AttributeOptionView _self;
  final $Res Function(_AttributeOptionView) _then;

/// Create a copy of AttributeOptionView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? label = null,Object? sortOrder = null,}) {
  return _then(_AttributeOptionView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of AttributeOptionView
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
mixin _$AttributeView {

 String get id;/// **This is what you send as `attr[CODE]`** — filters key on the code,
/// never the id.
 String get code; Localized get label;@JsonKey(unknownEnumValue: AttributeType.unknown) AttributeType get dataType; String? get canonicalUnit;/// NUMBER only. `0` = whole numbers, `null` = unconstrained.
 int? get decimalPlaces;/// Global kill-switch — sending `attr[CODE]` for a non-filterable
/// attribute is a 400.
 bool get isFilterable; int get sortOrder;/// Populated for ENUM; empty for NUMBER/TEXT.
 List<AttributeOptionView> get options;
/// Create a copy of AttributeView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttributeViewCopyWith<AttributeView> get copyWith => _$AttributeViewCopyWithImpl<AttributeView>(this as AttributeView, _$identity);

  /// Serializes this AttributeView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttributeView&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.canonicalUnit, canonicalUnit) || other.canonicalUnit == canonicalUnit)&&(identical(other.decimalPlaces, decimalPlaces) || other.decimalPlaces == decimalPlaces)&&(identical(other.isFilterable, isFilterable) || other.isFilterable == isFilterable)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,label,dataType,canonicalUnit,decimalPlaces,isFilterable,sortOrder,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'AttributeView(id: $id, code: $code, label: $label, dataType: $dataType, canonicalUnit: $canonicalUnit, decimalPlaces: $decimalPlaces, isFilterable: $isFilterable, sortOrder: $sortOrder, options: $options)';
}


}

/// @nodoc
abstract mixin class $AttributeViewCopyWith<$Res>  {
  factory $AttributeViewCopyWith(AttributeView value, $Res Function(AttributeView) _then) = _$AttributeViewCopyWithImpl;
@useResult
$Res call({
 String id, String code, Localized label,@JsonKey(unknownEnumValue: AttributeType.unknown) AttributeType dataType, String? canonicalUnit, int? decimalPlaces, bool isFilterable, int sortOrder, List<AttributeOptionView> options
});


$LocalizedCopyWith<$Res> get label;

}
/// @nodoc
class _$AttributeViewCopyWithImpl<$Res>
    implements $AttributeViewCopyWith<$Res> {
  _$AttributeViewCopyWithImpl(this._self, this._then);

  final AttributeView _self;
  final $Res Function(AttributeView) _then;

/// Create a copy of AttributeView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? code = null,Object? label = null,Object? dataType = null,Object? canonicalUnit = freezed,Object? decimalPlaces = freezed,Object? isFilterable = null,Object? sortOrder = null,Object? options = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as AttributeType,canonicalUnit: freezed == canonicalUnit ? _self.canonicalUnit : canonicalUnit // ignore: cast_nullable_to_non_nullable
as String?,decimalPlaces: freezed == decimalPlaces ? _self.decimalPlaces : decimalPlaces // ignore: cast_nullable_to_non_nullable
as int?,isFilterable: null == isFilterable ? _self.isFilterable : isFilterable // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<AttributeOptionView>,
  ));
}
/// Create a copy of AttributeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttributeView].
extension AttributeViewPatterns on AttributeView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttributeView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttributeView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttributeView value)  $default,){
final _that = this;
switch (_that) {
case _AttributeView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttributeView value)?  $default,){
final _that = this;
switch (_that) {
case _AttributeView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String code,  Localized label, @JsonKey(unknownEnumValue: AttributeType.unknown)  AttributeType dataType,  String? canonicalUnit,  int? decimalPlaces,  bool isFilterable,  int sortOrder,  List<AttributeOptionView> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttributeView() when $default != null:
return $default(_that.id,_that.code,_that.label,_that.dataType,_that.canonicalUnit,_that.decimalPlaces,_that.isFilterable,_that.sortOrder,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String code,  Localized label, @JsonKey(unknownEnumValue: AttributeType.unknown)  AttributeType dataType,  String? canonicalUnit,  int? decimalPlaces,  bool isFilterable,  int sortOrder,  List<AttributeOptionView> options)  $default,) {final _that = this;
switch (_that) {
case _AttributeView():
return $default(_that.id,_that.code,_that.label,_that.dataType,_that.canonicalUnit,_that.decimalPlaces,_that.isFilterable,_that.sortOrder,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String code,  Localized label, @JsonKey(unknownEnumValue: AttributeType.unknown)  AttributeType dataType,  String? canonicalUnit,  int? decimalPlaces,  bool isFilterable,  int sortOrder,  List<AttributeOptionView> options)?  $default,) {final _that = this;
switch (_that) {
case _AttributeView() when $default != null:
return $default(_that.id,_that.code,_that.label,_that.dataType,_that.canonicalUnit,_that.decimalPlaces,_that.isFilterable,_that.sortOrder,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttributeView implements AttributeView {
  const _AttributeView({required this.id, required this.code, required this.label, @JsonKey(unknownEnumValue: AttributeType.unknown) this.dataType = AttributeType.unknown, this.canonicalUnit, this.decimalPlaces, this.isFilterable = true, this.sortOrder = 0, final  List<AttributeOptionView> options = const <AttributeOptionView>[]}): _options = options;
  factory _AttributeView.fromJson(Map<String, dynamic> json) => _$AttributeViewFromJson(json);

@override final  String id;
/// **This is what you send as `attr[CODE]`** — filters key on the code,
/// never the id.
@override final  String code;
@override final  Localized label;
@override@JsonKey(unknownEnumValue: AttributeType.unknown) final  AttributeType dataType;
@override final  String? canonicalUnit;
/// NUMBER only. `0` = whole numbers, `null` = unconstrained.
@override final  int? decimalPlaces;
/// Global kill-switch — sending `attr[CODE]` for a non-filterable
/// attribute is a 400.
@override@JsonKey() final  bool isFilterable;
@override@JsonKey() final  int sortOrder;
/// Populated for ENUM; empty for NUMBER/TEXT.
 final  List<AttributeOptionView> _options;
/// Populated for ENUM; empty for NUMBER/TEXT.
@override@JsonKey() List<AttributeOptionView> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of AttributeView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttributeViewCopyWith<_AttributeView> get copyWith => __$AttributeViewCopyWithImpl<_AttributeView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttributeViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttributeView&&(identical(other.id, id) || other.id == id)&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.dataType, dataType) || other.dataType == dataType)&&(identical(other.canonicalUnit, canonicalUnit) || other.canonicalUnit == canonicalUnit)&&(identical(other.decimalPlaces, decimalPlaces) || other.decimalPlaces == decimalPlaces)&&(identical(other.isFilterable, isFilterable) || other.isFilterable == isFilterable)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,code,label,dataType,canonicalUnit,decimalPlaces,isFilterable,sortOrder,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'AttributeView(id: $id, code: $code, label: $label, dataType: $dataType, canonicalUnit: $canonicalUnit, decimalPlaces: $decimalPlaces, isFilterable: $isFilterable, sortOrder: $sortOrder, options: $options)';
}


}

/// @nodoc
abstract mixin class _$AttributeViewCopyWith<$Res> implements $AttributeViewCopyWith<$Res> {
  factory _$AttributeViewCopyWith(_AttributeView value, $Res Function(_AttributeView) _then) = __$AttributeViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String code, Localized label,@JsonKey(unknownEnumValue: AttributeType.unknown) AttributeType dataType, String? canonicalUnit, int? decimalPlaces, bool isFilterable, int sortOrder, List<AttributeOptionView> options
});


@override $LocalizedCopyWith<$Res> get label;

}
/// @nodoc
class __$AttributeViewCopyWithImpl<$Res>
    implements _$AttributeViewCopyWith<$Res> {
  __$AttributeViewCopyWithImpl(this._self, this._then);

  final _AttributeView _self;
  final $Res Function(_AttributeView) _then;

/// Create a copy of AttributeView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? code = null,Object? label = null,Object? dataType = null,Object? canonicalUnit = freezed,Object? decimalPlaces = freezed,Object? isFilterable = null,Object? sortOrder = null,Object? options = null,}) {
  return _then(_AttributeView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,dataType: null == dataType ? _self.dataType : dataType // ignore: cast_nullable_to_non_nullable
as AttributeType,canonicalUnit: freezed == canonicalUnit ? _self.canonicalUnit : canonicalUnit // ignore: cast_nullable_to_non_nullable
as String?,decimalPlaces: freezed == decimalPlaces ? _self.decimalPlaces : decimalPlaces // ignore: cast_nullable_to_non_nullable
as int?,isFilterable: null == isFilterable ? _self.isFilterable : isFilterable // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<AttributeOptionView>,
  ));
}

/// Create a copy of AttributeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}

// dart format on
