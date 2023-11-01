// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationFilterStruct extends BaseStruct {
  LocationFilterStruct({
    int? addressName,
    double? latitude,
    double? longitude,
    double? radius,
    String? address,
    LatLng? latLng,
  })  : _addressName = addressName,
        _latitude = latitude,
        _longitude = longitude,
        _radius = radius,
        _address = address,
        _latLng = latLng;

  // "addressName" field.
  int? _addressName;
  int get addressName => _addressName ?? 0;
  set addressName(int? val) => _addressName = val;
  void incrementAddressName(int amount) => _addressName = addressName + amount;
  bool hasAddressName() => _addressName != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  void incrementLatitude(double amount) => _latitude = latitude + amount;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  void incrementLongitude(double amount) => _longitude = longitude + amount;
  bool hasLongitude() => _longitude != null;

  // "radius" field.
  double? _radius;
  double get radius => _radius ?? 0.0;
  set radius(double? val) => _radius = val;
  void incrementRadius(double amount) => _radius = radius + amount;
  bool hasRadius() => _radius != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "latLng" field.
  LatLng? _latLng;
  LatLng? get latLng => _latLng;
  set latLng(LatLng? val) => _latLng = val;
  bool hasLatLng() => _latLng != null;

  static LocationFilterStruct fromMap(Map<String, dynamic> data) =>
      LocationFilterStruct(
        addressName: castToType<int>(data['addressName']),
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        radius: castToType<double>(data['radius']),
        address: data['address'] as String?,
        latLng: data['latLng'] as LatLng?,
      );

  static LocationFilterStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? LocationFilterStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'addressName': _addressName,
        'latitude': _latitude,
        'longitude': _longitude,
        'radius': _radius,
        'address': _address,
        'latLng': _latLng,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'addressName': serializeParam(
          _addressName,
          ParamType.int,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'radius': serializeParam(
          _radius,
          ParamType.double,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'latLng': serializeParam(
          _latLng,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static LocationFilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationFilterStruct(
        addressName: deserializeParam(
          data['addressName'],
          ParamType.int,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        radius: deserializeParam(
          data['radius'],
          ParamType.double,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        latLng: deserializeParam(
          data['latLng'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'LocationFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationFilterStruct &&
        addressName == other.addressName &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        radius == other.radius &&
        address == other.address &&
        latLng == other.latLng;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([addressName, latitude, longitude, radius, address, latLng]);
}

LocationFilterStruct createLocationFilterStruct({
  int? addressName,
  double? latitude,
  double? longitude,
  double? radius,
  String? address,
  LatLng? latLng,
}) =>
    LocationFilterStruct(
      addressName: addressName,
      latitude: latitude,
      longitude: longitude,
      radius: radius,
      address: address,
      latLng: latLng,
    );
