import 'package:flutter/material.dart';

FlatButton button(BuildContext context, String text,
    {Color color = Colors.black, Function onPressed, bool disabled}) {
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
            ))
          : OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(16.0),
              ),
              borderSide: BorderSide(
                  color: Color(0xFFEDEDED), style: BorderStyle.solid)),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      minWidth: 144.0,
      color: color,
      disabledColor: color != Colors.white ? Color(0xFF7E7E7E) : Colors.white,
      highlightColor: Colors.black,
      splashColor: Colors.black);
}
