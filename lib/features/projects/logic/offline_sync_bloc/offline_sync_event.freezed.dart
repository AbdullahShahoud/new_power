// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_sync_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfflineSyncEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineSyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfflineSyncEvent()';
}


}

/// @nodoc
class $OfflineSyncEventCopyWith<$Res>  {
$OfflineSyncEventCopyWith(OfflineSyncEvent _, $Res Function(OfflineSyncEvent) __);
}


/// Adds pattern-matching-related methods to [OfflineSyncEvent].
extension OfflineSyncEventPatterns on OfflineSyncEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OfflineQueueLoaded value)?  queueLoaded,TResult Function( OfflineActivityQueued value)?  activityQueued,TResult Function( OfflineSyncRequested value)?  syncRequested,TResult Function( OfflineQueueItemDiscarded value)?  itemDiscarded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OfflineQueueLoaded() when queueLoaded != null:
return queueLoaded(_that);case OfflineActivityQueued() when activityQueued != null:
return activityQueued(_that);case OfflineSyncRequested() when syncRequested != null:
return syncRequested(_that);case OfflineQueueItemDiscarded() when itemDiscarded != null:
return itemDiscarded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OfflineQueueLoaded value)  queueLoaded,required TResult Function( OfflineActivityQueued value)  activityQueued,required TResult Function( OfflineSyncRequested value)  syncRequested,required TResult Function( OfflineQueueItemDiscarded value)  itemDiscarded,}){
final _that = this;
switch (_that) {
case OfflineQueueLoaded():
return queueLoaded(_that);case OfflineActivityQueued():
return activityQueued(_that);case OfflineSyncRequested():
return syncRequested(_that);case OfflineQueueItemDiscarded():
return itemDiscarded(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OfflineQueueLoaded value)?  queueLoaded,TResult? Function( OfflineActivityQueued value)?  activityQueued,TResult? Function( OfflineSyncRequested value)?  syncRequested,TResult? Function( OfflineQueueItemDiscarded value)?  itemDiscarded,}){
final _that = this;
switch (_that) {
case OfflineQueueLoaded() when queueLoaded != null:
return queueLoaded(_that);case OfflineActivityQueued() when activityQueued != null:
return activityQueued(_that);case OfflineSyncRequested() when syncRequested != null:
return syncRequested(_that);case OfflineQueueItemDiscarded() when itemDiscarded != null:
return itemDiscarded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  queueLoaded,TResult Function( SyncActivityItem item)?  activityQueued,TResult Function()?  syncRequested,TResult Function( String clientRef)?  itemDiscarded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OfflineQueueLoaded() when queueLoaded != null:
return queueLoaded();case OfflineActivityQueued() when activityQueued != null:
return activityQueued(_that.item);case OfflineSyncRequested() when syncRequested != null:
return syncRequested();case OfflineQueueItemDiscarded() when itemDiscarded != null:
return itemDiscarded(_that.clientRef);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  queueLoaded,required TResult Function( SyncActivityItem item)  activityQueued,required TResult Function()  syncRequested,required TResult Function( String clientRef)  itemDiscarded,}) {final _that = this;
switch (_that) {
case OfflineQueueLoaded():
return queueLoaded();case OfflineActivityQueued():
return activityQueued(_that.item);case OfflineSyncRequested():
return syncRequested();case OfflineQueueItemDiscarded():
return itemDiscarded(_that.clientRef);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  queueLoaded,TResult? Function( SyncActivityItem item)?  activityQueued,TResult? Function()?  syncRequested,TResult? Function( String clientRef)?  itemDiscarded,}) {final _that = this;
switch (_that) {
case OfflineQueueLoaded() when queueLoaded != null:
return queueLoaded();case OfflineActivityQueued() when activityQueued != null:
return activityQueued(_that.item);case OfflineSyncRequested() when syncRequested != null:
return syncRequested();case OfflineQueueItemDiscarded() when itemDiscarded != null:
return itemDiscarded(_that.clientRef);case _:
  return null;

}
}

}

