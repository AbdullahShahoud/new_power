// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AccountsEvent()';
}


}

/// @nodoc
class $AccountsEventCopyWith<$Res>  {
$AccountsEventCopyWith(AccountsEvent _, $Res Function(AccountsEvent) __);
}


/// Adds pattern-matching-related methods to [AccountsEvent].
extension AccountsEventPatterns on AccountsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AccountSearchRequested value)?  searchRequested,TResult Function( AccountClassified value)?  accountClassified,TResult Function( AccountRegisterSubmitted value)?  registerSubmitted,TResult Function( AccountContactsListRequested value)?  contactsListRequested,TResult Function( AccountContactAddSubmitted value)?  contactAddSubmitted,TResult Function( AccountContactPatchSubmitted value)?  contactPatchSubmitted,TResult Function( AccountContactArchiveSubmitted value)?  contactArchiveSubmitted,TResult Function( AccountContactAccountSet value)?  contactAccountSet,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AccountSearchRequested() when searchRequested != null:
return searchRequested(_that);case AccountClassified() when accountClassified != null:
return accountClassified(_that);case AccountRegisterSubmitted() when registerSubmitted != null:
return registerSubmitted(_that);case AccountContactsListRequested() when contactsListRequested != null:
return contactsListRequested(_that);case AccountContactAddSubmitted() when contactAddSubmitted != null:
return contactAddSubmitted(_that);case AccountContactPatchSubmitted() when contactPatchSubmitted != null:
return contactPatchSubmitted(_that);case AccountContactArchiveSubmitted() when contactArchiveSubmitted != null:
return contactArchiveSubmitted(_that);case AccountContactAccountSet() when contactAccountSet != null:
return contactAccountSet(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AccountSearchRequested value)  searchRequested,required TResult Function( AccountClassified value)  accountClassified,required TResult Function( AccountRegisterSubmitted value)  registerSubmitted,required TResult Function( AccountContactsListRequested value)  contactsListRequested,required TResult Function( AccountContactAddSubmitted value)  contactAddSubmitted,required TResult Function( AccountContactPatchSubmitted value)  contactPatchSubmitted,required TResult Function( AccountContactArchiveSubmitted value)  contactArchiveSubmitted,required TResult Function( AccountContactAccountSet value)  contactAccountSet,}){
final _that = this;
switch (_that) {
case AccountSearchRequested():
return searchRequested(_that);case AccountClassified():
return accountClassified(_that);case AccountRegisterSubmitted():
return registerSubmitted(_that);case AccountContactsListRequested():
return contactsListRequested(_that);case AccountContactAddSubmitted():
return contactAddSubmitted(_that);case AccountContactPatchSubmitted():
return contactPatchSubmitted(_that);case AccountContactArchiveSubmitted():
return contactArchiveSubmitted(_that);case AccountContactAccountSet():
return contactAccountSet(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AccountSearchRequested value)?  searchRequested,TResult? Function( AccountClassified value)?  accountClassified,TResult? Function( AccountRegisterSubmitted value)?  registerSubmitted,TResult? Function( AccountContactsListRequested value)?  contactsListRequested,TResult? Function( AccountContactAddSubmitted value)?  contactAddSubmitted,TResult? Function( AccountContactPatchSubmitted value)?  contactPatchSubmitted,TResult? Function( AccountContactArchiveSubmitted value)?  contactArchiveSubmitted,TResult? Function( AccountContactAccountSet value)?  contactAccountSet,}){
final _that = this;
switch (_that) {
case AccountSearchRequested() when searchRequested != null:
return searchRequested(_that);case AccountClassified() when accountClassified != null:
return accountClassified(_that);case AccountRegisterSubmitted() when registerSubmitted != null:
return registerSubmitted(_that);case AccountContactsListRequested() when contactsListRequested != null:
return contactsListRequested(_that);case AccountContactAddSubmitted() when contactAddSubmitted != null:
return contactAddSubmitted(_that);case AccountContactPatchSubmitted() when contactPatchSubmitted != null:
return contactPatchSubmitted(_that);case AccountContactArchiveSubmitted() when contactArchiveSubmitted != null:
return contactArchiveSubmitted(_that);case AccountContactAccountSet() when contactAccountSet != null:
return contactAccountSet(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String search,  AccountClassification? classification)?  searchRequested,TResult Function( String accountId,  AccountClassification classification)?  accountClassified,TResult Function( RegisterAccountRequest request)?  registerSubmitted,TResult Function( String accountId)?  contactsListRequested,TResult Function( AddContactRequest request)?  contactAddSubmitted,TResult Function( String contactId,  PatchContactRequest request)?  contactPatchSubmitted,TResult Function( String contactId,  ReasonRequest request)?  contactArchiveSubmitted,TResult Function( String contactId,  String accountId)?  contactAccountSet,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AccountSearchRequested() when searchRequested != null:
return searchRequested(_that.search,_that.classification);case AccountClassified() when accountClassified != null:
return accountClassified(_that.accountId,_that.classification);case AccountRegisterSubmitted() when registerSubmitted != null:
return registerSubmitted(_that.request);case AccountContactsListRequested() when contactsListRequested != null:
return contactsListRequested(_that.accountId);case AccountContactAddSubmitted() when contactAddSubmitted != null:
return contactAddSubmitted(_that.request);case AccountContactPatchSubmitted() when contactPatchSubmitted != null:
return contactPatchSubmitted(_that.contactId,_that.request);case AccountContactArchiveSubmitted() when contactArchiveSubmitted != null:
return contactArchiveSubmitted(_that.contactId,_that.request);case AccountContactAccountSet() when contactAccountSet != null:
return contactAccountSet(_that.contactId,_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String search,  AccountClassification? classification)  searchRequested,required TResult Function( String accountId,  AccountClassification classification)  accountClassified,required TResult Function( RegisterAccountRequest request)  registerSubmitted,required TResult Function( String accountId)  contactsListRequested,required TResult Function( AddContactRequest request)  contactAddSubmitted,required TResult Function( String contactId,  PatchContactRequest request)  contactPatchSubmitted,required TResult Function( String contactId,  ReasonRequest request)  contactArchiveSubmitted,required TResult Function( String contactId,  String accountId)  contactAccountSet,}) {final _that = this;
switch (_that) {
case AccountSearchRequested():
return searchRequested(_that.search,_that.classification);case AccountClassified():
return accountClassified(_that.accountId,_that.classification);case AccountRegisterSubmitted():
return registerSubmitted(_that.request);case AccountContactsListRequested():
return contactsListRequested(_that.accountId);case AccountContactAddSubmitted():
return contactAddSubmitted(_that.request);case AccountContactPatchSubmitted():
return contactPatchSubmitted(_that.contactId,_that.request);case AccountContactArchiveSubmitted():
return contactArchiveSubmitted(_that.contactId,_that.request);case AccountContactAccountSet():
return contactAccountSet(_that.contactId,_that.accountId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String search,  AccountClassification? classification)?  searchRequested,TResult? Function( String accountId,  AccountClassification classification)?  accountClassified,TResult? Function( RegisterAccountRequest request)?  registerSubmitted,TResult? Function( String accountId)?  contactsListRequested,TResult? Function( AddContactRequest request)?  contactAddSubmitted,TResult? Function( String contactId,  PatchContactRequest request)?  contactPatchSubmitted,TResult? Function( String contactId,  ReasonRequest request)?  contactArchiveSubmitted,TResult? Function( String contactId,  String accountId)?  contactAccountSet,}) {final _that = this;
switch (_that) {
case AccountSearchRequested() when searchRequested != null:
return searchRequested(_that.search,_that.classification);case AccountClassified() when accountClassified != null:
return accountClassified(_that.accountId,_that.classification);case AccountRegisterSubmitted() when registerSubmitted != null:
return registerSubmitted(_that.request);case AccountContactsListRequested() when contactsListRequested != null:
return contactsListRequested(_that.accountId);case AccountContactAddSubmitted() when contactAddSubmitted != null:
return contactAddSubmitted(_that.request);case AccountContactPatchSubmitted() when contactPatchSubmitted != null:
return contactPatchSubmitted(_that.contactId,_that.request);case AccountContactArchiveSubmitted() when contactArchiveSubmitted != null:
return contactArchiveSubmitted(_that.contactId,_that.request);case AccountContactAccountSet() when contactAccountSet != null:
return contactAccountSet(_that.contactId,_that.accountId);case _:
  return null;

}
}

}

