import 'package:flutter/material.dart';

TextFormField textInput(
  BuildContext context, {
  String hintText = '',
  String labelText = '',
  Widget suffixIcon,
  bool obscureText = false,
  Function validator,
  GlobalKey<FormFieldState> key,
  TextEditingController controller,
  bool readOnly = false,
  String initialValue,
  int maxLines = 1,
}) {
  return TextFormField(
    key: key,
    controller: controller,
    style: !readOnly
        ? Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16)
        : Theme.of(context).textTheme.overline.copyWith(fontSize: 14),
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: Theme.of(context).textTheme.overline,
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.overline,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(16.0),
        ),
        borderSide:
            BorderSide(color: Color(0xFFffffff), style: BorderStyle.solid),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(16.0),
        ),
        borderSide: BorderSide(color: Colors.red, style: BorderStyle.solid),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(16.0),
        ),
        borderSide:
            BorderSide(color: Color(0xFFEDEDED), style: BorderStyle.solid),
      ),
      enabled: !readOnly,
      filled: true,
      fillColor: readOnly ? Color(0xFFEDEDED) : Color(0xFFF9F9F9),
      suffixIcon: suffixIcon ?? null,
    ),
    obscureText: obscureText,
    validator: validator,
    readOnly: readOnly,
    initialValue: initialValue ?? null,
    maxLines: maxLines,
  );
}

Switch switchInput(BuildContext context, bool value, Function onChanged) =>
    Switch(
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).primaryColor,
    );
