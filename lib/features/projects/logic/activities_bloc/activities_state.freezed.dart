// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activities_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActivitiesState {

// ── needs-attention (Home tab; not wired yet — §12) ──────────────────
 ActivitiesFeedStatus get attentionStatus; List<AttentionItemView> get attentionItems; String? get attentionErrorMessage;// ── list (project-scoped or "your own feed") ─────────────────────────
 ActivitiesFeedStatus get listStatus; List<ActivityView> get activities; PaginationMeta? get pagination; ActivitiesFilter get filter; String? get listErrorMessage;// ── detail ────────────────────────────────────────────────────────
 ActivityDetailStatus get detailStatus; ActivityDetailView? get selectedActivity; String? get detailErrorMessage;// ── mutation (log / edit) ────────────────────────────────────────────
 ActivityMutationStatus get mutationStatus; ActivityView? get lastMutatedActivity; String? get lastLogSuggestion; String? get mutationErrorMessage;
/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActivitiesStateCopyWith<ActivitiesState> get copyWith => _$ActivitiesStateCopyWithImpl<ActivitiesState>(this as ActivitiesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActivitiesState&&(identical(other.attentionStatus, attentionStatus) || other.attentionStatus == attentionStatus)&&const DeepCollectionEquality().equals(other.attentionItems, attentionItems)&&(identical(other.attentionErrorMessage, attentionErrorMessage) || other.attentionErrorMessage == attentionErrorMessage)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&const DeepCollectionEquality().equals(other.activities, activities)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.listErrorMessage, listErrorMessage) || other.listErrorMessage == listErrorMessage)&&(identical(other.detailStatus, detailStatus) || other.detailStatus == detailStatus)&&(identical(other.selectedActivity, selectedActivity) || other.selectedActivity == selectedActivity)&&(identical(other.detailErrorMessage, detailErrorMessage) || other.detailErrorMessage == detailErrorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.lastMutatedActivity, lastMutatedActivity) || other.lastMutatedActivity == lastMutatedActivity)&&(identical(other.lastLogSuggestion, lastLogSuggestion) || other.lastLogSuggestion == lastLogSuggestion)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,attentionStatus,const DeepCollectionEquality().hash(attentionItems),attentionErrorMessage,listStatus,const DeepCollectionEquality().hash(activities),pagination,filter,listErrorMessage,detailStatus,selectedActivity,detailErrorMessage,mutationStatus,lastMutatedActivity,lastLogSuggestion,mutationErrorMessage);

