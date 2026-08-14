// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductImageRef {

 String get url; String? get thumbnailUrl;
/// Create a copy of ProductImageRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductImageRefCopyWith<ProductImageRef> get copyWith => _$ProductImageRefCopyWithImpl<ProductImageRef>(this as ProductImageRef, _$identity);

  /// Serializes this ProductImageRef to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductImageRef&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,thumbnailUrl);

@override
String toString() {
  return 'ProductImageRef(url: $url, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class $ProductImageRefCopyWith<$Res>  {
  factory $ProductImageRefCopyWith(ProductImageRef value, $Res Function(ProductImageRef) _then) = _$ProductImageRefCopyWithImpl;
@useResult
$Res call({
 String url, String? thumbnailUrl
});




}
/// @nodoc
class _$ProductImageRefCopyWithImpl<$Res>
    implements $ProductImageRefCopyWith<$Res> {
  _$ProductImageRefCopyWithImpl(this._self, this._then);

  final ProductImageRef _self;
  final $Res Function(ProductImageRef) _then;

/// Create a copy of ProductImageRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = null,Object? thumbnailUrl = freezed,}) {
  return _then(_self.copyWith(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductImageRef].
extension ProductImageRefPatterns on ProductImageRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductImageRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductImageRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductImageRef value)  $default,){
final _that = this;
switch (_that) {
case _ProductImageRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductImageRef value)?  $default,){
final _that = this;
switch (_that) {
case _ProductImageRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String url,  String? thumbnailUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductImageRef() when $default != null:
return $default(_that.url,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String url,  String? thumbnailUrl)  $default,) {final _that = this;
switch (_that) {
case _ProductImageRef():
return $default(_that.url,_that.thumbnailUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String url,  String? thumbnailUrl)?  $default,) {final _that = this;
switch (_that) {
case _ProductImageRef() when $default != null:
return $default(_that.url,_that.thumbnailUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductImageRef implements ProductImageRef {
  const _ProductImageRef({required this.url, this.thumbnailUrl});
  factory _ProductImageRef.fromJson(Map<String, dynamic> json) => _$ProductImageRefFromJson(json);

@override final  String url;
@override final  String? thumbnailUrl;

/// Create a copy of ProductImageRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductImageRefCopyWith<_ProductImageRef> get copyWith => __$ProductImageRefCopyWithImpl<_ProductImageRef>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductImageRefToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductImageRef&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,url,thumbnailUrl);

@override
String toString() {
  return 'ProductImageRef(url: $url, thumbnailUrl: $thumbnailUrl)';
}


}

/// @nodoc
abstract mixin class _$ProductImageRefCopyWith<$Res> implements $ProductImageRefCopyWith<$Res> {
  factory _$ProductImageRefCopyWith(_ProductImageRef value, $Res Function(_ProductImageRef) _then) = __$ProductImageRefCopyWithImpl;
@override @useResult
$Res call({
 String url, String? thumbnailUrl
});




}
/// @nodoc
class __$ProductImageRefCopyWithImpl<$Res>
    implements _$ProductImageRefCopyWith<$Res> {
  __$ProductImageRefCopyWithImpl(this._self, this._then);

  final _ProductImageRef _self;
  final $Res Function(_ProductImageRef) _then;

/// Create a copy of ProductImageRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = null,Object? thumbnailUrl = freezed,}) {
  return _then(_ProductImageRef(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HighlightView {

 String get code; Localized get label; String? get unit;/// **Pre-rendered** (`"30 W"`, `"50 / 60 Hz"`, `"≥ 90"`). Display as-is
/// — never reformat, the unit and qualifier are already baked in.
 Localized get display;
/// Create a copy of HighlightView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HighlightViewCopyWith<HighlightView> get copyWith => _$HighlightViewCopyWithImpl<HighlightView>(this as HighlightView, _$identity);

  /// Serializes this HighlightView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HighlightView&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.display, display) || other.display == display));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,unit,display);

@override
String toString() {
  return 'HighlightView(code: $code, label: $label, unit: $unit, display: $display)';
}


}

/// @nodoc
abstract mixin class $HighlightViewCopyWith<$Res>  {
  factory $HighlightViewCopyWith(HighlightView value, $Res Function(HighlightView) _then) = _$HighlightViewCopyWithImpl;
@useResult
$Res call({
 String code, Localized label, String? unit, Localized display
});


$LocalizedCopyWith<$Res> get label;$LocalizedCopyWith<$Res> get display;

}
/// @nodoc
class _$HighlightViewCopyWithImpl<$Res>
    implements $HighlightViewCopyWith<$Res> {
  _$HighlightViewCopyWithImpl(this._self, this._then);

  final HighlightView _self;
  final $Res Function(HighlightView) _then;

/// Create a copy of HighlightView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? label = null,Object? unit = freezed,Object? display = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,display: null == display ? _self.display : display // ignore: cast_nullable_to_non_nullable
as Localized,
  ));
}
/// Create a copy of HighlightView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of HighlightView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get display {
  
  return $LocalizedCopyWith<$Res>(_self.display, (value) {
    return _then(_self.copyWith(display: value));
  });
}
}


/// Adds pattern-matching-related methods to [HighlightView].
extension HighlightViewPatterns on HighlightView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HighlightView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HighlightView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HighlightView value)  $default,){
final _that = this;
switch (_that) {
case _HighlightView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HighlightView value)?  $default,){
final _that = this;
switch (_that) {
case _HighlightView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  Localized label,  String? unit,  Localized display)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HighlightView() when $default != null:
return $default(_that.code,_that.label,_that.unit,_that.display);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  Localized label,  String? unit,  Localized display)  $default,) {final _that = this;
switch (_that) {
case _HighlightView():
return $default(_that.code,_that.label,_that.unit,_that.display);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  Localized label,  String? unit,  Localized display)?  $default,) {final _that = this;
switch (_that) {
case _HighlightView() when $default != null:
return $default(_that.code,_that.label,_that.unit,_that.display);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HighlightView implements HighlightView {
  const _HighlightView({required this.code, required this.label, this.unit, required this.display});
  factory _HighlightView.fromJson(Map<String, dynamic> json) => _$HighlightViewFromJson(json);

@override final  String code;
@override final  Localized label;
@override final  String? unit;
/// **Pre-rendered** (`"30 W"`, `"50 / 60 Hz"`, `"≥ 90"`). Display as-is
/// — never reformat, the unit and qualifier are already baked in.
@override final  Localized display;

/// Create a copy of HighlightView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HighlightViewCopyWith<_HighlightView> get copyWith => __$HighlightViewCopyWithImpl<_HighlightView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HighlightViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HighlightView&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.display, display) || other.display == display));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,unit,display);

@override
String toString() {
  return 'HighlightView(code: $code, label: $label, unit: $unit, display: $display)';
}


}

/// @nodoc
abstract mixin class _$HighlightViewCopyWith<$Res> implements $HighlightViewCopyWith<$Res> {
  factory _$HighlightViewCopyWith(_HighlightView value, $Res Function(_HighlightView) _then) = __$HighlightViewCopyWithImpl;
@override @useResult
$Res call({
 String code, Localized label, String? unit, Localized display
});


@override $LocalizedCopyWith<$Res> get label;@override $LocalizedCopyWith<$Res> get display;

}
/// @nodoc
class __$HighlightViewCopyWithImpl<$Res>
    implements _$HighlightViewCopyWith<$Res> {
  __$HighlightViewCopyWithImpl(this._self, this._then);

  final _HighlightView _self;
  final $Res Function(_HighlightView) _then;

/// Create a copy of HighlightView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,Object? unit = freezed,Object? display = null,}) {
  return _then(_HighlightView(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,display: null == display ? _self.display : display // ignore: cast_nullable_to_non_nullable
as Localized,
  ));
}

/// Create a copy of HighlightView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of HighlightView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get display {
  
  return $LocalizedCopyWith<$Res>(_self.display, (value) {
    return _then(_self.copyWith(display: value));
  });
}
}


/// @nodoc
mixin _$MediaView {

 String? get id;@JsonKey(unknownEnumValue: MediaType.unknown) MediaType get type; String get url; String? get thumbnailUrl; Localized? get alt; int get sortOrder;
/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaViewCopyWith<MediaView> get copyWith => _$MediaViewCopyWithImpl<MediaView>(this as MediaView, _$identity);

  /// Serializes this MediaView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaView&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,url,thumbnailUrl,alt,sortOrder);

@override
String toString() {
  return 'MediaView(id: $id, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, alt: $alt, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $MediaViewCopyWith<$Res>  {
  factory $MediaViewCopyWith(MediaView value, $Res Function(MediaView) _then) = _$MediaViewCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(unknownEnumValue: MediaType.unknown) MediaType type, String url, String? thumbnailUrl, Localized? alt, int sortOrder
});


$LocalizedCopyWith<$Res>? get alt;

}
/// @nodoc
class _$MediaViewCopyWithImpl<$Res>
    implements $MediaViewCopyWith<$Res> {
  _$MediaViewCopyWithImpl(this._self, this._then);

  final MediaView _self;
  final $Res Function(MediaView) _then;

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = null,Object? url = null,Object? thumbnailUrl = freezed,Object? alt = freezed,Object? sortOrder = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as Localized?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get alt {
    if (_self.alt == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.alt!, (value) {
    return _then(_self.copyWith(alt: value));
  });
}
}


