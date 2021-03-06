import 'package:equatable/equatable.dart';

import 'package:metrdotel/shared/error/api_error/api_error.dart';
import 'package:metrdotel/shared/error/api_error/api_validation_error.dart';

class Failure extends Equatable {
  final String? message;
  final ApiError error;

  Failure({String? message, required this.error})
      : this.message = message == null || message.isEmpty
            ? error.message == null || error.message!.isEmpty
                ? "Unexpected error occurred"
                : error.message
            : message;

  bool containsErrorForField(String field) {
    return this.error.subErrors != null && this.error.subErrors!.isNotEmpty &&
        this.error.subErrors!.where((error) => error.field == field).isNotEmpty;
  }

  List<ApiValidationError> getErrorsForField(String field) =>
      this.error.subErrors != null ? this.error.subErrors!.where((error) => error.field == field).toList() : List.empty();

  @override
  List<Object> get props => [this.message as Object, this.error];

  @override
  String toString() {
    return '{\n\tmessage: ${this.message},\n\terror: ${this.error}\n\t}';
  }
}
