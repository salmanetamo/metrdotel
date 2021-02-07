import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:metrdotel/password_reset/model/password_reset_request.dart';
import 'package:metrdotel/password_reset/model/password_reset_request_response.dart';
import 'package:metrdotel/shared/error/failure.dart';

abstract class IPasswordResetService {
  Future<Either<Failure, PasswordResetRequestResponse>>
      sendPasswordResetRequest({@required PasswordResetRequest passwordResetRequest});
}