/// Adds pattern-matching-related methods to [MediaView].
extension MediaViewPatterns on MediaView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaView value)  $default,){
final _that = this;
switch (_that) {
case _MediaView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaView value)?  $default,){
final _that = this;
switch (_that) {
case _MediaView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(unknownEnumValue: MediaType.unknown)  MediaType type,  String url,  String? thumbnailUrl,  Localized? alt,  int sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaView() when $default != null:
return $default(_that.id,_that.type,_that.url,_that.thumbnailUrl,_that.alt,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(unknownEnumValue: MediaType.unknown)  MediaType type,  String url,  String? thumbnailUrl,  Localized? alt,  int sortOrder)  $default,) {final _that = this;
switch (_that) {
case _MediaView():
return $default(_that.id,_that.type,_that.url,_that.thumbnailUrl,_that.alt,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(unknownEnumValue: MediaType.unknown)  MediaType type,  String url,  String? thumbnailUrl,  Localized? alt,  int sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _MediaView() when $default != null:
return $default(_that.id,_that.type,_that.url,_that.thumbnailUrl,_that.alt,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaView implements MediaView {
  const _MediaView({this.id, @JsonKey(unknownEnumValue: MediaType.unknown) this.type = MediaType.unknown, required this.url, this.thumbnailUrl, this.alt, this.sortOrder = 0});
  factory _MediaView.fromJson(Map<String, dynamic> json) => _$MediaViewFromJson(json);

@override final  String? id;
@override@JsonKey(unknownEnumValue: MediaType.unknown) final  MediaType type;
@override final  String url;
@override final  String? thumbnailUrl;
@override final  Localized? alt;
@override@JsonKey() final  int sortOrder;

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaViewCopyWith<_MediaView> get copyWith => __$MediaViewCopyWithImpl<_MediaView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaView&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.alt, alt) || other.alt == alt)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,url,thumbnailUrl,alt,sortOrder);

@override
String toString() {
  return 'MediaView(id: $id, type: $type, url: $url, thumbnailUrl: $thumbnailUrl, alt: $alt, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$MediaViewCopyWith<$Res> implements $MediaViewCopyWith<$Res> {
  factory _$MediaViewCopyWith(_MediaView value, $Res Function(_MediaView) _then) = __$MediaViewCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(unknownEnumValue: MediaType.unknown) MediaType type, String url, String? thumbnailUrl, Localized? alt, int sortOrder
});


@override $LocalizedCopyWith<$Res>? get alt;

}
/// @nodoc
class __$MediaViewCopyWithImpl<$Res>
    implements _$MediaViewCopyWith<$Res> {
  __$MediaViewCopyWithImpl(this._self, this._then);

  final _MediaView _self;
  final $Res Function(_MediaView) _then;

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? url = null,Object? thumbnailUrl = freezed,Object? alt = freezed,Object? sortOrder = null,}) {
  return _then(_MediaView(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MediaType,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,alt: freezed == alt ? _self.alt : alt // ignore: cast_nullable_to_non_nullable
as Localized?,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of MediaView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get alt {
    if (_self.alt == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.alt!, (value) {
    return _then(_self.copyWith(alt: value));
  });
}
}


/// @nodoc
mixin _$SpecSheetRow {

/// `null` marks an **extra spec** — a free-form row no attribute claims.
 String? get code; Localized get label; Localized get value;
/// Create a copy of SpecSheetRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecSheetRowCopyWith<SpecSheetRow> get copyWith => _$SpecSheetRowCopyWithImpl<SpecSheetRow>(this as SpecSheetRow, _$identity);

  /// Serializes this SpecSheetRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecSheetRow&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,value);

@override
String toString() {
  return 'SpecSheetRow(code: $code, label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class $SpecSheetRowCopyWith<$Res>  {
  factory $SpecSheetRowCopyWith(SpecSheetRow value, $Res Function(SpecSheetRow) _then) = _$SpecSheetRowCopyWithImpl;
@useResult
$Res call({
 String? code, Localized label, Localized value
});


$LocalizedCopyWith<$Res> get label;$LocalizedCopyWith<$Res> get value;

}
/// @nodoc
class _$SpecSheetRowCopyWithImpl<$Res>
    implements $SpecSheetRowCopyWith<$Res> {
  _$SpecSheetRowCopyWithImpl(this._self, this._then);

  final SpecSheetRow _self;
  final $Res Function(SpecSheetRow) _then;

/// Create a copy of SpecSheetRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = freezed,Object? label = null,Object? value = null,}) {
  return _then(_self.copyWith(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Localized,
  ));
}
/// Create a copy of SpecSheetRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of SpecSheetRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get value {
  
  return $LocalizedCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}


/// Adds pattern-matching-related methods to [SpecSheetRow].
extension SpecSheetRowPatterns on SpecSheetRow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecSheetRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecSheetRow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecSheetRow value)  $default,){
final _that = this;
switch (_that) {
case _SpecSheetRow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecSheetRow value)?  $default,){
final _that = this;
switch (_that) {
case _SpecSheetRow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? code,  Localized label,  Localized value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecSheetRow() when $default != null:
return $default(_that.code,_that.label,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? code,  Localized label,  Localized value)  $default,) {final _that = this;
switch (_that) {
case _SpecSheetRow():
return $default(_that.code,_that.label,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? code,  Localized label,  Localized value)?  $default,) {final _that = this;
switch (_that) {
case _SpecSheetRow() when $default != null:
return $default(_that.code,_that.label,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecSheetRow implements SpecSheetRow {
  const _SpecSheetRow({this.code, required this.label, required this.value});
  factory _SpecSheetRow.fromJson(Map<String, dynamic> json) => _$SpecSheetRowFromJson(json);

/// `null` marks an **extra spec** — a free-form row no attribute claims.
@override final  String? code;
@override final  Localized label;
@override final  Localized value;

/// Create a copy of SpecSheetRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecSheetRowCopyWith<_SpecSheetRow> get copyWith => __$SpecSheetRowCopyWithImpl<_SpecSheetRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecSheetRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecSheetRow&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label,value);

@override
String toString() {
  return 'SpecSheetRow(code: $code, label: $label, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SpecSheetRowCopyWith<$Res> implements $SpecSheetRowCopyWith<$Res> {
  factory _$SpecSheetRowCopyWith(_SpecSheetRow value, $Res Function(_SpecSheetRow) _then) = __$SpecSheetRowCopyWithImpl;
@override @useResult
$Res call({
 String? code, Localized label, Localized value
});


@override $LocalizedCopyWith<$Res> get label;@override $LocalizedCopyWith<$Res> get value;

}
/// @nodoc
class __$SpecSheetRowCopyWithImpl<$Res>
    implements _$SpecSheetRowCopyWith<$Res> {
  __$SpecSheetRowCopyWithImpl(this._self, this._then);

  final _SpecSheetRow _self;
  final $Res Function(_SpecSheetRow) _then;

/// Create a copy of SpecSheetRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = freezed,Object? label = null,Object? value = null,}) {
  return _then(_SpecSheetRow(
code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as Localized,
  ));
}

/// Create a copy of SpecSheetRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of SpecSheetRow
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get value {
  
  return $LocalizedCopyWith<$Res>(_self.value, (value) {
    return _then(_self.copyWith(value: value));
  });
}
}


/// @nodoc
mixin _$ProductListItemView {

 String get id; String get slug; String? get sku; String? get itemNumber; Localized get name;/// `null` when the product is unfiled (`Product.categoryId` is
/// nullable). **Handle it** — a card must still render.
 CategoryRefView? get category; ProductImageRef? get primaryImage;/// Typed facets for this product's category binding, so a card renders
/// without a second call. Empty when unfiled or the category binds none.
 List<HighlightView> get highlights;/// **Advisory only** (CP7 — the ERP owns real stock). Never hide a
/// product because of it.
 bool get isAvailable;@JsonKey(unknownEnumValue: ProductStatus.unknown) ProductStatus get status; String? get checksum;
/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductListItemViewCopyWith<ProductListItemView> get copyWith => _$ProductListItemViewCopyWithImpl<ProductListItemView>(this as ProductListItemView, _$identity);

  /// Serializes this ProductListItemView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListItemView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.itemNumber, itemNumber) || other.itemNumber == itemNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage)&&const DeepCollectionEquality().equals(other.highlights, highlights)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.status, status) || other.status == status)&&(identical(other.checksum, checksum) || other.checksum == checksum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,sku,itemNumber,name,category,primaryImage,const DeepCollectionEquality().hash(highlights),isAvailable,status,checksum);

@override
String toString() {
  return 'ProductListItemView(id: $id, slug: $slug, sku: $sku, itemNumber: $itemNumber, name: $name, category: $category, primaryImage: $primaryImage, highlights: $highlights, isAvailable: $isAvailable, status: $status, checksum: $checksum)';
}


}

/// @nodoc
abstract mixin class $ProductListItemViewCopyWith<$Res>  {
  factory $ProductListItemViewCopyWith(ProductListItemView value, $Res Function(ProductListItemView) _then) = _$ProductListItemViewCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String? sku, String? itemNumber, Localized name, CategoryRefView? category, ProductImageRef? primaryImage, List<HighlightView> highlights, bool isAvailable,@JsonKey(unknownEnumValue: ProductStatus.unknown) ProductStatus status, String? checksum
});


$LocalizedCopyWith<$Res> get name;$CategoryRefViewCopyWith<$Res>? get category;$ProductImageRefCopyWith<$Res>? get primaryImage;

}
/// @nodoc
class _$ProductListItemViewCopyWithImpl<$Res>
    implements $ProductListItemViewCopyWith<$Res> {
  _$ProductListItemViewCopyWithImpl(this._self, this._then);

  final ProductListItemView _self;
  final $Res Function(ProductListItemView) _then;

/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? sku = freezed,Object? itemNumber = freezed,Object? name = null,Object? category = freezed,Object? primaryImage = freezed,Object? highlights = null,Object? isAvailable = null,Object? status = null,Object? checksum = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,itemNumber: freezed == itemNumber ? _self.itemNumber : itemNumber // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryRefView?,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as ProductImageRef?,highlights: null == highlights ? _self.highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<HighlightView>,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductStatus,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryRefViewCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryRefViewCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductImageRefCopyWith<$Res>? get primaryImage {
    if (_self.primaryImage == null) {
    return null;
  }

  return $ProductImageRefCopyWith<$Res>(_self.primaryImage!, (value) {
    return _then(_self.copyWith(primaryImage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductListItemView].
extension ProductListItemViewPatterns on ProductListItemView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductListItemView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductListItemView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductListItemView value)  $default,){
final _that = this;
switch (_that) {
case _ProductListItemView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductListItemView value)?  $default,){
final _that = this;
switch (_that) {
case _ProductListItemView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String? sku,  String? itemNumber,  Localized name,  CategoryRefView? category,  ProductImageRef? primaryImage,  List<HighlightView> highlights,  bool isAvailable, @JsonKey(unknownEnumValue: ProductStatus.unknown)  ProductStatus status,  String? checksum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductListItemView() when $default != null:
return $default(_that.id,_that.slug,_that.sku,_that.itemNumber,_that.name,_that.category,_that.primaryImage,_that.highlights,_that.isAvailable,_that.status,_that.checksum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String? sku,  String? itemNumber,  Localized name,  CategoryRefView? category,  ProductImageRef? primaryImage,  List<HighlightView> highlights,  bool isAvailable, @JsonKey(unknownEnumValue: ProductStatus.unknown)  ProductStatus status,  String? checksum)  $default,) {final _that = this;
switch (_that) {
case _ProductListItemView():
return $default(_that.id,_that.slug,_that.sku,_that.itemNumber,_that.name,_that.category,_that.primaryImage,_that.highlights,_that.isAvailable,_that.status,_that.checksum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String? sku,  String? itemNumber,  Localized name,  CategoryRefView? category,  ProductImageRef? primaryImage,  List<HighlightView> highlights,  bool isAvailable, @JsonKey(unknownEnumValue: ProductStatus.unknown)  ProductStatus status,  String? checksum)?  $default,) {final _that = this;
switch (_that) {
case _ProductListItemView() when $default != null:
return $default(_that.id,_that.slug,_that.sku,_that.itemNumber,_that.name,_that.category,_that.primaryImage,_that.highlights,_that.isAvailable,_that.status,_that.checksum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductListItemView implements ProductListItemView {
  const _ProductListItemView({required this.id, required this.slug, this.sku, this.itemNumber, required this.name, this.category, this.primaryImage, final  List<HighlightView> highlights = const <HighlightView>[], this.isAvailable = true, @JsonKey(unknownEnumValue: ProductStatus.unknown) this.status = ProductStatus.active, this.checksum}): _highlights = highlights;
  factory _ProductListItemView.fromJson(Map<String, dynamic> json) => _$ProductListItemViewFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String? sku;
@override final  String? itemNumber;
@override final  Localized name;
/// `null` when the product is unfiled (`Product.categoryId` is
/// nullable). **Handle it** — a card must still render.
@override final  CategoryRefView? category;
@override final  ProductImageRef? primaryImage;
/// Typed facets for this product's category binding, so a card renders
/// without a second call. Empty when unfiled or the category binds none.
 final  List<HighlightView> _highlights;
/// Typed facets for this product's category binding, so a card renders
/// without a second call. Empty when unfiled or the category binds none.
@override@JsonKey() List<HighlightView> get highlights {
  if (_highlights is EqualUnmodifiableListView) return _highlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlights);
}

/// **Advisory only** (CP7 — the ERP owns real stock). Never hide a
/// product because of it.
@override@JsonKey() final  bool isAvailable;
@override@JsonKey(unknownEnumValue: ProductStatus.unknown) final  ProductStatus status;
@override final  String? checksum;

/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductListItemViewCopyWith<_ProductListItemView> get copyWith => __$ProductListItemViewCopyWithImpl<_ProductListItemView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductListItemViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductListItemView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.itemNumber, itemNumber) || other.itemNumber == itemNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage)&&const DeepCollectionEquality().equals(other._highlights, _highlights)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.status, status) || other.status == status)&&(identical(other.checksum, checksum) || other.checksum == checksum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,sku,itemNumber,name,category,primaryImage,const DeepCollectionEquality().hash(_highlights),isAvailable,status,checksum);

@override
String toString() {
  return 'ProductListItemView(id: $id, slug: $slug, sku: $sku, itemNumber: $itemNumber, name: $name, category: $category, primaryImage: $primaryImage, highlights: $highlights, isAvailable: $isAvailable, status: $status, checksum: $checksum)';
}


}

/// @nodoc
abstract mixin class _$ProductListItemViewCopyWith<$Res> implements $ProductListItemViewCopyWith<$Res> {
  factory _$ProductListItemViewCopyWith(_ProductListItemView value, $Res Function(_ProductListItemView) _then) = __$ProductListItemViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String? sku, String? itemNumber, Localized name, CategoryRefView? category, ProductImageRef? primaryImage, List<HighlightView> highlights, bool isAvailable,@JsonKey(unknownEnumValue: ProductStatus.unknown) ProductStatus status, String? checksum
});


@override $LocalizedCopyWith<$Res> get name;@override $CategoryRefViewCopyWith<$Res>? get category;@override $ProductImageRefCopyWith<$Res>? get primaryImage;

}
/// @nodoc
class __$ProductListItemViewCopyWithImpl<$Res>
    implements _$ProductListItemViewCopyWith<$Res> {
  __$ProductListItemViewCopyWithImpl(this._self, this._then);

  final _ProductListItemView _self;
  final $Res Function(_ProductListItemView) _then;

/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? sku = freezed,Object? itemNumber = freezed,Object? name = null,Object? category = freezed,Object? primaryImage = freezed,Object? highlights = null,Object? isAvailable = null,Object? status = null,Object? checksum = freezed,}) {
  return _then(_ProductListItemView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,itemNumber: freezed == itemNumber ? _self.itemNumber : itemNumber // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryRefView?,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as ProductImageRef?,highlights: null == highlights ? _self._highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<HighlightView>,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductStatus,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryRefViewCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryRefViewCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductListItemView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductImageRefCopyWith<$Res>? get primaryImage {
    if (_self.primaryImage == null) {
    return null;
  }

  return $ProductImageRefCopyWith<$Res>(_self.primaryImage!, (value) {
    return _then(_self.copyWith(primaryImage: value));
  });
}
}


/// @nodoc
mixin _$ProductDetailView {

 String get id; String get slug; String? get sku; String? get itemNumber; Localized get name; Localized? get description;/// Free-text marketing bullets — **distinct from [highlights]**, which
/// are typed facets.
 List<Localized> get highlightPoints; CategoryRefView? get category; List<CategoryRefView> get breadcrumb; ProductImageRef? get primaryImage;/// **All** media — both `IMAGE` and `DATASHEET`. The gallery must filter
/// client-side.
 List<MediaView> get media; List<HighlightView> get highlights; List<SpecSheetRow> get specSheet; bool get hasDatasheet; bool get isAvailable;/// ⚠️ This is the **one** endpoint where `DISCONTINUED` can appear
/// (BR-2) — a discontinued product still returns 200 because historical
/// activities reference it. Render a banner; never 404 it yourself.
@JsonKey(unknownEnumValue: ProductStatus.unknown) ProductStatus get status; String? get checksum;
/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailViewCopyWith<ProductDetailView> get copyWith => _$ProductDetailViewCopyWithImpl<ProductDetailView>(this as ProductDetailView, _$identity);

  /// Serializes this ProductDetailView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.itemNumber, itemNumber) || other.itemNumber == itemNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.highlightPoints, highlightPoints)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.breadcrumb, breadcrumb)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage)&&const DeepCollectionEquality().equals(other.media, media)&&const DeepCollectionEquality().equals(other.highlights, highlights)&&const DeepCollectionEquality().equals(other.specSheet, specSheet)&&(identical(other.hasDatasheet, hasDatasheet) || other.hasDatasheet == hasDatasheet)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.status, status) || other.status == status)&&(identical(other.checksum, checksum) || other.checksum == checksum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,sku,itemNumber,name,description,const DeepCollectionEquality().hash(highlightPoints),category,const DeepCollectionEquality().hash(breadcrumb),primaryImage,const DeepCollectionEquality().hash(media),const DeepCollectionEquality().hash(highlights),const DeepCollectionEquality().hash(specSheet),hasDatasheet,isAvailable,status,checksum);

@override
String toString() {
  return 'ProductDetailView(id: $id, slug: $slug, sku: $sku, itemNumber: $itemNumber, name: $name, description: $description, highlightPoints: $highlightPoints, category: $category, breadcrumb: $breadcrumb, primaryImage: $primaryImage, media: $media, highlights: $highlights, specSheet: $specSheet, hasDatasheet: $hasDatasheet, isAvailable: $isAvailable, status: $status, checksum: $checksum)';
}


}

/// @nodoc
abstract mixin class $ProductDetailViewCopyWith<$Res>  {
  factory $ProductDetailViewCopyWith(ProductDetailView value, $Res Function(ProductDetailView) _then) = _$ProductDetailViewCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String? sku, String? itemNumber, Localized name, Localized? description, List<Localized> highlightPoints, CategoryRefView? category, List<CategoryRefView> breadcrumb, ProductImageRef? primaryImage, List<MediaView> media, List<HighlightView> highlights, List<SpecSheetRow> specSheet, bool hasDatasheet, bool isAvailable,@JsonKey(unknownEnumValue: ProductStatus.unknown) ProductStatus status, String? checksum
});


$LocalizedCopyWith<$Res> get name;$LocalizedCopyWith<$Res>? get description;$CategoryRefViewCopyWith<$Res>? get category;$ProductImageRefCopyWith<$Res>? get primaryImage;

}
/// @nodoc
class _$ProductDetailViewCopyWithImpl<$Res>
    implements $ProductDetailViewCopyWith<$Res> {
  _$ProductDetailViewCopyWithImpl(this._self, this._then);

  final ProductDetailView _self;
  final $Res Function(ProductDetailView) _then;

/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? sku = freezed,Object? itemNumber = freezed,Object? name = null,Object? description = freezed,Object? highlightPoints = null,Object? category = freezed,Object? breadcrumb = null,Object? primaryImage = freezed,Object? media = null,Object? highlights = null,Object? specSheet = null,Object? hasDatasheet = null,Object? isAvailable = null,Object? status = null,Object? checksum = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,itemNumber: freezed == itemNumber ? _self.itemNumber : itemNumber // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Localized?,highlightPoints: null == highlightPoints ? _self.highlightPoints : highlightPoints // ignore: cast_nullable_to_non_nullable
as List<Localized>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryRefView?,breadcrumb: null == breadcrumb ? _self.breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as List<CategoryRefView>,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as ProductImageRef?,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<MediaView>,highlights: null == highlights ? _self.highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<HighlightView>,specSheet: null == specSheet ? _self.specSheet : specSheet // ignore: cast_nullable_to_non_nullable
as List<SpecSheetRow>,hasDatasheet: null == hasDatasheet ? _self.hasDatasheet : hasDatasheet // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductStatus,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get description {
    if (_self.description == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.description!, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryRefViewCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryRefViewCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductImageRefCopyWith<$Res>? get primaryImage {
    if (_self.primaryImage == null) {
    return null;
  }

  return $ProductImageRefCopyWith<$Res>(_self.primaryImage!, (value) {
    return _then(_self.copyWith(primaryImage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductDetailView].
extension ProductDetailViewPatterns on ProductDetailView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailView value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailView value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String? sku,  String? itemNumber,  Localized name,  Localized? description,  List<Localized> highlightPoints,  CategoryRefView? category,  List<CategoryRefView> breadcrumb,  ProductImageRef? primaryImage,  List<MediaView> media,  List<HighlightView> highlights,  List<SpecSheetRow> specSheet,  bool hasDatasheet,  bool isAvailable, @JsonKey(unknownEnumValue: ProductStatus.unknown)  ProductStatus status,  String? checksum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailView() when $default != null:
return $default(_that.id,_that.slug,_that.sku,_that.itemNumber,_that.name,_that.description,_that.highlightPoints,_that.category,_that.breadcrumb,_that.primaryImage,_that.media,_that.highlights,_that.specSheet,_that.hasDatasheet,_that.isAvailable,_that.status,_that.checksum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String? sku,  String? itemNumber,  Localized name,  Localized? description,  List<Localized> highlightPoints,  CategoryRefView? category,  List<CategoryRefView> breadcrumb,  ProductImageRef? primaryImage,  List<MediaView> media,  List<HighlightView> highlights,  List<SpecSheetRow> specSheet,  bool hasDatasheet,  bool isAvailable, @JsonKey(unknownEnumValue: ProductStatus.unknown)  ProductStatus status,  String? checksum)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailView():
return $default(_that.id,_that.slug,_that.sku,_that.itemNumber,_that.name,_that.description,_that.highlightPoints,_that.category,_that.breadcrumb,_that.primaryImage,_that.media,_that.highlights,_that.specSheet,_that.hasDatasheet,_that.isAvailable,_that.status,_that.checksum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String? sku,  String? itemNumber,  Localized name,  Localized? description,  List<Localized> highlightPoints,  CategoryRefView? category,  List<CategoryRefView> breadcrumb,  ProductImageRef? primaryImage,  List<MediaView> media,  List<HighlightView> highlights,  List<SpecSheetRow> specSheet,  bool hasDatasheet,  bool isAvailable, @JsonKey(unknownEnumValue: ProductStatus.unknown)  ProductStatus status,  String? checksum)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailView() when $default != null:
return $default(_that.id,_that.slug,_that.sku,_that.itemNumber,_that.name,_that.description,_that.highlightPoints,_that.category,_that.breadcrumb,_that.primaryImage,_that.media,_that.highlights,_that.specSheet,_that.hasDatasheet,_that.isAvailable,_that.status,_that.checksum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductDetailView implements ProductDetailView {
  const _ProductDetailView({required this.id, required this.slug, this.sku, this.itemNumber, required this.name, this.description, final  List<Localized> highlightPoints = const <Localized>[], this.category, final  List<CategoryRefView> breadcrumb = const <CategoryRefView>[], this.primaryImage, final  List<MediaView> media = const <MediaView>[], final  List<HighlightView> highlights = const <HighlightView>[], final  List<SpecSheetRow> specSheet = const <SpecSheetRow>[], this.hasDatasheet = false, this.isAvailable = true, @JsonKey(unknownEnumValue: ProductStatus.unknown) this.status = ProductStatus.active, this.checksum}): _highlightPoints = highlightPoints,_breadcrumb = breadcrumb,_media = media,_highlights = highlights,_specSheet = specSheet;
  factory _ProductDetailView.fromJson(Map<String, dynamic> json) => _$ProductDetailViewFromJson(json);

@override final  String id;
@override final  String slug;
@override final  String? sku;
@override final  String? itemNumber;
@override final  Localized name;
@override final  Localized? description;
/// Free-text marketing bullets — **distinct from [highlights]**, which
/// are typed facets.
 final  List<Localized> _highlightPoints;
/// Free-text marketing bullets — **distinct from [highlights]**, which
/// are typed facets.
@override@JsonKey() List<Localized> get highlightPoints {
  if (_highlightPoints is EqualUnmodifiableListView) return _highlightPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlightPoints);
}

@override final  CategoryRefView? category;
 final  List<CategoryRefView> _breadcrumb;
@override@JsonKey() List<CategoryRefView> get breadcrumb {
  if (_breadcrumb is EqualUnmodifiableListView) return _breadcrumb;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breadcrumb);
}

@override final  ProductImageRef? primaryImage;
/// **All** media — both `IMAGE` and `DATASHEET`. The gallery must filter
/// client-side.
 final  List<MediaView> _media;
/// **All** media — both `IMAGE` and `DATASHEET`. The gallery must filter
/// client-side.
@override@JsonKey() List<MediaView> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}

 final  List<HighlightView> _highlights;
@override@JsonKey() List<HighlightView> get highlights {
  if (_highlights is EqualUnmodifiableListView) return _highlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlights);
}

 final  List<SpecSheetRow> _specSheet;
@override@JsonKey() List<SpecSheetRow> get specSheet {
  if (_specSheet is EqualUnmodifiableListView) return _specSheet;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specSheet);
}

@override@JsonKey() final  bool hasDatasheet;
@override@JsonKey() final  bool isAvailable;
/// ⚠️ This is the **one** endpoint where `DISCONTINUED` can appear
/// (BR-2) — a discontinued product still returns 200 because historical
/// activities reference it. Render a banner; never 404 it yourself.
@override@JsonKey(unknownEnumValue: ProductStatus.unknown) final  ProductStatus status;
@override final  String? checksum;

/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailViewCopyWith<_ProductDetailView> get copyWith => __$ProductDetailViewCopyWithImpl<_ProductDetailView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductDetailViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailView&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.itemNumber, itemNumber) || other.itemNumber == itemNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._highlightPoints, _highlightPoints)&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._breadcrumb, _breadcrumb)&&(identical(other.primaryImage, primaryImage) || other.primaryImage == primaryImage)&&const DeepCollectionEquality().equals(other._media, _media)&&const DeepCollectionEquality().equals(other._highlights, _highlights)&&const DeepCollectionEquality().equals(other._specSheet, _specSheet)&&(identical(other.hasDatasheet, hasDatasheet) || other.hasDatasheet == hasDatasheet)&&(identical(other.isAvailable, isAvailable) || other.isAvailable == isAvailable)&&(identical(other.status, status) || other.status == status)&&(identical(other.checksum, checksum) || other.checksum == checksum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,sku,itemNumber,name,description,const DeepCollectionEquality().hash(_highlightPoints),category,const DeepCollectionEquality().hash(_breadcrumb),primaryImage,const DeepCollectionEquality().hash(_media),const DeepCollectionEquality().hash(_highlights),const DeepCollectionEquality().hash(_specSheet),hasDatasheet,isAvailable,status,checksum);

