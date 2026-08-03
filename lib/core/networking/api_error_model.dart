import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final String? code;
  final dynamic errors;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? retryAfter;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final int? statusCode;

  ApiErrorModel({
    this.message,
    this.code,
    this.errors,
    this.retryAfter,
    this.statusCode,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
