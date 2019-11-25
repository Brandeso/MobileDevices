import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreen createState() => new _CreateScreen();
}

class _CreateScreen extends State<CreateScreen> {
  List<String> _locations = ['Cita', 'Junta', 'Proyecto', 'Examen', 'Otro'];
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Evento'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 400,
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              new Text('Categoría'),
              DropdownButton(
                hint: Text('Categoría'),
                value: _selectedLocation,
                onChanged: (newValue) {
                  setState(() {
                    _selectedLocation = newValue;
                  });
                },
                items: _locations.map((location) {
                  return DropdownMenuItem(
                    child: new Text(location),
                    value: location,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}