@override
String toString() {
  return 'ProductDetailView(id: $id, slug: $slug, sku: $sku, itemNumber: $itemNumber, name: $name, description: $description, highlightPoints: $highlightPoints, category: $category, breadcrumb: $breadcrumb, primaryImage: $primaryImage, media: $media, highlights: $highlights, specSheet: $specSheet, hasDatasheet: $hasDatasheet, isAvailable: $isAvailable, status: $status, checksum: $checksum)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailViewCopyWith<$Res> implements $ProductDetailViewCopyWith<$Res> {
  factory _$ProductDetailViewCopyWith(_ProductDetailView value, $Res Function(_ProductDetailView) _then) = __$ProductDetailViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String? sku, String? itemNumber, Localized name, Localized? description, List<Localized> highlightPoints, CategoryRefView? category, List<CategoryRefView> breadcrumb, ProductImageRef? primaryImage, List<MediaView> media, List<HighlightView> highlights, List<SpecSheetRow> specSheet, bool hasDatasheet, bool isAvailable,@JsonKey(unknownEnumValue: ProductStatus.unknown) ProductStatus status, String? checksum
});


@override $LocalizedCopyWith<$Res> get name;@override $LocalizedCopyWith<$Res>? get description;@override $CategoryRefViewCopyWith<$Res>? get category;@override $ProductImageRefCopyWith<$Res>? get primaryImage;

}
/// @nodoc
class __$ProductDetailViewCopyWithImpl<$Res>
    implements _$ProductDetailViewCopyWith<$Res> {
  __$ProductDetailViewCopyWithImpl(this._self, this._then);

  final _ProductDetailView _self;
  final $Res Function(_ProductDetailView) _then;

/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? sku = freezed,Object? itemNumber = freezed,Object? name = null,Object? description = freezed,Object? highlightPoints = null,Object? category = freezed,Object? breadcrumb = null,Object? primaryImage = freezed,Object? media = null,Object? highlights = null,Object? specSheet = null,Object? hasDatasheet = null,Object? isAvailable = null,Object? status = null,Object? checksum = freezed,}) {
  return _then(_ProductDetailView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,itemNumber: freezed == itemNumber ? _self.itemNumber : itemNumber // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as Localized?,highlightPoints: null == highlightPoints ? _self._highlightPoints : highlightPoints // ignore: cast_nullable_to_non_nullable
as List<Localized>,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as CategoryRefView?,breadcrumb: null == breadcrumb ? _self._breadcrumb : breadcrumb // ignore: cast_nullable_to_non_nullable
as List<CategoryRefView>,primaryImage: freezed == primaryImage ? _self.primaryImage : primaryImage // ignore: cast_nullable_to_non_nullable
as ProductImageRef?,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<MediaView>,highlights: null == highlights ? _self._highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<HighlightView>,specSheet: null == specSheet ? _self._specSheet : specSheet // ignore: cast_nullable_to_non_nullable
as List<SpecSheetRow>,hasDatasheet: null == hasDatasheet ? _self.hasDatasheet : hasDatasheet // ignore: cast_nullable_to_non_nullable
as bool,isAvailable: null == isAvailable ? _self.isAvailable : isAvailable // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductStatus,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get description {
    if (_self.description == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.description!, (value) {
    return _then(_self.copyWith(description: value));
  });
}/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryRefViewCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryRefViewCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of ProductDetailView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductImageRefCopyWith<$Res>? get primaryImage {
    if (_self.primaryImage == null) {
    return null;
  }

  return $ProductImageRefCopyWith<$Res>(_self.primaryImage!, (value) {
    return _then(_self.copyWith(primaryImage: value));
  });
}
}


