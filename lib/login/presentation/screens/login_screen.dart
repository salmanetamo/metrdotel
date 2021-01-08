import 'package:flutter/material.dart';
import 'package:metrdotel/shared/widgets/form_inputs.dart';
import 'package:metrdotel/shared/widgets/ui_components.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Container(child: LoginForm()),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    bool showPassword = true;
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              textInput(
                
                context, key: GlobalKey<FormFieldState>(), hintText: 'Email', labelText: 'Email',
                  validator: (value) {
                if (value.isEmpty) return 'Enter good email';
                return null;
                // return value == 'yo@email.com' ? null : 'Bad email entered!';
              }),
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
                  obscureText: showPassword),
              textInput(
                context,
                key: GlobalKey<FormFieldState>(),
                readOnly: true,
                initialValue: 'I am disabled'
              ),
              switchInput(context, isSwitched, (bool value){
                setState(() {
              isSwitched=value;
            });
              }),
              textInput(
                context,
                key: GlobalKey<FormFieldState>(),
                maxLines: 8,
                hintText: 'Say something...',
                  labelText: 'Text area',
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     // Validate returns true if the form is valid, otherwise false.
              //     if (_formKey.currentState.validate()) {
              //       // If the form is valid, display a snackbar. In the real world,
              //       // you'd often call a server or save the information in a database.

              //       Scaffold.of(context).showSnackBar(
              //           SnackBar(content: Text('Processing Data')));
              //     }
              //   },
              //   child: Text('Submit'),
              // ),
              button(context, 'Normal',),
              button(context, 'Normal', onPressed: (){}),
              button(context, 'Normal', color: Theme.of(context).primaryColor, onPressed: (){}),
              button(context, 'Normal', color: Colors.white, onPressed: (){}),
              button(context, 'Normal', color: Colors.white)
            ]));
  }
}
