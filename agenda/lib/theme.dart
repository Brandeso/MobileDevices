import 'package:flutter/material.dart';

final ThemeData demoTheme = _buildTheme();

ThemeData _buildTheme() {
  final ThemeData base = new ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Roboto'
  );
  return base.copyWith(
    primaryColor: Color.fromRGBO(90, 42, 130, 1),
    accentColor: Color.fromRGBO(152, 81, 170, 1),
  );
}