/// @nodoc
mixin _$SuggestionView {

@JsonKey(unknownEnumValue: SuggestionKind.unknown) SuggestionKind get kind; String get id; String get slug; Localized get name; String? get sku;
/// Create a copy of SuggestionView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuggestionViewCopyWith<SuggestionView> get copyWith => _$SuggestionViewCopyWithImpl<SuggestionView>(this as SuggestionView, _$identity);

  /// Serializes this SuggestionView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuggestionView&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.sku, sku) || other.sku == sku));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,id,slug,name,sku);

@override
String toString() {
  return 'SuggestionView(kind: $kind, id: $id, slug: $slug, name: $name, sku: $sku)';
}


}

/// @nodoc
abstract mixin class $SuggestionViewCopyWith<$Res>  {
  factory $SuggestionViewCopyWith(SuggestionView value, $Res Function(SuggestionView) _then) = _$SuggestionViewCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: SuggestionKind.unknown) SuggestionKind kind, String id, String slug, Localized name, String? sku
});


$LocalizedCopyWith<$Res> get name;

}
/// @nodoc
class _$SuggestionViewCopyWithImpl<$Res>
    implements $SuggestionViewCopyWith<$Res> {
  _$SuggestionViewCopyWithImpl(this._self, this._then);

  final SuggestionView _self;
  final $Res Function(SuggestionView) _then;

/// Create a copy of SuggestionView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? id = null,Object? slug = null,Object? name = null,Object? sku = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SuggestionKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SuggestionView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// Adds pattern-matching-related methods to [SuggestionView].
extension SuggestionViewPatterns on SuggestionView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SuggestionView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SuggestionView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SuggestionView value)  $default,){
final _that = this;
switch (_that) {
case _SuggestionView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SuggestionView value)?  $default,){
final _that = this;
switch (_that) {
case _SuggestionView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: SuggestionKind.unknown)  SuggestionKind kind,  String id,  String slug,  Localized name,  String? sku)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SuggestionView() when $default != null:
return $default(_that.kind,_that.id,_that.slug,_that.name,_that.sku);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: SuggestionKind.unknown)  SuggestionKind kind,  String id,  String slug,  Localized name,  String? sku)  $default,) {final _that = this;
switch (_that) {
case _SuggestionView():
return $default(_that.kind,_that.id,_that.slug,_that.name,_that.sku);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: SuggestionKind.unknown)  SuggestionKind kind,  String id,  String slug,  Localized name,  String? sku)?  $default,) {final _that = this;
switch (_that) {
case _SuggestionView() when $default != null:
return $default(_that.kind,_that.id,_that.slug,_that.name,_that.sku);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SuggestionView implements SuggestionView {
  const _SuggestionView({@JsonKey(unknownEnumValue: SuggestionKind.unknown) this.kind = SuggestionKind.product, required this.id, required this.slug, required this.name, this.sku});
  factory _SuggestionView.fromJson(Map<String, dynamic> json) => _$SuggestionViewFromJson(json);

@override@JsonKey(unknownEnumValue: SuggestionKind.unknown) final  SuggestionKind kind;
@override final  String id;
@override final  String slug;
@override final  Localized name;
@override final  String? sku;

/// Create a copy of SuggestionView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuggestionViewCopyWith<_SuggestionView> get copyWith => __$SuggestionViewCopyWithImpl<_SuggestionView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuggestionViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuggestionView&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.name, name) || other.name == name)&&(identical(other.sku, sku) || other.sku == sku));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,kind,id,slug,name,sku);

@override
String toString() {
  return 'SuggestionView(kind: $kind, id: $id, slug: $slug, name: $name, sku: $sku)';
}


}

/// @nodoc
abstract mixin class _$SuggestionViewCopyWith<$Res> implements $SuggestionViewCopyWith<$Res> {
  factory _$SuggestionViewCopyWith(_SuggestionView value, $Res Function(_SuggestionView) _then) = __$SuggestionViewCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: SuggestionKind.unknown) SuggestionKind kind, String id, String slug, Localized name, String? sku
});


