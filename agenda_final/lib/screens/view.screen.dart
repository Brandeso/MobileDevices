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
    @override
    initState() {
      super.initState();
      setState(() async {
        var db = new DatabaseHelper();
        _events = await db.getAllEvents();
      });
    }
    if(_events != null) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Consultar Eventos'),
          ),
          body: new ListView.builder(
            itemCount: _events.length,
            itemBuilder: (_, int position) {
              return new Card(
                color: Colors.white,
                elevation: 2.0,
                child: new ListTile(
                  leading: new CircleAvatar(
                    child: Text("${Event
                      .fromMap(_events[position])
                      .Category
                      .substring(0, 1)}"),
                  ),
                  title: new Text("Event: ${Event
                    .fromMap(_events[position])
                    .Desc}"),
                  subtitle: new Text("id : ${Event
                    .fromMap(_events[position])
                    .Id}\n Date & Time: ${Event
                    .fromMap(_events[position])
                    .Date} ${Event
                    .fromMap(_events[position])
                    .Time}\nStatus: ${Event
                    .fromMap(_events[position])
                    .Status}"),
                  onTap: () =>
                    debugPrint("${Event
                      .fromMap(_events[position])
                      .Status}"),
                ),
              );
            }
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Consultar Eventos'),
          ),
        )
      );
    }
  }
}