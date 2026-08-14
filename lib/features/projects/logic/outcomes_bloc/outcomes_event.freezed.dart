// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outcomes_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OutcomesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OutcomesEvent()';
}


}

/// @nodoc
class $OutcomesEventCopyWith<$Res>  {
$OutcomesEventCopyWith(OutcomesEvent _, $Res Function(OutcomesEvent) __);
}


/// Adds pattern-matching-related methods to [OutcomesEvent].
extension OutcomesEventPatterns on OutcomesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OutcomeWonSubmitted value)?  wonSubmitted,TResult Function( OutcomeLostSubmitted value)?  lostSubmitted,TResult Function( OutcomesListRequested value)?  listRequested,TResult Function( OutcomesNextPageRequested value)?  nextPageRequested,TResult Function( OutcomeDetailRequested value)?  detailRequested,TResult Function( OutcomeConfirmSubmitted value)?  confirmSubmitted,TResult Function( OutcomeRejectSubmitted value)?  rejectSubmitted,TResult Function( OutcomeRetryRequested value)?  retryRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OutcomeWonSubmitted() when wonSubmitted != null:
return wonSubmitted(_that);case OutcomeLostSubmitted() when lostSubmitted != null:
return lostSubmitted(_that);case OutcomesListRequested() when listRequested != null:
return listRequested(_that);case OutcomesNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case OutcomeDetailRequested() when detailRequested != null:
return detailRequested(_that);case OutcomeConfirmSubmitted() when confirmSubmitted != null:
return confirmSubmitted(_that);case OutcomeRejectSubmitted() when rejectSubmitted != null:
return rejectSubmitted(_that);case OutcomeRetryRequested() when retryRequested != null:
return retryRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OutcomeWonSubmitted value)  wonSubmitted,required TResult Function( OutcomeLostSubmitted value)  lostSubmitted,required TResult Function( OutcomesListRequested value)  listRequested,required TResult Function( OutcomesNextPageRequested value)  nextPageRequested,required TResult Function( OutcomeDetailRequested value)  detailRequested,required TResult Function( OutcomeConfirmSubmitted value)  confirmSubmitted,required TResult Function( OutcomeRejectSubmitted value)  rejectSubmitted,required TResult Function( OutcomeRetryRequested value)  retryRequested,}){
final _that = this;
switch (_that) {
case OutcomeWonSubmitted():
return wonSubmitted(_that);case OutcomeLostSubmitted():
return lostSubmitted(_that);case OutcomesListRequested():
return listRequested(_that);case OutcomesNextPageRequested():
return nextPageRequested(_that);case OutcomeDetailRequested():
return detailRequested(_that);case OutcomeConfirmSubmitted():
return confirmSubmitted(_that);case OutcomeRejectSubmitted():
return rejectSubmitted(_that);case OutcomeRetryRequested():
return retryRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OutcomeWonSubmitted value)?  wonSubmitted,TResult? Function( OutcomeLostSubmitted value)?  lostSubmitted,TResult? Function( OutcomesListRequested value)?  listRequested,TResult? Function( OutcomesNextPageRequested value)?  nextPageRequested,TResult? Function( OutcomeDetailRequested value)?  detailRequested,TResult? Function( OutcomeConfirmSubmitted value)?  confirmSubmitted,TResult? Function( OutcomeRejectSubmitted value)?  rejectSubmitted,TResult? Function( OutcomeRetryRequested value)?  retryRequested,}){
final _that = this;
switch (_that) {
case OutcomeWonSubmitted() when wonSubmitted != null:
return wonSubmitted(_that);case OutcomeLostSubmitted() when lostSubmitted != null:
return lostSubmitted(_that);case OutcomesListRequested() when listRequested != null:
return listRequested(_that);case OutcomesNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case OutcomeDetailRequested() when detailRequested != null:
return detailRequested(_that);case OutcomeConfirmSubmitted() when confirmSubmitted != null:
return confirmSubmitted(_that);case OutcomeRejectSubmitted() when rejectSubmitted != null:
return rejectSubmitted(_that);case OutcomeRetryRequested() when retryRequested != null:
return retryRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String projectId,  SubmitWonRequest request)?  wonSubmitted,TResult Function( String projectId,  SubmitLostRequest request)?  lostSubmitted,TResult Function( OutcomesFilter filter)?  listRequested,TResult Function()?  nextPageRequested,TResult Function( String id)?  detailRequested,TResult Function( String id)?  confirmSubmitted,TResult Function( String id,  RejectOutcomeRequest request)?  rejectSubmitted,TResult Function()?  retryRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OutcomeWonSubmitted() when wonSubmitted != null:
return wonSubmitted(_that.projectId,_that.request);case OutcomeLostSubmitted() when lostSubmitted != null:
return lostSubmitted(_that.projectId,_that.request);case OutcomesListRequested() when listRequested != null:
return listRequested(_that.filter);case OutcomesNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case OutcomeDetailRequested() when detailRequested != null:
return detailRequested(_that.id);case OutcomeConfirmSubmitted() when confirmSubmitted != null:
return confirmSubmitted(_that.id);case OutcomeRejectSubmitted() when rejectSubmitted != null:
return rejectSubmitted(_that.id,_that.request);case OutcomeRetryRequested() when retryRequested != null:
return retryRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String projectId,  SubmitWonRequest request)  wonSubmitted,required TResult Function( String projectId,  SubmitLostRequest request)  lostSubmitted,required TResult Function( OutcomesFilter filter)  listRequested,required TResult Function()  nextPageRequested,required TResult Function( String id)  detailRequested,required TResult Function( String id)  confirmSubmitted,required TResult Function( String id,  RejectOutcomeRequest request)  rejectSubmitted,required TResult Function()  retryRequested,}) {final _that = this;
switch (_that) {
case OutcomeWonSubmitted():
return wonSubmitted(_that.projectId,_that.request);case OutcomeLostSubmitted():
return lostSubmitted(_that.projectId,_that.request);case OutcomesListRequested():
return listRequested(_that.filter);case OutcomesNextPageRequested():
return nextPageRequested();case OutcomeDetailRequested():
return detailRequested(_that.id);case OutcomeConfirmSubmitted():
return confirmSubmitted(_that.id);case OutcomeRejectSubmitted():
return rejectSubmitted(_that.id,_that.request);case OutcomeRetryRequested():
return retryRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String projectId,  SubmitWonRequest request)?  wonSubmitted,TResult? Function( String projectId,  SubmitLostRequest request)?  lostSubmitted,TResult? Function( OutcomesFilter filter)?  listRequested,TResult? Function()?  nextPageRequested,TResult? Function( String id)?  detailRequested,TResult? Function( String id)?  confirmSubmitted,TResult? Function( String id,  RejectOutcomeRequest request)?  rejectSubmitted,TResult? Function()?  retryRequested,}) {final _that = this;
switch (_that) {
case OutcomeWonSubmitted() when wonSubmitted != null:
return wonSubmitted(_that.projectId,_that.request);case OutcomeLostSubmitted() when lostSubmitted != null:
return lostSubmitted(_that.projectId,_that.request);case OutcomesListRequested() when listRequested != null:
return listRequested(_that.filter);case OutcomesNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case OutcomeDetailRequested() when detailRequested != null:
return detailRequested(_that.id);case OutcomeConfirmSubmitted() when confirmSubmitted != null:
return confirmSubmitted(_that.id);case OutcomeRejectSubmitted() when rejectSubmitted != null:
return rejectSubmitted(_that.id,_that.request);case OutcomeRetryRequested() when retryRequested != null:
return retryRequested();case _:
  return null;

}
}

}

