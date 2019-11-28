import 'package:agenda/utils/database.helper.dart';
import 'package:flutter/material.dart';
import 'package:agenda/routes.dart';
import 'package:agenda/theme.dart';
import 'package:agenda/models/event.model.dart';

void main() async {
  var db = new DatabaseHelper();

  // Add Event
  int savedUser = await db.saveEvent(new Event("Otro", "2019/12/21", "20:00:00", "Cena navideña con toda la familia", "Pendiente"));

  print('Event Sabed: $savedUser');

  // Get Events
  List _events = await db.getAllEvents();
  for(int i = 0; i < _events.length; i++){
    Event event = Event.map(_events[i]);

    print("Event: $event.desc");
  }

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