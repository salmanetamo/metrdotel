import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:metrdotel/shared/error/failure.dart';
import 'package:metrdotel/shared/state/state_utils.dart';

part 'password_reset_state.dart';

@injectable
class PasswordResetCubit extends Cubit<PasswordResetState> {
  PasswordResetCubit()
      : super(
          PasswordResetState(
            email: null,
            message: null,
            status: null,
            failure: null,
          ),
        );

  Future<void> sendPasswordResetRequest({@required String email}) async {
    emit(
      this.state.copyWith(
        email: email,
        message: 'Loading',
        status: StateStatus.IN_PROGRESS,
      ),
    );
  }
}
