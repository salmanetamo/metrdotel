
import 'package:flutter/foundation.dart';

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({
    @required this.email,
    @required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': this.email,
      'password': this.password,
    };
  }
}
