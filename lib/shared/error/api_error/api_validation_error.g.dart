// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_validation_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiValidationError _$ApiValidationErrorFromJson(Map<String, dynamic> json) {
  return ApiValidationError(
    object: json['object'] as String,
    message: json['message'] as String,
    field: json['field'] as String,
    rejectedValue: json['rejectedValue'],
  );
}

Map<String, dynamic> _$ApiValidationErrorToJson(ApiValidationError instance) =>
    <String, dynamic>{
      'object': instance.object,
      'message': instance.message,
      'field': instance.field,
      'rejectedValue': instance.rejectedValue,
    };
