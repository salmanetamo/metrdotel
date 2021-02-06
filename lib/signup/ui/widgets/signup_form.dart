import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/routes/functions.dart';
import 'package:metrdotel/shared/error/validators.dart';
import 'package:metrdotel/shared/state/state_utils.dart';
import 'package:metrdotel/shared/widgets/form_inputs.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';
import 'package:metrdotel/signup/state/signup_cubit.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  var _passwordKey = GlobalKey<FormFieldState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
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
          showErrorSnackBar(context, state.message, Duration(seconds: 5));
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
            this._firstNameController.text = state.firstName;
            this._lastNameController.text = state.lastName;
            this._emailController.text = state.email;
            this._passwordController.text = state.password;
            this._confirmPasswordController.text = state.confirmPassword;
            return this._form(state);
        }
      },
    );
  }

  Form _form(SignupState state) {
    final isFailure =
        state.status == StateStatus.FAILURE && state.failure != null;

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
                  height: 32.0,
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
            height: 24.0,
          ),
          textInput(
            context,
            key: GlobalKey<FormFieldState>(),
            hintText: 'First name',
            labelText: 'First name',
            validator: (value) {
              String validateBlankFirstName =
                  validateEmptyValue(value, 'first name');
              if (validateBlankFirstName != null) {
                return validateBlankFirstName;
              }
              return null;
            },
            controller: this._firstNameController,
            errorText: isFailure
                ? state.failure.containsErrorForField('firstName')
                    ? state.failure
                        .getErrorsForField('firstName')
                        .map((e) => e.message)
                        .toList()
                        .join("\n")
                    : null
                : null,
            errorMaxLines: isFailure
                ? state.failure.getErrorsForField('firstName').length
                : null,
          ),
          SizedBox(
            height: 8.0,
          ),
          textInput(
            context,
            key: GlobalKey<FormFieldState>(),
            hintText: 'Last name',
            labelText: 'Last name',
            validator: (value) {
              String validateBlankLastName =
                  validateEmptyValue(value, 'last name');
              if (validateBlankLastName != null) {
                return validateBlankLastName;
              }
              return null;
            },
            controller: this._lastNameController,
            errorText: isFailure
                ? state.failure.containsErrorForField('lastName')
                    ? state.failure
                        .getErrorsForField('lastName')
                        .map((e) => e.message)
                        .toList()
                        .join("\n")
                    : null
                : null,
            errorMaxLines: isFailure
                ? state.failure.getErrorsForField('lastName').length
                : null,
          ),
          SizedBox(
            height: 16.0,
          ),
          textInput(
            context,
            key: GlobalKey<FormFieldState>(),
            hintText: 'Email',
            labelText: 'Email',
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
          SizedBox(
            height: 8.0,
          ),
          textInput(
            context,
            key: this._passwordKey,
            hintText: 'Password',
            labelText: 'Password',
            validator: (value) {
              String validateBlankPassword =
                  validateEmptyValue(value, 'password');
              if (validateBlankPassword != null) {
                return validateBlankPassword;
              }

              String validateMinSizePassword =
                  validateMinSize(value, 'password', 8);
              if (validateMinSizePassword != null) {
                return validateMinSizePassword;
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
            errorText: isFailure
                ? state.failure.containsErrorForField('password')
                    ? state.failure
                        .getErrorsForField('password')
                        .map((e) => e.message)
                        .toList()
                        .join("\n")
                    : null
                : null,
            errorMaxLines: isFailure
                ? state.failure.getErrorsForField('password').length
                : null,
          ),
          SizedBox(
            height: 8.0,
          ),
          textInput(
            context,
            key: GlobalKey<FormFieldState>(),
            hintText: 'Confirm password',
            labelText: 'Confirm password',
            validator: (value) {
              String validateBlankPassword =
                  validateEmptyValue(value, 'password confirmation');
              if (validateBlankPassword != null) {
                return validateBlankPassword;
              }

              String password = this._passwordKey.currentState.value;
              if (password != this._confirmPasswordController.text) {
                return 'Confirmation password does not match password';
              }

              return null;
            },
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: this._showConfirmPassword
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  this._confirmPasswordFocusNode.unfocus();
                  this._confirmPasswordFocusNode.canRequestFocus = false;
                  this._showConfirmPassword = !this._showConfirmPassword;
                  Future.delayed(
                    Duration(milliseconds: 100),
                    () {
                      this._confirmPasswordFocusNode.canRequestFocus = true;
                    },
                  );
                });
              },
            ),
            obscureText: !this._showConfirmPassword,
            controller: this._confirmPasswordController,
            focusNode: this._confirmPasswordFocusNode,
            errorText: isFailure
                ? state.failure.containsErrorForField('confirmPassword')
                    ? state.failure
                        .getErrorsForField('confirmPassword')
                        .map((e) => e.message)
                        .toList()
                        .join("\n")
                    : null
                : null,
            errorMaxLines: isFailure
                ? state.failure.getErrorsForField('confirmPassword').length
                : null,
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
                  this._onSubmit();
                  if (this._formKey.currentState.validate()) {
                    navigateToTermsOfUseScreen(context);
                  }
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
        firstName: this._firstNameController.text,
        lastName: this._lastNameController.text,
        email: this._emailController.text,
        password: this._passwordController.text,
        confirmPassword: this._confirmPasswordController.text,
        acceptedTermsAndConditions: this._acceptedTermsAndConditions,
      );
    }
  }
}
