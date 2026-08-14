// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfflineSyncState {

 OfflineQueueStatus get queueStatus; List<QueuedActivityRecord> get queuedItems; OfflineSyncStatus get syncStatus; DateTime? get lastSyncAt; int? get lastSyncCreated; int? get lastSyncDuplicates; int? get lastSyncRejected; String? get syncErrorMessage;
/// Create a copy of OfflineSyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineSyncStateCopyWith<OfflineSyncState> get copyWith => _$OfflineSyncStateCopyWithImpl<OfflineSyncState>(this as OfflineSyncState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineSyncState&&(identical(other.queueStatus, queueStatus) || other.queueStatus == queueStatus)&&const DeepCollectionEquality().equals(other.queuedItems, queuedItems)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.lastSyncCreated, lastSyncCreated) || other.lastSyncCreated == lastSyncCreated)&&(identical(other.lastSyncDuplicates, lastSyncDuplicates) || other.lastSyncDuplicates == lastSyncDuplicates)&&(identical(other.lastSyncRejected, lastSyncRejected) || other.lastSyncRejected == lastSyncRejected)&&(identical(other.syncErrorMessage, syncErrorMessage) || other.syncErrorMessage == syncErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,queueStatus,const DeepCollectionEquality().hash(queuedItems),syncStatus,lastSyncAt,lastSyncCreated,lastSyncDuplicates,lastSyncRejected,syncErrorMessage);

@override
String toString() {
  return 'OfflineSyncState(queueStatus: $queueStatus, queuedItems: $queuedItems, syncStatus: $syncStatus, lastSyncAt: $lastSyncAt, lastSyncCreated: $lastSyncCreated, lastSyncDuplicates: $lastSyncDuplicates, lastSyncRejected: $lastSyncRejected, syncErrorMessage: $syncErrorMessage)';
}


}

