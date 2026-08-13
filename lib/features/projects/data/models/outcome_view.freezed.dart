// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outcome_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OutcomeView {

 String get id; String get projectId; String get projectName; OutcomeType get type; OutcomeStatus get status;// WON
 String? get distributorAccountId; CounterpartyView? get distributor; double? get value; DateTime? get soldAt; List<ProductCategory> get categories; int? get unitsSupplied; int? get unitsTotal; String? get buyerContactId;// LOST — a null competitor means UNKNOWN and nothing else.
 String? get competitorAccountId; CounterpartyView? get competitor; LossReason? get lossReason; double? get competitorPrice; String? get narrative; String? get currency; String? get notes; DateTime get submittedAt; String? get submittedBy; ActorView? get submittedByUser; DateTime? get confirmedAt; String? get confirmedBy; ActorView? get confirmedByUser; DateTime? get rejectedAt; String? get rejectedBy; ActorView? get rejectedByUser; String? get rejectionReason; ProjectStage get previousStage;
/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomeViewCopyWith<OutcomeView> get copyWith => _$OutcomeViewCopyWithImpl<OutcomeView>(this as OutcomeView, _$identity);

  /// Serializes this OutcomeView to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutcomeView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.distributorAccountId, distributorAccountId) || other.distributorAccountId == distributorAccountId)&&(identical(other.distributor, distributor) || other.distributor == distributor)&&(identical(other.value, value) || other.value == value)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.unitsSupplied, unitsSupplied) || other.unitsSupplied == unitsSupplied)&&(identical(other.unitsTotal, unitsTotal) || other.unitsTotal == unitsTotal)&&(identical(other.buyerContactId, buyerContactId) || other.buyerContactId == buyerContactId)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.competitor, competitor) || other.competitor == competitor)&&(identical(other.lossReason, lossReason) || other.lossReason == lossReason)&&(identical(other.competitorPrice, competitorPrice) || other.competitorPrice == competitorPrice)&&(identical(other.narrative, narrative) || other.narrative == narrative)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.submittedBy, submittedBy) || other.submittedBy == submittedBy)&&(identical(other.submittedByUser, submittedByUser) || other.submittedByUser == submittedByUser)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.confirmedBy, confirmedBy) || other.confirmedBy == confirmedBy)&&(identical(other.confirmedByUser, confirmedByUser) || other.confirmedByUser == confirmedByUser)&&(identical(other.rejectedAt, rejectedAt) || other.rejectedAt == rejectedAt)&&(identical(other.rejectedBy, rejectedBy) || other.rejectedBy == rejectedBy)&&(identical(other.rejectedByUser, rejectedByUser) || other.rejectedByUser == rejectedByUser)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.previousStage, previousStage) || other.previousStage == previousStage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,projectId,projectName,type,status,distributorAccountId,distributor,value,soldAt,const DeepCollectionEquality().hash(categories),unitsSupplied,unitsTotal,buyerContactId,competitorAccountId,competitor,lossReason,competitorPrice,narrative,currency,notes,submittedAt,submittedBy,submittedByUser,confirmedAt,confirmedBy,confirmedByUser,rejectedAt,rejectedBy,rejectedByUser,rejectionReason,previousStage]);

@override
String toString() {
  return 'OutcomeView(id: $id, projectId: $projectId, projectName: $projectName, type: $type, status: $status, distributorAccountId: $distributorAccountId, distributor: $distributor, value: $value, soldAt: $soldAt, categories: $categories, unitsSupplied: $unitsSupplied, unitsTotal: $unitsTotal, buyerContactId: $buyerContactId, competitorAccountId: $competitorAccountId, competitor: $competitor, lossReason: $lossReason, competitorPrice: $competitorPrice, narrative: $narrative, currency: $currency, notes: $notes, submittedAt: $submittedAt, submittedBy: $submittedBy, submittedByUser: $submittedByUser, confirmedAt: $confirmedAt, confirmedBy: $confirmedBy, confirmedByUser: $confirmedByUser, rejectedAt: $rejectedAt, rejectedBy: $rejectedBy, rejectedByUser: $rejectedByUser, rejectionReason: $rejectionReason, previousStage: $previousStage)';
}


}

