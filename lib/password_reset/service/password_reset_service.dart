import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:metrdotel/password_reset/model/password_reset_request.dart';
import 'package:metrdotel/password_reset/model/password_reset_request_response.dart';
import 'package:metrdotel/password_reset/service/i_password_reset_service.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/shared/error/api_error/api_error.dart';
import 'package:metrdotel/core/http/http_utils.dart';
import 'package:http/http.dart' as http;

@Injectable(as: IPasswordResetService)
class PasswordResetService implements IPasswordResetService {
  final Logger _logger;
  final http.Client _httpClient;

  PasswordResetService(this._logger, this._httpClient);

  @override
  Future<Either<Failure, PasswordResetRequestResponse>> sendPasswordResetRequest({PasswordResetRequest passwordResetRequest}) async {
    final url = "auth/request-password-reset";

    this._logger.i("Sending password reset request");

    var response = await this._httpClient.get(
      getHttpUri(endpoint: url, queryParameters: {'email': passwordResetRequest.email}),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      this._logger.i("Success!");
      return right(PasswordResetRequestResponse(message: response.body));
    } else {
      this._logger.e("Something went wrong while sending password reset request");
      Map responseMap = jsonDecode(response.body);
      return left(Failure(
        message: null,
        error: ApiError.fromJson(responseMap['apierror']),
      ));
    }
  }

}