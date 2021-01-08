import 'package:flutter/material.dart';
import 'package:metrdotel/shared/widgets/form_inputs.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool showPassword = true;
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
            validator: (value) {
              if (value.isEmpty) return 'Enter good email';
              return null;
            },
          ),
          SizedBox(
            height: 16.0,
          ),
          textInput(
            context,
            key: GlobalKey<FormFieldState>(),
            hintText: 'Password',
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye,
                color: !showPassword
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
              ),
              onPressed: () {},
            ),
            obscureText: showPassword,
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
            onPressed: () {},
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
}
