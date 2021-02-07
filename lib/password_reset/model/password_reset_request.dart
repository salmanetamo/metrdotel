import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_reset_request.g.dart';

@JsonSerializable()
class PasswordResetRequest {
  final String email;

  const PasswordResetRequest({@required this.email});

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) => _$PasswordResetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetRequestToJson(this);
}