/// @nodoc


class AccountSearchRequested implements AccountsEvent {
  const AccountSearchRequested({this.search = '', this.classification});
  

@JsonKey() final  String search;
 final  AccountClassification? classification;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountSearchRequestedCopyWith<AccountSearchRequested> get copyWith => _$AccountSearchRequestedCopyWithImpl<AccountSearchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountSearchRequested&&(identical(other.search, search) || other.search == search)&&(identical(other.classification, classification) || other.classification == classification));
}


@override
int get hashCode => Object.hash(runtimeType,search,classification);

@override
String toString() {
  return 'AccountsEvent.searchRequested(search: $search, classification: $classification)';
}


}

/// @nodoc
abstract mixin class $AccountSearchRequestedCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $AccountSearchRequestedCopyWith(AccountSearchRequested value, $Res Function(AccountSearchRequested) _then) = _$AccountSearchRequestedCopyWithImpl;
@useResult
$Res call({
 String search, AccountClassification? classification
});




}
/// @nodoc
class _$AccountSearchRequestedCopyWithImpl<$Res>
    implements $AccountSearchRequestedCopyWith<$Res> {
  _$AccountSearchRequestedCopyWithImpl(this._self, this._then);

  final AccountSearchRequested _self;
  final $Res Function(AccountSearchRequested) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? search = null,Object? classification = freezed,}) {
  return _then(AccountSearchRequested(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,classification: freezed == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AccountClassification?,
  ));
}


}