/// @nodoc


class OutcomeWonSubmitted implements OutcomesEvent {
  const OutcomeWonSubmitted({required this.projectId, required this.request});
  

 final  String projectId;
 final  SubmitWonRequest request;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomeWonSubmittedCopyWith<OutcomeWonSubmitted> get copyWith => _$OutcomeWonSubmittedCopyWithImpl<OutcomeWonSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomeWonSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,request);

@override
String toString() {
  return 'OutcomesEvent.wonSubmitted(projectId: $projectId, request: $request)';
}


}

/// @nodoc
abstract mixin class $OutcomeWonSubmittedCopyWith<$Res> implements $OutcomesEventCopyWith<$Res> {
  factory $OutcomeWonSubmittedCopyWith(OutcomeWonSubmitted value, $Res Function(OutcomeWonSubmitted) _then) = _$OutcomeWonSubmittedCopyWithImpl;
@useResult
$Res call({
 String projectId, SubmitWonRequest request
});


$SubmitWonRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$OutcomeWonSubmittedCopyWithImpl<$Res>
    implements $OutcomeWonSubmittedCopyWith<$Res> {
  _$OutcomeWonSubmittedCopyWithImpl(this._self, this._then);

  final OutcomeWonSubmitted _self;
  final $Res Function(OutcomeWonSubmitted) _then;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? request = null,}) {
  return _then(OutcomeWonSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SubmitWonRequest,
  ));
}

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmitWonRequestCopyWith<$Res> get request {
  
  return $SubmitWonRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class OutcomeLostSubmitted implements OutcomesEvent {
  const OutcomeLostSubmitted({required this.projectId, required this.request});
  

 final  String projectId;
 final  SubmitLostRequest request;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomeLostSubmittedCopyWith<OutcomeLostSubmitted> get copyWith => _$OutcomeLostSubmittedCopyWithImpl<OutcomeLostSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomeLostSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,request);

@override
String toString() {
  return 'OutcomesEvent.lostSubmitted(projectId: $projectId, request: $request)';
}


}

