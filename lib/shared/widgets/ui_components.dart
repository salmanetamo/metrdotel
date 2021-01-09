import 'package:flutter/material.dart';

FlatButton button(
  BuildContext context,
  String text, {
  Color color = Colors.black,
  Function onPressed,
  bool disabled,
}) {
  return FlatButton(
    child: Text(text),
    onPressed: onPressed ?? null,
    textColor: color == Colors.black ? Colors.white : Colors.black,
    disabledTextColor: color != Colors.white
        ? Colors.white.withOpacity(0.5)
        : Colors.black.withOpacity(0.25),
    shape: color != Colors.white
        ? RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(16.0),
            ),
          )
        : OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(16.0),
            ),
            borderSide: BorderSide(
              color: Color(0xFFEDEDED),
              style: BorderStyle.solid,
            ),
          ),
    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
    minWidth: double.infinity,
    color: color,
    disabledColor: color != Colors.white ? Color(0xFF7E7E7E) : Colors.white,
    highlightColor: Colors.black,
    splashColor: Colors.black,
  );
}

FlatButton buttonLink(BuildContext context, String text, {Function onPressed}) {
  return FlatButton(
    child: Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    textColor: Theme.of(context).primaryColor,
    disabledTextColor: Colors.black.withOpacity(0.25),
    onPressed: onPressed,
    padding: EdgeInsets.all(0.0),
  );
}

FlatButton facebookButton(Function onPressed) {
  return oAuthButton(
    'Facebook',
    'facebook_logo.png',
    Color(0xFF3b579d),
    Color(0xFF3b579d),
    Colors.white,
    onPressed,
  );
}

FlatButton googleButton(Function onPressed) {
  return oAuthButton(
    'Google',
    'google_logo.png',
    Colors.white,
    Color(0xFF7E7E7E),
    Colors.black,
    onPressed,
  );
}

FlatButton oAuthButton(
  String name,
  String logoImageName,
  Color fillColor,
  Color borderColor,
  Color textColor,
  Function onPressed,
) {
  return FlatButton(
    height: 48.0,
    minWidth: 144.0,
    child: Row(
      children: [
        Image.asset(
          'images/$logoImageName',
          height: 32.0,
          width: 32.0,
        ),
        SizedBox(
          width: 12.0,
        ),
        Text(name),
      ],
    ),
    shape: OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        const Radius.circular(16.0),
      ),
      borderSide: BorderSide(
        color: borderColor,
        style: BorderStyle.solid,
      ),
    ),
    textColor: textColor,
    color: fillColor,
    onPressed: onPressed,
  );
}

void showErrorSnackBar(BuildContext context, String message) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}

Widget showLoadingSpinner(BuildContext context) {
  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 350.0),
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    ),
  );
}
