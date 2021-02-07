// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetRequest _$PasswordResetRequestFromJson(Map<String, dynamic> json) {
  return PasswordResetRequest(
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$PasswordResetRequestToJson(
        PasswordResetRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };
