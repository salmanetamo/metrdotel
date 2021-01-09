import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:metrdotel/core/routes/functions.dart';
import 'package:metrdotel/login/presentation/cubit/login_cubit.dart';
import 'package:metrdotel/shared/error/validators.dart';
import 'package:metrdotel/shared/state/state_utils.dart';
import 'package:metrdotel/shared/widgets/form_inputs.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _passwordFocusNode = FocusNode();

  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == StateStatus.FAILURE)
          showErrorSnackBar(context, state.message);
        else if (state.status == StateStatus.SUCCESS)
          navigateToHomeScreen(context);
      },
      builder: (context, state) {
        switch (state.status) {
          case StateStatus.IN_PROGRESS:
            return showLoadingSpinner(context);
          case StateStatus.SUCCESS:
            return Container();
          default:
            return this._form(state.email, state.password);
        }
      },
    );
  }

  Form _form(String email, String password) {
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
                Container(
                  width: 72.0,
                  height: 72.0,
                  child: Image.asset(
                    'images/eating_with_chopsticks.png', // TODO: Replace with correct image
                    fit: BoxFit.fitHeight,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Welcome to',
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  'Metrdotel',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      .copyWith(color: Theme.of(context).primaryColor),
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
          Container(
            alignment: Alignment.bottomRight,
            width: double.infinity,
            child: buttonLink(
              context,
              'Forgot password?',
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          button(
            context,
            'Login',
            onPressed: _onSubmit,
          ),
          SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a member?'),
              buttonLink(
                context,
                'Join now',
                onPressed: () {},
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
              Text('Or sign in with'),
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
      // TODO: Send login event here
      // this._formKey.currentState.save();
      final loginCubit = context.read<LoginCubit>();

      loginCubit.loginWithCredentials();
    }
  }
}
