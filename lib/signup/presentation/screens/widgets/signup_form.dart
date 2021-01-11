import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/routes/functions.dart';
import 'package:metrdotel/signup/presentation/cubit/signup_cubit.dart';
import 'package:metrdotel/shared/error/validators.dart';
import 'package:metrdotel/shared/state/state_utils.dart';
import 'package:metrdotel/shared/widgets/form_inputs.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  bool _showPassword = false;
  bool _showConfirmPassword = false;
  bool _acceptedTermsAndConditions;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == StateStatus.FAILURE)
          showErrorSnackBar(context, state.message);
        else if (state.status == StateStatus.SUCCESS)
          navigateToHomeScreen(context);
      },
      builder: (context, state) {
        this._acceptedTermsAndConditions = state.acceptedTermsAndConditions;
        switch (state.status) {
          case StateStatus.IN_PROGRESS:
            return showLoadingSpinner(context);
          case StateStatus.SUCCESS:
            return Container();
          default:
            return this
                ._form(state.email, state.password, state.confirmPassword);
        }
      },
    );
  }

  Form _form(String email, String password, String confirmPassword) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 48.0,
                ),
                Text(
                  'Create a new',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'account',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
          textInput(
            context,
            key: GlobalKey<FormFieldState>(),
            hintText: 'Email',
            labelText: 'Email',
            initialValue: email ?? null,
            validator: (value) {
              String validateBlankEmail = validateEmptyValue(value, 'email');
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
          ),
          SizedBox(
            height: 16.0,
          ),
          textInput(
            context,
            key: GlobalKey<FormFieldState>(),
            hintText: 'Password',
            labelText: 'Password',
            initialValue: password ?? null,
            validator: (value) {
              String validateBlankPassword =
                  validateEmptyValue(value, 'password');
              if (validateBlankPassword != null) {
                return validateBlankPassword;
              }

              return null;
            },
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: this._showPassword
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  this._passwordFocusNode.unfocus();
                  this._passwordFocusNode.canRequestFocus = false;
                  this._showPassword = !this._showPassword;
                  Future.delayed(
                    Duration(milliseconds: 100),
                    () {
                      this._passwordFocusNode.canRequestFocus = true;
                    },
                  );
                });
              },
            ),
            obscureText: !this._showPassword,
            controller: this._passwordController,
            focusNode: this._passwordFocusNode,
          ),
          SizedBox(
            height: 16.0,
          ),
          textInput(
            context,
            key: GlobalKey<FormFieldState>(),
            hintText: 'Confirm password',
            labelText: 'Confirm password',
            initialValue: confirmPassword ?? null,
            validator: (value) {
              String validateBlankPassword =
                  validateEmptyValue(value, 'password confirmation');
              if (validateBlankPassword != null) {
                return validateBlankPassword;
              }

              return null;
            },
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: this._showPassword
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  this._passwordFocusNode.unfocus();
                  this._passwordFocusNode.canRequestFocus = false;
                  this._showPassword = !this._showPassword;
                  Future.delayed(
                    Duration(milliseconds: 100),
                    () {
                      this._passwordFocusNode.canRequestFocus = true;
                    },
                  );
                });
              },
            ),
            obscureText: !this._showConfirmPassword,
            controller: this._confirmPasswordController,
            focusNode: this._confirmPasswordFocusNode,
          ),
          SizedBox(
            height: 16.0,
          ),
          button(
            context,
            'Register now',
            onPressed: _onSubmit,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              buttonLink(
                context,
                'Sign in',
                onPressed: () {
                  navigateToLoginScreen(context);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('By registering I agree to the '),
              buttonLink(
                context,
                'Terms of Use',
                onPressed: () {
                  navigateToTermsOfUseScreen(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 32.0,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 2.0,
                  endIndent: 8.0,
                ),
              ),
              Text('Or sign up with'),
              Expanded(
                child: Divider(
                  thickness: 2.0,
                  indent: 8.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              facebookButton(() {}),
              googleButton(() {}),
            ],
          )
        ],
      ),
    );
  }

  void _onSubmit() {
    if (this._formKey.currentState.validate()) {
      final signupCubit = context.read<SignupCubit>();

      signupCubit.signupWithCredentials(
        email: this._emailController.text,
        password: this._passwordController.text,
        confirmPassword: this._confirmPasswordController.text,
        acceptedTermsAndConditions: this._acceptedTermsAndConditions,
      );
    }
  }
}
