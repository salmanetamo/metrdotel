import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:metrdotel/core/auth/model/auth_response.dart';
import 'package:metrdotel/core/auth/service/i_auth_service.dart';
import 'package:metrdotel/core/http/http_utils.dart';
import 'package:metrdotel/core/storage/i_storage.dart';
import 'package:metrdotel/login/model/login_request.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/shared/error/api_error/api_error.dart';
import 'package:metrdotel/signup/model/signup_request.dart';

@Injectable(as: IAuthService)
class AuthService implements IAuthService {
  final IStorage _storage;
  final Logger _logger;
  final http.Client _httpClient;

  AuthService(this._storage, this._logger, this._httpClient);

  @override
  Future<String>? getToken() {
    return this._storage.get(key: 'token') as Future<String>;
  }

  @override
  Future<bool> isLoggedIn() {
    return this._storage.get(key: 'loggedIn') as Future<bool>;
  }

  @override
  Future<Either<Failure, AuthResponse>> loginWithCredentials({
    required LoginRequest loginRequest,
  }) async {
    final url = "auth/login";

    this._logger.i("Sending login request");

    var response = await this._httpClient.post(
      getHttpUri(endpoint: url),
      body: loginRequest.toJson().encode(),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      this._logger.i("token is ${response.body}");
      this._storage.set(key: 'token', value: response.body);
      return right(AuthResponse(message: 'Success!'));
    } else {
      this._logger.e("Something went wrong while logging user in");
      Map responseMap = jsonDecode(response.body);
      return left(Failure(
        message: null,
        error: ApiError.fromJson(responseMap['apierror']),
      ));
    }
  }

  @override
  Future<void> logout() {
    return this._storage.remove(key: 'token');
  }

  @override
  Future<Either<Failure, AuthResponse>> refreshToken() async {
    final email = await this._storage.get(key: 'email');
    final password = await this._storage.get(key: 'password');

    return this.loginWithCredentials(
      loginRequest: LoginRequest(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, AuthResponse>> signupWithCredentials({
    required SignupRequest signupRequest,
  }) async {
    final url = "auth/signup";

    this._logger.i("Sending registration request");

    var response = await this._httpClient.post(
      getHttpUri(endpoint: url),
      body: signupRequest.toJson().encode(),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 201) {
      this._logger.i("token is ${response.body}");
      this._storage.set(key: 'token', value: response.body);
      return right(AuthResponse(message: 'Success! Welcome to Metrdotel'));
    } else {
      this._logger.e("Something went wrong while registering user");
      Map responseMap = jsonDecode(response.body);
      return left(Failure(
        message: null,
        error: ApiError.fromJson(responseMap['apierror']),
      ));
    }
  }
}
