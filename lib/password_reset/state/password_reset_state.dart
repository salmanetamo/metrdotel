part of 'password_reset_cubit.dart';

@immutable
class PasswordResetState extends Equatable {
  final String email;
  final String message;
  final StateStatus status;
  final Failure failure;

  PasswordResetState(
      {@required this.email,
      @required this.message,
      @required this.status,
      @required this.failure});

  PasswordResetState copyWith({
    String email,
    String password,
    String message,
    StateStatus status,
    Failure failure,
  }) {
    return PasswordResetState(
      email: email ?? this.email,
      message: message ?? this.message,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object> get props => [
        this.email,
        this.message,
        this.status,
        this.failure,
      ];

  @override
  String toString() {
    return '''{
      email: ${this.email},
      message: ${this.message},
      status: ${this.status},
      failure: ${this.failure}
    }
    ''';
  }
}