@override
String toString() {
  return 'ActivitiesState(attentionStatus: $attentionStatus, attentionItems: $attentionItems, attentionErrorMessage: $attentionErrorMessage, listStatus: $listStatus, activities: $activities, pagination: $pagination, filter: $filter, listErrorMessage: $listErrorMessage, detailStatus: $detailStatus, selectedActivity: $selectedActivity, detailErrorMessage: $detailErrorMessage, mutationStatus: $mutationStatus, lastMutatedActivity: $lastMutatedActivity, lastLogSuggestion: $lastLogSuggestion, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class $ActivitiesStateCopyWith<$Res>  {
  factory $ActivitiesStateCopyWith(ActivitiesState value, $Res Function(ActivitiesState) _then) = _$ActivitiesStateCopyWithImpl;
@useResult
$Res call({
 ActivitiesFeedStatus attentionStatus, List<AttentionItemView> attentionItems, String? attentionErrorMessage, ActivitiesFeedStatus listStatus, List<ActivityView> activities, PaginationMeta? pagination, ActivitiesFilter filter, String? listErrorMessage, ActivityDetailStatus detailStatus, ActivityDetailView? selectedActivity, String? detailErrorMessage, ActivityMutationStatus mutationStatus, ActivityView? lastMutatedActivity, String? lastLogSuggestion, String? mutationErrorMessage
});


$PaginationMetaCopyWith<$Res>? get pagination;$ActivitiesFilterCopyWith<$Res> get filter;$ActivityDetailViewCopyWith<$Res>? get selectedActivity;$ActivityViewCopyWith<$Res>? get lastMutatedActivity;

}
/// @nodoc
class _$ActivitiesStateCopyWithImpl<$Res>
    implements $ActivitiesStateCopyWith<$Res> {
  _$ActivitiesStateCopyWithImpl(this._self, this._then);

  final ActivitiesState _self;
  final $Res Function(ActivitiesState) _then;

/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attentionStatus = null,Object? attentionItems = null,Object? attentionErrorMessage = freezed,Object? listStatus = null,Object? activities = null,Object? pagination = freezed,Object? filter = null,Object? listErrorMessage = freezed,Object? detailStatus = null,Object? selectedActivity = freezed,Object? detailErrorMessage = freezed,Object? mutationStatus = null,Object? lastMutatedActivity = freezed,Object? lastLogSuggestion = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_self.copyWith(
attentionStatus: null == attentionStatus ? _self.attentionStatus : attentionStatus // ignore: cast_nullable_to_non_nullable
as ActivitiesFeedStatus,attentionItems: null == attentionItems ? _self.attentionItems : attentionItems // ignore: cast_nullable_to_non_nullable
as List<AttentionItemView>,attentionErrorMessage: freezed == attentionErrorMessage ? _self.attentionErrorMessage : attentionErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as ActivitiesFeedStatus,activities: null == activities ? _self.activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityView>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ActivitiesFilter,listErrorMessage: freezed == listErrorMessage ? _self.listErrorMessage : listErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,detailStatus: null == detailStatus ? _self.detailStatus : detailStatus // ignore: cast_nullable_to_non_nullable
as ActivityDetailStatus,selectedActivity: freezed == selectedActivity ? _self.selectedActivity : selectedActivity // ignore: cast_nullable_to_non_nullable
as ActivityDetailView?,detailErrorMessage: freezed == detailErrorMessage ? _self.detailErrorMessage : detailErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as ActivityMutationStatus,lastMutatedActivity: freezed == lastMutatedActivity ? _self.lastMutatedActivity : lastMutatedActivity // ignore: cast_nullable_to_non_nullable
as ActivityView?,lastLogSuggestion: freezed == lastLogSuggestion ? _self.lastLogSuggestion : lastLogSuggestion // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivitiesFilterCopyWith<$Res> get filter {
  
  return $ActivitiesFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityDetailViewCopyWith<$Res>? get selectedActivity {
    if (_self.selectedActivity == null) {
    return null;
  }

  return $ActivityDetailViewCopyWith<$Res>(_self.selectedActivity!, (value) {
    return _then(_self.copyWith(selectedActivity: value));
  });
}/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityViewCopyWith<$Res>? get lastMutatedActivity {
    if (_self.lastMutatedActivity == null) {
    return null;
  }

  return $ActivityViewCopyWith<$Res>(_self.lastMutatedActivity!, (value) {
    return _then(_self.copyWith(lastMutatedActivity: value));
  });
}
}


/// Adds pattern-matching-related methods to [ActivitiesState].
extension ActivitiesStatePatterns on ActivitiesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActivitiesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActivitiesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActivitiesState value)  $default,){
final _that = this;
switch (_that) {
case _ActivitiesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActivitiesState value)?  $default,){
final _that = this;
switch (_that) {
case _ActivitiesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ActivitiesFeedStatus attentionStatus,  List<AttentionItemView> attentionItems,  String? attentionErrorMessage,  ActivitiesFeedStatus listStatus,  List<ActivityView> activities,  PaginationMeta? pagination,  ActivitiesFilter filter,  String? listErrorMessage,  ActivityDetailStatus detailStatus,  ActivityDetailView? selectedActivity,  String? detailErrorMessage,  ActivityMutationStatus mutationStatus,  ActivityView? lastMutatedActivity,  String? lastLogSuggestion,  String? mutationErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActivitiesState() when $default != null:
return $default(_that.attentionStatus,_that.attentionItems,_that.attentionErrorMessage,_that.listStatus,_that.activities,_that.pagination,_that.filter,_that.listErrorMessage,_that.detailStatus,_that.selectedActivity,_that.detailErrorMessage,_that.mutationStatus,_that.lastMutatedActivity,_that.lastLogSuggestion,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ActivitiesFeedStatus attentionStatus,  List<AttentionItemView> attentionItems,  String? attentionErrorMessage,  ActivitiesFeedStatus listStatus,  List<ActivityView> activities,  PaginationMeta? pagination,  ActivitiesFilter filter,  String? listErrorMessage,  ActivityDetailStatus detailStatus,  ActivityDetailView? selectedActivity,  String? detailErrorMessage,  ActivityMutationStatus mutationStatus,  ActivityView? lastMutatedActivity,  String? lastLogSuggestion,  String? mutationErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _ActivitiesState():
return $default(_that.attentionStatus,_that.attentionItems,_that.attentionErrorMessage,_that.listStatus,_that.activities,_that.pagination,_that.filter,_that.listErrorMessage,_that.detailStatus,_that.selectedActivity,_that.detailErrorMessage,_that.mutationStatus,_that.lastMutatedActivity,_that.lastLogSuggestion,_that.mutationErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ActivitiesFeedStatus attentionStatus,  List<AttentionItemView> attentionItems,  String? attentionErrorMessage,  ActivitiesFeedStatus listStatus,  List<ActivityView> activities,  PaginationMeta? pagination,  ActivitiesFilter filter,  String? listErrorMessage,  ActivityDetailStatus detailStatus,  ActivityDetailView? selectedActivity,  String? detailErrorMessage,  ActivityMutationStatus mutationStatus,  ActivityView? lastMutatedActivity,  String? lastLogSuggestion,  String? mutationErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ActivitiesState() when $default != null:
return $default(_that.attentionStatus,_that.attentionItems,_that.attentionErrorMessage,_that.listStatus,_that.activities,_that.pagination,_that.filter,_that.listErrorMessage,_that.detailStatus,_that.selectedActivity,_that.detailErrorMessage,_that.mutationStatus,_that.lastMutatedActivity,_that.lastLogSuggestion,_that.mutationErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ActivitiesState implements ActivitiesState {
  const _ActivitiesState({this.attentionStatus = ActivitiesFeedStatus.initial, final  List<AttentionItemView> attentionItems = const <AttentionItemView>[], this.attentionErrorMessage, this.listStatus = ActivitiesFeedStatus.initial, final  List<ActivityView> activities = const <ActivityView>[], this.pagination, this.filter = const ActivitiesFilter(), this.listErrorMessage, this.detailStatus = ActivityDetailStatus.idle, this.selectedActivity, this.detailErrorMessage, this.mutationStatus = ActivityMutationStatus.idle, this.lastMutatedActivity, this.lastLogSuggestion, this.mutationErrorMessage}): _attentionItems = attentionItems,_activities = activities;
  

// ── needs-attention (Home tab; not wired yet — §12) ──────────────────
@override@JsonKey() final  ActivitiesFeedStatus attentionStatus;
 final  List<AttentionItemView> _attentionItems;
@override@JsonKey() List<AttentionItemView> get attentionItems {
  if (_attentionItems is EqualUnmodifiableListView) return _attentionItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attentionItems);
}

@override final  String? attentionErrorMessage;
// ── list (project-scoped or "your own feed") ─────────────────────────
@override@JsonKey() final  ActivitiesFeedStatus listStatus;
 final  List<ActivityView> _activities;
@override@JsonKey() List<ActivityView> get activities {
  if (_activities is EqualUnmodifiableListView) return _activities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activities);
}

@override final  PaginationMeta? pagination;
@override@JsonKey() final  ActivitiesFilter filter;
@override final  String? listErrorMessage;
// ── detail ────────────────────────────────────────────────────────
@override@JsonKey() final  ActivityDetailStatus detailStatus;
@override final  ActivityDetailView? selectedActivity;
@override final  String? detailErrorMessage;
// ── mutation (log / edit) ────────────────────────────────────────────
@override@JsonKey() final  ActivityMutationStatus mutationStatus;
@override final  ActivityView? lastMutatedActivity;
@override final  String? lastLogSuggestion;
@override final  String? mutationErrorMessage;

/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActivitiesStateCopyWith<_ActivitiesState> get copyWith => __$ActivitiesStateCopyWithImpl<_ActivitiesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActivitiesState&&(identical(other.attentionStatus, attentionStatus) || other.attentionStatus == attentionStatus)&&const DeepCollectionEquality().equals(other._attentionItems, _attentionItems)&&(identical(other.attentionErrorMessage, attentionErrorMessage) || other.attentionErrorMessage == attentionErrorMessage)&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&const DeepCollectionEquality().equals(other._activities, _activities)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.listErrorMessage, listErrorMessage) || other.listErrorMessage == listErrorMessage)&&(identical(other.detailStatus, detailStatus) || other.detailStatus == detailStatus)&&(identical(other.selectedActivity, selectedActivity) || other.selectedActivity == selectedActivity)&&(identical(other.detailErrorMessage, detailErrorMessage) || other.detailErrorMessage == detailErrorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.lastMutatedActivity, lastMutatedActivity) || other.lastMutatedActivity == lastMutatedActivity)&&(identical(other.lastLogSuggestion, lastLogSuggestion) || other.lastLogSuggestion == lastLogSuggestion)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,attentionStatus,const DeepCollectionEquality().hash(_attentionItems),attentionErrorMessage,listStatus,const DeepCollectionEquality().hash(_activities),pagination,filter,listErrorMessage,detailStatus,selectedActivity,detailErrorMessage,mutationStatus,lastMutatedActivity,lastLogSuggestion,mutationErrorMessage);

