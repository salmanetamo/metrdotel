part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final StateStatus status;

  const LoginState({
    @required this.email,
    @required this.password,
    @required this.message,
    @required this.status,
  });

  LoginState copyWith(
      {String email, String password, String message, StateStatus status}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        this.email,
        this.password,
        this.message,
        this.status,
      ];
}
