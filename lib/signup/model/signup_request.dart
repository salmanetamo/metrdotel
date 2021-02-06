import 'package:flutter/foundation.dart';

class SignupRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  const SignupRequest({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.password,
    @required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': this.firstName,
      'lastName': this.lastName,
      'email': this.email,
      'password': this.password,
      'confirmPassword': this.confirmPassword,
    };
  }
}