@override
String toString() {
  return 'ActivitiesState(attentionStatus: $attentionStatus, attentionItems: $attentionItems, attentionErrorMessage: $attentionErrorMessage, listStatus: $listStatus, activities: $activities, pagination: $pagination, filter: $filter, listErrorMessage: $listErrorMessage, detailStatus: $detailStatus, selectedActivity: $selectedActivity, detailErrorMessage: $detailErrorMessage, mutationStatus: $mutationStatus, lastMutatedActivity: $lastMutatedActivity, lastLogSuggestion: $lastLogSuggestion, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$ActivitiesStateCopyWith<$Res> implements $ActivitiesStateCopyWith<$Res> {
  factory _$ActivitiesStateCopyWith(_ActivitiesState value, $Res Function(_ActivitiesState) _then) = __$ActivitiesStateCopyWithImpl;
@override @useResult
$Res call({
 ActivitiesFeedStatus attentionStatus, List<AttentionItemView> attentionItems, String? attentionErrorMessage, ActivitiesFeedStatus listStatus, List<ActivityView> activities, PaginationMeta? pagination, ActivitiesFilter filter, String? listErrorMessage, ActivityDetailStatus detailStatus, ActivityDetailView? selectedActivity, String? detailErrorMessage, ActivityMutationStatus mutationStatus, ActivityView? lastMutatedActivity, String? lastLogSuggestion, String? mutationErrorMessage
});


@override $PaginationMetaCopyWith<$Res>? get pagination;@override $ActivitiesFilterCopyWith<$Res> get filter;@override $ActivityDetailViewCopyWith<$Res>? get selectedActivity;@override $ActivityViewCopyWith<$Res>? get lastMutatedActivity;

}
/// @nodoc
class __$ActivitiesStateCopyWithImpl<$Res>
    implements _$ActivitiesStateCopyWith<$Res> {
  __$ActivitiesStateCopyWithImpl(this._self, this._then);

  final _ActivitiesState _self;
  final $Res Function(_ActivitiesState) _then;

/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attentionStatus = null,Object? attentionItems = null,Object? attentionErrorMessage = freezed,Object? listStatus = null,Object? activities = null,Object? pagination = freezed,Object? filter = null,Object? listErrorMessage = freezed,Object? detailStatus = null,Object? selectedActivity = freezed,Object? detailErrorMessage = freezed,Object? mutationStatus = null,Object? lastMutatedActivity = freezed,Object? lastLogSuggestion = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_ActivitiesState(
attentionStatus: null == attentionStatus ? _self.attentionStatus : attentionStatus // ignore: cast_nullable_to_non_nullable
as ActivitiesFeedStatus,attentionItems: null == attentionItems ? _self._attentionItems : attentionItems // ignore: cast_nullable_to_non_nullable
as List<AttentionItemView>,attentionErrorMessage: freezed == attentionErrorMessage ? _self.attentionErrorMessage : attentionErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as ActivitiesFeedStatus,activities: null == activities ? _self._activities : activities // ignore: cast_nullable_to_non_nullable
as List<ActivityView>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as ActivitiesFilter,listErrorMessage: freezed == listErrorMessage ? _self.listErrorMessage : listErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,detailStatus: null == detailStatus ? _self.detailStatus : detailStatus // ignore: cast_nullable_to_non_nullable
as ActivityDetailStatus,selectedActivity: freezed == selectedActivity ? _self.selectedActivity : selectedActivity // ignore: cast_nullable_to_non_nullable
as ActivityDetailView?,detailErrorMessage: freezed == detailErrorMessage ? _self.detailErrorMessage : detailErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as ActivityMutationStatus,lastMutatedActivity: freezed == lastMutatedActivity ? _self.lastMutatedActivity : lastMutatedActivity // ignore: cast_nullable_to_non_nullable
as ActivityView?,lastLogSuggestion: freezed == lastLogSuggestion ? _self.lastLogSuggestion : lastLogSuggestion // ignore: cast_nullable_to_non_nullable
as String?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaginationMetaCopyWith<$Res>? get pagination {
    if (_self.pagination == null) {
    return null;
  }

  return $PaginationMetaCopyWith<$Res>(_self.pagination!, (value) {
    return _then(_self.copyWith(pagination: value));
  });
}/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivitiesFilterCopyWith<$Res> get filter {
  
  return $ActivitiesFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityDetailViewCopyWith<$Res>? get selectedActivity {
    if (_self.selectedActivity == null) {
    return null;
  }

  return $ActivityDetailViewCopyWith<$Res>(_self.selectedActivity!, (value) {
    return _then(_self.copyWith(selectedActivity: value));
  });
}/// Create a copy of ActivitiesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActivityViewCopyWith<$Res>? get lastMutatedActivity {
    if (_self.lastMutatedActivity == null) {
    return null;
  }

  return $ActivityViewCopyWith<$Res>(_self.lastMutatedActivity!, (value) {
    return _then(_self.copyWith(lastMutatedActivity: value));
  });
}
}

// dart format on
