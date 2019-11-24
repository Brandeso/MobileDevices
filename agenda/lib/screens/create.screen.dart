import 'package:flutter/material.dart';
import 'package:agenda/routes.dart';

class CreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {

          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}