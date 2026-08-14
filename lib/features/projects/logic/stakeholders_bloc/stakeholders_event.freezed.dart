// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stakeholders_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StakeholdersEvent {

 String get projectId;
/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholdersEventCopyWith<StakeholdersEvent> get copyWith => _$StakeholdersEventCopyWithImpl<StakeholdersEvent>(this as StakeholdersEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholdersEvent&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'StakeholdersEvent(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $StakeholdersEventCopyWith<$Res>  {
  factory $StakeholdersEventCopyWith(StakeholdersEvent value, $Res Function(StakeholdersEvent) _then) = _$StakeholdersEventCopyWithImpl;
@useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$StakeholdersEventCopyWithImpl<$Res>
    implements $StakeholdersEventCopyWith<$Res> {
  _$StakeholdersEventCopyWithImpl(this._self, this._then);

  final StakeholdersEvent _self;
  final $Res Function(StakeholdersEvent) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? projectId = null,}) {
  return _then(_self.copyWith(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StakeholdersEvent].
extension StakeholdersEventPatterns on StakeholdersEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StakeholderLinksListRequested value)?  linksListRequested,TResult Function( StakeholderLinkAddSubmitted value)?  linkAddSubmitted,TResult Function( StakeholderPersonAdded value)?  stakeholderPersonAdded,TResult Function( StakeholderPersonAddedToCompany value)?  stakeholderPersonAddedToCompany,TResult Function( StakeholderLinkPatchSubmitted value)?  linkPatchSubmitted,TResult Function( StakeholderLinkCloseSubmitted value)?  linkCloseSubmitted,TResult Function( StakeholderLinkReplaceSubmitted value)?  linkReplaceSubmitted,TResult Function( DecisionMakerRequested value)?  decisionMakerRequested,TResult Function( DecisionMakerSetSubmitted value)?  decisionMakerSetSubmitted,TResult Function( DecisionMakerRemoveSubmitted value)?  decisionMakerRemoveSubmitted,TResult Function( DecisionMakerHistoryRequested value)?  decisionMakerHistoryRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StakeholderLinksListRequested() when linksListRequested != null:
return linksListRequested(_that);case StakeholderLinkAddSubmitted() when linkAddSubmitted != null:
return linkAddSubmitted(_that);case StakeholderPersonAdded() when stakeholderPersonAdded != null:
return stakeholderPersonAdded(_that);case StakeholderPersonAddedToCompany() when stakeholderPersonAddedToCompany != null:
return stakeholderPersonAddedToCompany(_that);case StakeholderLinkPatchSubmitted() when linkPatchSubmitted != null:
return linkPatchSubmitted(_that);case StakeholderLinkCloseSubmitted() when linkCloseSubmitted != null:
return linkCloseSubmitted(_that);case StakeholderLinkReplaceSubmitted() when linkReplaceSubmitted != null:
return linkReplaceSubmitted(_that);case DecisionMakerRequested() when decisionMakerRequested != null:
return decisionMakerRequested(_that);case DecisionMakerSetSubmitted() when decisionMakerSetSubmitted != null:
return decisionMakerSetSubmitted(_that);case DecisionMakerRemoveSubmitted() when decisionMakerRemoveSubmitted != null:
return decisionMakerRemoveSubmitted(_that);case DecisionMakerHistoryRequested() when decisionMakerHistoryRequested != null:
return decisionMakerHistoryRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StakeholderLinksListRequested value)  linksListRequested,required TResult Function( StakeholderLinkAddSubmitted value)  linkAddSubmitted,required TResult Function( StakeholderPersonAdded value)  stakeholderPersonAdded,required TResult Function( StakeholderPersonAddedToCompany value)  stakeholderPersonAddedToCompany,required TResult Function( StakeholderLinkPatchSubmitted value)  linkPatchSubmitted,required TResult Function( StakeholderLinkCloseSubmitted value)  linkCloseSubmitted,required TResult Function( StakeholderLinkReplaceSubmitted value)  linkReplaceSubmitted,required TResult Function( DecisionMakerRequested value)  decisionMakerRequested,required TResult Function( DecisionMakerSetSubmitted value)  decisionMakerSetSubmitted,required TResult Function( DecisionMakerRemoveSubmitted value)  decisionMakerRemoveSubmitted,required TResult Function( DecisionMakerHistoryRequested value)  decisionMakerHistoryRequested,}){
final _that = this;
switch (_that) {
case StakeholderLinksListRequested():
return linksListRequested(_that);case StakeholderLinkAddSubmitted():
return linkAddSubmitted(_that);case StakeholderPersonAdded():
return stakeholderPersonAdded(_that);case StakeholderPersonAddedToCompany():
return stakeholderPersonAddedToCompany(_that);case StakeholderLinkPatchSubmitted():
return linkPatchSubmitted(_that);case StakeholderLinkCloseSubmitted():
return linkCloseSubmitted(_that);case StakeholderLinkReplaceSubmitted():
return linkReplaceSubmitted(_that);case DecisionMakerRequested():
return decisionMakerRequested(_that);case DecisionMakerSetSubmitted():
return decisionMakerSetSubmitted(_that);case DecisionMakerRemoveSubmitted():
return decisionMakerRemoveSubmitted(_that);case DecisionMakerHistoryRequested():
return decisionMakerHistoryRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StakeholderLinksListRequested value)?  linksListRequested,TResult? Function( StakeholderLinkAddSubmitted value)?  linkAddSubmitted,TResult? Function( StakeholderPersonAdded value)?  stakeholderPersonAdded,TResult? Function( StakeholderPersonAddedToCompany value)?  stakeholderPersonAddedToCompany,TResult? Function( StakeholderLinkPatchSubmitted value)?  linkPatchSubmitted,TResult? Function( StakeholderLinkCloseSubmitted value)?  linkCloseSubmitted,TResult? Function( StakeholderLinkReplaceSubmitted value)?  linkReplaceSubmitted,TResult? Function( DecisionMakerRequested value)?  decisionMakerRequested,TResult? Function( DecisionMakerSetSubmitted value)?  decisionMakerSetSubmitted,TResult? Function( DecisionMakerRemoveSubmitted value)?  decisionMakerRemoveSubmitted,TResult? Function( DecisionMakerHistoryRequested value)?  decisionMakerHistoryRequested,}){
final _that = this;
switch (_that) {
case StakeholderLinksListRequested() when linksListRequested != null:
return linksListRequested(_that);case StakeholderLinkAddSubmitted() when linkAddSubmitted != null:
return linkAddSubmitted(_that);case StakeholderPersonAdded() when stakeholderPersonAdded != null:
return stakeholderPersonAdded(_that);case StakeholderPersonAddedToCompany() when stakeholderPersonAddedToCompany != null:
return stakeholderPersonAddedToCompany(_that);case StakeholderLinkPatchSubmitted() when linkPatchSubmitted != null:
return linkPatchSubmitted(_that);case StakeholderLinkCloseSubmitted() when linkCloseSubmitted != null:
return linkCloseSubmitted(_that);case StakeholderLinkReplaceSubmitted() when linkReplaceSubmitted != null:
return linkReplaceSubmitted(_that);case DecisionMakerRequested() when decisionMakerRequested != null:
return decisionMakerRequested(_that);case DecisionMakerSetSubmitted() when decisionMakerSetSubmitted != null:
return decisionMakerSetSubmitted(_that);case DecisionMakerRemoveSubmitted() when decisionMakerRemoveSubmitted != null:
return decisionMakerRemoveSubmitted(_that);case DecisionMakerHistoryRequested() when decisionMakerHistoryRequested != null:
return decisionMakerHistoryRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String projectId,  bool includeClosed)?  linksListRequested,TResult Function( String projectId,  AddStakeholderLinkRequest request)?  linkAddSubmitted,TResult Function( String projectId,  RegisterAccountRequest account,  StakeholderRole role,  String? note)?  stakeholderPersonAdded,TResult Function( String projectId,  String accountId,  AddContactRequest contact,  StakeholderRole role,  String? note)?  stakeholderPersonAddedToCompany,TResult Function( String projectId,  String linkId,  PatchStakeholderLinkRequest request)?  linkPatchSubmitted,TResult Function( String projectId,  String linkId,  CloseStakeholderLinkRequest request)?  linkCloseSubmitted,TResult Function( String projectId,  String linkId,  ReplaceStakeholderLinkRequest request)?  linkReplaceSubmitted,TResult Function( String projectId)?  decisionMakerRequested,TResult Function( String projectId,  SetDecisionMakerRequest request)?  decisionMakerSetSubmitted,TResult Function( String projectId,  ReasonRequest request)?  decisionMakerRemoveSubmitted,TResult Function( String projectId)?  decisionMakerHistoryRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StakeholderLinksListRequested() when linksListRequested != null:
return linksListRequested(_that.projectId,_that.includeClosed);case StakeholderLinkAddSubmitted() when linkAddSubmitted != null:
return linkAddSubmitted(_that.projectId,_that.request);case StakeholderPersonAdded() when stakeholderPersonAdded != null:
return stakeholderPersonAdded(_that.projectId,_that.account,_that.role,_that.note);case StakeholderPersonAddedToCompany() when stakeholderPersonAddedToCompany != null:
return stakeholderPersonAddedToCompany(_that.projectId,_that.accountId,_that.contact,_that.role,_that.note);case StakeholderLinkPatchSubmitted() when linkPatchSubmitted != null:
return linkPatchSubmitted(_that.projectId,_that.linkId,_that.request);case StakeholderLinkCloseSubmitted() when linkCloseSubmitted != null:
return linkCloseSubmitted(_that.projectId,_that.linkId,_that.request);case StakeholderLinkReplaceSubmitted() when linkReplaceSubmitted != null:
return linkReplaceSubmitted(_that.projectId,_that.linkId,_that.request);case DecisionMakerRequested() when decisionMakerRequested != null:
return decisionMakerRequested(_that.projectId);case DecisionMakerSetSubmitted() when decisionMakerSetSubmitted != null:
return decisionMakerSetSubmitted(_that.projectId,_that.request);case DecisionMakerRemoveSubmitted() when decisionMakerRemoveSubmitted != null:
return decisionMakerRemoveSubmitted(_that.projectId,_that.request);case DecisionMakerHistoryRequested() when decisionMakerHistoryRequested != null:
return decisionMakerHistoryRequested(_that.projectId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String projectId,  bool includeClosed)  linksListRequested,required TResult Function( String projectId,  AddStakeholderLinkRequest request)  linkAddSubmitted,required TResult Function( String projectId,  RegisterAccountRequest account,  StakeholderRole role,  String? note)  stakeholderPersonAdded,required TResult Function( String projectId,  String accountId,  AddContactRequest contact,  StakeholderRole role,  String? note)  stakeholderPersonAddedToCompany,required TResult Function( String projectId,  String linkId,  PatchStakeholderLinkRequest request)  linkPatchSubmitted,required TResult Function( String projectId,  String linkId,  CloseStakeholderLinkRequest request)  linkCloseSubmitted,required TResult Function( String projectId,  String linkId,  ReplaceStakeholderLinkRequest request)  linkReplaceSubmitted,required TResult Function( String projectId)  decisionMakerRequested,required TResult Function( String projectId,  SetDecisionMakerRequest request)  decisionMakerSetSubmitted,required TResult Function( String projectId,  ReasonRequest request)  decisionMakerRemoveSubmitted,required TResult Function( String projectId)  decisionMakerHistoryRequested,}) {final _that = this;
switch (_that) {
case StakeholderLinksListRequested():
return linksListRequested(_that.projectId,_that.includeClosed);case StakeholderLinkAddSubmitted():
return linkAddSubmitted(_that.projectId,_that.request);case StakeholderPersonAdded():
return stakeholderPersonAdded(_that.projectId,_that.account,_that.role,_that.note);case StakeholderPersonAddedToCompany():
return stakeholderPersonAddedToCompany(_that.projectId,_that.accountId,_that.contact,_that.role,_that.note);case StakeholderLinkPatchSubmitted():
return linkPatchSubmitted(_that.projectId,_that.linkId,_that.request);case StakeholderLinkCloseSubmitted():
return linkCloseSubmitted(_that.projectId,_that.linkId,_that.request);case StakeholderLinkReplaceSubmitted():
return linkReplaceSubmitted(_that.projectId,_that.linkId,_that.request);case DecisionMakerRequested():
return decisionMakerRequested(_that.projectId);case DecisionMakerSetSubmitted():
return decisionMakerSetSubmitted(_that.projectId,_that.request);case DecisionMakerRemoveSubmitted():
return decisionMakerRemoveSubmitted(_that.projectId,_that.request);case DecisionMakerHistoryRequested():
return decisionMakerHistoryRequested(_that.projectId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String projectId,  bool includeClosed)?  linksListRequested,TResult? Function( String projectId,  AddStakeholderLinkRequest request)?  linkAddSubmitted,TResult? Function( String projectId,  RegisterAccountRequest account,  StakeholderRole role,  String? note)?  stakeholderPersonAdded,TResult? Function( String projectId,  String accountId,  AddContactRequest contact,  StakeholderRole role,  String? note)?  stakeholderPersonAddedToCompany,TResult? Function( String projectId,  String linkId,  PatchStakeholderLinkRequest request)?  linkPatchSubmitted,TResult? Function( String projectId,  String linkId,  CloseStakeholderLinkRequest request)?  linkCloseSubmitted,TResult? Function( String projectId,  String linkId,  ReplaceStakeholderLinkRequest request)?  linkReplaceSubmitted,TResult? Function( String projectId)?  decisionMakerRequested,TResult? Function( String projectId,  SetDecisionMakerRequest request)?  decisionMakerSetSubmitted,TResult? Function( String projectId,  ReasonRequest request)?  decisionMakerRemoveSubmitted,TResult? Function( String projectId)?  decisionMakerHistoryRequested,}) {final _that = this;
switch (_that) {
case StakeholderLinksListRequested() when linksListRequested != null:
return linksListRequested(_that.projectId,_that.includeClosed);case StakeholderLinkAddSubmitted() when linkAddSubmitted != null:
return linkAddSubmitted(_that.projectId,_that.request);case StakeholderPersonAdded() when stakeholderPersonAdded != null:
return stakeholderPersonAdded(_that.projectId,_that.account,_that.role,_that.note);case StakeholderPersonAddedToCompany() when stakeholderPersonAddedToCompany != null:
return stakeholderPersonAddedToCompany(_that.projectId,_that.accountId,_that.contact,_that.role,_that.note);case StakeholderLinkPatchSubmitted() when linkPatchSubmitted != null:
return linkPatchSubmitted(_that.projectId,_that.linkId,_that.request);case StakeholderLinkCloseSubmitted() when linkCloseSubmitted != null:
return linkCloseSubmitted(_that.projectId,_that.linkId,_that.request);case StakeholderLinkReplaceSubmitted() when linkReplaceSubmitted != null:
return linkReplaceSubmitted(_that.projectId,_that.linkId,_that.request);case DecisionMakerRequested() when decisionMakerRequested != null:
return decisionMakerRequested(_that.projectId);case DecisionMakerSetSubmitted() when decisionMakerSetSubmitted != null:
return decisionMakerSetSubmitted(_that.projectId,_that.request);case DecisionMakerRemoveSubmitted() when decisionMakerRemoveSubmitted != null:
return decisionMakerRemoveSubmitted(_that.projectId,_that.request);case DecisionMakerHistoryRequested() when decisionMakerHistoryRequested != null:
return decisionMakerHistoryRequested(_that.projectId);case _:
  return null;

}
}

}

