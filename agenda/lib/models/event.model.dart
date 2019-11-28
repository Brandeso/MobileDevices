import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Event {
  int _id;
  String _category;
  String _date;
  String _time;
  String _desc;
  String _status;

  Event(this._id, this._category, this._date, this._time, this._desc, this._status);

  Event.map(dynamic obj){
    this._id = obj['id'];
    this._category = obj['category'];
    this._date = obj['date'];
    this._time = obj['time'];
    this._desc = obj['desc'];
    this._status = obj['status'];
  }

  int get Id => _id;
  String get Category => _category;
  String get Date => _date;
  String get Time => _time;
  String get Desc => _desc;
  String get Status => _status;

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

    return map;
  }

  Event.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._category = map['category'];
    this._date = map['date'];
    this._time = map['time'];
    this._desc = map['desc'];
    this._status = map['status'];
  }

}