/// @nodoc
abstract mixin class $OutcomeViewCopyWith<$Res>  {
  factory $OutcomeViewCopyWith(OutcomeView value, $Res Function(OutcomeView) _then) = _$OutcomeViewCopyWithImpl;
@useResult
$Res call({
 String id, String projectId, String projectName, OutcomeType type, OutcomeStatus status, String? distributorAccountId, CounterpartyView? distributor, double? value, DateTime? soldAt, List<ProductCategory> categories, int? unitsSupplied, int? unitsTotal, String? buyerContactId, String? competitorAccountId, CounterpartyView? competitor, LossReason? lossReason, double? competitorPrice, String? narrative, String? currency, String? notes, DateTime submittedAt, String? submittedBy, ActorView? submittedByUser, DateTime? confirmedAt, String? confirmedBy, ActorView? confirmedByUser, DateTime? rejectedAt, String? rejectedBy, ActorView? rejectedByUser, String? rejectionReason, ProjectStage previousStage
});


$CounterpartyViewCopyWith<$Res>? get distributor;$CounterpartyViewCopyWith<$Res>? get competitor;$ActorViewCopyWith<$Res>? get submittedByUser;$ActorViewCopyWith<$Res>? get confirmedByUser;$ActorViewCopyWith<$Res>? get rejectedByUser;

}
/// @nodoc
class _$OutcomeViewCopyWithImpl<$Res>
    implements $OutcomeViewCopyWith<$Res> {
  _$OutcomeViewCopyWithImpl(this._self, this._then);

  final OutcomeView _self;
  final $Res Function(OutcomeView) _then;

/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? projectId = null,Object? projectName = null,Object? type = null,Object? status = null,Object? distributorAccountId = freezed,Object? distributor = freezed,Object? value = freezed,Object? soldAt = freezed,Object? categories = null,Object? unitsSupplied = freezed,Object? unitsTotal = freezed,Object? buyerContactId = freezed,Object? competitorAccountId = freezed,Object? competitor = freezed,Object? lossReason = freezed,Object? competitorPrice = freezed,Object? narrative = freezed,Object? currency = freezed,Object? notes = freezed,Object? submittedAt = null,Object? submittedBy = freezed,Object? submittedByUser = freezed,Object? confirmedAt = freezed,Object? confirmedBy = freezed,Object? confirmedByUser = freezed,Object? rejectedAt = freezed,Object? rejectedBy = freezed,Object? rejectedByUser = freezed,Object? rejectionReason = freezed,Object? previousStage = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OutcomeType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OutcomeStatus,distributorAccountId: freezed == distributorAccountId ? _self.distributorAccountId : distributorAccountId // ignore: cast_nullable_to_non_nullable
as String?,distributor: freezed == distributor ? _self.distributor : distributor // ignore: cast_nullable_to_non_nullable
as CounterpartyView?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategory>,unitsSupplied: freezed == unitsSupplied ? _self.unitsSupplied : unitsSupplied // ignore: cast_nullable_to_non_nullable
as int?,unitsTotal: freezed == unitsTotal ? _self.unitsTotal : unitsTotal // ignore: cast_nullable_to_non_nullable
as int?,buyerContactId: freezed == buyerContactId ? _self.buyerContactId : buyerContactId // ignore: cast_nullable_to_non_nullable
as String?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,competitor: freezed == competitor ? _self.competitor : competitor // ignore: cast_nullable_to_non_nullable
as CounterpartyView?,lossReason: freezed == lossReason ? _self.lossReason : lossReason // ignore: cast_nullable_to_non_nullable
as LossReason?,competitorPrice: freezed == competitorPrice ? _self.competitorPrice : competitorPrice // ignore: cast_nullable_to_non_nullable
as double?,narrative: freezed == narrative ? _self.narrative : narrative // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,submittedBy: freezed == submittedBy ? _self.submittedBy : submittedBy // ignore: cast_nullable_to_non_nullable
as String?,submittedByUser: freezed == submittedByUser ? _self.submittedByUser : submittedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedBy: freezed == confirmedBy ? _self.confirmedBy : confirmedBy // ignore: cast_nullable_to_non_nullable
as String?,confirmedByUser: freezed == confirmedByUser ? _self.confirmedByUser : confirmedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,rejectedAt: freezed == rejectedAt ? _self.rejectedAt : rejectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectedBy: freezed == rejectedBy ? _self.rejectedBy : rejectedBy // ignore: cast_nullable_to_non_nullable
as String?,rejectedByUser: freezed == rejectedByUser ? _self.rejectedByUser : rejectedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,previousStage: null == previousStage ? _self.previousStage : previousStage // ignore: cast_nullable_to_non_nullable
as ProjectStage,
  ));
}
/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterpartyViewCopyWith<$Res>? get distributor {
    if (_self.distributor == null) {
    return null;
  }

  return $CounterpartyViewCopyWith<$Res>(_self.distributor!, (value) {
    return _then(_self.copyWith(distributor: value));
  });
}/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterpartyViewCopyWith<$Res>? get competitor {
    if (_self.competitor == null) {
    return null;
  }

  return $CounterpartyViewCopyWith<$Res>(_self.competitor!, (value) {
    return _then(_self.copyWith(competitor: value));
  });
}/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get submittedByUser {
    if (_self.submittedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.submittedByUser!, (value) {
    return _then(_self.copyWith(submittedByUser: value));
  });
}/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get confirmedByUser {
    if (_self.confirmedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.confirmedByUser!, (value) {
    return _then(_self.copyWith(confirmedByUser: value));
  });
}/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get rejectedByUser {
    if (_self.rejectedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.rejectedByUser!, (value) {
    return _then(_self.copyWith(rejectedByUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [OutcomeView].
extension OutcomeViewPatterns on OutcomeView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OutcomeView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OutcomeView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OutcomeView value)  $default,){
final _that = this;
switch (_that) {
case _OutcomeView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OutcomeView value)?  $default,){
final _that = this;
switch (_that) {
case _OutcomeView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String projectId,  String projectName,  OutcomeType type,  OutcomeStatus status,  String? distributorAccountId,  CounterpartyView? distributor,  double? value,  DateTime? soldAt,  List<ProductCategory> categories,  int? unitsSupplied,  int? unitsTotal,  String? buyerContactId,  String? competitorAccountId,  CounterpartyView? competitor,  LossReason? lossReason,  double? competitorPrice,  String? narrative,  String? currency,  String? notes,  DateTime submittedAt,  String? submittedBy,  ActorView? submittedByUser,  DateTime? confirmedAt,  String? confirmedBy,  ActorView? confirmedByUser,  DateTime? rejectedAt,  String? rejectedBy,  ActorView? rejectedByUser,  String? rejectionReason,  ProjectStage previousStage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OutcomeView() when $default != null:
return $default(_that.id,_that.projectId,_that.projectName,_that.type,_that.status,_that.distributorAccountId,_that.distributor,_that.value,_that.soldAt,_that.categories,_that.unitsSupplied,_that.unitsTotal,_that.buyerContactId,_that.competitorAccountId,_that.competitor,_that.lossReason,_that.competitorPrice,_that.narrative,_that.currency,_that.notes,_that.submittedAt,_that.submittedBy,_that.submittedByUser,_that.confirmedAt,_that.confirmedBy,_that.confirmedByUser,_that.rejectedAt,_that.rejectedBy,_that.rejectedByUser,_that.rejectionReason,_that.previousStage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String projectId,  String projectName,  OutcomeType type,  OutcomeStatus status,  String? distributorAccountId,  CounterpartyView? distributor,  double? value,  DateTime? soldAt,  List<ProductCategory> categories,  int? unitsSupplied,  int? unitsTotal,  String? buyerContactId,  String? competitorAccountId,  CounterpartyView? competitor,  LossReason? lossReason,  double? competitorPrice,  String? narrative,  String? currency,  String? notes,  DateTime submittedAt,  String? submittedBy,  ActorView? submittedByUser,  DateTime? confirmedAt,  String? confirmedBy,  ActorView? confirmedByUser,  DateTime? rejectedAt,  String? rejectedBy,  ActorView? rejectedByUser,  String? rejectionReason,  ProjectStage previousStage)  $default,) {final _that = this;
switch (_that) {
case _OutcomeView():
return $default(_that.id,_that.projectId,_that.projectName,_that.type,_that.status,_that.distributorAccountId,_that.distributor,_that.value,_that.soldAt,_that.categories,_that.unitsSupplied,_that.unitsTotal,_that.buyerContactId,_that.competitorAccountId,_that.competitor,_that.lossReason,_that.competitorPrice,_that.narrative,_that.currency,_that.notes,_that.submittedAt,_that.submittedBy,_that.submittedByUser,_that.confirmedAt,_that.confirmedBy,_that.confirmedByUser,_that.rejectedAt,_that.rejectedBy,_that.rejectedByUser,_that.rejectionReason,_that.previousStage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String projectId,  String projectName,  OutcomeType type,  OutcomeStatus status,  String? distributorAccountId,  CounterpartyView? distributor,  double? value,  DateTime? soldAt,  List<ProductCategory> categories,  int? unitsSupplied,  int? unitsTotal,  String? buyerContactId,  String? competitorAccountId,  CounterpartyView? competitor,  LossReason? lossReason,  double? competitorPrice,  String? narrative,  String? currency,  String? notes,  DateTime submittedAt,  String? submittedBy,  ActorView? submittedByUser,  DateTime? confirmedAt,  String? confirmedBy,  ActorView? confirmedByUser,  DateTime? rejectedAt,  String? rejectedBy,  ActorView? rejectedByUser,  String? rejectionReason,  ProjectStage previousStage)?  $default,) {final _that = this;
switch (_that) {
case _OutcomeView() when $default != null:
return $default(_that.id,_that.projectId,_that.projectName,_that.type,_that.status,_that.distributorAccountId,_that.distributor,_that.value,_that.soldAt,_that.categories,_that.unitsSupplied,_that.unitsTotal,_that.buyerContactId,_that.competitorAccountId,_that.competitor,_that.lossReason,_that.competitorPrice,_that.narrative,_that.currency,_that.notes,_that.submittedAt,_that.submittedBy,_that.submittedByUser,_that.confirmedAt,_that.confirmedBy,_that.confirmedByUser,_that.rejectedAt,_that.rejectedBy,_that.rejectedByUser,_that.rejectionReason,_that.previousStage);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(converters: [UtcDateTimeConverter()])
class _OutcomeView implements OutcomeView {
  const _OutcomeView({required this.id, required this.projectId, required this.projectName, required this.type, required this.status, this.distributorAccountId, this.distributor, this.value, this.soldAt, final  List<ProductCategory> categories = const <ProductCategory>[], this.unitsSupplied, this.unitsTotal, this.buyerContactId, this.competitorAccountId, this.competitor, this.lossReason, this.competitorPrice, this.narrative, this.currency, this.notes, required this.submittedAt, this.submittedBy, this.submittedByUser, this.confirmedAt, this.confirmedBy, this.confirmedByUser, this.rejectedAt, this.rejectedBy, this.rejectedByUser, this.rejectionReason, required this.previousStage}): _categories = categories;
  factory _OutcomeView.fromJson(Map<String, dynamic> json) => _$OutcomeViewFromJson(json);

@override final  String id;
@override final  String projectId;
@override final  String projectName;
@override final  OutcomeType type;
@override final  OutcomeStatus status;
// WON
@override final  String? distributorAccountId;
@override final  CounterpartyView? distributor;
@override final  double? value;
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
// LOST — a null competitor means UNKNOWN and nothing else.
@override final  String? competitorAccountId;
@override final  CounterpartyView? competitor;
@override final  LossReason? lossReason;
@override final  double? competitorPrice;
@override final  String? narrative;
@override final  String? currency;
@override final  String? notes;
@override final  DateTime submittedAt;
@override final  String? submittedBy;
@override final  ActorView? submittedByUser;
@override final  DateTime? confirmedAt;
@override final  String? confirmedBy;
@override final  ActorView? confirmedByUser;
@override final  DateTime? rejectedAt;
@override final  String? rejectedBy;
@override final  ActorView? rejectedByUser;
@override final  String? rejectionReason;
@override final  ProjectStage previousStage;

/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutcomeViewCopyWith<_OutcomeView> get copyWith => __$OutcomeViewCopyWithImpl<_OutcomeView>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutcomeViewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OutcomeView&&(identical(other.id, id) || other.id == id)&&(identical(other.projectId, projectId) || other.projectId == projectId)&&(identical(other.projectName, projectName) || other.projectName == projectName)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.distributorAccountId, distributorAccountId) || other.distributorAccountId == distributorAccountId)&&(identical(other.distributor, distributor) || other.distributor == distributor)&&(identical(other.value, value) || other.value == value)&&(identical(other.soldAt, soldAt) || other.soldAt == soldAt)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.unitsSupplied, unitsSupplied) || other.unitsSupplied == unitsSupplied)&&(identical(other.unitsTotal, unitsTotal) || other.unitsTotal == unitsTotal)&&(identical(other.buyerContactId, buyerContactId) || other.buyerContactId == buyerContactId)&&(identical(other.competitorAccountId, competitorAccountId) || other.competitorAccountId == competitorAccountId)&&(identical(other.competitor, competitor) || other.competitor == competitor)&&(identical(other.lossReason, lossReason) || other.lossReason == lossReason)&&(identical(other.competitorPrice, competitorPrice) || other.competitorPrice == competitorPrice)&&(identical(other.narrative, narrative) || other.narrative == narrative)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.submittedBy, submittedBy) || other.submittedBy == submittedBy)&&(identical(other.submittedByUser, submittedByUser) || other.submittedByUser == submittedByUser)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.confirmedBy, confirmedBy) || other.confirmedBy == confirmedBy)&&(identical(other.confirmedByUser, confirmedByUser) || other.confirmedByUser == confirmedByUser)&&(identical(other.rejectedAt, rejectedAt) || other.rejectedAt == rejectedAt)&&(identical(other.rejectedBy, rejectedBy) || other.rejectedBy == rejectedBy)&&(identical(other.rejectedByUser, rejectedByUser) || other.rejectedByUser == rejectedByUser)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.previousStage, previousStage) || other.previousStage == previousStage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,projectId,projectName,type,status,distributorAccountId,distributor,value,soldAt,const DeepCollectionEquality().hash(_categories),unitsSupplied,unitsTotal,buyerContactId,competitorAccountId,competitor,lossReason,competitorPrice,narrative,currency,notes,submittedAt,submittedBy,submittedByUser,confirmedAt,confirmedBy,confirmedByUser,rejectedAt,rejectedBy,rejectedByUser,rejectionReason,previousStage]);

