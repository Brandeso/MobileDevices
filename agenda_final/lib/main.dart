import 'package:flutter/material.dart';
import 'package:agenda/routes.dart';
import 'package:agenda/theme.dart';

void main() {
  runApp(new DemoApp());
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: demoTheme,
        routes: Routes.get(),
        home: Routes.getHome()
    );
  }
}