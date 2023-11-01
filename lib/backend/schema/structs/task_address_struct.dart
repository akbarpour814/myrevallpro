// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskAddressStruct extends BaseStruct {
  TaskAddressStruct({
    String? address,
    String? fullAddress,
    double? latitude,
    double? longitude,
    String? country,
    String? city,
  })  : _address = address,
        _fullAddress = fullAddress,
        _latitude = latitude,
        _longitude = longitude,
        _country = country,
        _city = city;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "fullAddress" field.
  String? _fullAddress;
  String get fullAddress => _fullAddress ?? '';
  set fullAddress(String? val) => _fullAddress = val;
  bool hasFullAddress() => _fullAddress != null;

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

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  static TaskAddressStruct fromMap(Map<String, dynamic> data) =>
      TaskAddressStruct(
        address: data['address'] as String?,
        fullAddress: data['fullAddress'] as String?,
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        country: data['country'] as String?,
        city: data['city'] as String?,
      );

  static TaskAddressStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskAddressStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'address': _address,
        'fullAddress': _fullAddress,
        'latitude': _latitude,
        'longitude': _longitude,
        'country': _country,
        'city': _city,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'fullAddress': serializeParam(
          _fullAddress,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskAddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskAddressStruct(
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        fullAddress: deserializeParam(
          data['fullAddress'],
          ParamType.String,
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
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskAddressStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskAddressStruct &&
        address == other.address &&
        fullAddress == other.fullAddress &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        country == other.country &&
        city == other.city;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([address, fullAddress, latitude, longitude, country, city]);
}

TaskAddressStruct createTaskAddressStruct({
  String? address,
  String? fullAddress,
  double? latitude,
  double? longitude,
  String? country,
  String? city,
}) =>
    TaskAddressStruct(
      address: address,
      fullAddress: fullAddress,
      latitude: latitude,
      longitude: longitude,
      country: country,
      city: city,
    );
