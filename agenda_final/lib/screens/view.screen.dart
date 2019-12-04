import 'package:flutter/material.dart';
import 'package:agenda/models/event.model.dart';
import 'package:agenda/utils/database.helper.dart';

class ViewScreen extends StatefulWidget {
  @override
  _viewState createState() => new _viewState();
}
class _viewState extends State<ViewScreen> {
  List _events;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Consultar Eventos'),
        ),
        body: _buildBody(),
      )
    );
  }

  Widget _buildBody()  {
    _getEvents();
    return new ListView.builder(
      itemCount: _events.length,
      itemBuilder: (_, int position) {
        return new Card(
          color: Colors.white,
          elevation: 2.0,
          child: new ListTile(
            leading: new CircleAvatar(
              child: Event.fromMap(_events[position]).Category == null ? Text("") : Text("${Event.fromMap(_events[position]).Category.substring(0,1)}"),
            ),
            title: new Text("Categoria: ${Event.fromMap(_events[position]).Category}\nFecha: ${Event.fromMap(_events[position]).Date}"),
            subtitle: new Text("Estado: ${Event.fromMap(_events[position]).Status}\nContacto: ${Event.fromMap(_events[position]).Contact} \nDescripción: ${Event.fromMap(_events[position]).Desc}"),
            trailing: Tooltip(
                message: "Editar Evento",
                child: RawMaterialButton(
                  constraints: const BoxConstraints(
                    minWidth: 40.0, minHeight: 40.0,
                  ),
                  onPressed: () => {},
                  child: Icon(Icons.create, color: Theme.of(context).primaryColorLight),
                  elevation: 0.5,
                  shape: CircleBorder(),
                ),
              )
          )
        );
      },
    );
  }

  void _getEvents() async {
    var db = new DatabaseHelper();

    // Get Events
    List events =  await db.getAllEvents();
    setState(() {
      _events = events;
    });
  }
}
