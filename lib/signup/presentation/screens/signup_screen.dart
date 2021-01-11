import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/injection/injection.dart';
import 'package:metrdotel/signup/presentation/cubit/signup_cubit.dart';
import 'package:metrdotel/signup/presentation/screens/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SignupForm(),
            ),
          ),
        ),
      ),
    );
  }
}