/// @nodoc


class AccountClassified implements AccountsEvent {
  const AccountClassified({required this.accountId, required this.classification});
  

 final  String accountId;
 final  AccountClassification classification;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountClassifiedCopyWith<AccountClassified> get copyWith => _$AccountClassifiedCopyWithImpl<AccountClassified>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountClassified&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.classification, classification) || other.classification == classification));
}


@override
int get hashCode => Object.hash(runtimeType,accountId,classification);

@override
String toString() {
  return 'AccountsEvent.accountClassified(accountId: $accountId, classification: $classification)';
}


}

/// @nodoc
abstract mixin class $AccountClassifiedCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $AccountClassifiedCopyWith(AccountClassified value, $Res Function(AccountClassified) _then) = _$AccountClassifiedCopyWithImpl;
@useResult
$Res call({
 String accountId, AccountClassification classification
});




}
/// @nodoc
class _$AccountClassifiedCopyWithImpl<$Res>
    implements $AccountClassifiedCopyWith<$Res> {
  _$AccountClassifiedCopyWithImpl(this._self, this._then);

  final AccountClassified _self;
  final $Res Function(AccountClassified) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountId = null,Object? classification = null,}) {
  return _then(AccountClassified(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,classification: null == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AccountClassification,
  ));
}


}

/// @nodoc


class AccountRegisterSubmitted implements AccountsEvent {
  const AccountRegisterSubmitted(this.request);
  

 final  RegisterAccountRequest request;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountRegisterSubmittedCopyWith<AccountRegisterSubmitted> get copyWith => _$AccountRegisterSubmittedCopyWithImpl<AccountRegisterSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountRegisterSubmitted&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'AccountsEvent.registerSubmitted(request: $request)';
}


}

/// @nodoc
abstract mixin class $AccountRegisterSubmittedCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $AccountRegisterSubmittedCopyWith(AccountRegisterSubmitted value, $Res Function(AccountRegisterSubmitted) _then) = _$AccountRegisterSubmittedCopyWithImpl;
@useResult
$Res call({
 RegisterAccountRequest request
});


$RegisterAccountRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$AccountRegisterSubmittedCopyWithImpl<$Res>
    implements $AccountRegisterSubmittedCopyWith<$Res> {
  _$AccountRegisterSubmittedCopyWithImpl(this._self, this._then);

  final AccountRegisterSubmitted _self;
  final $Res Function(AccountRegisterSubmitted) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(AccountRegisterSubmitted(
null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as RegisterAccountRequest,
  ));
}

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterAccountRequestCopyWith<$Res> get request {
  
  return $RegisterAccountRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class AccountContactsListRequested implements AccountsEvent {
  const AccountContactsListRequested(this.accountId);
  

 final  String accountId;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountContactsListRequestedCopyWith<AccountContactsListRequested> get copyWith => _$AccountContactsListRequestedCopyWithImpl<AccountContactsListRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountContactsListRequested&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'AccountsEvent.contactsListRequested(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $AccountContactsListRequestedCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $AccountContactsListRequestedCopyWith(AccountContactsListRequested value, $Res Function(AccountContactsListRequested) _then) = _$AccountContactsListRequestedCopyWithImpl;
@useResult
$Res call({
 String accountId
});




}
/// @nodoc
class _$AccountContactsListRequestedCopyWithImpl<$Res>
    implements $AccountContactsListRequestedCopyWith<$Res> {
  _$AccountContactsListRequestedCopyWithImpl(this._self, this._then);

  final AccountContactsListRequested _self;
  final $Res Function(AccountContactsListRequested) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? accountId = null,}) {
  return _then(AccountContactsListRequested(
null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AccountContactAddSubmitted implements AccountsEvent {
  const AccountContactAddSubmitted({required this.request});
  

 final  AddContactRequest request;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountContactAddSubmittedCopyWith<AccountContactAddSubmitted> get copyWith => _$AccountContactAddSubmittedCopyWithImpl<AccountContactAddSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountContactAddSubmitted&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,request);

@override
String toString() {
  return 'AccountsEvent.contactAddSubmitted(request: $request)';
}


}

/// @nodoc
abstract mixin class $AccountContactAddSubmittedCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $AccountContactAddSubmittedCopyWith(AccountContactAddSubmitted value, $Res Function(AccountContactAddSubmitted) _then) = _$AccountContactAddSubmittedCopyWithImpl;
@useResult
$Res call({
 AddContactRequest request
});


$AddContactRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$AccountContactAddSubmittedCopyWithImpl<$Res>
    implements $AccountContactAddSubmittedCopyWith<$Res> {
  _$AccountContactAddSubmittedCopyWithImpl(this._self, this._then);

  final AccountContactAddSubmitted _self;
  final $Res Function(AccountContactAddSubmitted) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? request = null,}) {
  return _then(AccountContactAddSubmitted(
request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as AddContactRequest,
  ));
}

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddContactRequestCopyWith<$Res> get request {
  
  return $AddContactRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class AccountContactPatchSubmitted implements AccountsEvent {
  const AccountContactPatchSubmitted({required this.contactId, required this.request});
  

 final  String contactId;
 final  PatchContactRequest request;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountContactPatchSubmittedCopyWith<AccountContactPatchSubmitted> get copyWith => _$AccountContactPatchSubmittedCopyWithImpl<AccountContactPatchSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountContactPatchSubmitted&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,contactId,request);

@override
String toString() {
  return 'AccountsEvent.contactPatchSubmitted(contactId: $contactId, request: $request)';
}


}

/// @nodoc
abstract mixin class $AccountContactPatchSubmittedCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $AccountContactPatchSubmittedCopyWith(AccountContactPatchSubmitted value, $Res Function(AccountContactPatchSubmitted) _then) = _$AccountContactPatchSubmittedCopyWithImpl;
@useResult
$Res call({
 String contactId, PatchContactRequest request
});




}
/// @nodoc
class _$AccountContactPatchSubmittedCopyWithImpl<$Res>
    implements $AccountContactPatchSubmittedCopyWith<$Res> {
  _$AccountContactPatchSubmittedCopyWithImpl(this._self, this._then);

  final AccountContactPatchSubmitted _self;
  final $Res Function(AccountContactPatchSubmitted) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? request = null,}) {
  return _then(AccountContactPatchSubmitted(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as PatchContactRequest,
  ));
}


}

