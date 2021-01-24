import 'package:dartz/dartz.dart';
import 'package:metrdotel/core/models/auth/auth_response.dart';
import 'package:metrdotel/signup/domain/error/signup_failure.dart';

abstract class ISignupRepository {
  Future<Either<SignupFailure, AuthResponse>> signupWithCredentials();
}