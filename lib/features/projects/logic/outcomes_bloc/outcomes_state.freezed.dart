// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outcomes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OutcomesState {

// ── list ("my outcomes" / manager's PENDING queue) ───────────────────
 OutcomesFeedStatus get listStatus; List<OutcomeView> get outcomes; PaginationMeta? get pagination; OutcomesFilter get filter; String? get listErrorMessage;// ── detail ───────────────────────────────────────────────────────
 OutcomeDetailStatus get detailStatus; OutcomeView? get selectedOutcome; String? get detailErrorMessage;// ── mutation (submit won/lost, confirm, reject/withdraw) ─────────────
 OutcomeMutationStatus get mutationStatus; OutcomeView? get lastMutatedOutcome; String? get mutationErrorMessage;
/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomesStateCopyWith<OutcomesState> get copyWith => _$OutcomesStateCopyWithImpl<OutcomesState>(this as OutcomesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomesState&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&const DeepCollectionEquality().equals(other.outcomes, outcomes)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.listErrorMessage, listErrorMessage) || other.listErrorMessage == listErrorMessage)&&(identical(other.detailStatus, detailStatus) || other.detailStatus == detailStatus)&&(identical(other.selectedOutcome, selectedOutcome) || other.selectedOutcome == selectedOutcome)&&(identical(other.detailErrorMessage, detailErrorMessage) || other.detailErrorMessage == detailErrorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.lastMutatedOutcome, lastMutatedOutcome) || other.lastMutatedOutcome == lastMutatedOutcome)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,listStatus,const DeepCollectionEquality().hash(outcomes),pagination,filter,listErrorMessage,detailStatus,selectedOutcome,detailErrorMessage,mutationStatus,lastMutatedOutcome,mutationErrorMessage);

