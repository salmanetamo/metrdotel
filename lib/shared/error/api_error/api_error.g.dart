// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) {
  return ApiError(
    message: json['message'] as String?,
    subErrors: (json['subErrors'] as List<dynamic>?)
        ?.map((e) => ApiValidationError.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'message': instance.message,
      'subErrors': instance.subErrors?.map((e) => e.toJson()).toList(),
    };