/// @nodoc


class StakeholderLinksListRequested implements StakeholdersEvent {
  const StakeholderLinksListRequested({required this.projectId, this.includeClosed = false});
  

@override final  String projectId;
@JsonKey() final  bool includeClosed;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinksListRequestedCopyWith<StakeholderLinksListRequested> get copyWith => _$StakeholderLinksListRequestedCopyWithImpl<StakeholderLinksListRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinksListRequested&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.includeClosed, includeClosed) || other.includeClosed == includeClosed));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,includeClosed);

@override
String toString() {
  return 'StakeholdersEvent.linksListRequested(projectId: $projectId, includeClosed: $includeClosed)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinksListRequestedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $StakeholderLinksListRequestedCopyWith(StakeholderLinksListRequested value, $Res Function(StakeholderLinksListRequested) _then) = _$StakeholderLinksListRequestedCopyWithImpl;
@override @useResult
$Res call({
 String projectId, bool includeClosed
});




}
/// @nodoc
class _$StakeholderLinksListRequestedCopyWithImpl<$Res>
    implements $StakeholderLinksListRequestedCopyWith<$Res> {
  _$StakeholderLinksListRequestedCopyWithImpl(this._self, this._then);

  final StakeholderLinksListRequested _self;
  final $Res Function(StakeholderLinksListRequested) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? includeClosed = null,}) {
  return _then(StakeholderLinksListRequested(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,includeClosed: null == includeClosed ? _self.includeClosed : includeClosed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class StakeholderLinkAddSubmitted implements StakeholdersEvent {
  const StakeholderLinkAddSubmitted({required this.projectId, required this.request});
  

@override final  String projectId;
 final  AddStakeholderLinkRequest request;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinkAddSubmittedCopyWith<StakeholderLinkAddSubmitted> get copyWith => _$StakeholderLinkAddSubmittedCopyWithImpl<StakeholderLinkAddSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinkAddSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,request);

@override
String toString() {
  return 'StakeholdersEvent.linkAddSubmitted(projectId: $projectId, request: $request)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinkAddSubmittedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $StakeholderLinkAddSubmittedCopyWith(StakeholderLinkAddSubmitted value, $Res Function(StakeholderLinkAddSubmitted) _then) = _$StakeholderLinkAddSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String projectId, AddStakeholderLinkRequest request
});


$AddStakeholderLinkRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$StakeholderLinkAddSubmittedCopyWithImpl<$Res>
    implements $StakeholderLinkAddSubmittedCopyWith<$Res> {
  _$StakeholderLinkAddSubmittedCopyWithImpl(this._self, this._then);

  final StakeholderLinkAddSubmitted _self;
  final $Res Function(StakeholderLinkAddSubmitted) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? request = null,}) {
  return _then(StakeholderLinkAddSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as AddStakeholderLinkRequest,
  ));
}

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddStakeholderLinkRequestCopyWith<$Res> get request {
  
  return $AddStakeholderLinkRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class StakeholderPersonAdded implements StakeholdersEvent {
  const StakeholderPersonAdded({required this.projectId, required this.account, required this.role, this.note});
  

@override final  String projectId;
 final  RegisterAccountRequest account;
 final  StakeholderRole role;
 final  String? note;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderPersonAddedCopyWith<StakeholderPersonAdded> get copyWith => _$StakeholderPersonAddedCopyWithImpl<StakeholderPersonAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderPersonAdded&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.account, account) || other.account == account)&&(identical(other.role, role) || other.role == role)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,account,role,note);

