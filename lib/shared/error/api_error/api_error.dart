import 'package:json_annotation/json_annotation.dart';

import 'api_validation_error.dart';

part 'api_error.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiError {
  final String message;
  final List<ApiValidationError> subErrors;

  ApiError({this.message, this.subErrors});

  factory ApiError.fromJson(Map<String, dynamic> json) => _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);

  @override
  String toString() {
    return '{\n\tmessage: ${this.message},\n\tsubErrors: ${this.subErrors}\n\t}';
  }
}