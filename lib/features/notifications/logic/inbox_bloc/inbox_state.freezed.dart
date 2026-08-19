// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inbox_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InboxState {

 InboxStatus get status; List<NotificationView> get notifications; NotificationFilter get filter; int get page; int get totalPages; bool get isLoadingMore; String? get errorMessage;/// Ids removed from the list but whose `DELETE` has not fired yet — the
/// undo window is still open. Held so a rebuild cannot resurrect a row
/// the rep already swiped away.
 Set<String> get pendingArchive;
/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InboxStateCopyWith<InboxState> get copyWith => _$InboxStateCopyWithImpl<InboxState>(this as InboxState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InboxState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.pendingArchive, pendingArchive));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(notifications),filter,page,totalPages,isLoadingMore,errorMessage,const DeepCollectionEquality().hash(pendingArchive));

@override
String toString() {
  return 'InboxState(status: $status, notifications: $notifications, filter: $filter, page: $page, totalPages: $totalPages, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, pendingArchive: $pendingArchive)';
}


}

/// @nodoc
abstract mixin class $InboxStateCopyWith<$Res>  {
  factory $InboxStateCopyWith(InboxState value, $Res Function(InboxState) _then) = _$InboxStateCopyWithImpl;
@useResult
$Res call({
 InboxStatus status, List<NotificationView> notifications, NotificationFilter filter, int page, int totalPages, bool isLoadingMore, String? errorMessage, Set<String> pendingArchive
});




}
/// @nodoc
class _$InboxStateCopyWithImpl<$Res>
    implements $InboxStateCopyWith<$Res> {
  _$InboxStateCopyWithImpl(this._self, this._then);

  final InboxState _self;
  final $Res Function(InboxState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? notifications = null,Object? filter = null,Object? page = null,Object? totalPages = null,Object? isLoadingMore = null,Object? errorMessage = freezed,Object? pendingArchive = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InboxStatus,notifications: null == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationView>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as NotificationFilter,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,pendingArchive: null == pendingArchive ? _self.pendingArchive : pendingArchive // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [InboxState].
extension InboxStatePatterns on InboxState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InboxState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InboxState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InboxState value)  $default,){
final _that = this;
switch (_that) {
case _InboxState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InboxState value)?  $default,){
final _that = this;
switch (_that) {
case _InboxState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InboxStatus status,  List<NotificationView> notifications,  NotificationFilter filter,  int page,  int totalPages,  bool isLoadingMore,  String? errorMessage,  Set<String> pendingArchive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InboxState() when $default != null:
return $default(_that.status,_that.notifications,_that.filter,_that.page,_that.totalPages,_that.isLoadingMore,_that.errorMessage,_that.pendingArchive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InboxStatus status,  List<NotificationView> notifications,  NotificationFilter filter,  int page,  int totalPages,  bool isLoadingMore,  String? errorMessage,  Set<String> pendingArchive)  $default,) {final _that = this;
switch (_that) {
case _InboxState():
return $default(_that.status,_that.notifications,_that.filter,_that.page,_that.totalPages,_that.isLoadingMore,_that.errorMessage,_that.pendingArchive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InboxStatus status,  List<NotificationView> notifications,  NotificationFilter filter,  int page,  int totalPages,  bool isLoadingMore,  String? errorMessage,  Set<String> pendingArchive)?  $default,) {final _that = this;
switch (_that) {
case _InboxState() when $default != null:
return $default(_that.status,_that.notifications,_that.filter,_that.page,_that.totalPages,_that.isLoadingMore,_that.errorMessage,_that.pendingArchive);case _:
  return null;

}
}

}

/// @nodoc


class _InboxState implements InboxState {
  const _InboxState({this.status = InboxStatus.initial, final  List<NotificationView> notifications = const <NotificationView>[], this.filter = NotificationFilter.all, this.page = 1, this.totalPages = 0, this.isLoadingMore = false, this.errorMessage, final  Set<String> pendingArchive = const <String>{}}): _notifications = notifications,_pendingArchive = pendingArchive;
  

@override@JsonKey() final  InboxStatus status;
 final  List<NotificationView> _notifications;
@override@JsonKey() List<NotificationView> get notifications {
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifications);
}

@override@JsonKey() final  NotificationFilter filter;
@override@JsonKey() final  int page;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  bool isLoadingMore;
@override final  String? errorMessage;
/// Ids removed from the list but whose `DELETE` has not fired yet — the
/// undo window is still open. Held so a rebuild cannot resurrect a row
/// the rep already swiped away.
 final  Set<String> _pendingArchive;
/// Ids removed from the list but whose `DELETE` has not fired yet — the
/// undo window is still open. Held so a rebuild cannot resurrect a row
/// the rep already swiped away.
@override@JsonKey() Set<String> get pendingArchive {
  if (_pendingArchive is EqualUnmodifiableSetView) return _pendingArchive;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_pendingArchive);
}


/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InboxStateCopyWith<_InboxState> get copyWith => __$InboxStateCopyWithImpl<_InboxState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InboxState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._pendingArchive, _pendingArchive));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_notifications),filter,page,totalPages,isLoadingMore,errorMessage,const DeepCollectionEquality().hash(_pendingArchive));

@override
String toString() {
  return 'InboxState(status: $status, notifications: $notifications, filter: $filter, page: $page, totalPages: $totalPages, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage, pendingArchive: $pendingArchive)';
}


}

/// @nodoc
abstract mixin class _$InboxStateCopyWith<$Res> implements $InboxStateCopyWith<$Res> {
  factory _$InboxStateCopyWith(_InboxState value, $Res Function(_InboxState) _then) = __$InboxStateCopyWithImpl;
@override @useResult
$Res call({
 InboxStatus status, List<NotificationView> notifications, NotificationFilter filter, int page, int totalPages, bool isLoadingMore, String? errorMessage, Set<String> pendingArchive
});




}
/// @nodoc
class __$InboxStateCopyWithImpl<$Res>
    implements _$InboxStateCopyWith<$Res> {
  __$InboxStateCopyWithImpl(this._self, this._then);

  final _InboxState _self;
  final $Res Function(_InboxState) _then;

/// Create a copy of InboxState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? notifications = null,Object? filter = null,Object? page = null,Object? totalPages = null,Object? isLoadingMore = null,Object? errorMessage = freezed,Object? pendingArchive = null,}) {
  return _then(_InboxState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InboxStatus,notifications: null == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<NotificationView>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as NotificationFilter,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,pendingArchive: null == pendingArchive ? _self._pendingArchive : pendingArchive // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
