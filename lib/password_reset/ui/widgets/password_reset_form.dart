import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/routes/functions.dart';
import 'package:metrdotel/password_reset/state/password_reset_cubit.dart';
import 'package:metrdotel/shared/error/validators.dart';
import 'package:metrdotel/shared/state/state_utils.dart';
import 'package:metrdotel/shared/widgets/form_inputs.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class PasswordResetForm extends StatefulWidget {
  @override
  _PasswordResetFormState createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PasswordResetCubit, PasswordResetState>(
      listener: (context, state) {
        if (state.status == StateStatus.FAILURE) {
          showErrorSnackBar(context, state.message, Duration(seconds: 5));
        } else if (state.status == StateStatus.SUCCESS) {
          showErrorSnackBar(context, state.message, Duration(seconds: 5));
          Future.delayed(
            Duration(seconds: 5),
            () {
              navigateToLoginScreen(context);
            },
          );
        }
      },
      builder: (context, state) {
        switch (state.status) {
          case StateStatus.IN_PROGRESS:
            return showLoadingSpinner(context);
          default:
            this._emailController.text = state.email;
            return this._form(state);
        }
      },
    );
  }

  Form _form(PasswordResetState state) {
    final isFailure =
        state.status == StateStatus.FAILURE && state.failure != null;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'Please enter your email address to request password reset',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(
                  height: 32.0,
                ),
                textInput(
                  context,
                  key: GlobalKey<FormFieldState>(),
                  hintText: 'Email',
                  labelText: 'Email',
                  // initialValue: state.email ?? null, TODO: Update
                  validator: (value) {
                    String validateBlankEmail =
                        validateEmptyValue(value, 'email');
                    if (validateBlankEmail != null) {
                      return validateBlankEmail;
                    }

                    String emailValidation = validateEmail(value);
                    if (emailValidation != null) {
                      return emailValidation;
                    }
                    return null;
                  },
                  controller: this._emailController,
                  errorText: isFailure
                      ? state.failure.containsErrorForField('email')
                          ? state.failure
                              .getErrorsForField('email')
                              .map((e) => e.message)
                              .toList()
                              .join("\n")
                          : null
                      : null,
                  errorMaxLines: isFailure
                      ? state.failure.getErrorsForField('email').length
                      : null,
                ),
              ],
            ),
          ),
          Column(
            children: [
              button(
                context,
                'Send new password',
                onPressed: _onSubmit,
              ),
              SizedBox(
                height: 8.0,
              ),
              button(
                context,
                'Cancel',
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onSubmit() {
    if (this._formKey.currentState.validate()) {
      final passwordResetCubitCubit = context.read<PasswordResetCubit>();

      passwordResetCubitCubit.sendPasswordResetRequest(
        email: this._emailController.text,
      );
    }
  }
}
