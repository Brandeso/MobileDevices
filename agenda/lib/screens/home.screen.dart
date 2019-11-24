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
              ButtonTheme(
                minWidth: double.infinity,
                height: 50.0,
                child: RaisedButton(
                  shape: StadiumBorder(),
                  splashColor: Theme.of(context).accentColor,
                  color: Theme.of(context).primaryColor,
                  onPressed: () => { Navigator.pushNamed(context, '/create') },
                  child: Text("Crear Evento", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 50),
              ButtonTheme(
                minWidth: double.infinity,
                height: 50.0,
                child: RaisedButton(
                  shape: StadiumBorder(),
                  splashColor: Theme.of(context).accentColor,
                  color: Theme.of(context).primaryColor,
                  onPressed: () => { Navigator.pushNamed(context, '/view') },
                  child: Text("Ver Eventos", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