/// @nodoc
abstract mixin class $OutcomeLostSubmittedCopyWith<$Res> implements $OutcomesEventCopyWith<$Res> {
  factory $OutcomeLostSubmittedCopyWith(OutcomeLostSubmitted value, $Res Function(OutcomeLostSubmitted) _then) = _$OutcomeLostSubmittedCopyWithImpl;
@useResult
$Res call({
 String projectId, SubmitLostRequest request
});


$SubmitLostRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$OutcomeLostSubmittedCopyWithImpl<$Res>
    implements $OutcomeLostSubmittedCopyWith<$Res> {
  _$OutcomeLostSubmittedCopyWithImpl(this._self, this._then);

  final OutcomeLostSubmitted _self;
  final $Res Function(OutcomeLostSubmitted) _then;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? request = null,}) {
  return _then(OutcomeLostSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SubmitLostRequest,
  ));
}

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmitLostRequestCopyWith<$Res> get request {
  
  return $SubmitLostRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class OutcomesListRequested implements OutcomesEvent {
  const OutcomesListRequested(this.filter);
  

 final  OutcomesFilter filter;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomesListRequestedCopyWith<OutcomesListRequested> get copyWith => _$OutcomesListRequestedCopyWithImpl<OutcomesListRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomesListRequested&&(identical(other.filter, filter) || other.filter == filter));
}


@override
int get hashCode => Object.hash(runtimeType,filter);

@override
String toString() {
  return 'OutcomesEvent.listRequested(filter: $filter)';
}


}

/// @nodoc
abstract mixin class $OutcomesListRequestedCopyWith<$Res> implements $OutcomesEventCopyWith<$Res> {
  factory $OutcomesListRequestedCopyWith(OutcomesListRequested value, $Res Function(OutcomesListRequested) _then) = _$OutcomesListRequestedCopyWithImpl;
@useResult
$Res call({
 OutcomesFilter filter
});


$OutcomesFilterCopyWith<$Res> get filter;

}
/// @nodoc
class _$OutcomesListRequestedCopyWithImpl<$Res>
    implements $OutcomesListRequestedCopyWith<$Res> {
  _$OutcomesListRequestedCopyWithImpl(this._self, this._then);

  final OutcomesListRequested _self;
  final $Res Function(OutcomesListRequested) _then;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? filter = null,}) {
  return _then(OutcomesListRequested(
null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as OutcomesFilter,
  ));
}

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OutcomesFilterCopyWith<$Res> get filter {
  
  return $OutcomesFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

/// @nodoc


class OutcomesNextPageRequested implements OutcomesEvent {
  const OutcomesNextPageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomesNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OutcomesEvent.nextPageRequested()';
}


}




