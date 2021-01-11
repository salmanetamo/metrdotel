import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:metrdotel/shared/state/state_utils.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState(
          email: null,
          password: null,
          message: null,
          status: null,
        ));

  Future<void> loginWithCredentials({@required String email, @required String password}) async {
    emit(
      this.state.copyWith(message: 'Loading', status: StateStatus.IN_PROGRESS),
    );
    await Future.delayed(Duration(seconds: 5));
    emit(this.state.copyWith(status: StateStatus.SUCCESS));
  }
}
