// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InboxEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent()';
}


}

/// @nodoc
class $InboxEventCopyWith<$Res>  {
$InboxEventCopyWith(InboxEvent _, $Res Function(InboxEvent) __);
}


/// Adds pattern-matching-related methods to [InboxEvent].
extension InboxEventPatterns on InboxEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InboxOpened value)?  opened,TResult Function( InboxRefreshed value)?  refreshed,TResult Function( InboxFilterChanged value)?  filterChanged,TResult Function( InboxNextPageRequested value)?  nextPageRequested,TResult Function( InboxReadRequested value)?  readRequested,TResult Function( InboxReadAllRequested value)?  readAllRequested,TResult Function( InboxArchiveRequested value)?  archiveRequested,TResult Function( InboxArchiveUndone value)?  archiveUndone,TResult Function( InboxArchiveCommitted value)?  archiveCommitted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InboxOpened() when opened != null:
return opened(_that);case InboxRefreshed() when refreshed != null:
return refreshed(_that);case InboxFilterChanged() when filterChanged != null:
return filterChanged(_that);case InboxNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case InboxReadRequested() when readRequested != null:
return readRequested(_that);case InboxReadAllRequested() when readAllRequested != null:
return readAllRequested(_that);case InboxArchiveRequested() when archiveRequested != null:
return archiveRequested(_that);case InboxArchiveUndone() when archiveUndone != null:
return archiveUndone(_that);case InboxArchiveCommitted() when archiveCommitted != null:
return archiveCommitted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InboxOpened value)  opened,required TResult Function( InboxRefreshed value)  refreshed,required TResult Function( InboxFilterChanged value)  filterChanged,required TResult Function( InboxNextPageRequested value)  nextPageRequested,required TResult Function( InboxReadRequested value)  readRequested,required TResult Function( InboxReadAllRequested value)  readAllRequested,required TResult Function( InboxArchiveRequested value)  archiveRequested,required TResult Function( InboxArchiveUndone value)  archiveUndone,required TResult Function( InboxArchiveCommitted value)  archiveCommitted,}){
final _that = this;
switch (_that) {
case InboxOpened():
return opened(_that);case InboxRefreshed():
return refreshed(_that);case InboxFilterChanged():
return filterChanged(_that);case InboxNextPageRequested():
return nextPageRequested(_that);case InboxReadRequested():
return readRequested(_that);case InboxReadAllRequested():
return readAllRequested(_that);case InboxArchiveRequested():
return archiveRequested(_that);case InboxArchiveUndone():
return archiveUndone(_that);case InboxArchiveCommitted():
return archiveCommitted(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InboxOpened value)?  opened,TResult? Function( InboxRefreshed value)?  refreshed,TResult? Function( InboxFilterChanged value)?  filterChanged,TResult? Function( InboxNextPageRequested value)?  nextPageRequested,TResult? Function( InboxReadRequested value)?  readRequested,TResult? Function( InboxReadAllRequested value)?  readAllRequested,TResult? Function( InboxArchiveRequested value)?  archiveRequested,TResult? Function( InboxArchiveUndone value)?  archiveUndone,TResult? Function( InboxArchiveCommitted value)?  archiveCommitted,}){
final _that = this;
switch (_that) {
case InboxOpened() when opened != null:
return opened(_that);case InboxRefreshed() when refreshed != null:
return refreshed(_that);case InboxFilterChanged() when filterChanged != null:
return filterChanged(_that);case InboxNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case InboxReadRequested() when readRequested != null:
return readRequested(_that);case InboxReadAllRequested() when readAllRequested != null:
return readAllRequested(_that);case InboxArchiveRequested() when archiveRequested != null:
return archiveRequested(_that);case InboxArchiveUndone() when archiveUndone != null:
return archiveUndone(_that);case InboxArchiveCommitted() when archiveCommitted != null:
return archiveCommitted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  opened,TResult Function()?  refreshed,TResult Function( NotificationFilter filter)?  filterChanged,TResult Function()?  nextPageRequested,TResult Function( String id)?  readRequested,TResult Function()?  readAllRequested,TResult Function( String id)?  archiveRequested,TResult Function( String id)?  archiveUndone,TResult Function( String id)?  archiveCommitted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InboxOpened() when opened != null:
return opened();case InboxRefreshed() when refreshed != null:
return refreshed();case InboxFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case InboxNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case InboxReadRequested() when readRequested != null:
return readRequested(_that.id);case InboxReadAllRequested() when readAllRequested != null:
return readAllRequested();case InboxArchiveRequested() when archiveRequested != null:
return archiveRequested(_that.id);case InboxArchiveUndone() when archiveUndone != null:
return archiveUndone(_that.id);case InboxArchiveCommitted() when archiveCommitted != null:
return archiveCommitted(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  opened,required TResult Function()  refreshed,required TResult Function( NotificationFilter filter)  filterChanged,required TResult Function()  nextPageRequested,required TResult Function( String id)  readRequested,required TResult Function()  readAllRequested,required TResult Function( String id)  archiveRequested,required TResult Function( String id)  archiveUndone,required TResult Function( String id)  archiveCommitted,}) {final _that = this;
switch (_that) {
case InboxOpened():
return opened();case InboxRefreshed():
return refreshed();case InboxFilterChanged():
return filterChanged(_that.filter);case InboxNextPageRequested():
return nextPageRequested();case InboxReadRequested():
return readRequested(_that.id);case InboxReadAllRequested():
return readAllRequested();case InboxArchiveRequested():
return archiveRequested(_that.id);case InboxArchiveUndone():
return archiveUndone(_that.id);case InboxArchiveCommitted():
return archiveCommitted(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  opened,TResult? Function()?  refreshed,TResult? Function( NotificationFilter filter)?  filterChanged,TResult? Function()?  nextPageRequested,TResult? Function( String id)?  readRequested,TResult? Function()?  readAllRequested,TResult? Function( String id)?  archiveRequested,TResult? Function( String id)?  archiveUndone,TResult? Function( String id)?  archiveCommitted,}) {final _that = this;
switch (_that) {
case InboxOpened() when opened != null:
return opened();case InboxRefreshed() when refreshed != null:
return refreshed();case InboxFilterChanged() when filterChanged != null:
return filterChanged(_that.filter);case InboxNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case InboxReadRequested() when readRequested != null:
return readRequested(_that.id);case InboxReadAllRequested() when readAllRequested != null:
return readAllRequested();case InboxArchiveRequested() when archiveRequested != null:
return archiveRequested(_that.id);case InboxArchiveUndone() when archiveUndone != null:
return archiveUndone(_that.id);case InboxArchiveCommitted() when archiveCommitted != null:
return archiveCommitted(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class InboxOpened implements InboxEvent {
  const InboxOpened();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxOpened);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent.opened()';
}


}




/// @nodoc


class InboxRefreshed implements InboxEvent {
  const InboxRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent.refreshed()';
}


}




/// @nodoc


class InboxFilterChanged implements InboxEvent {
  const InboxFilterChanged(this.filter);
  

 final  NotificationFilter filter;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxFilterChangedCopyWith<InboxFilterChanged> get copyWith => _$InboxFilterChangedCopyWithImpl<InboxFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxFilterChanged&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'InboxEvent.filterChanged(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $InboxFilterChangedCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxFilterChangedCopyWith(InboxFilterChanged value, $Res Function(InboxFilterChanged) _then) = _$InboxFilterChangedCopyWithImpl;
@useResult
$Res call({
 NotificationFilter filter
});




}
/// @nodoc
class _$InboxFilterChangedCopyWithImpl<$Res>
    implements $InboxFilterChangedCopyWith<$Res> {
  _$InboxFilterChangedCopyWithImpl(this._self, this._then);

  final InboxFilterChanged _self;
  final $Res Function(InboxFilterChanged) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(InboxFilterChanged(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as NotificationFilter,
  ));
}


}

/// @nodoc


class InboxNextPageRequested implements InboxEvent {
  const InboxNextPageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent.nextPageRequested()';
}


}