@override $LocalizedCopyWith<$Res> get name;

}
/// @nodoc
class __$SuggestionViewCopyWithImpl<$Res>
    implements _$SuggestionViewCopyWith<$Res> {
  __$SuggestionViewCopyWithImpl(this._self, this._then);

  final _SuggestionView _self;
  final $Res Function(_SuggestionView) _then;

/// Create a copy of SuggestionView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? id = null,Object? slug = null,Object? name = null,Object? sku = freezed,}) {
  return _then(_SuggestionView(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as SuggestionKind,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SuggestionView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// @nodoc
mixin _$CatalogVersionView {

 int get versionNumber; DateTime? get publishedAt; int get itemCount;/// **Opaque.** Only ever compared against a value previously stored from
/// this same endpoint — two different hashing algorithms exist in the
/// backend and produce different strings for identical data. Never
/// derive or recompute it client-side.
 String get manifestChecksum;
/// Create a copy of CatalogVersionView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogVersionViewCopyWith<CatalogVersionView> get copyWith => _$CatalogVersionViewCopyWithImpl<CatalogVersionView>(this as CatalogVersionView, _$identity);

  /// Serializes this CatalogVersionView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogVersionView&&(identical(other.versionNumber, versionNumber) || other.versionNumber == versionNumber)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.manifestChecksum, manifestChecksum) || other.manifestChecksum == manifestChecksum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,versionNumber,publishedAt,itemCount,manifestChecksum);

@override
String toString() {
  return 'CatalogVersionView(versionNumber: $versionNumber, publishedAt: $publishedAt, itemCount: $itemCount, manifestChecksum: $manifestChecksum)';
}


}

/// @nodoc
abstract mixin class $CatalogVersionViewCopyWith<$Res>  {
  factory $CatalogVersionViewCopyWith(CatalogVersionView value, $Res Function(CatalogVersionView) _then) = _$CatalogVersionViewCopyWithImpl;
@useResult
$Res call({
 int versionNumber, DateTime? publishedAt, int itemCount, String manifestChecksum
});




}
/// @nodoc
class _$CatalogVersionViewCopyWithImpl<$Res>
    implements $CatalogVersionViewCopyWith<$Res> {
  _$CatalogVersionViewCopyWithImpl(this._self, this._then);

  final CatalogVersionView _self;
  final $Res Function(CatalogVersionView) _then;

/// Create a copy of CatalogVersionView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? versionNumber = null,Object? publishedAt = freezed,Object? itemCount = null,Object? manifestChecksum = null,}) {
  return _then(_self.copyWith(
versionNumber: null == versionNumber ? _self.versionNumber : versionNumber // ignore: cast_nullable_to_non_nullable
as int,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,manifestChecksum: null == manifestChecksum ? _self.manifestChecksum : manifestChecksum // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogVersionView].
extension CatalogVersionViewPatterns on CatalogVersionView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogVersionView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogVersionView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogVersionView value)  $default,){
final _that = this;
switch (_that) {
case _CatalogVersionView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogVersionView value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogVersionView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int versionNumber,  DateTime? publishedAt,  int itemCount,  String manifestChecksum)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogVersionView() when $default != null:
return $default(_that.versionNumber,_that.publishedAt,_that.itemCount,_that.manifestChecksum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int versionNumber,  DateTime? publishedAt,  int itemCount,  String manifestChecksum)  $default,) {final _that = this;
switch (_that) {
case _CatalogVersionView():
return $default(_that.versionNumber,_that.publishedAt,_that.itemCount,_that.manifestChecksum);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int versionNumber,  DateTime? publishedAt,  int itemCount,  String manifestChecksum)?  $default,) {final _that = this;
switch (_that) {
case _CatalogVersionView() when $default != null:
return $default(_that.versionNumber,_that.publishedAt,_that.itemCount,_that.manifestChecksum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogVersionView implements CatalogVersionView {
  const _CatalogVersionView({required this.versionNumber, this.publishedAt, this.itemCount = 0, required this.manifestChecksum});
  factory _CatalogVersionView.fromJson(Map<String, dynamic> json) => _$CatalogVersionViewFromJson(json);

@override final  int versionNumber;
@override final  DateTime? publishedAt;
@override@JsonKey() final  int itemCount;
/// **Opaque.** Only ever compared against a value previously stored from
/// this same endpoint — two different hashing algorithms exist in the
/// backend and produce different strings for identical data. Never
/// derive or recompute it client-side.
@override final  String manifestChecksum;

/// Create a copy of CatalogVersionView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogVersionViewCopyWith<_CatalogVersionView> get copyWith => __$CatalogVersionViewCopyWithImpl<_CatalogVersionView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogVersionViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogVersionView&&(identical(other.versionNumber, versionNumber) || other.versionNumber == versionNumber)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.manifestChecksum, manifestChecksum) || other.manifestChecksum == manifestChecksum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,versionNumber,publishedAt,itemCount,manifestChecksum);

@override
String toString() {
  return 'CatalogVersionView(versionNumber: $versionNumber, publishedAt: $publishedAt, itemCount: $itemCount, manifestChecksum: $manifestChecksum)';
}


}

/// @nodoc
abstract mixin class _$CatalogVersionViewCopyWith<$Res> implements $CatalogVersionViewCopyWith<$Res> {
  factory _$CatalogVersionViewCopyWith(_CatalogVersionView value, $Res Function(_CatalogVersionView) _then) = __$CatalogVersionViewCopyWithImpl;
@override @useResult
$Res call({
 int versionNumber, DateTime? publishedAt, int itemCount, String manifestChecksum
});




}
/// @nodoc
class __$CatalogVersionViewCopyWithImpl<$Res>
    implements _$CatalogVersionViewCopyWith<$Res> {
  __$CatalogVersionViewCopyWithImpl(this._self, this._then);

  final _CatalogVersionView _self;
  final $Res Function(_CatalogVersionView) _then;

/// Create a copy of CatalogVersionView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? versionNumber = null,Object? publishedAt = freezed,Object? itemCount = null,Object? manifestChecksum = null,}) {
  return _then(_CatalogVersionView(
versionNumber: null == versionNumber ? _self.versionNumber : versionNumber // ignore: cast_nullable_to_non_nullable
as int,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,manifestChecksum: null == manifestChecksum ? _self.manifestChecksum : manifestChecksum // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
