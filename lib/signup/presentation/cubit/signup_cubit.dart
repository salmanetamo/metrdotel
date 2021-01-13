import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:metrdotel/shared/state/state_utils.dart';

part 'signup_state.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
      : super(SignupState(
          email: null,
          password: null,
          confirmPassword: null,
          acceptedTermsAndConditions: null,
          message: null,
          status: null,
        ));

  Future<void> signupWithCredentials({
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required bool acceptedTermsAndConditions,
  }) async {
    if (acceptedTermsAndConditions == null || !acceptedTermsAndConditions) {
      emit(
        this.state.copyWith(
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            message: 'Please accept the Terms and Conditions',
            status: StateStatus.FAILURE),
      );
    } else {
      emit(
        this
            .state
            .copyWith(message: 'Loading', status: StateStatus.IN_PROGRESS),
      );
      await Future.delayed(Duration(seconds: 5));
      emit(this.state.copyWith(status: StateStatus.SUCCESS));
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
