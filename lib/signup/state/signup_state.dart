part of 'signup_cubit.dart';

@immutable
class SignupState extends Equatable {
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? confirmPassword;
  final bool? acceptedTermsAndConditions;
  final String? message;
  final StateStatus? status;
  final Failure? failure;

  const SignupState({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.confirmPassword,
    required this.acceptedTermsAndConditions,
    required this.message,
    required this.status,
    required this.failure,
  });

  SignupState copyWith({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
    String? confirmPassword,
    bool? acceptedTermsAndConditions,
    String? message,
    StateStatus? status,
    Failure? failure,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      acceptedTermsAndConditions:
          acceptedTermsAndConditions ?? this.acceptedTermsAndConditions,
      message: message ?? this.message,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object> get props => [
        this.email as Object,
        this.password as Object,
        this.firstName as Object,
        this.lastName as Object,
        this.confirmPassword as Object,
        this.acceptedTermsAndConditions as Object,
        this.message as Object,
        this.status as Object,
        this.failure as Object,
      ];

  @override
  String toString() {
    return '{\n\tfirstName: ${this.firstName},\n\tlastName: ${this.lastName},\n\temail: ${this.email},\n\tpassword: ${this.password},\n\tconfirmPassword: ${this.confirmPassword},\n\tacceptedTermsAndConditions: ${this.acceptedTermsAndConditions},\n\tmessage: ${this.message},\n\tstatus: ${this.status},\n\tfailure: ${this.failure}\n}';
  }
}
