import 'package:json_annotation/json_annotation.dart';

part 'api_validation_error.g.dart';

@JsonSerializable()
class ApiValidationError {
  final String object;
  final String message;
  final String field;
  final dynamic rejectedValue;

  ApiValidationError({
    this.object,
    this.message,
    this.field,
    this.rejectedValue,
  });

  factory ApiValidationError.fromJson(Map<String, dynamic> json) => _$ApiValidationErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiValidationErrorToJson(this);

  @override
  String toString() {
    return '{\n\tobject: ${this.object},\n\tmessage: ${this.message},\n\tfield: ${this.field},\n\trejectedValue: ${this.rejectedValue}\n\t}';
  }
}