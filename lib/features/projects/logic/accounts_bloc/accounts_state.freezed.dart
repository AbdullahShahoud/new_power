// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountsState {

// ── search ────────────────────────────────────────────────────────
 AccountSearchStatus get searchStatus; List<AccountView> get accounts; String? get searchErrorMessage;// ── register (create) ────────────────────────────────────────────
 StakeholderMutationStatus get registerStatus; AccountView? get lastRegisteredAccount; String? get registerErrorMessage;// ── contacts (own only, server-scoped) ──────────────────────────
 ContactsFeedStatus get contactsStatus; List<ContactView> get contacts; String? get contactsErrorMessage;// ── contact mutation (add / patch / archive) ─────────────────────
 StakeholderMutationStatus get contactMutationStatus; ContactView? get lastMutatedContact; String? get contactMutationErrorMessage;
/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountsStateCopyWith<AccountsState> get copyWith => _$AccountsStateCopyWithImpl<AccountsState>(this as AccountsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountsState&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other.accounts, accounts)&&(identical(other.searchErrorMessage, searchErrorMessage) || other.searchErrorMessage == searchErrorMessage)&&(identical(other.registerStatus, registerStatus) || other.registerStatus == registerStatus)&&(identical(other.lastRegisteredAccount, lastRegisteredAccount) || other.lastRegisteredAccount == lastRegisteredAccount)&&(identical(other.registerErrorMessage, registerErrorMessage) || other.registerErrorMessage == registerErrorMessage)&&(identical(other.contactsStatus, contactsStatus) || other.contactsStatus == contactsStatus)&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.contactsErrorMessage, contactsErrorMessage) || other.contactsErrorMessage == contactsErrorMessage)&&(identical(other.contactMutationStatus, contactMutationStatus) || other.contactMutationStatus == contactMutationStatus)&&(identical(other.lastMutatedContact, lastMutatedContact) || other.lastMutatedContact == lastMutatedContact)&&(identical(other.contactMutationErrorMessage, contactMutationErrorMessage) || other.contactMutationErrorMessage == contactMutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,searchStatus,const DeepCollectionEquality().hash(accounts),searchErrorMessage,registerStatus,lastRegisteredAccount,registerErrorMessage,contactsStatus,const DeepCollectionEquality().hash(contacts),contactsErrorMessage,contactMutationStatus,lastMutatedContact,contactMutationErrorMessage);

