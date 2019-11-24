import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {},),
        title: Text('Agenda'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: 400,
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              RaisedButton(
                shape: StadiumBorder(),
                splashColor: Colors.orange,
                color: Theme.of(context).primaryColor,
                onPressed: () => { Navigator.pushNamed(context, '/create') },
                child: Text('Crear Evento', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 50),
              ButtonTheme(
                minWidth: 200.0,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("test"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

