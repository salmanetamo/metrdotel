import 'package:flutter/material.dart';
import 'package:metrdotel/signup/ui/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: SignupForm(),
          ),
        ),
      ),
    );
  }
}