@override
String toString() {
  return 'AccountsState(searchStatus: $searchStatus, accounts: $accounts, searchErrorMessage: $searchErrorMessage, registerStatus: $registerStatus, lastRegisteredAccount: $lastRegisteredAccount, registerErrorMessage: $registerErrorMessage, contactsStatus: $contactsStatus, contacts: $contacts, contactsErrorMessage: $contactsErrorMessage, contactMutationStatus: $contactMutationStatus, lastMutatedContact: $lastMutatedContact, contactMutationErrorMessage: $contactMutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class $AccountsStateCopyWith<$Res>  {
  factory $AccountsStateCopyWith(AccountsState value, $Res Function(AccountsState) _then) = _$AccountsStateCopyWithImpl;
@useResult
$Res call({
 AccountSearchStatus searchStatus, List<AccountView> accounts, String? searchErrorMessage, StakeholderMutationStatus registerStatus, AccountView? lastRegisteredAccount, String? registerErrorMessage, ContactsFeedStatus contactsStatus, List<ContactView> contacts, String? contactsErrorMessage, StakeholderMutationStatus contactMutationStatus, ContactView? lastMutatedContact, String? contactMutationErrorMessage
});


$AccountViewCopyWith<$Res>? get lastRegisteredAccount;$ContactViewCopyWith<$Res>? get lastMutatedContact;

}
/// @nodoc
class _$AccountsStateCopyWithImpl<$Res>
    implements $AccountsStateCopyWith<$Res> {
  _$AccountsStateCopyWithImpl(this._self, this._then);

  final AccountsState _self;
  final $Res Function(AccountsState) _then;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? searchStatus = null,Object? accounts = null,Object? searchErrorMessage = freezed,Object? registerStatus = null,Object? lastRegisteredAccount = freezed,Object? registerErrorMessage = freezed,Object? contactsStatus = null,Object? contacts = null,Object? contactsErrorMessage = freezed,Object? contactMutationStatus = null,Object? lastMutatedContact = freezed,Object? contactMutationErrorMessage = freezed,}) {
  return _then(_self.copyWith(
searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as AccountSearchStatus,accounts: null == accounts ? _self.accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AccountView>,searchErrorMessage: freezed == searchErrorMessage ? _self.searchErrorMessage : searchErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,registerStatus: null == registerStatus ? _self.registerStatus : registerStatus // ignore: cast_nullable_to_non_nullable
as StakeholderMutationStatus,lastRegisteredAccount: freezed == lastRegisteredAccount ? _self.lastRegisteredAccount : lastRegisteredAccount // ignore: cast_nullable_to_non_nullable
as AccountView?,registerErrorMessage: freezed == registerErrorMessage ? _self.registerErrorMessage : registerErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,contactsStatus: null == contactsStatus ? _self.contactsStatus : contactsStatus // ignore: cast_nullable_to_non_nullable
as ContactsFeedStatus,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactView>,contactsErrorMessage: freezed == contactsErrorMessage ? _self.contactsErrorMessage : contactsErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,contactMutationStatus: null == contactMutationStatus ? _self.contactMutationStatus : contactMutationStatus // ignore: cast_nullable_to_non_nullable
as StakeholderMutationStatus,lastMutatedContact: freezed == lastMutatedContact ? _self.lastMutatedContact : lastMutatedContact // ignore: cast_nullable_to_non_nullable
as ContactView?,contactMutationErrorMessage: freezed == contactMutationErrorMessage ? _self.contactMutationErrorMessage : contactMutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountViewCopyWith<$Res>? get lastRegisteredAccount {
    if (_self.lastRegisteredAccount == null) {
    return null;
  }

  return $AccountViewCopyWith<$Res>(_self.lastRegisteredAccount!, (value) {
    return _then(_self.copyWith(lastRegisteredAccount: value));
  });
}/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactViewCopyWith<$Res>? get lastMutatedContact {
    if (_self.lastMutatedContact == null) {
    return null;
  }

  return $ContactViewCopyWith<$Res>(_self.lastMutatedContact!, (value) {
    return _then(_self.copyWith(lastMutatedContact: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountsState].
extension AccountsStatePatterns on AccountsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountsState value)  $default,){
final _that = this;
switch (_that) {
case _AccountsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountsState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AccountSearchStatus searchStatus,  List<AccountView> accounts,  String? searchErrorMessage,  StakeholderMutationStatus registerStatus,  AccountView? lastRegisteredAccount,  String? registerErrorMessage,  ContactsFeedStatus contactsStatus,  List<ContactView> contacts,  String? contactsErrorMessage,  StakeholderMutationStatus contactMutationStatus,  ContactView? lastMutatedContact,  String? contactMutationErrorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountsState() when $default != null:
return $default(_that.searchStatus,_that.accounts,_that.searchErrorMessage,_that.registerStatus,_that.lastRegisteredAccount,_that.registerErrorMessage,_that.contactsStatus,_that.contacts,_that.contactsErrorMessage,_that.contactMutationStatus,_that.lastMutatedContact,_that.contactMutationErrorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AccountSearchStatus searchStatus,  List<AccountView> accounts,  String? searchErrorMessage,  StakeholderMutationStatus registerStatus,  AccountView? lastRegisteredAccount,  String? registerErrorMessage,  ContactsFeedStatus contactsStatus,  List<ContactView> contacts,  String? contactsErrorMessage,  StakeholderMutationStatus contactMutationStatus,  ContactView? lastMutatedContact,  String? contactMutationErrorMessage)  $default,) {final _that = this;
switch (_that) {
case _AccountsState():
return $default(_that.searchStatus,_that.accounts,_that.searchErrorMessage,_that.registerStatus,_that.lastRegisteredAccount,_that.registerErrorMessage,_that.contactsStatus,_that.contacts,_that.contactsErrorMessage,_that.contactMutationStatus,_that.lastMutatedContact,_that.contactMutationErrorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AccountSearchStatus searchStatus,  List<AccountView> accounts,  String? searchErrorMessage,  StakeholderMutationStatus registerStatus,  AccountView? lastRegisteredAccount,  String? registerErrorMessage,  ContactsFeedStatus contactsStatus,  List<ContactView> contacts,  String? contactsErrorMessage,  StakeholderMutationStatus contactMutationStatus,  ContactView? lastMutatedContact,  String? contactMutationErrorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AccountsState() when $default != null:
return $default(_that.searchStatus,_that.accounts,_that.searchErrorMessage,_that.registerStatus,_that.lastRegisteredAccount,_that.registerErrorMessage,_that.contactsStatus,_that.contacts,_that.contactsErrorMessage,_that.contactMutationStatus,_that.lastMutatedContact,_that.contactMutationErrorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AccountsState implements AccountsState {
  const _AccountsState({this.searchStatus = AccountSearchStatus.initial, final  List<AccountView> accounts = const <AccountView>[], this.searchErrorMessage, this.registerStatus = StakeholderMutationStatus.idle, this.lastRegisteredAccount, this.registerErrorMessage, this.contactsStatus = ContactsFeedStatus.initial, final  List<ContactView> contacts = const <ContactView>[], this.contactsErrorMessage, this.contactMutationStatus = StakeholderMutationStatus.idle, this.lastMutatedContact, this.contactMutationErrorMessage}): _accounts = accounts,_contacts = contacts;
  

// ── search ────────────────────────────────────────────────────────
@override@JsonKey() final  AccountSearchStatus searchStatus;
 final  List<AccountView> _accounts;
@override@JsonKey() List<AccountView> get accounts {
  if (_accounts is EqualUnmodifiableListView) return _accounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_accounts);
}

@override final  String? searchErrorMessage;
// ── register (create) ────────────────────────────────────────────
@override@JsonKey() final  StakeholderMutationStatus registerStatus;
@override final  AccountView? lastRegisteredAccount;
@override final  String? registerErrorMessage;
// ── contacts (own only, server-scoped) ──────────────────────────
@override@JsonKey() final  ContactsFeedStatus contactsStatus;
 final  List<ContactView> _contacts;
@override@JsonKey() List<ContactView> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override final  String? contactsErrorMessage;
// ── contact mutation (add / patch / archive) ─────────────────────
@override@JsonKey() final  StakeholderMutationStatus contactMutationStatus;
@override final  ContactView? lastMutatedContact;
@override final  String? contactMutationErrorMessage;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountsStateCopyWith<_AccountsState> get copyWith => __$AccountsStateCopyWithImpl<_AccountsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountsState&&(identical(other.searchStatus, searchStatus) || other.searchStatus == searchStatus)&&const DeepCollectionEquality().equals(other._accounts, _accounts)&&(identical(other.searchErrorMessage, searchErrorMessage) || other.searchErrorMessage == searchErrorMessage)&&(identical(other.registerStatus, registerStatus) || other.registerStatus == registerStatus)&&(identical(other.lastRegisteredAccount, lastRegisteredAccount) || other.lastRegisteredAccount == lastRegisteredAccount)&&(identical(other.registerErrorMessage, registerErrorMessage) || other.registerErrorMessage == registerErrorMessage)&&(identical(other.contactsStatus, contactsStatus) || other.contactsStatus == contactsStatus)&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.contactsErrorMessage, contactsErrorMessage) || other.contactsErrorMessage == contactsErrorMessage)&&(identical(other.contactMutationStatus, contactMutationStatus) || other.contactMutationStatus == contactMutationStatus)&&(identical(other.lastMutatedContact, lastMutatedContact) || other.lastMutatedContact == lastMutatedContact)&&(identical(other.contactMutationErrorMessage, contactMutationErrorMessage) || other.contactMutationErrorMessage == contactMutationErrorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,searchStatus,const DeepCollectionEquality().hash(_accounts),searchErrorMessage,registerStatus,lastRegisteredAccount,registerErrorMessage,contactsStatus,const DeepCollectionEquality().hash(_contacts),contactsErrorMessage,contactMutationStatus,lastMutatedContact,contactMutationErrorMessage);

@override
String toString() {
  return 'AccountsState(searchStatus: $searchStatus, accounts: $accounts, searchErrorMessage: $searchErrorMessage, registerStatus: $registerStatus, lastRegisteredAccount: $lastRegisteredAccount, registerErrorMessage: $registerErrorMessage, contactsStatus: $contactsStatus, contacts: $contacts, contactsErrorMessage: $contactsErrorMessage, contactMutationStatus: $contactMutationStatus, lastMutatedContact: $lastMutatedContact, contactMutationErrorMessage: $contactMutationErrorMessage)';
}


}

/// @nodoc
abstract mixin class _$AccountsStateCopyWith<$Res> implements $AccountsStateCopyWith<$Res> {
  factory _$AccountsStateCopyWith(_AccountsState value, $Res Function(_AccountsState) _then) = __$AccountsStateCopyWithImpl;
@override @useResult
$Res call({
 AccountSearchStatus searchStatus, List<AccountView> accounts, String? searchErrorMessage, StakeholderMutationStatus registerStatus, AccountView? lastRegisteredAccount, String? registerErrorMessage, ContactsFeedStatus contactsStatus, List<ContactView> contacts, String? contactsErrorMessage, StakeholderMutationStatus contactMutationStatus, ContactView? lastMutatedContact, String? contactMutationErrorMessage
});


@override $AccountViewCopyWith<$Res>? get lastRegisteredAccount;@override $ContactViewCopyWith<$Res>? get lastMutatedContact;

}
/// @nodoc
class __$AccountsStateCopyWithImpl<$Res>
    implements _$AccountsStateCopyWith<$Res> {
  __$AccountsStateCopyWithImpl(this._self, this._then);

  final _AccountsState _self;
  final $Res Function(_AccountsState) _then;

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? searchStatus = null,Object? accounts = null,Object? searchErrorMessage = freezed,Object? registerStatus = null,Object? lastRegisteredAccount = freezed,Object? registerErrorMessage = freezed,Object? contactsStatus = null,Object? contacts = null,Object? contactsErrorMessage = freezed,Object? contactMutationStatus = null,Object? lastMutatedContact = freezed,Object? contactMutationErrorMessage = freezed,}) {
  return _then(_AccountsState(
searchStatus: null == searchStatus ? _self.searchStatus : searchStatus // ignore: cast_nullable_to_non_nullable
as AccountSearchStatus,accounts: null == accounts ? _self._accounts : accounts // ignore: cast_nullable_to_non_nullable
as List<AccountView>,searchErrorMessage: freezed == searchErrorMessage ? _self.searchErrorMessage : searchErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,registerStatus: null == registerStatus ? _self.registerStatus : registerStatus // ignore: cast_nullable_to_non_nullable
as StakeholderMutationStatus,lastRegisteredAccount: freezed == lastRegisteredAccount ? _self.lastRegisteredAccount : lastRegisteredAccount // ignore: cast_nullable_to_non_nullable
as AccountView?,registerErrorMessage: freezed == registerErrorMessage ? _self.registerErrorMessage : registerErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,contactsStatus: null == contactsStatus ? _self.contactsStatus : contactsStatus // ignore: cast_nullable_to_non_nullable
as ContactsFeedStatus,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactView>,contactsErrorMessage: freezed == contactsErrorMessage ? _self.contactsErrorMessage : contactsErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,contactMutationStatus: null == contactMutationStatus ? _self.contactMutationStatus : contactMutationStatus // ignore: cast_nullable_to_non_nullable
as StakeholderMutationStatus,lastMutatedContact: freezed == lastMutatedContact ? _self.lastMutatedContact : lastMutatedContact // ignore: cast_nullable_to_non_nullable
as ContactView?,contactMutationErrorMessage: freezed == contactMutationErrorMessage ? _self.contactMutationErrorMessage : contactMutationErrorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountViewCopyWith<$Res>? get lastRegisteredAccount {
    if (_self.lastRegisteredAccount == null) {
    return null;
  }

  return $AccountViewCopyWith<$Res>(_self.lastRegisteredAccount!, (value) {
    return _then(_self.copyWith(lastRegisteredAccount: value));
  });
}/// Create a copy of AccountsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactViewCopyWith<$Res>? get lastMutatedContact {
    if (_self.lastMutatedContact == null) {
    return null;
  }

  return $ContactViewCopyWith<$Res>(_self.lastMutatedContact!, (value) {
    return _then(_self.copyWith(lastMutatedContact: value));
  });
}
}

// dart format on
