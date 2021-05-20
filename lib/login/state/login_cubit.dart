import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart';
import 'package:metrdotel/core/auth/service/i_auth_service.dart';
import 'package:metrdotel/login/model/login_request.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/shared/state/state_utils.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final IAuthService _authService;

  LoginCubit(this._authService)
      : super(LoginState(
          email: null,
          password: null,
          message: null,
          status: null,
          failure: null,
        ));

  Future<void> loginWithCredentials({
    required String email,
    required String password,
  }) async {
    emit(
      this.state.copyWith(
            email: email,
            password: password,
            message: 'Loading',
            status: StateStatus.IN_PROGRESS,
          ),
    );

    var loginResponse = await this._authService.loginWithCredentials(
          loginRequest: LoginRequest(
            email: state.email,
            password: state.password,
          ),
        );

    loginResponse.fold(
      (failure) => emit(
        this.state.copyWith(
              status: StateStatus.FAILURE,
              message: failure.message,
              failure: failure,
            ),
      ),
      (authResponse) => emit(
        this.state.copyWith(
              status: StateStatus.SUCCESS,
              message: authResponse.message,
            ),
      ),
    );
  }
}
