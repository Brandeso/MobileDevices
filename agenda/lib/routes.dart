import 'package:flutter/material.dart';
import 'package:agenda/screens/home.screen.dart';
import 'package:agenda/screens/create.screen.dart';
import 'package:agenda/screens/view.screen.dart';

class Routes {
  static get() {
    return <String, WidgetBuilder> {
      '/home' : (BuildContext context) => new HomeScreen(),
      '/create' : (BuildContext context) => new CreateScreen(),
      '/view' : (BuildContext context) => new ViewScreen(),
    };
  }

  static getHome() {
    return new HomeScreen();
  }
}