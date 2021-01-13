part of 'signup_cubit.dart';

@immutable
class SignupState extends Equatable {
  final String email;
  final String password;
  final String confirmPassword;
  final bool acceptedTermsAndConditions;
  final String message;
  final StateStatus status;

  const SignupState({
    @required this.email,
    @required this.password,
    @required this.confirmPassword,
    @required this.acceptedTermsAndConditions,
    @required this.message,
    @required this.status,
  });

  SignupState copyWith(
      {String email,
      String password,
      String confirmPassword,
      bool acceptedTermsAndConditions,
      String message,
      StateStatus status}) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      acceptedTermsAndConditions:
          acceptedTermsAndConditions ?? this.acceptedTermsAndConditions,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        this.email,
        this.password,
        this.confirmPassword,
        this.acceptedTermsAndConditions,
        this.message,
        this.status,
      ];

  @override
  String toString() {
    return '{\n\temail: ${this.email},\n\tpassword: ${this.password},\n\tconfirmPassword: ${this.confirmPassword},\n\tacceptedTermsAndConditions: ${this.acceptedTermsAndConditions},\n\tmessage: ${this.message},\n\tstatus: ${this.status}\n}';
  }
}