/// @nodoc


class OfflineQueueLoaded implements OfflineSyncEvent {
  const OfflineQueueLoaded();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineQueueLoaded);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfflineSyncEvent.queueLoaded()';
}


}




/// @nodoc


class OfflineActivityQueued implements OfflineSyncEvent {
  const OfflineActivityQueued({required this.item});
  

 final  SyncActivityItem item;

/// Create a copy of OfflineSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineActivityQueuedCopyWith<OfflineActivityQueued> get copyWith => _$OfflineActivityQueuedCopyWithImpl<OfflineActivityQueued>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineActivityQueued&&(identical(other.item, item) || other.item == item));
}


@override
int get hashCode => Object.hash(runtimeType,item);

@override
String toString() {
  return 'OfflineSyncEvent.activityQueued(item: $item)';
}


}

/// @nodoc
abstract mixin class $OfflineActivityQueuedCopyWith<$Res> implements $OfflineSyncEventCopyWith<$Res> {
  factory $OfflineActivityQueuedCopyWith(OfflineActivityQueued value, $Res Function(OfflineActivityQueued) _then) = _$OfflineActivityQueuedCopyWithImpl;
@useResult
$Res call({
 SyncActivityItem item
});


$SyncActivityItemCopyWith<$Res> get item;

}
/// @nodoc
class _$OfflineActivityQueuedCopyWithImpl<$Res>
    implements $OfflineActivityQueuedCopyWith<$Res> {
  _$OfflineActivityQueuedCopyWithImpl(this._self, this._then);

  final OfflineActivityQueued _self;
  final $Res Function(OfflineActivityQueued) _then;

/// Create a copy of OfflineSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? item = null,}) {
  return _then(OfflineActivityQueued(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as SyncActivityItem,
  ));
}

/// Create a copy of OfflineSyncEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SyncActivityItemCopyWith<$Res> get item {
  
  return $SyncActivityItemCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

/// @nodoc


class OfflineSyncRequested implements OfflineSyncEvent {
  const OfflineSyncRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineSyncRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OfflineSyncEvent.syncRequested()';
}


}




/// @nodoc


class OfflineQueueItemDiscarded implements OfflineSyncEvent {
  const OfflineQueueItemDiscarded(this.clientRef);
  

 final  String clientRef;

/// Create a copy of OfflineSyncEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineQueueItemDiscardedCopyWith<OfflineQueueItemDiscarded> get copyWith => _$OfflineQueueItemDiscardedCopyWithImpl<OfflineQueueItemDiscarded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineQueueItemDiscarded&&(identical(other.clientRef, clientRef) || other.clientRef == clientRef));
}


@override
int get hashCode => Object.hash(runtimeType,clientRef);

@override
String toString() {
  return 'OfflineSyncEvent.itemDiscarded(clientRef: $clientRef)';
}


}

/// @nodoc
abstract mixin class $OfflineQueueItemDiscardedCopyWith<$Res> implements $OfflineSyncEventCopyWith<$Res> {
  factory $OfflineQueueItemDiscardedCopyWith(OfflineQueueItemDiscarded value, $Res Function(OfflineQueueItemDiscarded) _then) = _$OfflineQueueItemDiscardedCopyWithImpl;
@useResult
$Res call({
 String clientRef
});




}
/// @nodoc
class _$OfflineQueueItemDiscardedCopyWithImpl<$Res>
    implements $OfflineQueueItemDiscardedCopyWith<$Res> {
  _$OfflineQueueItemDiscardedCopyWithImpl(this._self, this._then);

  final OfflineQueueItemDiscarded _self;
  final $Res Function(OfflineQueueItemDiscarded) _then;

/// Create a copy of OfflineSyncEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clientRef = null,}) {
  return _then(OfflineQueueItemDiscarded(
null == clientRef ? _self.clientRef : clientRef // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