@override
String toString() {
  return 'OutcomeView(id: $id, projectId: $projectId, projectName: $projectName, type: $type, status: $status, distributorAccountId: $distributorAccountId, distributor: $distributor, value: $value, soldAt: $soldAt, categories: $categories, unitsSupplied: $unitsSupplied, unitsTotal: $unitsTotal, buyerContactId: $buyerContactId, competitorAccountId: $competitorAccountId, competitor: $competitor, lossReason: $lossReason, competitorPrice: $competitorPrice, narrative: $narrative, currency: $currency, notes: $notes, submittedAt: $submittedAt, submittedBy: $submittedBy, submittedByUser: $submittedByUser, confirmedAt: $confirmedAt, confirmedBy: $confirmedBy, confirmedByUser: $confirmedByUser, rejectedAt: $rejectedAt, rejectedBy: $rejectedBy, rejectedByUser: $rejectedByUser, rejectionReason: $rejectionReason, previousStage: $previousStage)';
}


}

/// @nodoc
abstract mixin class _$OutcomeViewCopyWith<$Res> implements $OutcomeViewCopyWith<$Res> {
  factory _$OutcomeViewCopyWith(_OutcomeView value, $Res Function(_OutcomeView) _then) = __$OutcomeViewCopyWithImpl;
@override @useResult
$Res call({
 String id, String projectId, String projectName, OutcomeType type, OutcomeStatus status, String? distributorAccountId, CounterpartyView? distributor, double? value, DateTime? soldAt, List<ProductCategory> categories, int? unitsSupplied, int? unitsTotal, String? buyerContactId, String? competitorAccountId, CounterpartyView? competitor, LossReason? lossReason, double? competitorPrice, String? narrative, String? currency, String? notes, DateTime submittedAt, String? submittedBy, ActorView? submittedByUser, DateTime? confirmedAt, String? confirmedBy, ActorView? confirmedByUser, DateTime? rejectedAt, String? rejectedBy, ActorView? rejectedByUser, String? rejectionReason, ProjectStage previousStage
});


@override $CounterpartyViewCopyWith<$Res>? get distributor;@override $CounterpartyViewCopyWith<$Res>? get competitor;@override $ActorViewCopyWith<$Res>? get submittedByUser;@override $ActorViewCopyWith<$Res>? get confirmedByUser;@override $ActorViewCopyWith<$Res>? get rejectedByUser;

}
/// @nodoc
class __$OutcomeViewCopyWithImpl<$Res>
    implements _$OutcomeViewCopyWith<$Res> {
  __$OutcomeViewCopyWithImpl(this._self, this._then);

  final _OutcomeView _self;
  final $Res Function(_OutcomeView) _then;

/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? projectId = null,Object? projectName = null,Object? type = null,Object? status = null,Object? distributorAccountId = freezed,Object? distributor = freezed,Object? value = freezed,Object? soldAt = freezed,Object? categories = null,Object? unitsSupplied = freezed,Object? unitsTotal = freezed,Object? buyerContactId = freezed,Object? competitorAccountId = freezed,Object? competitor = freezed,Object? lossReason = freezed,Object? competitorPrice = freezed,Object? narrative = freezed,Object? currency = freezed,Object? notes = freezed,Object? submittedAt = null,Object? submittedBy = freezed,Object? submittedByUser = freezed,Object? confirmedAt = freezed,Object? confirmedBy = freezed,Object? confirmedByUser = freezed,Object? rejectedAt = freezed,Object? rejectedBy = freezed,Object? rejectedByUser = freezed,Object? rejectionReason = freezed,Object? previousStage = null,}) {
  return _then(_OutcomeView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,projectId: null == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as String,projectName: null == projectName ? _self.projectName : projectName // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as OutcomeType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OutcomeStatus,distributorAccountId: freezed == distributorAccountId ? _self.distributorAccountId : distributorAccountId // ignore: cast_nullable_to_non_nullable
as String?,distributor: freezed == distributor ? _self.distributor : distributor // ignore: cast_nullable_to_non_nullable
as CounterpartyView?,value: freezed == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double?,soldAt: freezed == soldAt ? _self.soldAt : soldAt // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ProductCategory>,unitsSupplied: freezed == unitsSupplied ? _self.unitsSupplied : unitsSupplied // ignore: cast_nullable_to_non_nullable
as int?,unitsTotal: freezed == unitsTotal ? _self.unitsTotal : unitsTotal // ignore: cast_nullable_to_non_nullable
as int?,buyerContactId: freezed == buyerContactId ? _self.buyerContactId : buyerContactId // ignore: cast_nullable_to_non_nullable
as String?,competitorAccountId: freezed == competitorAccountId ? _self.competitorAccountId : competitorAccountId // ignore: cast_nullable_to_non_nullable
as String?,competitor: freezed == competitor ? _self.competitor : competitor // ignore: cast_nullable_to_non_nullable
as CounterpartyView?,lossReason: freezed == lossReason ? _self.lossReason : lossReason // ignore: cast_nullable_to_non_nullable
as LossReason?,competitorPrice: freezed == competitorPrice ? _self.competitorPrice : competitorPrice // ignore: cast_nullable_to_non_nullable
as double?,narrative: freezed == narrative ? _self.narrative : narrative // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,submittedBy: freezed == submittedBy ? _self.submittedBy : submittedBy // ignore: cast_nullable_to_non_nullable
as String?,submittedByUser: freezed == submittedByUser ? _self.submittedByUser : submittedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedBy: freezed == confirmedBy ? _self.confirmedBy : confirmedBy // ignore: cast_nullable_to_non_nullable
as String?,confirmedByUser: freezed == confirmedByUser ? _self.confirmedByUser : confirmedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,rejectedAt: freezed == rejectedAt ? _self.rejectedAt : rejectedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,rejectedBy: freezed == rejectedBy ? _self.rejectedBy : rejectedBy // ignore: cast_nullable_to_non_nullable
as String?,rejectedByUser: freezed == rejectedByUser ? _self.rejectedByUser : rejectedByUser // ignore: cast_nullable_to_non_nullable
as ActorView?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,previousStage: null == previousStage ? _self.previousStage : previousStage // ignore: cast_nullable_to_non_nullable
as ProjectStage,
  ));
}

/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterpartyViewCopyWith<$Res>? get distributor {
    if (_self.distributor == null) {
    return null;
  }

  return $CounterpartyViewCopyWith<$Res>(_self.distributor!, (value) {
    return _then(_self.copyWith(distributor: value));
  });
}/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterpartyViewCopyWith<$Res>? get competitor {
    if (_self.competitor == null) {
    return null;
  }

  return $CounterpartyViewCopyWith<$Res>(_self.competitor!, (value) {
    return _then(_self.copyWith(competitor: value));
  });
}/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get submittedByUser {
    if (_self.submittedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.submittedByUser!, (value) {
    return _then(_self.copyWith(submittedByUser: value));
  });
}/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get confirmedByUser {
    if (_self.confirmedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.confirmedByUser!, (value) {
    return _then(_self.copyWith(confirmedByUser: value));
  });
}/// Create a copy of OutcomeView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ActorViewCopyWith<$Res>? get rejectedByUser {
    if (_self.rejectedByUser == null) {
    return null;
  }

  return $ActorViewCopyWith<$Res>(_self.rejectedByUser!, (value) {
    return _then(_self.copyWith(rejectedByUser: value));
  });
}
}

// dart format on
