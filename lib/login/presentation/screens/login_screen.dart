import 'package:flutter/material.dart';
import 'package:metrdotel/login/presentation/screens/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: LoginForm(),
        ),
      ),
    );
  }
}
