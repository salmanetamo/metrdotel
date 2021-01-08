import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.amber,
    primaryColor: Color.fromRGBO(254, 201, 45, 1),
    accentColor: Colors.black,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      headline1: TextStyle(
        fontFamily: 'Butler',
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: Colors.black,
        letterSpacing: 1,
      ),
      subtitle1: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5),
      ),
      overline: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: Colors.black.withOpacity(0.5),
      ),
    ),
  );
}
