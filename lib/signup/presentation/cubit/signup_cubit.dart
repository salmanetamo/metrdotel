import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:metrdotel/core/auth/i_auth_service.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/shared/state/state_utils.dart';
import 'package:metrdotel/signup/domain/models/signup_request.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final IAuthService _authService;

  SignupCubit(this._authService)
      : super(SignupState(
          email: null,
          password: null,
          firstName: null,
          lastName: null,
          confirmPassword: null,
          acceptedTermsAndConditions: null,
          message: null,
          status: null,
          failure: null,
        ));

  Future<void> signupWithCredentials({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required bool acceptedTermsAndConditions,
  }) async {
    if (acceptedTermsAndConditions == null || !acceptedTermsAndConditions) {
      emit(
        this.state.copyWith(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
              confirmPassword: confirmPassword,
              message: 'Please accept the Terms and Conditions',
              status: StateStatus.FAILURE,
            ),
      );
    } else {
      emit(
        this
            .state
            .copyWith(message: 'Loading', status: StateStatus.IN_PROGRESS),
      );

      var signupResponse = await this._authService.signupWithCredentials(
            signupRequest: SignupRequest(
                firstName: state.firstName,
                lastName: state.lastName,
                email: state.email,
                password: state.password,
                confirmPassword: state.confirmPassword),
          );
      signupResponse.fold(
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

  void acceptTermsAndConditions(bool acceptedTermsAndConditions) {
    emit(
      this.state.copyWith(
            status: StateStatus.INITIAL,
            acceptedTermsAndConditions: acceptedTermsAndConditions,
          ),
    );
  }
}
