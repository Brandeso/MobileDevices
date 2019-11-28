import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  @override
  _viewState createState() => new _viewState();
}

class _viewState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Consultar Eventos'),
        ),
        body: SingleChildScrollView(
        ),
      ),
    );
  }
}