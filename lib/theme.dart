import 'package:flutter/material.dart';

final theme = ThemeData(
    primaryColor: primaryColor,
    backgroundColor: Colors.white,
    textTheme: const TextTheme(
      subtitle1: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600),
      subtitle2: TextStyle(
          color: primaryColor,
          fontSize: 14,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600),
      bodyText1: TextStyle(
        color: Colors.grey,
        fontSize: 14,
        fontStyle: FontStyle.normal,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontStyle: FontStyle.normal,
      ),
    ));
const heightSpace20 = SizedBox(
  height: 20,
);

const secondayColor = Color(0xFFAF0917);
const primaryColor = Color(0xFFE43228);
