part of 'login_cubit.dart';

@immutable
class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final StateStatus status;
  final Failure failure;

  const LoginState({
    @required this.email,
    @required this.password,
    @required this.message,
    @required this.status,
    @required this.failure,
  });

  LoginState copyWith(
      {String email, String password, String message, StateStatus status, Failure failure,}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      message: message ?? this.message,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object> get props => [
        this.email,
        this.password,
        this.message,
        this.status,
        this.failure,
      ];

  @override
  String toString() {
    return '''{
      email: ${this.email},
      password: ${this.password},
      message: ${this.message},
      status: ${this.status},
      failure: ${this.failure}
    }
    ''';
  }
}
