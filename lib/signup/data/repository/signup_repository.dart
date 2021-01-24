import 'package:dartz/dartz.dart';
import 'package:metrdotel/core/models/auth/auth_response.dart';
import 'package:metrdotel/signup/domain/error/signup_failure.dart';
import 'package:metrdotel/signup/domain/repository/i_signup_repository.dart';

class SignupRepository extends ISignupRepository {
  @override
  Future<Either<SignupFailure, AuthResponse>> signupWithCredentials() {
    // TODO: implement signupWithCredentials
    throw UnimplementedError();
  }

}