@override
String toString() {
  return 'OutcomesState(listStatus: $listStatus, outcomes: $outcomes, pagination: $pagination, filter: $filter, listErrorMessage: $listErrorMessage, detailStatus: $detailStatus, selectedOutcome: $selectedOutcome, detailErrorMessage: $detailErrorMessage, mutationStatus: $mutationStatus, lastMutatedOutcome: $lastMutatedOutcome, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class $OutcomesStateCopyWith<$Res>  {
  factory $OutcomesStateCopyWith(OutcomesState value, $Res Function(OutcomesState) _then) = _$OutcomesStateCopyWithImpl;
@useResult
$Res call({
 OutcomesFeedStatus listStatus, List<OutcomeView> outcomes, PaginationMeta? pagination, OutcomesFilter filter, String? listErrorMessage, OutcomeDetailStatus detailStatus, OutcomeView? selectedOutcome, String? detailErrorMessage, OutcomeMutationStatus mutationStatus, OutcomeView? lastMutatedOutcome, String? mutationErrorMessage
});


$PaginationMetaCopyWith<$Res>? get pagination;$OutcomesFilterCopyWith<$Res> get filter;$OutcomeViewCopyWith<$Res>? get selectedOutcome;$OutcomeViewCopyWith<$Res>? get lastMutatedOutcome;

}
/// @nodoc
class _$OutcomesStateCopyWithImpl<$Res>
    implements $OutcomesStateCopyWith<$Res> {
  _$OutcomesStateCopyWithImpl(this._self, this._then);

  final OutcomesState _self;
  final $Res Function(OutcomesState) _then;

/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listStatus = null,Object? outcomes = null,Object? pagination = freezed,Object? filter = null,Object? listErrorMessage = freezed,Object? detailStatus = null,Object? selectedOutcome = freezed,Object? detailErrorMessage = freezed,Object? mutationStatus = null,Object? lastMutatedOutcome = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_self.copyWith(
listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as OutcomesFeedStatus,outcomes: null == outcomes ? _self.outcomes : outcomes // ignore: cast_nullable_to_non_nullable
as List<OutcomeView>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OutcomesFilter,listErrorMessage: freezed == listErrorMessage ? _self.listErrorMessage : listErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,detailStatus: null == detailStatus ? _self.detailStatus : detailStatus // ignore: cast_nullable_to_non_nullable
as OutcomeDetailStatus,selectedOutcome: freezed == selectedOutcome ? _self.selectedOutcome : selectedOutcome // ignore: cast_nullable_to_non_nullable
as OutcomeView?,detailErrorMessage: freezed == detailErrorMessage ? _self.detailErrorMessage : detailErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as OutcomeMutationStatus,lastMutatedOutcome: freezed == lastMutatedOutcome ? _self.lastMutatedOutcome : lastMutatedOutcome // ignore: cast_nullable_to_non_nullable
as OutcomeView?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OutcomesState
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
}/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomesFilterCopyWith<$Res> get filter {
  
  return $OutcomesFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomeViewCopyWith<$Res>? get selectedOutcome {
    if (_self.selectedOutcome == null) {
    return null;
  }

  return $OutcomeViewCopyWith<$Res>(_self.selectedOutcome!, (value) {
    return _then(_self.copyWith(selectedOutcome: value));
  });
}/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomeViewCopyWith<$Res>? get lastMutatedOutcome {
    if (_self.lastMutatedOutcome == null) {
    return null;
  }

  return $OutcomeViewCopyWith<$Res>(_self.lastMutatedOutcome!, (value) {
    return _then(_self.copyWith(lastMutatedOutcome: value));
  });
}
}


/// Adds pattern-matching-related methods to [OutcomesState].
extension OutcomesStatePatterns on OutcomesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutcomesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutcomesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutcomesState value)  $default,){
final _that = this;
switch (_that) {
case _OutcomesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutcomesState value)?  $default,){
final _that = this;
switch (_that) {
case _OutcomesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OutcomesFeedStatus listStatus,  List<OutcomeView> outcomes,  PaginationMeta? pagination,  OutcomesFilter filter,  String? listErrorMessage,  OutcomeDetailStatus detailStatus,  OutcomeView? selectedOutcome,  String? detailErrorMessage,  OutcomeMutationStatus mutationStatus,  OutcomeView? lastMutatedOutcome,  String? mutationErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutcomesState() when $default != null:
return $default(_that.listStatus,_that.outcomes,_that.pagination,_that.filter,_that.listErrorMessage,_that.detailStatus,_that.selectedOutcome,_that.detailErrorMessage,_that.mutationStatus,_that.lastMutatedOutcome,_that.mutationErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OutcomesFeedStatus listStatus,  List<OutcomeView> outcomes,  PaginationMeta? pagination,  OutcomesFilter filter,  String? listErrorMessage,  OutcomeDetailStatus detailStatus,  OutcomeView? selectedOutcome,  String? detailErrorMessage,  OutcomeMutationStatus mutationStatus,  OutcomeView? lastMutatedOutcome,  String? mutationErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _OutcomesState():
return $default(_that.listStatus,_that.outcomes,_that.pagination,_that.filter,_that.listErrorMessage,_that.detailStatus,_that.selectedOutcome,_that.detailErrorMessage,_that.mutationStatus,_that.lastMutatedOutcome,_that.mutationErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OutcomesFeedStatus listStatus,  List<OutcomeView> outcomes,  PaginationMeta? pagination,  OutcomesFilter filter,  String? listErrorMessage,  OutcomeDetailStatus detailStatus,  OutcomeView? selectedOutcome,  String? detailErrorMessage,  OutcomeMutationStatus mutationStatus,  OutcomeView? lastMutatedOutcome,  String? mutationErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OutcomesState() when $default != null:
return $default(_that.listStatus,_that.outcomes,_that.pagination,_that.filter,_that.listErrorMessage,_that.detailStatus,_that.selectedOutcome,_that.detailErrorMessage,_that.mutationStatus,_that.lastMutatedOutcome,_that.mutationErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OutcomesState implements OutcomesState {
  const _OutcomesState({this.listStatus = OutcomesFeedStatus.initial, final  List<OutcomeView> outcomes = const <OutcomeView>[], this.pagination, this.filter = const OutcomesFilter(), this.listErrorMessage, this.detailStatus = OutcomeDetailStatus.idle, this.selectedOutcome, this.detailErrorMessage, this.mutationStatus = OutcomeMutationStatus.idle, this.lastMutatedOutcome, this.mutationErrorMessage}): _outcomes = outcomes;
  

// ── list ("my outcomes" / manager's PENDING queue) ───────────────────
@override@JsonKey() final  OutcomesFeedStatus listStatus;
 final  List<OutcomeView> _outcomes;
@override@JsonKey() List<OutcomeView> get outcomes {
  if (_outcomes is EqualUnmodifiableListView) return _outcomes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_outcomes);
}

@override final  PaginationMeta? pagination;
@override@JsonKey() final  OutcomesFilter filter;
@override final  String? listErrorMessage;
// ── detail ───────────────────────────────────────────────────────
@override@JsonKey() final  OutcomeDetailStatus detailStatus;
@override final  OutcomeView? selectedOutcome;
@override final  String? detailErrorMessage;
// ── mutation (submit won/lost, confirm, reject/withdraw) ─────────────
@override@JsonKey() final  OutcomeMutationStatus mutationStatus;
@override final  OutcomeView? lastMutatedOutcome;
@override final  String? mutationErrorMessage;

/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutcomesStateCopyWith<_OutcomesState> get copyWith => __$OutcomesStateCopyWithImpl<_OutcomesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutcomesState&&(identical(other.listStatus, listStatus) || other.listStatus == listStatus)&&const DeepCollectionEquality().equals(other._outcomes, _outcomes)&&(identical(other.pagination, pagination) || other.pagination == pagination)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.listErrorMessage, listErrorMessage) || other.listErrorMessage == listErrorMessage)&&(identical(other.detailStatus, detailStatus) || other.detailStatus == detailStatus)&&(identical(other.selectedOutcome, selectedOutcome) || other.selectedOutcome == selectedOutcome)&&(identical(other.detailErrorMessage, detailErrorMessage) || other.detailErrorMessage == detailErrorMessage)&&(identical(other.mutationStatus, mutationStatus) || other.mutationStatus == mutationStatus)&&(identical(other.lastMutatedOutcome, lastMutatedOutcome) || other.lastMutatedOutcome == lastMutatedOutcome)&&(identical(other.mutationErrorMessage, mutationErrorMessage) || other.mutationErrorMessage == mutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,listStatus,const DeepCollectionEquality().hash(_outcomes),pagination,filter,listErrorMessage,detailStatus,selectedOutcome,detailErrorMessage,mutationStatus,lastMutatedOutcome,mutationErrorMessage);

@override
String toString() {
  return 'OutcomesState(listStatus: $listStatus, outcomes: $outcomes, pagination: $pagination, filter: $filter, listErrorMessage: $listErrorMessage, detailStatus: $detailStatus, selectedOutcome: $selectedOutcome, detailErrorMessage: $detailErrorMessage, mutationStatus: $mutationStatus, lastMutatedOutcome: $lastMutatedOutcome, mutationErrorMessage: $mutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$OutcomesStateCopyWith<$Res> implements $OutcomesStateCopyWith<$Res> {
  factory _$OutcomesStateCopyWith(_OutcomesState value, $Res Function(_OutcomesState) _then) = __$OutcomesStateCopyWithImpl;
@override @useResult
$Res call({
 OutcomesFeedStatus listStatus, List<OutcomeView> outcomes, PaginationMeta? pagination, OutcomesFilter filter, String? listErrorMessage, OutcomeDetailStatus detailStatus, OutcomeView? selectedOutcome, String? detailErrorMessage, OutcomeMutationStatus mutationStatus, OutcomeView? lastMutatedOutcome, String? mutationErrorMessage
});


@override $PaginationMetaCopyWith<$Res>? get pagination;@override $OutcomesFilterCopyWith<$Res> get filter;@override $OutcomeViewCopyWith<$Res>? get selectedOutcome;@override $OutcomeViewCopyWith<$Res>? get lastMutatedOutcome;

}
/// @nodoc
class __$OutcomesStateCopyWithImpl<$Res>
    implements _$OutcomesStateCopyWith<$Res> {
  __$OutcomesStateCopyWithImpl(this._self, this._then);

  final _OutcomesState _self;
  final $Res Function(_OutcomesState) _then;

/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listStatus = null,Object? outcomes = null,Object? pagination = freezed,Object? filter = null,Object? listErrorMessage = freezed,Object? detailStatus = null,Object? selectedOutcome = freezed,Object? detailErrorMessage = freezed,Object? mutationStatus = null,Object? lastMutatedOutcome = freezed,Object? mutationErrorMessage = freezed,}) {
  return _then(_OutcomesState(
listStatus: null == listStatus ? _self.listStatus : listStatus // ignore: cast_nullable_to_non_nullable
as OutcomesFeedStatus,outcomes: null == outcomes ? _self._outcomes : outcomes // ignore: cast_nullable_to_non_nullable
as List<OutcomeView>,pagination: freezed == pagination ? _self.pagination : pagination // ignore: cast_nullable_to_non_nullable
as PaginationMeta?,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OutcomesFilter,listErrorMessage: freezed == listErrorMessage ? _self.listErrorMessage : listErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,detailStatus: null == detailStatus ? _self.detailStatus : detailStatus // ignore: cast_nullable_to_non_nullable
as OutcomeDetailStatus,selectedOutcome: freezed == selectedOutcome ? _self.selectedOutcome : selectedOutcome // ignore: cast_nullable_to_non_nullable
as OutcomeView?,detailErrorMessage: freezed == detailErrorMessage ? _self.detailErrorMessage : detailErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,mutationStatus: null == mutationStatus ? _self.mutationStatus : mutationStatus // ignore: cast_nullable_to_non_nullable
as OutcomeMutationStatus,lastMutatedOutcome: freezed == lastMutatedOutcome ? _self.lastMutatedOutcome : lastMutatedOutcome // ignore: cast_nullable_to_non_nullable
as OutcomeView?,mutationErrorMessage: freezed == mutationErrorMessage ? _self.mutationErrorMessage : mutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OutcomesState
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
}/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomesFilterCopyWith<$Res> get filter {
  
  return $OutcomesFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomeViewCopyWith<$Res>? get selectedOutcome {
    if (_self.selectedOutcome == null) {
    return null;
  }

  return $OutcomeViewCopyWith<$Res>(_self.selectedOutcome!, (value) {
    return _then(_self.copyWith(selectedOutcome: value));
  });
}/// Create a copy of OutcomesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomeViewCopyWith<$Res>? get lastMutatedOutcome {
    if (_self.lastMutatedOutcome == null) {
    return null;
  }

  return $OutcomeViewCopyWith<$Res>(_self.lastMutatedOutcome!, (value) {
    return _then(_self.copyWith(lastMutatedOutcome: value));
  });
}
}

// dart format on
