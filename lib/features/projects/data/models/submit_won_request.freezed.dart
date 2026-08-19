// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_won_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitWonRequest {

 String get distributorAccountId; double? get value; String? get currency; DateTime? get soldAt; List<ProductCategory> get categories; int? get unitsSupplied; int? get unitsTotal; String? get buyerContactId; String? get notes;/// Supporting documents for the claim — a signed contract, a delivery
/// note, the approval scan. Same `{key, name}` shape as an activity's
/// attachments: upload through `POST /files` first, then quote the keys
/// it returns.
///
/// Capped at 10 to match every other `files` array in this API. Empty by
/// default and, with `includeIfNull: false`, an empty list still
/// serialises as `"files": []` — harmless, since the server treats the
/// array as optional.
 List<UploadedFileDto> get files;
/// Create a copy of SubmitWonRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitWonRequestCopyWith<SubmitWonRequest> get copyWith => _$SubmitWonRequestCopyWithImpl<SubmitWonRequest>(this as SubmitWonRequest, _$identity);

  /// Serializes this SubmitWonRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitWonRequest&&(identical(other.distributorAccountId, distributorAccountId) || other.distributorAccountId == distributorAccountId)&&(identical(other.value, value) || other.value == value)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.unitsSupplied, unitsSupplied) || other.unitsSupplied == unitsSupplied)&&(identical(other.unitsTotal, unitsTotal) || other.unitsTotal == unitsTotal)&&(identical(other.buyerContactId, buyerContactId) || other.buyerContactId == buyerContactId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.files, files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,distributorAccountId,value,currency,soldAt,const DeepCollectionEquality().hash(categories),unitsSupplied,unitsTotal,buyerContactId,notes,const DeepCollectionEquality().hash(files));

@override
String toString() {
  return 'SubmitWonRequest(distributorAccountId: $distributorAccountId, value: $value, currency: $currency, soldAt: $soldAt, categories: $categories, unitsSupplied: $unitsSupplied, unitsTotal: $unitsTotal, buyerContactId: $buyerContactId, notes: $notes, files: $files)';
}


}