@override
String toString() {
  return 'StakeholdersEvent.stakeholderPersonAdded(projectId: $projectId, account: $account, role: $role, note: $note)';
}


}

/// @nodoc
abstract mixin class $StakeholderPersonAddedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $StakeholderPersonAddedCopyWith(StakeholderPersonAdded value, $Res Function(StakeholderPersonAdded) _then) = _$StakeholderPersonAddedCopyWithImpl;
@override @useResult
$Res call({
 String projectId, RegisterAccountRequest account, StakeholderRole role, String? note
});


$RegisterAccountRequestCopyWith<$Res> get account;

}
/// @nodoc
class _$StakeholderPersonAddedCopyWithImpl<$Res>
    implements $StakeholderPersonAddedCopyWith<$Res> {
  _$StakeholderPersonAddedCopyWithImpl(this._self, this._then);

  final StakeholderPersonAdded _self;
  final $Res Function(StakeholderPersonAdded) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? account = null,Object? role = null,Object? note = freezed,}) {
  return _then(StakeholderPersonAdded(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as RegisterAccountRequest,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterAccountRequestCopyWith<$Res> get account {
  
  return $RegisterAccountRequestCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}
}

/// @nodoc


class StakeholderPersonAddedToCompany implements StakeholdersEvent {
  const StakeholderPersonAddedToCompany({required this.projectId, required this.accountId, required this.contact, required this.role, this.note});
  

@override final  String projectId;
 final  String accountId;
 final  AddContactRequest contact;
 final  StakeholderRole role;
 final  String? note;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderPersonAddedToCompanyCopyWith<StakeholderPersonAddedToCompany> get copyWith => _$StakeholderPersonAddedToCompanyCopyWithImpl<StakeholderPersonAddedToCompany>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderPersonAddedToCompany&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.role, role) || other.role == role)&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,accountId,contact,role,note);

