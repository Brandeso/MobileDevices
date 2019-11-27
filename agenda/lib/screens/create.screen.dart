import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreen createState() => new _CreateScreen();
}

class _CreateScreen extends State<CreateScreen> {
  List<String> _categories = ['Cita', 'Junta', 'Proyecto', 'Examen', 'Otro'];
  String _selectedCategory;

  String _date = "2019 - 1 - 1";
  String _time = "00 : 00 : 00";

  String _description = "";
  void _onChange(String value) {
    setState(() {
      _description = value;
    });
  }

  List<String> _status = ['Pendiente', 'Realizado', 'Aplazado'];
  String _selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Evento'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 25,),
                Text('Categorìa:'),
                DropdownButton(
                  isExpanded: true,
                  hint: Text('Categoría'),
                  value: _selectedCategory,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  items: _categories.map((category) {
                    return DropdownMenuItem(
                      child: new Text(category),
                      value: category,
                    );
                  }).toList(),
                ),
                SizedBox(height: 15,),
                Text('Fecha: $_date / $_time'),
                SizedBox(height: 10,),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                    onPressed: () {
                      DatePicker.showDatePicker(
                        context,
                        theme: DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true,
                        minTime: DateTime(2019, 1, 1),
                        maxTime: DateTime(2030, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          _date = '${date.year} - ${date.month} - ${date.day}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en
                      );
                    },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.date_range,
                                    size: 18.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    " $_date",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          "  Cambiar",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
                SizedBox(height: 10,),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  onPressed: () {
                    DatePicker.showTimePicker(context,
                        theme: DatePickerTheme(
                          containerHeight: 210.0,
                        ),
                        showTitleActions: true, onConfirm: (time) {
                          print('confirm $time');
                          _time = '${time.hour} : ${time.minute} : ${time.second}';
                          setState(() {});
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                    setState(() {});
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.access_time,
                                    size: 18.0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Text(
                                    " $_time",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text(
                          "  Cambiar",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
                SizedBox(height: 15,),
                Text('Descripción: $_description'),
                TextField(
                  onChanged: _onChange,
                ),
                SizedBox(height: 15,),
                Text('Estado: '),
                DropdownButton(
                  isExpanded: true,
                  hint: Text('Estado'),
                  value: _selectedStatus,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedStatus = newValue;
                    });
                  },
                  items: _status.map((status) {
                    return DropdownMenuItem(
                      child: new Text(status),
                      value: status,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}