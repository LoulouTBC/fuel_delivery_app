import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String message;
  final ErrorData? data;
  final bool status;
  final int code;

  ApiErrorModel({
    required this.message,
    required this.code,
    this.data,
    required this.status,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

@JsonSerializable()
class ErrorData {
  final List<String>? name;
  final List<String>? email;
  final List<String>? phone;
  final List<String>? gender;
  final List<String>? password;

  ErrorData({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
  });

    factory ErrorData.fromJson(Map<String, dynamic> json) =>
      _$ErrorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}
