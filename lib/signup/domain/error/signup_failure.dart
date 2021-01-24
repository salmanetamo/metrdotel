import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class SignupFailure extends Equatable {
  final String failure;

  const SignupFailure({@required this.failure});

  @override
  List<Object> get props => [this.failure];
}