/// @nodoc


class AccountContactArchiveSubmitted implements AccountsEvent {
  const AccountContactArchiveSubmitted({required this.contactId, required this.request});
  

 final  String contactId;
 final  ReasonRequest request;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountContactArchiveSubmittedCopyWith<AccountContactArchiveSubmitted> get copyWith => _$AccountContactArchiveSubmittedCopyWithImpl<AccountContactArchiveSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountContactArchiveSubmitted&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,contactId,request);

@override
String toString() {
  return 'AccountsEvent.contactArchiveSubmitted(contactId: $contactId, request: $request)';
}


}

/// @nodoc
abstract mixin class $AccountContactArchiveSubmittedCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $AccountContactArchiveSubmittedCopyWith(AccountContactArchiveSubmitted value, $Res Function(AccountContactArchiveSubmitted) _then) = _$AccountContactArchiveSubmittedCopyWithImpl;
@useResult
$Res call({
 String contactId, ReasonRequest request
});


$ReasonRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$AccountContactArchiveSubmittedCopyWithImpl<$Res>
    implements $AccountContactArchiveSubmittedCopyWith<$Res> {
  _$AccountContactArchiveSubmittedCopyWithImpl(this._self, this._then);

  final AccountContactArchiveSubmitted _self;
  final $Res Function(AccountContactArchiveSubmitted) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? request = null,}) {
  return _then(AccountContactArchiveSubmitted(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as ReasonRequest,
  ));
}

/// Create a copy of AccountsEvent
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


class AccountContactAccountSet implements AccountsEvent {
  const AccountContactAccountSet({required this.contactId, required this.accountId});
  

 final  String contactId;
 final  String accountId;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountContactAccountSetCopyWith<AccountContactAccountSet> get copyWith => _$AccountContactAccountSetCopyWithImpl<AccountContactAccountSet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountContactAccountSet&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.accountId, accountId) || other.accountId == accountId));
}


@override
int get hashCode => Object.hash(runtimeType,contactId,accountId);

@override
String toString() {
  return 'AccountsEvent.contactAccountSet(contactId: $contactId, accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $AccountContactAccountSetCopyWith<$Res> implements $AccountsEventCopyWith<$Res> {
  factory $AccountContactAccountSetCopyWith(AccountContactAccountSet value, $Res Function(AccountContactAccountSet) _then) = _$AccountContactAccountSetCopyWithImpl;
@useResult
$Res call({
 String contactId, String accountId
});




}
/// @nodoc
class _$AccountContactAccountSetCopyWithImpl<$Res>
    implements $AccountContactAccountSetCopyWith<$Res> {
  _$AccountContactAccountSetCopyWithImpl(this._self, this._then);

  final AccountContactAccountSet _self;
  final $Res Function(AccountContactAccountSet) _then;

/// Create a copy of AccountsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? accountId = null,}) {
  return _then(AccountContactAccountSet(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
