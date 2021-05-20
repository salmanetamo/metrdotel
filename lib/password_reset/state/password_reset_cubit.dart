import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:metrdotel/password_reset/service/i_password_reset_service.dart';
import 'package:metrdotel/password_reset/model/password_reset_request.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/shared/state/state_utils.dart';

part 'password_reset_state.dart';

@injectable
class PasswordResetCubit extends Cubit<PasswordResetState> {
  final IPasswordResetService _passwordResetService;

  PasswordResetCubit(this._passwordResetService)
      : super(
          PasswordResetState(
            email: null,
            message: null,
            status: null,
            failure: null,
          ),
        );

  Future<void> sendPasswordResetRequest({required String email}) async {
    emit(
      this.state.copyWith(
            email: email,
            message: 'Loading',
            status: StateStatus.IN_PROGRESS,
          ),
    );

    var passwordResetResponse =
        await this._passwordResetService.sendPasswordResetRequest(
              passwordResetRequest: PasswordResetRequest(email: email),
            );

    passwordResetResponse.fold(
      (failure) => emit(
        this.state.copyWith(
              status: StateStatus.FAILURE,
              message: failure.message,
              failure: failure,
            ),
      ),
      (passwordResetRequestResponse) => emit(
        this.state.copyWith(
              status: StateStatus.SUCCESS,
              message: passwordResetRequestResponse.message,
            ),
      ),
    );
  }
}
