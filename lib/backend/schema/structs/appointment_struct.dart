// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppointmentStruct extends BaseStruct {
  AppointmentStruct({
    String? appointmentType,
    DateTime? date,
    String? time,
    String? lat,
    String? lng,
  })  : _appointmentType = appointmentType,
        _date = date,
        _time = time,
        _lat = lat,
        _lng = lng;

  // "AppointmentType" field.
  String? _appointmentType;
  String get appointmentType => _appointmentType ?? '';
  set appointmentType(String? val) => _appointmentType = val;
  bool hasAppointmentType() => _appointmentType != null;

  // "Date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "Time" field.
  String? _time;
  String get time => _time ?? '';
  set time(String? val) => _time = val;
  bool hasTime() => _time != null;

  // "lat" field.
  String? _lat;
  String get lat => _lat ?? '';
  set lat(String? val) => _lat = val;
  bool hasLat() => _lat != null;

  // "lng" field.
  String? _lng;
  String get lng => _lng ?? '';
  set lng(String? val) => _lng = val;
  bool hasLng() => _lng != null;

  static AppointmentStruct fromMap(Map<String, dynamic> data) =>
      AppointmentStruct(
        appointmentType: data['AppointmentType'] as String?,
        date: data['Date'] as DateTime?,
        time: data['Time'] as String?,
        lat: data['lat'] as String?,
        lng: data['lng'] as String?,
      );

  static AppointmentStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AppointmentStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'AppointmentType': _appointmentType,
        'Date': _date,
        'Time': _time,
        'lat': _lat,
        'lng': _lng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'AppointmentType': serializeParam(
          _appointmentType,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'Time': serializeParam(
          _time,
          ParamType.String,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.String,
        ),
        'lng': serializeParam(
          _lng,
          ParamType.String,
        ),
      }.withoutNulls;

  static AppointmentStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppointmentStruct(
        appointmentType: deserializeParam(
          data['AppointmentType'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.DateTime,
          false,
        ),
        time: deserializeParam(
          data['Time'],
          ParamType.String,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.String,
          false,
        ),
        lng: deserializeParam(
          data['lng'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AppointmentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppointmentStruct &&
        appointmentType == other.appointmentType &&
        date == other.date &&
        time == other.time &&
        lat == other.lat &&
        lng == other.lng;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([appointmentType, date, time, lat, lng]);
}

AppointmentStruct createAppointmentStruct({
  String? appointmentType,
  DateTime? date,
  String? time,
  String? lat,
  String? lng,
}) =>
    AppointmentStruct(
      appointmentType: appointmentType,
      date: date,
      time: time,
      lat: lat,
      lng: lng,
    );
