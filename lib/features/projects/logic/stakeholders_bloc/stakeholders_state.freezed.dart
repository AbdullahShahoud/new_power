// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stakeholders_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StakeholdersState {

// ── links ─────────────────────────────────────────────────────────
 StakeholderLinksFeedStatus get linksStatus; List<StakeholderLinkView> get links; String? get linksErrorMessage;// ── link mutation (add / patch / close / replace) ────────────────
 StakeholderMutationStatus get linkMutationStatus; StakeholderLinkView? get lastMutatedLink; String? get linkMutationErrorMessage;// ── decision maker ────────────────────────────────────────────────
 DecisionMakerStatus get decisionMakerStatus; DecisionMakerView? get decisionMaker; String? get decisionMakerErrorMessage;// ── decision-maker mutation (set / remove) ───────────────────────
 StakeholderMutationStatus get decisionMakerMutationStatus; String? get decisionMakerMutationErrorMessage;// ── decision-maker history ───────────────────────────────────────
 DecisionMakerHistoryStatus get historyStatus; List<DecisionMakerHistoryEntry> get history; String? get historyErrorMessage;
/// Create a copy of StakeholdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholdersStateCopyWith<StakeholdersState> get copyWith => _$StakeholdersStateCopyWithImpl<StakeholdersState>(this as StakeholdersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholdersState&&(identical(other.linksStatus, linksStatus) || other.linksStatus == linksStatus)&&const DeepCollectionEquality().equals(other.links, links)&&(identical(other.linksErrorMessage, linksErrorMessage) || other.linksErrorMessage == linksErrorMessage)&&(identical(other.linkMutationStatus, linkMutationStatus) || other.linkMutationStatus == linkMutationStatus)&&(identical(other.lastMutatedLink, lastMutatedLink) || other.lastMutatedLink == lastMutatedLink)&&(identical(other.linkMutationErrorMessage, linkMutationErrorMessage) || other.linkMutationErrorMessage == linkMutationErrorMessage)&&(identical(other.decisionMakerStatus, decisionMakerStatus) || other.decisionMakerStatus == decisionMakerStatus)&&(identical(other.decisionMaker, decisionMaker) || other.decisionMaker == decisionMaker)&&(identical(other.decisionMakerErrorMessage, decisionMakerErrorMessage) || other.decisionMakerErrorMessage == decisionMakerErrorMessage)&&(identical(other.decisionMakerMutationStatus, decisionMakerMutationStatus) || other.decisionMakerMutationStatus == decisionMakerMutationStatus)&&(identical(other.decisionMakerMutationErrorMessage, decisionMakerMutationErrorMessage) || other.decisionMakerMutationErrorMessage == decisionMakerMutationErrorMessage)&&(identical(other.historyStatus, historyStatus) || other.historyStatus == historyStatus)&&const DeepCollectionEquality().equals(other.history, history)&&(identical(other.historyErrorMessage, historyErrorMessage) || other.historyErrorMessage == historyErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,linksStatus,const DeepCollectionEquality().hash(links),linksErrorMessage,linkMutationStatus,lastMutatedLink,linkMutationErrorMessage,decisionMakerStatus,decisionMaker,decisionMakerErrorMessage,decisionMakerMutationStatus,decisionMakerMutationErrorMessage,historyStatus,const DeepCollectionEquality().hash(history),historyErrorMessage);

@override
String toString() {
  return 'StakeholdersState(linksStatus: $linksStatus, links: $links, linksErrorMessage: $linksErrorMessage, linkMutationStatus: $linkMutationStatus, lastMutatedLink: $lastMutatedLink, linkMutationErrorMessage: $linkMutationErrorMessage, decisionMakerStatus: $decisionMakerStatus, decisionMaker: $decisionMaker, decisionMakerErrorMessage: $decisionMakerErrorMessage, decisionMakerMutationStatus: $decisionMakerMutationStatus, decisionMakerMutationErrorMessage: $decisionMakerMutationErrorMessage, historyStatus: $historyStatus, history: $history, historyErrorMessage: $historyErrorMessage)';
}


}

