import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:metrdotel/core/models/auth/auth_response.dart';
import 'package:metrdotel/login/domain/models/login_request.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/signup/domain/models/signup_request.dart';

abstract class IAuthService {
  Future<bool> isLoggedIn();
  Future<String> getToken();
  Future<Either<Failure, AuthResponse>> signupWithCredentials({
    @required SignupRequest signupRequest,
  });
  Future<Either<Failure, AuthResponse>> loginWithCredentials({
    @required LoginRequest loginRequest,
  });
  Future<Either<Failure, AuthResponse>> refreshToken();
  Future<void> logout();
}
