import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/injection/injection.dart';
import 'package:metrdotel/password_reset/state/password_reset_cubit.dart';
import 'package:metrdotel/password_reset/ui/widgets/password_reset_form.dart';

class PasswordResetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<PasswordResetCubit>(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: PasswordResetForm(),
          ),
        ),
      ),
    );
  }
}