/// @nodoc
abstract mixin class $StakeholdersStateCopyWith<$Res>  {
  factory $StakeholdersStateCopyWith(StakeholdersState value, $Res Function(StakeholdersState) _then) = _$StakeholdersStateCopyWithImpl;
@useResult
$Res call({
 StakeholderLinksFeedStatus linksStatus, List<StakeholderLinkView> links, String? linksErrorMessage, StakeholderMutationStatus linkMutationStatus, StakeholderLinkView? lastMutatedLink, String? linkMutationErrorMessage, DecisionMakerStatus decisionMakerStatus, DecisionMakerView? decisionMaker, String? decisionMakerErrorMessage, StakeholderMutationStatus decisionMakerMutationStatus, String? decisionMakerMutationErrorMessage, DecisionMakerHistoryStatus historyStatus, List<DecisionMakerHistoryEntry> history, String? historyErrorMessage
});


$StakeholderLinkViewCopyWith<$Res>? get lastMutatedLink;$DecisionMakerViewCopyWith<$Res>? get decisionMaker;

}
/// @nodoc
class _$StakeholdersStateCopyWithImpl<$Res>
    implements $StakeholdersStateCopyWith<$Res> {
  _$StakeholdersStateCopyWithImpl(this._self, this._then);

  final StakeholdersState _self;
  final $Res Function(StakeholdersState) _then;

/// Create a copy of StakeholdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? linksStatus = null,Object? links = null,Object? linksErrorMessage = freezed,Object? linkMutationStatus = null,Object? lastMutatedLink = freezed,Object? linkMutationErrorMessage = freezed,Object? decisionMakerStatus = null,Object? decisionMaker = freezed,Object? decisionMakerErrorMessage = freezed,Object? decisionMakerMutationStatus = null,Object? decisionMakerMutationErrorMessage = freezed,Object? historyStatus = null,Object? history = null,Object? historyErrorMessage = freezed,}) {
  return _then(_self.copyWith(
linksStatus: null == linksStatus ? _self.linksStatus : linksStatus // ignore: cast_nullable_to_non_nullable
as StakeholderLinksFeedStatus,links: null == links ? _self.links : links // ignore: cast_nullable_to_non_nullable
as List<StakeholderLinkView>,linksErrorMessage: freezed == linksErrorMessage ? _self.linksErrorMessage : linksErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,linkMutationStatus: null == linkMutationStatus ? _self.linkMutationStatus : linkMutationStatus // ignore: cast_nullable_to_non_nullable
as StakeholderMutationStatus,lastMutatedLink: freezed == lastMutatedLink ? _self.lastMutatedLink : lastMutatedLink // ignore: cast_nullable_to_non_nullable
as StakeholderLinkView?,linkMutationErrorMessage: freezed == linkMutationErrorMessage ? _self.linkMutationErrorMessage : linkMutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,decisionMakerStatus: null == decisionMakerStatus ? _self.decisionMakerStatus : decisionMakerStatus // ignore: cast_nullable_to_non_nullable
as DecisionMakerStatus,decisionMaker: freezed == decisionMaker ? _self.decisionMaker : decisionMaker // ignore: cast_nullable_to_non_nullable
as DecisionMakerView?,decisionMakerErrorMessage: freezed == decisionMakerErrorMessage ? _self.decisionMakerErrorMessage : decisionMakerErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,decisionMakerMutationStatus: null == decisionMakerMutationStatus ? _self.decisionMakerMutationStatus : decisionMakerMutationStatus // ignore: cast_nullable_to_non_nullable
as StakeholderMutationStatus,decisionMakerMutationErrorMessage: freezed == decisionMakerMutationErrorMessage ? _self.decisionMakerMutationErrorMessage : decisionMakerMutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,historyStatus: null == historyStatus ? _self.historyStatus : historyStatus // ignore: cast_nullable_to_non_nullable
as DecisionMakerHistoryStatus,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<DecisionMakerHistoryEntry>,historyErrorMessage: freezed == historyErrorMessage ? _self.historyErrorMessage : historyErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of StakeholdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkViewCopyWith<$Res>? get lastMutatedLink {
    if (_self.lastMutatedLink == null) {
    return null;
  }

  return $StakeholderLinkViewCopyWith<$Res>(_self.lastMutatedLink!, (value) {
    return _then(_self.copyWith(lastMutatedLink: value));
  });
}/// Create a copy of StakeholdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DecisionMakerViewCopyWith<$Res>? get decisionMaker {
    if (_self.decisionMaker == null) {
    return null;
  }

  return $DecisionMakerViewCopyWith<$Res>(_self.decisionMaker!, (value) {
    return _then(_self.copyWith(decisionMaker: value));
  });
}
}


/// Adds pattern-matching-related methods to [StakeholdersState].
extension StakeholdersStatePatterns on StakeholdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StakeholdersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StakeholdersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StakeholdersState value)  $default,){
final _that = this;
switch (_that) {
case _StakeholdersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StakeholdersState value)?  $default,){
final _that = this;
switch (_that) {
case _StakeholdersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StakeholderLinksFeedStatus linksStatus,  List<StakeholderLinkView> links,  String? linksErrorMessage,  StakeholderMutationStatus linkMutationStatus,  StakeholderLinkView? lastMutatedLink,  String? linkMutationErrorMessage,  DecisionMakerStatus decisionMakerStatus,  DecisionMakerView? decisionMaker,  String? decisionMakerErrorMessage,  StakeholderMutationStatus decisionMakerMutationStatus,  String? decisionMakerMutationErrorMessage,  DecisionMakerHistoryStatus historyStatus,  List<DecisionMakerHistoryEntry> history,  String? historyErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StakeholdersState() when $default != null:
return $default(_that.linksStatus,_that.links,_that.linksErrorMessage,_that.linkMutationStatus,_that.lastMutatedLink,_that.linkMutationErrorMessage,_that.decisionMakerStatus,_that.decisionMaker,_that.decisionMakerErrorMessage,_that.decisionMakerMutationStatus,_that.decisionMakerMutationErrorMessage,_that.historyStatus,_that.history,_that.historyErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StakeholderLinksFeedStatus linksStatus,  List<StakeholderLinkView> links,  String? linksErrorMessage,  StakeholderMutationStatus linkMutationStatus,  StakeholderLinkView? lastMutatedLink,  String? linkMutationErrorMessage,  DecisionMakerStatus decisionMakerStatus,  DecisionMakerView? decisionMaker,  String? decisionMakerErrorMessage,  StakeholderMutationStatus decisionMakerMutationStatus,  String? decisionMakerMutationErrorMessage,  DecisionMakerHistoryStatus historyStatus,  List<DecisionMakerHistoryEntry> history,  String? historyErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _StakeholdersState():
return $default(_that.linksStatus,_that.links,_that.linksErrorMessage,_that.linkMutationStatus,_that.lastMutatedLink,_that.linkMutationErrorMessage,_that.decisionMakerStatus,_that.decisionMaker,_that.decisionMakerErrorMessage,_that.decisionMakerMutationStatus,_that.decisionMakerMutationErrorMessage,_that.historyStatus,_that.history,_that.historyErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StakeholderLinksFeedStatus linksStatus,  List<StakeholderLinkView> links,  String? linksErrorMessage,  StakeholderMutationStatus linkMutationStatus,  StakeholderLinkView? lastMutatedLink,  String? linkMutationErrorMessage,  DecisionMakerStatus decisionMakerStatus,  DecisionMakerView? decisionMaker,  String? decisionMakerErrorMessage,  StakeholderMutationStatus decisionMakerMutationStatus,  String? decisionMakerMutationErrorMessage,  DecisionMakerHistoryStatus historyStatus,  List<DecisionMakerHistoryEntry> history,  String? historyErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _StakeholdersState() when $default != null:
return $default(_that.linksStatus,_that.links,_that.linksErrorMessage,_that.linkMutationStatus,_that.lastMutatedLink,_that.linkMutationErrorMessage,_that.decisionMakerStatus,_that.decisionMaker,_that.decisionMakerErrorMessage,_that.decisionMakerMutationStatus,_that.decisionMakerMutationErrorMessage,_that.historyStatus,_that.history,_that.historyErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _StakeholdersState implements StakeholdersState {
  const _StakeholdersState({this.linksStatus = StakeholderLinksFeedStatus.initial, final  List<StakeholderLinkView> links = const <StakeholderLinkView>[], this.linksErrorMessage, this.linkMutationStatus = StakeholderMutationStatus.idle, this.lastMutatedLink, this.linkMutationErrorMessage, this.decisionMakerStatus = DecisionMakerStatus.initial, this.decisionMaker, this.decisionMakerErrorMessage, this.decisionMakerMutationStatus = StakeholderMutationStatus.idle, this.decisionMakerMutationErrorMessage, this.historyStatus = DecisionMakerHistoryStatus.initial, final  List<DecisionMakerHistoryEntry> history = const <DecisionMakerHistoryEntry>[], this.historyErrorMessage}): _links = links,_history = history;
  

// ── links ─────────────────────────────────────────────────────────
@override@JsonKey() final  StakeholderLinksFeedStatus linksStatus;
 final  List<StakeholderLinkView> _links;
@override@JsonKey() List<StakeholderLinkView> get links {
  if (_links is EqualUnmodifiableListView) return _links;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_links);
}

@override final  String? linksErrorMessage;
// ── link mutation (add / patch / close / replace) ────────────────
@override@JsonKey() final  StakeholderMutationStatus linkMutationStatus;
@override final  StakeholderLinkView? lastMutatedLink;
@override final  String? linkMutationErrorMessage;
// ── decision maker ────────────────────────────────────────────────
@override@JsonKey() final  DecisionMakerStatus decisionMakerStatus;
@override final  DecisionMakerView? decisionMaker;
@override final  String? decisionMakerErrorMessage;
// ── decision-maker mutation (set / remove) ───────────────────────
@override@JsonKey() final  StakeholderMutationStatus decisionMakerMutationStatus;
@override final  String? decisionMakerMutationErrorMessage;
// ── decision-maker history ───────────────────────────────────────
@override@JsonKey() final  DecisionMakerHistoryStatus historyStatus;
 final  List<DecisionMakerHistoryEntry> _history;
@override@JsonKey() List<DecisionMakerHistoryEntry> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override final  String? historyErrorMessage;

/// Create a copy of StakeholdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StakeholdersStateCopyWith<_StakeholdersState> get copyWith => __$StakeholdersStateCopyWithImpl<_StakeholdersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StakeholdersState&&(identical(other.linksStatus, linksStatus) || other.linksStatus == linksStatus)&&const DeepCollectionEquality().equals(other._links, _links)&&(identical(other.linksErrorMessage, linksErrorMessage) || other.linksErrorMessage == linksErrorMessage)&&(identical(other.linkMutationStatus, linkMutationStatus) || other.linkMutationStatus == linkMutationStatus)&&(identical(other.lastMutatedLink, lastMutatedLink) || other.lastMutatedLink == lastMutatedLink)&&(identical(other.linkMutationErrorMessage, linkMutationErrorMessage) || other.linkMutationErrorMessage == linkMutationErrorMessage)&&(identical(other.decisionMakerStatus, decisionMakerStatus) || other.decisionMakerStatus == decisionMakerStatus)&&(identical(other.decisionMaker, decisionMaker) || other.decisionMaker == decisionMaker)&&(identical(other.decisionMakerErrorMessage, decisionMakerErrorMessage) || other.decisionMakerErrorMessage == decisionMakerErrorMessage)&&(identical(other.decisionMakerMutationStatus, decisionMakerMutationStatus) || other.decisionMakerMutationStatus == decisionMakerMutationStatus)&&(identical(other.decisionMakerMutationErrorMessage, decisionMakerMutationErrorMessage) || other.decisionMakerMutationErrorMessage == decisionMakerMutationErrorMessage)&&(identical(other.historyStatus, historyStatus) || other.historyStatus == historyStatus)&&const DeepCollectionEquality().equals(other._history, _history)&&(identical(other.historyErrorMessage, historyErrorMessage) || other.historyErrorMessage == historyErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,linksStatus,const DeepCollectionEquality().hash(_links),linksErrorMessage,linkMutationStatus,lastMutatedLink,linkMutationErrorMessage,decisionMakerStatus,decisionMaker,decisionMakerErrorMessage,decisionMakerMutationStatus,decisionMakerMutationErrorMessage,historyStatus,const DeepCollectionEquality().hash(_history),historyErrorMessage);

@override
String toString() {
  return 'StakeholdersState(linksStatus: $linksStatus, links: $links, linksErrorMessage: $linksErrorMessage, linkMutationStatus: $linkMutationStatus, lastMutatedLink: $lastMutatedLink, linkMutationErrorMessage: $linkMutationErrorMessage, decisionMakerStatus: $decisionMakerStatus, decisionMaker: $decisionMaker, decisionMakerErrorMessage: $decisionMakerErrorMessage, decisionMakerMutationStatus: $decisionMakerMutationStatus, decisionMakerMutationErrorMessage: $decisionMakerMutationErrorMessage, historyStatus: $historyStatus, history: $history, historyErrorMessage: $historyErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$StakeholdersStateCopyWith<$Res> implements $StakeholdersStateCopyWith<$Res> {
  factory _$StakeholdersStateCopyWith(_StakeholdersState value, $Res Function(_StakeholdersState) _then) = __$StakeholdersStateCopyWithImpl;
@override @useResult
$Res call({
 StakeholderLinksFeedStatus linksStatus, List<StakeholderLinkView> links, String? linksErrorMessage, StakeholderMutationStatus linkMutationStatus, StakeholderLinkView? lastMutatedLink, String? linkMutationErrorMessage, DecisionMakerStatus decisionMakerStatus, DecisionMakerView? decisionMaker, String? decisionMakerErrorMessage, StakeholderMutationStatus decisionMakerMutationStatus, String? decisionMakerMutationErrorMessage, DecisionMakerHistoryStatus historyStatus, List<DecisionMakerHistoryEntry> history, String? historyErrorMessage
});


@override $StakeholderLinkViewCopyWith<$Res>? get lastMutatedLink;@override $DecisionMakerViewCopyWith<$Res>? get decisionMaker;

}
/// @nodoc
class __$StakeholdersStateCopyWithImpl<$Res>
    implements _$StakeholdersStateCopyWith<$Res> {
  __$StakeholdersStateCopyWithImpl(this._self, this._then);

  final _StakeholdersState _self;
  final $Res Function(_StakeholdersState) _then;

/// Create a copy of StakeholdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? linksStatus = null,Object? links = null,Object? linksErrorMessage = freezed,Object? linkMutationStatus = null,Object? lastMutatedLink = freezed,Object? linkMutationErrorMessage = freezed,Object? decisionMakerStatus = null,Object? decisionMaker = freezed,Object? decisionMakerErrorMessage = freezed,Object? decisionMakerMutationStatus = null,Object? decisionMakerMutationErrorMessage = freezed,Object? historyStatus = null,Object? history = null,Object? historyErrorMessage = freezed,}) {
  return _then(_StakeholdersState(
linksStatus: null == linksStatus ? _self.linksStatus : linksStatus // ignore: cast_nullable_to_non_nullable
as StakeholderLinksFeedStatus,links: null == links ? _self._links : links // ignore: cast_nullable_to_non_nullable
as List<StakeholderLinkView>,linksErrorMessage: freezed == linksErrorMessage ? _self.linksErrorMessage : linksErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,linkMutationStatus: null == linkMutationStatus ? _self.linkMutationStatus : linkMutationStatus // ignore: cast_nullable_to_non_nullable
as StakeholderMutationStatus,lastMutatedLink: freezed == lastMutatedLink ? _self.lastMutatedLink : lastMutatedLink // ignore: cast_nullable_to_non_nullable
as StakeholderLinkView?,linkMutationErrorMessage: freezed == linkMutationErrorMessage ? _self.linkMutationErrorMessage : linkMutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,decisionMakerStatus: null == decisionMakerStatus ? _self.decisionMakerStatus : decisionMakerStatus // ignore: cast_nullable_to_non_nullable
as DecisionMakerStatus,decisionMaker: freezed == decisionMaker ? _self.decisionMaker : decisionMaker // ignore: cast_nullable_to_non_nullable
as DecisionMakerView?,decisionMakerErrorMessage: freezed == decisionMakerErrorMessage ? _self.decisionMakerErrorMessage : decisionMakerErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,decisionMakerMutationStatus: null == decisionMakerMutationStatus ? _self.decisionMakerMutationStatus : decisionMakerMutationStatus // ignore: cast_nullable_to_non_nullable
as StakeholderMutationStatus,decisionMakerMutationErrorMessage: freezed == decisionMakerMutationErrorMessage ? _self.decisionMakerMutationErrorMessage : decisionMakerMutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,historyStatus: null == historyStatus ? _self.historyStatus : historyStatus // ignore: cast_nullable_to_non_nullable
as DecisionMakerHistoryStatus,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<DecisionMakerHistoryEntry>,historyErrorMessage: freezed == historyErrorMessage ? _self.historyErrorMessage : historyErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StakeholdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StakeholderLinkViewCopyWith<$Res>? get lastMutatedLink {
    if (_self.lastMutatedLink == null) {
    return null;
  }

  return $StakeholderLinkViewCopyWith<$Res>(_self.lastMutatedLink!, (value) {
    return _then(_self.copyWith(lastMutatedLink: value));
  });
}/// Create a copy of StakeholdersState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DecisionMakerViewCopyWith<$Res>? get decisionMaker {
    if (_self.decisionMaker == null) {
    return null;
  }

  return $DecisionMakerViewCopyWith<$Res>(_self.decisionMaker!, (value) {
    return _then(_self.copyWith(decisionMaker: value));
  });
}
}

// dart format on
