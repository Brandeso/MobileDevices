import 'package:agenda/utils/database.helper.dart';

class Event {
  int _id;
  String _category;
  String _date;
  String _time;
  String _desc;
  String _status;
  String _contact;
  String _place;

  Event(this._category, this._date, this._time, this._desc, this._status, this._contact, this._place);

  Event.map(dynamic obj){
    this._id = obj['id'];
    this._category = obj['category'];
    this._date = obj['date'];
    this._time = obj['time'];
    this._desc = obj['desc'];
    this._status = obj['status'];
    this._contact = obj['contact'];
    this._place = obj['place'];
  }

  int get Id => _id;
  String get Category => _category;
  String get Date => _date;
  String get Time => _time;
  String get Desc => _desc;
  String get Status => _status;
  String get Contact => _contact;
  String get Place => _place;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if(_id != null){
      map['id'] = _id;
    }
    map['category'] = _category;
    map['date'] = _date;
    map['time'] = _time;
    map['desc'] = _desc;
    map['status'] = _status;
    map['contact'] = _contact;
    map['place'] = _place;

    return map;
  }

  Event.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._category = map['category'];
    this._date = map['date'];
    this._time = map['time'];
    this._desc = map['desc'];
    this._status = map['status'];
    this._contact = map['contact'];
    this._place = map['place'];
  }
  getAll() async {
    var db = new DatabaseHelper();
    return await db.getAllEvents();
  }
}