@override
String toString() {
  return 'StakeholdersEvent.stakeholderPersonAddedToCompany(projectId: $projectId, accountId: $accountId, contact: $contact, role: $role, note: $note)';
}


}

/// @nodoc
abstract mixin class $StakeholderPersonAddedToCompanyCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $StakeholderPersonAddedToCompanyCopyWith(StakeholderPersonAddedToCompany value, $Res Function(StakeholderPersonAddedToCompany) _then) = _$StakeholderPersonAddedToCompanyCopyWithImpl;
@override @useResult
$Res call({
 String projectId, String accountId, AddContactRequest contact, StakeholderRole role, String? note
});


$AddContactRequestCopyWith<$Res> get contact;

}
/// @nodoc
class _$StakeholderPersonAddedToCompanyCopyWithImpl<$Res>
    implements $StakeholderPersonAddedToCompanyCopyWith<$Res> {
  _$StakeholderPersonAddedToCompanyCopyWithImpl(this._self, this._then);

  final StakeholderPersonAddedToCompany _self;
  final $Res Function(StakeholderPersonAddedToCompany) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? accountId = null,Object? contact = null,Object? role = null,Object? note = freezed,}) {
  return _then(StakeholderPersonAddedToCompany(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,contact: null == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as AddContactRequest,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StakeholderRole,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddContactRequestCopyWith<$Res> get contact {
  
  return $AddContactRequestCopyWith<$Res>(_self.contact, (value) {
    return _then(_self.copyWith(contact: value));
  });
}
}

/// @nodoc


class StakeholderLinkPatchSubmitted implements StakeholdersEvent {
  const StakeholderLinkPatchSubmitted({required this.projectId, required this.linkId, required this.request});
  

@override final  String projectId;
 final  String linkId;
 final  PatchStakeholderLinkRequest request;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinkPatchSubmittedCopyWith<StakeholderLinkPatchSubmitted> get copyWith => _$StakeholderLinkPatchSubmittedCopyWithImpl<StakeholderLinkPatchSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinkPatchSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,linkId,request);

@override
String toString() {
  return 'StakeholdersEvent.linkPatchSubmitted(projectId: $projectId, linkId: $linkId, request: $request)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinkPatchSubmittedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $StakeholderLinkPatchSubmittedCopyWith(StakeholderLinkPatchSubmitted value, $Res Function(StakeholderLinkPatchSubmitted) _then) = _$StakeholderLinkPatchSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String projectId, String linkId, PatchStakeholderLinkRequest request
});




}
/// @nodoc
class _$StakeholderLinkPatchSubmittedCopyWithImpl<$Res>
    implements $StakeholderLinkPatchSubmittedCopyWith<$Res> {
  _$StakeholderLinkPatchSubmittedCopyWithImpl(this._self, this._then);

  final StakeholderLinkPatchSubmitted _self;
  final $Res Function(StakeholderLinkPatchSubmitted) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? linkId = null,Object? request = null,}) {
  return _then(StakeholderLinkPatchSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PatchStakeholderLinkRequest,
  ));
}


}

