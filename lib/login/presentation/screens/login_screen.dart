import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/injection/injection.dart';
import 'package:metrdotel/login/presentation/cubit/login_cubit.dart';
import 'package:metrdotel/login/presentation/screens/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}
