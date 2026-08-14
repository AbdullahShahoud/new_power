// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_account_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterAccountData {

 AccountView get account; AccountClassificationView? get classification; List<ContactView> get contacts;
/// Create a copy of RegisterAccountData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterAccountDataCopyWith<RegisterAccountData> get copyWith => _$RegisterAccountDataCopyWithImpl<RegisterAccountData>(this as RegisterAccountData, _$identity);

  /// Serializes this RegisterAccountData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterAccountData&&(identical(other.account, account) || other.account == account)&&(identical(other.classification, classification) || other.classification == classification)&&const DeepCollectionEquality().equals(other.contacts, contacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,classification,const DeepCollectionEquality().hash(contacts));

@override
String toString() {
  return 'RegisterAccountData(account: $account, classification: $classification, contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class $RegisterAccountDataCopyWith<$Res>  {
  factory $RegisterAccountDataCopyWith(RegisterAccountData value, $Res Function(RegisterAccountData) _then) = _$RegisterAccountDataCopyWithImpl;
@useResult
$Res call({
 AccountView account, AccountClassificationView? classification, List<ContactView> contacts
});


$AccountViewCopyWith<$Res> get account;$AccountClassificationViewCopyWith<$Res>? get classification;

}
/// @nodoc
class _$RegisterAccountDataCopyWithImpl<$Res>
    implements $RegisterAccountDataCopyWith<$Res> {
  _$RegisterAccountDataCopyWithImpl(this._self, this._then);

  final RegisterAccountData _self;
  final $Res Function(RegisterAccountData) _then;

/// Create a copy of RegisterAccountData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? account = null,Object? classification = freezed,Object? contacts = null,}) {
  return _then(_self.copyWith(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountView,classification: freezed == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AccountClassificationView?,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactView>,
  ));
}
/// Create a copy of RegisterAccountData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountViewCopyWith<$Res> get account {
  
  return $AccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of RegisterAccountData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountClassificationViewCopyWith<$Res>? get classification {
    if (_self.classification == null) {
    return null;
  }

  return $AccountClassificationViewCopyWith<$Res>(_self.classification!, (value) {
    return _then(_self.copyWith(classification: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterAccountData].
extension RegisterAccountDataPatterns on RegisterAccountData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterAccountData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterAccountData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterAccountData value)  $default,){
final _that = this;
switch (_that) {
case _RegisterAccountData():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterAccountData value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterAccountData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AccountView account,  AccountClassificationView? classification,  List<ContactView> contacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterAccountData() when $default != null:
return $default(_that.account,_that.classification,_that.contacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AccountView account,  AccountClassificationView? classification,  List<ContactView> contacts)  $default,) {final _that = this;
switch (_that) {
case _RegisterAccountData():
return $default(_that.account,_that.classification,_that.contacts);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AccountView account,  AccountClassificationView? classification,  List<ContactView> contacts)?  $default,) {final _that = this;
switch (_that) {
case _RegisterAccountData() when $default != null:
return $default(_that.account,_that.classification,_that.contacts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterAccountData implements RegisterAccountData {
  const _RegisterAccountData({required this.account, this.classification, final  List<ContactView> contacts = const <ContactView>[]}): _contacts = contacts;
  factory _RegisterAccountData.fromJson(Map<String, dynamic> json) => _$RegisterAccountDataFromJson(json);

@override final  AccountView account;
@override final  AccountClassificationView? classification;
 final  List<ContactView> _contacts;
@override@JsonKey() List<ContactView> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}


/// Create a copy of RegisterAccountData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterAccountDataCopyWith<_RegisterAccountData> get copyWith => __$RegisterAccountDataCopyWithImpl<_RegisterAccountData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterAccountDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterAccountData&&(identical(other.account, account) || other.account == account)&&(identical(other.classification, classification) || other.classification == classification)&&const DeepCollectionEquality().equals(other._contacts, _contacts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,account,classification,const DeepCollectionEquality().hash(_contacts));

@override
String toString() {
  return 'RegisterAccountData(account: $account, classification: $classification, contacts: $contacts)';
}


}

/// @nodoc
abstract mixin class _$RegisterAccountDataCopyWith<$Res> implements $RegisterAccountDataCopyWith<$Res> {
  factory _$RegisterAccountDataCopyWith(_RegisterAccountData value, $Res Function(_RegisterAccountData) _then) = __$RegisterAccountDataCopyWithImpl;
@override @useResult
$Res call({
 AccountView account, AccountClassificationView? classification, List<ContactView> contacts
});


@override $AccountViewCopyWith<$Res> get account;@override $AccountClassificationViewCopyWith<$Res>? get classification;

}
/// @nodoc
class __$RegisterAccountDataCopyWithImpl<$Res>
    implements _$RegisterAccountDataCopyWith<$Res> {
  __$RegisterAccountDataCopyWithImpl(this._self, this._then);

  final _RegisterAccountData _self;
  final $Res Function(_RegisterAccountData) _then;

/// Create a copy of RegisterAccountData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? account = null,Object? classification = freezed,Object? contacts = null,}) {
  return _then(_RegisterAccountData(
account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as AccountView,classification: freezed == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as AccountClassificationView?,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<ContactView>,
  ));
}

/// Create a copy of RegisterAccountData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountViewCopyWith<$Res> get account {
  
  return $AccountViewCopyWith<$Res>(_self.account, (value) {
    return _then(_self.copyWith(account: value));
  });
}/// Create a copy of RegisterAccountData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountClassificationViewCopyWith<$Res>? get classification {
    if (_self.classification == null) {
    return null;
  }

  return $AccountClassificationViewCopyWith<$Res>(_self.classification!, (value) {
    return _then(_self.copyWith(classification: value));
  });
}
}


/// @nodoc
mixin _$RegisterAccountResponse {

 bool? get success; String? get message; RegisterAccountData get data; ApiResponseMeta? get meta;
/// Create a copy of RegisterAccountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterAccountResponseCopyWith<RegisterAccountResponse> get copyWith => _$RegisterAccountResponseCopyWithImpl<RegisterAccountResponse>(this as RegisterAccountResponse, _$identity);

  /// Serializes this RegisterAccountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterAccountResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'RegisterAccountResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $RegisterAccountResponseCopyWith<$Res>  {
  factory $RegisterAccountResponseCopyWith(RegisterAccountResponse value, $Res Function(RegisterAccountResponse) _then) = _$RegisterAccountResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, RegisterAccountData data, ApiResponseMeta? meta
});


$RegisterAccountDataCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$RegisterAccountResponseCopyWithImpl<$Res>
    implements $RegisterAccountResponseCopyWith<$Res> {
  _$RegisterAccountResponseCopyWithImpl(this._self, this._then);

  final RegisterAccountResponse _self;
  final $Res Function(RegisterAccountResponse) _then;

/// Create a copy of RegisterAccountResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterAccountData,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of RegisterAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterAccountDataCopyWith<$Res> get data {
  
  return $RegisterAccountDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of RegisterAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ApiResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegisterAccountResponse].
extension RegisterAccountResponsePatterns on RegisterAccountResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterAccountResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterAccountResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterAccountResponse value)  $default,){
final _that = this;
switch (_that) {
case _RegisterAccountResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterAccountResponse value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterAccountResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  RegisterAccountData data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterAccountResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  RegisterAccountData data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _RegisterAccountResponse():
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  RegisterAccountData data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _RegisterAccountResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterAccountResponse implements RegisterAccountResponse {
  const _RegisterAccountResponse({this.success, this.message, required this.data, this.meta});
  factory _RegisterAccountResponse.fromJson(Map<String, dynamic> json) => _$RegisterAccountResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  RegisterAccountData data;
@override final  ApiResponseMeta? meta;

/// Create a copy of RegisterAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterAccountResponseCopyWith<_RegisterAccountResponse> get copyWith => __$RegisterAccountResponseCopyWithImpl<_RegisterAccountResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterAccountResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterAccountResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'RegisterAccountResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$RegisterAccountResponseCopyWith<$Res> implements $RegisterAccountResponseCopyWith<$Res> {
  factory _$RegisterAccountResponseCopyWith(_RegisterAccountResponse value, $Res Function(_RegisterAccountResponse) _then) = __$RegisterAccountResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, RegisterAccountData data, ApiResponseMeta? meta
});


@override $RegisterAccountDataCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$RegisterAccountResponseCopyWithImpl<$Res>
    implements _$RegisterAccountResponseCopyWith<$Res> {
  __$RegisterAccountResponseCopyWithImpl(this._self, this._then);

  final _RegisterAccountResponse _self;
  final $Res Function(_RegisterAccountResponse) _then;

/// Create a copy of RegisterAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_RegisterAccountResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as RegisterAccountData,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of RegisterAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegisterAccountDataCopyWith<$Res> get data {
  
  return $RegisterAccountDataCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of RegisterAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ApiResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$AccountClassificationResponse {

 bool? get success; String? get message; AccountClassificationView get data; ApiResponseMeta? get meta;
/// Create a copy of AccountClassificationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountClassificationResponseCopyWith<AccountClassificationResponse> get copyWith => _$AccountClassificationResponseCopyWithImpl<AccountClassificationResponse>(this as AccountClassificationResponse, _$identity);

  /// Serializes this AccountClassificationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountClassificationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'AccountClassificationResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $AccountClassificationResponseCopyWith<$Res>  {
  factory $AccountClassificationResponseCopyWith(AccountClassificationResponse value, $Res Function(AccountClassificationResponse) _then) = _$AccountClassificationResponseCopyWithImpl;
@useResult
$Res call({
 bool? success, String? message, AccountClassificationView data, ApiResponseMeta? meta
});


$AccountClassificationViewCopyWith<$Res> get data;$ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$AccountClassificationResponseCopyWithImpl<$Res>
    implements $AccountClassificationResponseCopyWith<$Res> {
  _$AccountClassificationResponseCopyWithImpl(this._self, this._then);

  final AccountClassificationResponse _self;
  final $Res Function(AccountClassificationResponse) _then;

/// Create a copy of AccountClassificationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AccountClassificationView,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}
/// Create a copy of AccountClassificationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountClassificationViewCopyWith<$Res> get data {
  
  return $AccountClassificationViewCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of AccountClassificationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ApiResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [AccountClassificationResponse].
extension AccountClassificationResponsePatterns on AccountClassificationResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountClassificationResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountClassificationResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountClassificationResponse value)  $default,){
final _that = this;
switch (_that) {
case _AccountClassificationResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountClassificationResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AccountClassificationResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? success,  String? message,  AccountClassificationView data,  ApiResponseMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountClassificationResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? success,  String? message,  AccountClassificationView data,  ApiResponseMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _AccountClassificationResponse():
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? success,  String? message,  AccountClassificationView data,  ApiResponseMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _AccountClassificationResponse() when $default != null:
return $default(_that.success,_that.message,_that.data,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountClassificationResponse implements AccountClassificationResponse {
  const _AccountClassificationResponse({this.success, this.message, required this.data, this.meta});
  factory _AccountClassificationResponse.fromJson(Map<String, dynamic> json) => _$AccountClassificationResponseFromJson(json);

@override final  bool? success;
@override final  String? message;
@override final  AccountClassificationView data;
@override final  ApiResponseMeta? meta;

/// Create a copy of AccountClassificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountClassificationResponseCopyWith<_AccountClassificationResponse> get copyWith => __$AccountClassificationResponseCopyWithImpl<_AccountClassificationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountClassificationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountClassificationResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data,meta);

@override
String toString() {
  return 'AccountClassificationResponse(success: $success, message: $message, data: $data, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$AccountClassificationResponseCopyWith<$Res> implements $AccountClassificationResponseCopyWith<$Res> {
  factory _$AccountClassificationResponseCopyWith(_AccountClassificationResponse value, $Res Function(_AccountClassificationResponse) _then) = __$AccountClassificationResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? success, String? message, AccountClassificationView data, ApiResponseMeta? meta
});


@override $AccountClassificationViewCopyWith<$Res> get data;@override $ApiResponseMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$AccountClassificationResponseCopyWithImpl<$Res>
    implements _$AccountClassificationResponseCopyWith<$Res> {
  __$AccountClassificationResponseCopyWithImpl(this._self, this._then);

  final _AccountClassificationResponse _self;
  final $Res Function(_AccountClassificationResponse) _then;

/// Create a copy of AccountClassificationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = null,Object? meta = freezed,}) {
  return _then(_AccountClassificationResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AccountClassificationView,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as ApiResponseMeta?,
  ));
}

/// Create a copy of AccountClassificationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AccountClassificationViewCopyWith<$Res> get data {
  
  return $AccountClassificationViewCopyWith<$Res>(_self.data, (value) {
    return _then(_self.copyWith(data: value));
  });
}/// Create a copy of AccountClassificationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiResponseMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $ApiResponseMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}

// dart format on