/// @nodoc


class StakeholderLinkCloseSubmitted implements StakeholdersEvent {
  const StakeholderLinkCloseSubmitted({required this.projectId, required this.linkId, required this.request});
  

@override final  String projectId;
 final  String linkId;
 final  CloseStakeholderLinkRequest request;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinkCloseSubmittedCopyWith<StakeholderLinkCloseSubmitted> get copyWith => _$StakeholderLinkCloseSubmittedCopyWithImpl<StakeholderLinkCloseSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinkCloseSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,linkId,request);

@override
String toString() {
  return 'StakeholdersEvent.linkCloseSubmitted(projectId: $projectId, linkId: $linkId, request: $request)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinkCloseSubmittedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $StakeholderLinkCloseSubmittedCopyWith(StakeholderLinkCloseSubmitted value, $Res Function(StakeholderLinkCloseSubmitted) _then) = _$StakeholderLinkCloseSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String projectId, String linkId, CloseStakeholderLinkRequest request
});


$CloseStakeholderLinkRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$StakeholderLinkCloseSubmittedCopyWithImpl<$Res>
    implements $StakeholderLinkCloseSubmittedCopyWith<$Res> {
  _$StakeholderLinkCloseSubmittedCopyWithImpl(this._self, this._then);

  final StakeholderLinkCloseSubmitted _self;
  final $Res Function(StakeholderLinkCloseSubmitted) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? linkId = null,Object? request = null,}) {
  return _then(StakeholderLinkCloseSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as CloseStakeholderLinkRequest,
  ));
}

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CloseStakeholderLinkRequestCopyWith<$Res> get request {
  
  return $CloseStakeholderLinkRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class StakeholderLinkReplaceSubmitted implements StakeholdersEvent {
  const StakeholderLinkReplaceSubmitted({required this.projectId, required this.linkId, required this.request});
  

@override final  String projectId;
 final  String linkId;
 final  ReplaceStakeholderLinkRequest request;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StakeholderLinkReplaceSubmittedCopyWith<StakeholderLinkReplaceSubmitted> get copyWith => _$StakeholderLinkReplaceSubmittedCopyWithImpl<StakeholderLinkReplaceSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StakeholderLinkReplaceSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.linkId, linkId) || other.linkId == linkId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,linkId,request);