/// @nodoc


class InboxReadRequested implements InboxEvent {
  const InboxReadRequested(this.id);
  

 final  String id;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxReadRequestedCopyWith<InboxReadRequested> get copyWith => _$InboxReadRequestedCopyWithImpl<InboxReadRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxReadRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'InboxEvent.readRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $InboxReadRequestedCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxReadRequestedCopyWith(InboxReadRequested value, $Res Function(InboxReadRequested) _then) = _$InboxReadRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$InboxReadRequestedCopyWithImpl<$Res>
    implements $InboxReadRequestedCopyWith<$Res> {
  _$InboxReadRequestedCopyWithImpl(this._self, this._then);

  final InboxReadRequested _self;
  final $Res Function(InboxReadRequested) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(InboxReadRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InboxReadAllRequested implements InboxEvent {
  const InboxReadAllRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxReadAllRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InboxEvent.readAllRequested()';
}


}




/// @nodoc


class InboxArchiveRequested implements InboxEvent {
  const InboxArchiveRequested(this.id);
  

 final  String id;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxArchiveRequestedCopyWith<InboxArchiveRequested> get copyWith => _$InboxArchiveRequestedCopyWithImpl<InboxArchiveRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxArchiveRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'InboxEvent.archiveRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $InboxArchiveRequestedCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxArchiveRequestedCopyWith(InboxArchiveRequested value, $Res Function(InboxArchiveRequested) _then) = _$InboxArchiveRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$InboxArchiveRequestedCopyWithImpl<$Res>
    implements $InboxArchiveRequestedCopyWith<$Res> {
  _$InboxArchiveRequestedCopyWithImpl(this._self, this._then);

  final InboxArchiveRequested _self;
  final $Res Function(InboxArchiveRequested) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(InboxArchiveRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InboxArchiveUndone implements InboxEvent {
  const InboxArchiveUndone(this.id);
  

 final  String id;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxArchiveUndoneCopyWith<InboxArchiveUndone> get copyWith => _$InboxArchiveUndoneCopyWithImpl<InboxArchiveUndone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxArchiveUndone&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'InboxEvent.archiveUndone(id: $id)';
}


}

/// @nodoc
abstract mixin class $InboxArchiveUndoneCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxArchiveUndoneCopyWith(InboxArchiveUndone value, $Res Function(InboxArchiveUndone) _then) = _$InboxArchiveUndoneCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$InboxArchiveUndoneCopyWithImpl<$Res>
    implements $InboxArchiveUndoneCopyWith<$Res> {
  _$InboxArchiveUndoneCopyWithImpl(this._self, this._then);

  final InboxArchiveUndone _self;
  final $Res Function(InboxArchiveUndone) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(InboxArchiveUndone(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InboxArchiveCommitted implements InboxEvent {
  const InboxArchiveCommitted(this.id);
  

 final  String id;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxArchiveCommittedCopyWith<InboxArchiveCommitted> get copyWith => _$InboxArchiveCommittedCopyWithImpl<InboxArchiveCommitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxArchiveCommitted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'InboxEvent.archiveCommitted(id: $id)';
}


}

/// @nodoc
abstract mixin class $InboxArchiveCommittedCopyWith<$Res> implements $InboxEventCopyWith<$Res> {
  factory $InboxArchiveCommittedCopyWith(InboxArchiveCommitted value, $Res Function(InboxArchiveCommitted) _then) = _$InboxArchiveCommittedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$InboxArchiveCommittedCopyWithImpl<$Res>
    implements $InboxArchiveCommittedCopyWith<$Res> {
  _$InboxArchiveCommittedCopyWithImpl(this._self, this._then);

  final InboxArchiveCommitted _self;
  final $Res Function(InboxArchiveCommitted) _then;

/// Create a copy of InboxEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(InboxArchiveCommitted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
