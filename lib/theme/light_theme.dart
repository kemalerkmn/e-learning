import 'package:flutter/material.dart';

class LightTheme {
  late ThemeData theme;
  LightTheme() {
    theme = ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        centerTitle: true,
      ),
      scaffoldBackgroundColor: Colors.white,
      // ignore: prefer_const_constructors
      textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0)),
            bodyText2: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0)),
            subtitle1: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 255, 255, 255)),
            subtitle2: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(120, 116, 109, 1)),
            headline2: const TextStyle(
                fontSize: 40, fontWeight: FontWeight.w500, color: Colors.black),
            headline4: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            headline5: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.normal,
                color: Colors.black),
            headline6: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
          ),
    );
  }
}