/// @nodoc


class OutcomeDetailRequested implements OutcomesEvent {
  const OutcomeDetailRequested(this.id);
  

 final  String id;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomeDetailRequestedCopyWith<OutcomeDetailRequested> get copyWith => _$OutcomeDetailRequestedCopyWithImpl<OutcomeDetailRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomeDetailRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'OutcomesEvent.detailRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $OutcomeDetailRequestedCopyWith<$Res> implements $OutcomesEventCopyWith<$Res> {
  factory $OutcomeDetailRequestedCopyWith(OutcomeDetailRequested value, $Res Function(OutcomeDetailRequested) _then) = _$OutcomeDetailRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$OutcomeDetailRequestedCopyWithImpl<$Res>
    implements $OutcomeDetailRequestedCopyWith<$Res> {
  _$OutcomeDetailRequestedCopyWithImpl(this._self, this._then);

  final OutcomeDetailRequested _self;
  final $Res Function(OutcomeDetailRequested) _then;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(OutcomeDetailRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OutcomeConfirmSubmitted implements OutcomesEvent {
  const OutcomeConfirmSubmitted(this.id);
  

 final  String id;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomeConfirmSubmittedCopyWith<OutcomeConfirmSubmitted> get copyWith => _$OutcomeConfirmSubmittedCopyWithImpl<OutcomeConfirmSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomeConfirmSubmitted&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'OutcomesEvent.confirmSubmitted(id: $id)';
}


}

/// @nodoc
abstract mixin class $OutcomeConfirmSubmittedCopyWith<$Res> implements $OutcomesEventCopyWith<$Res> {
  factory $OutcomeConfirmSubmittedCopyWith(OutcomeConfirmSubmitted value, $Res Function(OutcomeConfirmSubmitted) _then) = _$OutcomeConfirmSubmittedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$OutcomeConfirmSubmittedCopyWithImpl<$Res>
    implements $OutcomeConfirmSubmittedCopyWith<$Res> {
  _$OutcomeConfirmSubmittedCopyWithImpl(this._self, this._then);

  final OutcomeConfirmSubmitted _self;
  final $Res Function(OutcomeConfirmSubmitted) _then;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(OutcomeConfirmSubmitted(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OutcomeRejectSubmitted implements OutcomesEvent {
  const OutcomeRejectSubmitted({required this.id, required this.request});
  

 final  String id;
 final  RejectOutcomeRequest request;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomeRejectSubmittedCopyWith<OutcomeRejectSubmitted> get copyWith => _$OutcomeRejectSubmittedCopyWithImpl<OutcomeRejectSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomeRejectSubmitted&&(identical(other.id, id) || other.id == id)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,id,request);

@override
String toString() {
  return 'OutcomesEvent.rejectSubmitted(id: $id, request: $request)';
}


}

/// @nodoc
abstract mixin class $OutcomeRejectSubmittedCopyWith<$Res> implements $OutcomesEventCopyWith<$Res> {
  factory $OutcomeRejectSubmittedCopyWith(OutcomeRejectSubmitted value, $Res Function(OutcomeRejectSubmitted) _then) = _$OutcomeRejectSubmittedCopyWithImpl;
@useResult
$Res call({
 String id, RejectOutcomeRequest request
});


$RejectOutcomeRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$OutcomeRejectSubmittedCopyWithImpl<$Res>
    implements $OutcomeRejectSubmittedCopyWith<$Res> {
  _$OutcomeRejectSubmittedCopyWithImpl(this._self, this._then);

  final OutcomeRejectSubmitted _self;
  final $Res Function(OutcomeRejectSubmitted) _then;

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? request = null,}) {
  return _then(OutcomeRejectSubmitted(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as RejectOutcomeRequest,
  ));
}

/// Create a copy of OutcomesEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RejectOutcomeRequestCopyWith<$Res> get request {
  
  return $RejectOutcomeRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class OutcomeRetryRequested implements OutcomesEvent {
  const OutcomeRetryRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomeRetryRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'OutcomesEvent.retryRequested()';
}


}




// dart format on
