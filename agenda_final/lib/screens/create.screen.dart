import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:agenda/models/event.model.dart';
import 'package:agenda/utils/database.helper.dart';
import 'package:agenda/utils/contact.helper.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreen createState() => new _CreateScreen();
}

class _CreateScreen extends State<CreateScreen> {
  List<String> _categories = ['Cita', 'Junta', 'Proyecto', 'Examen', 'Otro'];
  String _selectedCategory;

  List<String> _status = ['Pendiente', 'Realizado', 'Aplazado'];
  String _selectedStatus;

  String _date = "2019 - 1 - 1";
  String _time = "00 : 00 : 00";

  String _description = "";

  //Contacts
  Iterable<Contact> _contacts;
  Contact _actualContact;
  String _selectedContact = '';
  TextEditingController guestnameTextFieldController = TextEditingController();

  // Places
  String _selectedPlace = '';
  void _onChange(String value) {
    setState(() {
      _description = value;
    });
  }

  void _addEvent(Event event) async {
    var db = new DatabaseHelper();

    // Add Event
    int savedEvent = await db.saveEvent(event);
    if(savedEvent > 0) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success!'),
            content: Text("Evento agregado exitosamente"),
          )
      );
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text("El evento no pudo ser agregado"),
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Evento'),
      ),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            Padding(
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
                                ),
                              ],
                            ),
                            Text(
                              "  Cambiar",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0
                              ),
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
                                fontSize: 18.0
                              ),
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
                    SizedBox(height: 15,),
                    Text('Elija un contacto: $_selectedContact'),
                    SizedBox(height: 15,),
                    Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*.9,
                          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 0.0, bottom: 0.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]
                            ),
                            child: TextFormField(
                              controller: guestnameTextFieldController,
                              validator: (val) {
                                return val != '' ? null : 'Por favor ingrese un nombre';
                              },
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Nombre contacto',
                                prefixText: '     ',
                                suffixStyle: const TextStyle(color: Colors.green)
                              ),
                            )
                          ),
                        Positioned(
                          right: 10.0,
                          top: 3.0,
                          //alignment: Alignment.topRight,
                          child: Tooltip(
                            message: "Libreta de contactos",
                            child: _buildSelectContactButton(Icons.perm_contact_calendar, Colors.white)
                          )
                        ),
                      ],
                    ),
                    SizedBox(height: 15,),
                    ButtonTheme(
                      minWidth: double.infinity,
                      height: 50.0,
                      child: RaisedButton(
                        shape: StadiumBorder(),
                        splashColor: Theme.of(context).accentColor,
                        color: Theme.of(context).primaryColor,
                        onPressed: ()=>{_addEvent(new Event(_selectedCategory, _date, _time, _description, _selectedStatus, _selectedContact, _selectedPlace ))},
                        child: Text("Crear Evento", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }


  RawMaterialButton _buildSelectContactButton(IconData iconButton, Color colorButton) {
    return RawMaterialButton(
      constraints: const BoxConstraints(
          minWidth: 40.0, minHeight: 40.0
      ),
      onPressed: () => {
        _showContactList(context)
      },
      child: Icon(
        // Conditional expression:
        // show "favorite" icon or "favorite border" icon depending on widget.inFavorites:
        iconButton,
        color: Theme.of(context).primaryColorLight,
      ),
      elevation: 0.5,
      fillColor: colorButton,
      shape: CircleBorder(),
    );
  }

  // Getting list of contacts from AGENDA
  refreshContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      var contacts = await ContactsService.getContacts();
      setState(() {
        _contacts = contacts;
      });
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  // Asking Contact permissions
  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    if (permission != PermissionStatus.granted && permission != PermissionStatus.disabled) {
      Map<PermissionGroup, PermissionStatus> permissionStatus = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);
      return permissionStatus[PermissionGroup.contacts] ?? PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  // Managing error when you don't have permissions
  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw new PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to contacts data denied",
          details: null);
    } else if (permissionStatus == PermissionStatus.disabled) {
      throw new PlatformException(
          code: "PERMISSION_DISABLED",
          message: "Contacts data is not available on device",
          details: null);
    }
  }

  // Showing contact list.
  Future _showContactList(BuildContext context) async {

    List<Contact> favoriteElements = [];
    final InputDecoration searchDecoration = const InputDecoration();

    await refreshContacts();
    if (_contacts != null) {
      showDialog(
        context: context,
        builder: (_) =>
            SelectionDialogContacts(
              _contacts.toList(),
              favoriteElements,
              showCountryOnly: false,
              emptySearchBuilder: null,
              searchDecoration: searchDecoration,
            ),
      ).then((e) {
        if (e != null) {
          setState(() {
            _actualContact = e;
          });
          _actualContact.givenName == null ? guestnameTextFieldController.text = 'null' : guestnameTextFieldController.text = _actualContact.displayName;
          _selectedContact = _actualContact.displayName;
        }
      });
    }
  }

}