@override
String toString() {
  return 'StakeholdersEvent.linkReplaceSubmitted(projectId: $projectId, linkId: $linkId, request: $request)';
}


}

/// @nodoc
abstract mixin class $StakeholderLinkReplaceSubmittedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $StakeholderLinkReplaceSubmittedCopyWith(StakeholderLinkReplaceSubmitted value, $Res Function(StakeholderLinkReplaceSubmitted) _then) = _$StakeholderLinkReplaceSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String projectId, String linkId, ReplaceStakeholderLinkRequest request
});


$ReplaceStakeholderLinkRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$StakeholderLinkReplaceSubmittedCopyWithImpl<$Res>
    implements $StakeholderLinkReplaceSubmittedCopyWith<$Res> {
  _$StakeholderLinkReplaceSubmittedCopyWithImpl(this._self, this._then);

  final StakeholderLinkReplaceSubmitted _self;
  final $Res Function(StakeholderLinkReplaceSubmitted) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? linkId = null,Object? request = null,}) {
  return _then(StakeholderLinkReplaceSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,linkId: null == linkId ? _self.linkId : linkId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ReplaceStakeholderLinkRequest,
  ));
}

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReplaceStakeholderLinkRequestCopyWith<$Res> get request {
  
  return $ReplaceStakeholderLinkRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class DecisionMakerRequested implements StakeholdersEvent {
  const DecisionMakerRequested(this.projectId);
  

@override final  String projectId;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerRequestedCopyWith<DecisionMakerRequested> get copyWith => _$DecisionMakerRequestedCopyWithImpl<DecisionMakerRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerRequested&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'StakeholdersEvent.decisionMakerRequested(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerRequestedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $DecisionMakerRequestedCopyWith(DecisionMakerRequested value, $Res Function(DecisionMakerRequested) _then) = _$DecisionMakerRequestedCopyWithImpl;
@override @useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$DecisionMakerRequestedCopyWithImpl<$Res>
    implements $DecisionMakerRequestedCopyWith<$Res> {
  _$DecisionMakerRequestedCopyWithImpl(this._self, this._then);

  final DecisionMakerRequested _self;
  final $Res Function(DecisionMakerRequested) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(DecisionMakerRequested(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DecisionMakerSetSubmitted implements StakeholdersEvent {
  const DecisionMakerSetSubmitted({required this.projectId, required this.request});
  

@override final  String projectId;
 final  SetDecisionMakerRequest request;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerSetSubmittedCopyWith<DecisionMakerSetSubmitted> get copyWith => _$DecisionMakerSetSubmittedCopyWithImpl<DecisionMakerSetSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerSetSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,request);

@override
String toString() {
  return 'StakeholdersEvent.decisionMakerSetSubmitted(projectId: $projectId, request: $request)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerSetSubmittedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $DecisionMakerSetSubmittedCopyWith(DecisionMakerSetSubmitted value, $Res Function(DecisionMakerSetSubmitted) _then) = _$DecisionMakerSetSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String projectId, SetDecisionMakerRequest request
});


$SetDecisionMakerRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$DecisionMakerSetSubmittedCopyWithImpl<$Res>
    implements $DecisionMakerSetSubmittedCopyWith<$Res> {
  _$DecisionMakerSetSubmittedCopyWithImpl(this._self, this._then);

  final DecisionMakerSetSubmitted _self;
  final $Res Function(DecisionMakerSetSubmitted) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? request = null,}) {
  return _then(DecisionMakerSetSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as SetDecisionMakerRequest,
  ));
}

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SetDecisionMakerRequestCopyWith<$Res> get request {
  
  return $SetDecisionMakerRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class DecisionMakerRemoveSubmitted implements StakeholdersEvent {
  const DecisionMakerRemoveSubmitted({required this.projectId, required this.request});
  

@override final  String projectId;
 final  ReasonRequest request;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerRemoveSubmittedCopyWith<DecisionMakerRemoveSubmitted> get copyWith => _$DecisionMakerRemoveSubmittedCopyWithImpl<DecisionMakerRemoveSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerRemoveSubmitted&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,projectId,request);

@override
String toString() {
  return 'StakeholdersEvent.decisionMakerRemoveSubmitted(projectId: $projectId, request: $request)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerRemoveSubmittedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $DecisionMakerRemoveSubmittedCopyWith(DecisionMakerRemoveSubmitted value, $Res Function(DecisionMakerRemoveSubmitted) _then) = _$DecisionMakerRemoveSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String projectId, ReasonRequest request
});


$ReasonRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$DecisionMakerRemoveSubmittedCopyWithImpl<$Res>
    implements $DecisionMakerRemoveSubmittedCopyWith<$Res> {
  _$DecisionMakerRemoveSubmittedCopyWithImpl(this._self, this._then);

  final DecisionMakerRemoveSubmitted _self;
  final $Res Function(DecisionMakerRemoveSubmitted) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,Object? request = null,}) {
  return _then(DecisionMakerRemoveSubmitted(
projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ReasonRequest,
  ));
}

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReasonRequestCopyWith<$Res> get request {
  
  return $ReasonRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class DecisionMakerHistoryRequested implements StakeholdersEvent {
  const DecisionMakerHistoryRequested(this.projectId);
  

@override final  String projectId;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DecisionMakerHistoryRequestedCopyWith<DecisionMakerHistoryRequested> get copyWith => _$DecisionMakerHistoryRequestedCopyWithImpl<DecisionMakerHistoryRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DecisionMakerHistoryRequested&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,projectId);

@override
String toString() {
  return 'StakeholdersEvent.decisionMakerHistoryRequested(projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $DecisionMakerHistoryRequestedCopyWith<$Res> implements $StakeholdersEventCopyWith<$Res> {
  factory $DecisionMakerHistoryRequestedCopyWith(DecisionMakerHistoryRequested value, $Res Function(DecisionMakerHistoryRequested) _then) = _$DecisionMakerHistoryRequestedCopyWithImpl;
@override @useResult
$Res call({
 String projectId
});




}
/// @nodoc
class _$DecisionMakerHistoryRequestedCopyWithImpl<$Res>
    implements $DecisionMakerHistoryRequestedCopyWith<$Res> {
  _$DecisionMakerHistoryRequestedCopyWithImpl(this._self, this._then);

  final DecisionMakerHistoryRequested _self;
  final $Res Function(DecisionMakerHistoryRequested) _then;

/// Create a copy of StakeholdersEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? projectId = null,}) {
  return _then(DecisionMakerHistoryRequested(
null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