/// @nodoc
abstract mixin class $OfflineSyncStateCopyWith<$Res>  {
  factory $OfflineSyncStateCopyWith(OfflineSyncState value, $Res Function(OfflineSyncState) _then) = _$OfflineSyncStateCopyWithImpl;
@useResult
$Res call({
 OfflineQueueStatus queueStatus, List<QueuedActivityRecord> queuedItems, OfflineSyncStatus syncStatus, DateTime? lastSyncAt, int? lastSyncCreated, int? lastSyncDuplicates, int? lastSyncRejected, String? syncErrorMessage
});




}
/// @nodoc
class _$OfflineSyncStateCopyWithImpl<$Res>
    implements $OfflineSyncStateCopyWith<$Res> {
  _$OfflineSyncStateCopyWithImpl(this._self, this._then);

  final OfflineSyncState _self;
  final $Res Function(OfflineSyncState) _then;

/// Create a copy of OfflineSyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? queueStatus = null,Object? queuedItems = null,Object? syncStatus = null,Object? lastSyncAt = freezed,Object? lastSyncCreated = freezed,Object? lastSyncDuplicates = freezed,Object? lastSyncRejected = freezed,Object? syncErrorMessage = freezed,}) {
  return _then(_self.copyWith(
queueStatus: null == queueStatus ? _self.queueStatus : queueStatus // ignore: cast_nullable_to_non_nullable
as OfflineQueueStatus,queuedItems: null == queuedItems ? _self.queuedItems : queuedItems // ignore: cast_nullable_to_non_nullable
as List<QueuedActivityRecord>,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as OfflineSyncStatus,lastSyncAt: freezed == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSyncCreated: freezed == lastSyncCreated ? _self.lastSyncCreated : lastSyncCreated // ignore: cast_nullable_to_non_nullable
as int?,lastSyncDuplicates: freezed == lastSyncDuplicates ? _self.lastSyncDuplicates : lastSyncDuplicates // ignore: cast_nullable_to_non_nullable
as int?,lastSyncRejected: freezed == lastSyncRejected ? _self.lastSyncRejected : lastSyncRejected // ignore: cast_nullable_to_non_nullable
as int?,syncErrorMessage: freezed == syncErrorMessage ? _self.syncErrorMessage : syncErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfflineSyncState].
extension OfflineSyncStatePatterns on OfflineSyncState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfflineSyncState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfflineSyncState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfflineSyncState value)  $default,){
final _that = this;
switch (_that) {
case _OfflineSyncState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfflineSyncState value)?  $default,){
final _that = this;
switch (_that) {
case _OfflineSyncState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OfflineQueueStatus queueStatus,  List<QueuedActivityRecord> queuedItems,  OfflineSyncStatus syncStatus,  DateTime? lastSyncAt,  int? lastSyncCreated,  int? lastSyncDuplicates,  int? lastSyncRejected,  String? syncErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfflineSyncState() when $default != null:
return $default(_that.queueStatus,_that.queuedItems,_that.syncStatus,_that.lastSyncAt,_that.lastSyncCreated,_that.lastSyncDuplicates,_that.lastSyncRejected,_that.syncErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OfflineQueueStatus queueStatus,  List<QueuedActivityRecord> queuedItems,  OfflineSyncStatus syncStatus,  DateTime? lastSyncAt,  int? lastSyncCreated,  int? lastSyncDuplicates,  int? lastSyncRejected,  String? syncErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _OfflineSyncState():
return $default(_that.queueStatus,_that.queuedItems,_that.syncStatus,_that.lastSyncAt,_that.lastSyncCreated,_that.lastSyncDuplicates,_that.lastSyncRejected,_that.syncErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OfflineQueueStatus queueStatus,  List<QueuedActivityRecord> queuedItems,  OfflineSyncStatus syncStatus,  DateTime? lastSyncAt,  int? lastSyncCreated,  int? lastSyncDuplicates,  int? lastSyncRejected,  String? syncErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OfflineSyncState() when $default != null:
return $default(_that.queueStatus,_that.queuedItems,_that.syncStatus,_that.lastSyncAt,_that.lastSyncCreated,_that.lastSyncDuplicates,_that.lastSyncRejected,_that.syncErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OfflineSyncState implements OfflineSyncState {
  const _OfflineSyncState({this.queueStatus = OfflineQueueStatus.loading, final  List<QueuedActivityRecord> queuedItems = const <QueuedActivityRecord>[], this.syncStatus = OfflineSyncStatus.idle, this.lastSyncAt, this.lastSyncCreated, this.lastSyncDuplicates, this.lastSyncRejected, this.syncErrorMessage}): _queuedItems = queuedItems;
  

@override@JsonKey() final  OfflineQueueStatus queueStatus;
 final  List<QueuedActivityRecord> _queuedItems;
@override@JsonKey() List<QueuedActivityRecord> get queuedItems {
  if (_queuedItems is EqualUnmodifiableListView) return _queuedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queuedItems);
}

@override@JsonKey() final  OfflineSyncStatus syncStatus;
@override final  DateTime? lastSyncAt;
@override final  int? lastSyncCreated;
@override final  int? lastSyncDuplicates;
@override final  int? lastSyncRejected;
@override final  String? syncErrorMessage;

/// Create a copy of OfflineSyncState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfflineSyncStateCopyWith<_OfflineSyncState> get copyWith => __$OfflineSyncStateCopyWithImpl<_OfflineSyncState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfflineSyncState&&(identical(other.queueStatus, queueStatus) || other.queueStatus == queueStatus)&&const DeepCollectionEquality().equals(other._queuedItems, _queuedItems)&&(identical(other.syncStatus, syncStatus) || other.syncStatus == syncStatus)&&(identical(other.lastSyncAt, lastSyncAt) || other.lastSyncAt == lastSyncAt)&&(identical(other.lastSyncCreated, lastSyncCreated) || other.lastSyncCreated == lastSyncCreated)&&(identical(other.lastSyncDuplicates, lastSyncDuplicates) || other.lastSyncDuplicates == lastSyncDuplicates)&&(identical(other.lastSyncRejected, lastSyncRejected) || other.lastSyncRejected == lastSyncRejected)&&(identical(other.syncErrorMessage, syncErrorMessage) || other.syncErrorMessage == syncErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,queueStatus,const DeepCollectionEquality().hash(_queuedItems),syncStatus,lastSyncAt,lastSyncCreated,lastSyncDuplicates,lastSyncRejected,syncErrorMessage);

@override
String toString() {
  return 'OfflineSyncState(queueStatus: $queueStatus, queuedItems: $queuedItems, syncStatus: $syncStatus, lastSyncAt: $lastSyncAt, lastSyncCreated: $lastSyncCreated, lastSyncDuplicates: $lastSyncDuplicates, lastSyncRejected: $lastSyncRejected, syncErrorMessage: $syncErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$OfflineSyncStateCopyWith<$Res> implements $OfflineSyncStateCopyWith<$Res> {
  factory _$OfflineSyncStateCopyWith(_OfflineSyncState value, $Res Function(_OfflineSyncState) _then) = __$OfflineSyncStateCopyWithImpl;
@override @useResult
$Res call({
 OfflineQueueStatus queueStatus, List<QueuedActivityRecord> queuedItems, OfflineSyncStatus syncStatus, DateTime? lastSyncAt, int? lastSyncCreated, int? lastSyncDuplicates, int? lastSyncRejected, String? syncErrorMessage
});




}
/// @nodoc
class __$OfflineSyncStateCopyWithImpl<$Res>
    implements _$OfflineSyncStateCopyWith<$Res> {
  __$OfflineSyncStateCopyWithImpl(this._self, this._then);

  final _OfflineSyncState _self;
  final $Res Function(_OfflineSyncState) _then;

/// Create a copy of OfflineSyncState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? queueStatus = null,Object? queuedItems = null,Object? syncStatus = null,Object? lastSyncAt = freezed,Object? lastSyncCreated = freezed,Object? lastSyncDuplicates = freezed,Object? lastSyncRejected = freezed,Object? syncErrorMessage = freezed,}) {
  return _then(_OfflineSyncState(
queueStatus: null == queueStatus ? _self.queueStatus : queueStatus // ignore: cast_nullable_to_non_nullable
as OfflineQueueStatus,queuedItems: null == queuedItems ? _self._queuedItems : queuedItems // ignore: cast_nullable_to_non_nullable
as List<QueuedActivityRecord>,syncStatus: null == syncStatus ? _self.syncStatus : syncStatus // ignore: cast_nullable_to_non_nullable
as OfflineSyncStatus,lastSyncAt: freezed == lastSyncAt ? _self.lastSyncAt : lastSyncAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSyncCreated: freezed == lastSyncCreated ? _self.lastSyncCreated : lastSyncCreated // ignore: cast_nullable_to_non_nullable
as int?,lastSyncDuplicates: freezed == lastSyncDuplicates ? _self.lastSyncDuplicates : lastSyncDuplicates // ignore: cast_nullable_to_non_nullable
as int?,lastSyncRejected: freezed == lastSyncRejected ? _self.lastSyncRejected : lastSyncRejected // ignore: cast_nullable_to_non_nullable
as int?,syncErrorMessage: freezed == syncErrorMessage ? _self.syncErrorMessage : syncErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