/// @nodoc
abstract mixin class $SubmitWonRequestCopyWith<$Res>  {
  factory $SubmitWonRequestCopyWith(SubmitWonRequest value, $Res Function(SubmitWonRequest) _then) = _$SubmitWonRequestCopyWithImpl;
@useResult
$Res call({
 String distributorAccountId, double? value, String? currency, DateTime? soldAt, List<ProductCategory> categories, int? unitsSupplied, int? unitsTotal, String? buyerContactId, String? notes, List<UploadedFileDto> files
});




}
/// @nodoc
class _$SubmitWonRequestCopyWithImpl<$Res>
    implements $SubmitWonRequestCopyWith<$Res> {
  _$SubmitWonRequestCopyWithImpl(this._self, this._then);

  final SubmitWonRequest _self;
  final $Res Function(SubmitWonRequest) _then;

/// Create a copy of SubmitWonRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? distributorAccountId = null,Object? value = freezed,Object? currency = freezed,Object? soldAt = freezed,Object? categories = null,Object? unitsSupplied = freezed,Object? unitsTotal = freezed,Object? buyerContactId = freezed,Object? notes = freezed,Object? files = null,}) {
  return _then(_self.copyWith(
distributorAccountId: null == distributorAccountId ? _self.distributorAccountId : distributorAccountId // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategory>,unitsSupplied: freezed == unitsSupplied ? _self.unitsSupplied : unitsSupplied // ignore: cast_nullable_to_non_nullable
as int?,unitsTotal: freezed == unitsTotal ? _self.unitsTotal : unitsTotal // ignore: cast_nullable_to_non_nullable
as int?,buyerContactId: freezed == buyerContactId ? _self.buyerContactId : buyerContactId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,files: null == files ? _self.files : files // ignore: cast_nullable_to_non_nullable
as List<UploadedFileDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitWonRequest].
extension SubmitWonRequestPatterns on SubmitWonRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitWonRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitWonRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitWonRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubmitWonRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitWonRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitWonRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String distributorAccountId,  double? value,  String? currency,  DateTime? soldAt,  List<ProductCategory> categories,  int? unitsSupplied,  int? unitsTotal,  String? buyerContactId,  String? notes,  List<UploadedFileDto> files)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitWonRequest() when $default != null:
return $default(_that.distributorAccountId,_that.value,_that.currency,_that.soldAt,_that.categories,_that.unitsSupplied,_that.unitsTotal,_that.buyerContactId,_that.notes,_that.files);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String distributorAccountId,  double? value,  String? currency,  DateTime? soldAt,  List<ProductCategory> categories,  int? unitsSupplied,  int? unitsTotal,  String? buyerContactId,  String? notes,  List<UploadedFileDto> files)  $default,) {final _that = this;
switch (_that) {
case _SubmitWonRequest():
return $default(_that.distributorAccountId,_that.value,_that.currency,_that.soldAt,_that.categories,_that.unitsSupplied,_that.unitsTotal,_that.buyerContactId,_that.notes,_that.files);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String distributorAccountId,  double? value,  String? currency,  DateTime? soldAt,  List<ProductCategory> categories,  int? unitsSupplied,  int? unitsTotal,  String? buyerContactId,  String? notes,  List<UploadedFileDto> files)?  $default,) {final _that = this;
switch (_that) {
case _SubmitWonRequest() when $default != null:
return $default(_that.distributorAccountId,_that.value,_that.currency,_that.soldAt,_that.categories,_that.unitsSupplied,_that.unitsTotal,_that.buyerContactId,_that.notes,_that.files);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(includeIfNull: false, converters: [UtcDateTimeConverter()])
class _SubmitWonRequest implements SubmitWonRequest {
  const _SubmitWonRequest({required this.distributorAccountId, this.value, this.currency, this.soldAt, final  List<ProductCategory> categories = const <ProductCategory>[], this.unitsSupplied, this.unitsTotal, this.buyerContactId, this.notes, final  List<UploadedFileDto> files = const <UploadedFileDto>[]}): _categories = categories,_files = files;
  factory _SubmitWonRequest.fromJson(Map<String, dynamic> json) => _$SubmitWonRequestFromJson(json);

@override final  String distributorAccountId;
@override final  double? value;
@override final  String? currency;
@override final  DateTime? soldAt;
 final  List<ProductCategory> _categories;
@override@JsonKey() List<ProductCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override final  int? unitsSupplied;
@override final  int? unitsTotal;
@override final  String? buyerContactId;
@override final  String? notes;
/// Supporting documents for the claim — a signed contract, a delivery
/// note, the approval scan. Same `{key, name}` shape as an activity's
/// attachments: upload through `POST /files` first, then quote the keys
/// it returns.
///
/// Capped at 10 to match every other `files` array in this API. Empty by
/// default and, with `includeIfNull: false`, an empty list still
/// serialises as `"files": []` — harmless, since the server treats the
/// array as optional.
 final  List<UploadedFileDto> _files;
/// Supporting documents for the claim — a signed contract, a delivery
/// note, the approval scan. Same `{key, name}` shape as an activity's
/// attachments: upload through `POST /files` first, then quote the keys
/// it returns.
///
/// Capped at 10 to match every other `files` array in this API. Empty by
/// default and, with `includeIfNull: false`, an empty list still
/// serialises as `"files": []` — harmless, since the server treats the
/// array as optional.
@override@JsonKey() List<UploadedFileDto> get files {
  if (_files is EqualUnmodifiableListView) return _files;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_files);
}


/// Create a copy of SubmitWonRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitWonRequestCopyWith<_SubmitWonRequest> get copyWith => __$SubmitWonRequestCopyWithImpl<_SubmitWonRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitWonRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitWonRequest&&(identical(other.distributorAccountId, distributorAccountId) || other.distributorAccountId == distributorAccountId)&&(identical(other.value, value) || other.value == value)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.unitsSupplied, unitsSupplied) || other.unitsSupplied == unitsSupplied)&&(identical(other.unitsTotal, unitsTotal) || other.unitsTotal == unitsTotal)&&(identical(other.buyerContactId, buyerContactId) || other.buyerContactId == buyerContactId)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._files, _files));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,distributorAccountId,value,currency,soldAt,const DeepCollectionEquality().hash(_categories),unitsSupplied,unitsTotal,buyerContactId,notes,const DeepCollectionEquality().hash(_files));

@override
String toString() {
  return 'SubmitWonRequest(distributorAccountId: $distributorAccountId, value: $value, currency: $currency, soldAt: $soldAt, categories: $categories, unitsSupplied: $unitsSupplied, unitsTotal: $unitsTotal, buyerContactId: $buyerContactId, notes: $notes, files: $files)';
}


}

/// @nodoc
abstract mixin class _$SubmitWonRequestCopyWith<$Res> implements $SubmitWonRequestCopyWith<$Res> {
  factory _$SubmitWonRequestCopyWith(_SubmitWonRequest value, $Res Function(_SubmitWonRequest) _then) = __$SubmitWonRequestCopyWithImpl;
@override @useResult
$Res call({
 String distributorAccountId, double? value, String? currency, DateTime? soldAt, List<ProductCategory> categories, int? unitsSupplied, int? unitsTotal, String? buyerContactId, String? notes, List<UploadedFileDto> files
});




}
/// @nodoc
class __$SubmitWonRequestCopyWithImpl<$Res>
    implements _$SubmitWonRequestCopyWith<$Res> {
  __$SubmitWonRequestCopyWithImpl(this._self, this._then);

  final _SubmitWonRequest _self;
  final $Res Function(_SubmitWonRequest) _then;

/// Create a copy of SubmitWonRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? distributorAccountId = null,Object? value = freezed,Object? currency = freezed,Object? soldAt = freezed,Object? categories = null,Object? unitsSupplied = freezed,Object? unitsTotal = freezed,Object? buyerContactId = freezed,Object? notes = freezed,Object? files = null,}) {
  return _then(_SubmitWonRequest(
distributorAccountId: null == distributorAccountId ? _self.distributorAccountId : distributorAccountId // ignore: cast_nullable_to_non_nullable
as String,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategory>,unitsSupplied: freezed == unitsSupplied ? _self.unitsSupplied : unitsSupplied // ignore: cast_nullable_to_non_nullable
as int?,unitsTotal: freezed == unitsTotal ? _self.unitsTotal : unitsTotal // ignore: cast_nullable_to_non_nullable
as int?,buyerContactId: freezed == buyerContactId ? _self.buyerContactId : buyerContactId // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,files: null == files ? _self._files : files // ignore: cast_nullable_to_non_nullable
as List<UploadedFileDto>,
  ));
}


}

// dart format on
