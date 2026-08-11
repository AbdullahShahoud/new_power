// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_activities_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncActivitiesRequest {

 List<SyncActivityItem> get items;
/// Create a copy of SyncActivitiesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncActivitiesRequestCopyWith<SyncActivitiesRequest> get copyWith => _$SyncActivitiesRequestCopyWithImpl<SyncActivitiesRequest>(this as SyncActivitiesRequest, _$identity);

  /// Serializes this SyncActivitiesRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncActivitiesRequest&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'SyncActivitiesRequest(items: $items)';
}


}

/// @nodoc
abstract mixin class $SyncActivitiesRequestCopyWith<$Res>  {
  factory $SyncActivitiesRequestCopyWith(SyncActivitiesRequest value, $Res Function(SyncActivitiesRequest) _then) = _$SyncActivitiesRequestCopyWithImpl;
@useResult
$Res call({
 List<SyncActivityItem> items
});




}
/// @nodoc
class _$SyncActivitiesRequestCopyWithImpl<$Res>
    implements $SyncActivitiesRequestCopyWith<$Res> {
  _$SyncActivitiesRequestCopyWithImpl(this._self, this._then);

  final SyncActivitiesRequest _self;
  final $Res Function(SyncActivitiesRequest) _then;

/// Create a copy of SyncActivitiesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<SyncActivityItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [SyncActivitiesRequest].
extension SyncActivitiesRequestPatterns on SyncActivitiesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SyncActivitiesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SyncActivitiesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SyncActivitiesRequest value)  $default,){
final _that = this;
switch (_that) {
case _SyncActivitiesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SyncActivitiesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SyncActivitiesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SyncActivityItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SyncActivitiesRequest() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SyncActivityItem> items)  $default,) {final _that = this;
switch (_that) {
case _SyncActivitiesRequest():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SyncActivityItem> items)?  $default,) {final _that = this;
switch (_that) {
case _SyncActivitiesRequest() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SyncActivitiesRequest implements SyncActivitiesRequest {
  const _SyncActivitiesRequest({required final  List<SyncActivityItem> items}): _items = items;
  factory _SyncActivitiesRequest.fromJson(Map<String, dynamic> json) => _$SyncActivitiesRequestFromJson(json);

 final  List<SyncActivityItem> _items;
@override List<SyncActivityItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of SyncActivitiesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SyncActivitiesRequestCopyWith<_SyncActivitiesRequest> get copyWith => __$SyncActivitiesRequestCopyWithImpl<_SyncActivitiesRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SyncActivitiesRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SyncActivitiesRequest&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'SyncActivitiesRequest(items: $items)';
}


}

/// @nodoc
abstract mixin class _$SyncActivitiesRequestCopyWith<$Res> implements $SyncActivitiesRequestCopyWith<$Res> {
  factory _$SyncActivitiesRequestCopyWith(_SyncActivitiesRequest value, $Res Function(_SyncActivitiesRequest) _then) = __$SyncActivitiesRequestCopyWithImpl;
@override @useResult
$Res call({
 List<SyncActivityItem> items
});




}
/// @nodoc
class __$SyncActivitiesRequestCopyWithImpl<$Res>
    implements _$SyncActivitiesRequestCopyWith<$Res> {
  __$SyncActivitiesRequestCopyWithImpl(this._self, this._then);

  final _SyncActivitiesRequest _self;
  final $Res Function(_SyncActivitiesRequest) _then;

/// Create a copy of SyncActivitiesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_SyncActivitiesRequest(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<SyncActivityItem>,
  ));
}


}

// dart format on
