// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queued_activity_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueuedActivityRecord {

 SyncActivityItem get item; DateTime get queuedAt; String? get lastErrorCode; String? get lastErrorMessage;
/// Create a copy of QueuedActivityRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueuedActivityRecordCopyWith<QueuedActivityRecord> get copyWith => _$QueuedActivityRecordCopyWithImpl<QueuedActivityRecord>(this as QueuedActivityRecord, _$identity);

  /// Serializes this QueuedActivityRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueuedActivityRecord&&(identical(other.item, item) || other.item == item)&&(identical(other.queuedAt, queuedAt) || other.queuedAt == queuedAt)&&(identical(other.lastErrorCode, lastErrorCode) || other.lastErrorCode == lastErrorCode)&&(identical(other.lastErrorMessage, lastErrorMessage) || other.lastErrorMessage == lastErrorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item,queuedAt,lastErrorCode,lastErrorMessage);

@override
String toString() {
  return 'QueuedActivityRecord(item: $item, queuedAt: $queuedAt, lastErrorCode: $lastErrorCode, lastErrorMessage: $lastErrorMessage)';
}


}

/// @nodoc
abstract mixin class $QueuedActivityRecordCopyWith<$Res>  {
  factory $QueuedActivityRecordCopyWith(QueuedActivityRecord value, $Res Function(QueuedActivityRecord) _then) = _$QueuedActivityRecordCopyWithImpl;
@useResult
$Res call({
 SyncActivityItem item, DateTime queuedAt, String? lastErrorCode, String? lastErrorMessage
});


$SyncActivityItemCopyWith<$Res> get item;

}
/// @nodoc
class _$QueuedActivityRecordCopyWithImpl<$Res>
    implements $QueuedActivityRecordCopyWith<$Res> {
  _$QueuedActivityRecordCopyWithImpl(this._self, this._then);

  final QueuedActivityRecord _self;
  final $Res Function(QueuedActivityRecord) _then;

/// Create a copy of QueuedActivityRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? queuedAt = null,Object? lastErrorCode = freezed,Object? lastErrorMessage = freezed,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SyncActivityItem,queuedAt: null == queuedAt ? _self.queuedAt : queuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastErrorCode: freezed == lastErrorCode ? _self.lastErrorCode : lastErrorCode // ignore: cast_nullable_to_non_nullable
as String?,lastErrorMessage: freezed == lastErrorMessage ? _self.lastErrorMessage : lastErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of QueuedActivityRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncActivityItemCopyWith<$Res> get item {
  
  return $SyncActivityItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [QueuedActivityRecord].
extension QueuedActivityRecordPatterns on QueuedActivityRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueuedActivityRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueuedActivityRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueuedActivityRecord value)  $default,){
final _that = this;
switch (_that) {
case _QueuedActivityRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueuedActivityRecord value)?  $default,){
final _that = this;
switch (_that) {
case _QueuedActivityRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SyncActivityItem item,  DateTime queuedAt,  String? lastErrorCode,  String? lastErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueuedActivityRecord() when $default != null:
return $default(_that.item,_that.queuedAt,_that.lastErrorCode,_that.lastErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SyncActivityItem item,  DateTime queuedAt,  String? lastErrorCode,  String? lastErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _QueuedActivityRecord():
return $default(_that.item,_that.queuedAt,_that.lastErrorCode,_that.lastErrorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SyncActivityItem item,  DateTime queuedAt,  String? lastErrorCode,  String? lastErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _QueuedActivityRecord() when $default != null:
return $default(_that.item,_that.queuedAt,_that.lastErrorCode,_that.lastErrorMessage);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _QueuedActivityRecord implements QueuedActivityRecord {
  const _QueuedActivityRecord({required this.item, required this.queuedAt, this.lastErrorCode, this.lastErrorMessage});
  factory _QueuedActivityRecord.fromJson(Map<String, dynamic> json) => _$QueuedActivityRecordFromJson(json);

@override final  SyncActivityItem item;
@override final  DateTime queuedAt;
@override final  String? lastErrorCode;
@override final  String? lastErrorMessage;

/// Create a copy of QueuedActivityRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueuedActivityRecordCopyWith<_QueuedActivityRecord> get copyWith => __$QueuedActivityRecordCopyWithImpl<_QueuedActivityRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueuedActivityRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueuedActivityRecord&&(identical(other.item, item) || other.item == item)&&(identical(other.queuedAt, queuedAt) || other.queuedAt == queuedAt)&&(identical(other.lastErrorCode, lastErrorCode) || other.lastErrorCode == lastErrorCode)&&(identical(other.lastErrorMessage, lastErrorMessage) || other.lastErrorMessage == lastErrorMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,item,queuedAt,lastErrorCode,lastErrorMessage);

@override
String toString() {
  return 'QueuedActivityRecord(item: $item, queuedAt: $queuedAt, lastErrorCode: $lastErrorCode, lastErrorMessage: $lastErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$QueuedActivityRecordCopyWith<$Res> implements $QueuedActivityRecordCopyWith<$Res> {
  factory _$QueuedActivityRecordCopyWith(_QueuedActivityRecord value, $Res Function(_QueuedActivityRecord) _then) = __$QueuedActivityRecordCopyWithImpl;
@override @useResult
$Res call({
 SyncActivityItem item, DateTime queuedAt, String? lastErrorCode, String? lastErrorMessage
});


@override $SyncActivityItemCopyWith<$Res> get item;

}
/// @nodoc
class __$QueuedActivityRecordCopyWithImpl<$Res>
    implements _$QueuedActivityRecordCopyWith<$Res> {
  __$QueuedActivityRecordCopyWithImpl(this._self, this._then);

  final _QueuedActivityRecord _self;
  final $Res Function(_QueuedActivityRecord) _then;

/// Create a copy of QueuedActivityRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? queuedAt = null,Object? lastErrorCode = freezed,Object? lastErrorMessage = freezed,}) {
  return _then(_QueuedActivityRecord(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SyncActivityItem,queuedAt: null == queuedAt ? _self.queuedAt : queuedAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastErrorCode: freezed == lastErrorCode ? _self.lastErrorCode : lastErrorCode // ignore: cast_nullable_to_non_nullable
as String?,lastErrorMessage: freezed == lastErrorMessage ? _self.lastErrorMessage : lastErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of QueuedActivityRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncActivityItemCopyWith<$Res> get item {
  
  return $SyncActivityItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
