// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressesStruct extends BaseStruct {
  AddressesStruct({
    int? id,
    String? createdAt,
    String? modifiedAt,
    String? address,
    String? city,
    String? country,
    String? postalCode,
    String? state,
    String? streetAddress,
    String? aptNo,
    String? locationLat,
    String? locationLng,
    bool? isMainAddress,
    int? userProfile,
  })  : _id = id,
        _createdAt = createdAt,
        _modifiedAt = modifiedAt,
        _address = address,
        _city = city,
        _country = country,
        _postalCode = postalCode,
        _state = state,
        _streetAddress = streetAddress,
        _aptNo = aptNo,
        _locationLat = locationLat,
        _locationLng = locationLng,
        _isMainAddress = isMainAddress,
        _userProfile = userProfile;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  String? _modifiedAt;
  String get modifiedAt => _modifiedAt ?? '';
  set modifiedAt(String? val) => _modifiedAt = val;
  bool hasModifiedAt() => _modifiedAt != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "postal_code" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;
  bool hasPostalCode() => _postalCode != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "street_address" field.
  String? _streetAddress;
  String get streetAddress => _streetAddress ?? '';
  set streetAddress(String? val) => _streetAddress = val;
  bool hasStreetAddress() => _streetAddress != null;

  // "apt_no" field.
  String? _aptNo;
  String get aptNo => _aptNo ?? '';
  set aptNo(String? val) => _aptNo = val;
  bool hasAptNo() => _aptNo != null;

  // "location_lat" field.
  String? _locationLat;
  String get locationLat => _locationLat ?? '';
  set locationLat(String? val) => _locationLat = val;
  bool hasLocationLat() => _locationLat != null;

  // "location_lng" field.
  String? _locationLng;
  String get locationLng => _locationLng ?? '';
  set locationLng(String? val) => _locationLng = val;
  bool hasLocationLng() => _locationLng != null;

  // "is_main_address" field.
  bool? _isMainAddress;
  bool get isMainAddress => _isMainAddress ?? false;
  set isMainAddress(bool? val) => _isMainAddress = val;
  bool hasIsMainAddress() => _isMainAddress != null;

  // "user_profile" field.
  int? _userProfile;
  int get userProfile => _userProfile ?? 0;
  set userProfile(int? val) => _userProfile = val;
  void incrementUserProfile(int amount) => _userProfile = userProfile + amount;
  bool hasUserProfile() => _userProfile != null;

  static AddressesStruct fromMap(Map<String, dynamic> data) => AddressesStruct(
        id: castToType<int>(data['id']),
        createdAt: data['created_at'] as String?,
        modifiedAt: data['modified_at'] as String?,
        address: data['address'] as String?,
        city: data['city'] as String?,
        country: data['country'] as String?,
        postalCode: data['postal_code'] as String?,
        state: data['state'] as String?,
        streetAddress: data['street_address'] as String?,
        aptNo: data['apt_no'] as String?,
        locationLat: data['location_lat'] as String?,
        locationLng: data['location_lng'] as String?,
        isMainAddress: data['is_main_address'] as bool?,
        userProfile: castToType<int>(data['user_profile']),
      );

  static AddressesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AddressesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'created_at': _createdAt,
        'modified_at': _modifiedAt,
        'address': _address,
        'city': _city,
        'country': _country,
        'postal_code': _postalCode,
        'state': _state,
        'street_address': _streetAddress,
        'apt_no': _aptNo,
        'location_lat': _locationLat,
        'location_lng': _locationLng,
        'is_main_address': _isMainAddress,
        'user_profile': _userProfile,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'modified_at': serializeParam(
          _modifiedAt,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'postal_code': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'street_address': serializeParam(
          _streetAddress,
          ParamType.String,
        ),
        'apt_no': serializeParam(
          _aptNo,
          ParamType.String,
        ),
        'location_lat': serializeParam(
          _locationLat,
          ParamType.String,
        ),
        'location_lng': serializeParam(
          _locationLng,
          ParamType.String,
        ),
        'is_main_address': serializeParam(
          _isMainAddress,
          ParamType.bool,
        ),
        'user_profile': serializeParam(
          _userProfile,
          ParamType.int,
        ),
      }.withoutNulls;

  static AddressesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AddressesStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        modifiedAt: deserializeParam(
          data['modified_at'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['postal_code'],
          ParamType.String,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        streetAddress: deserializeParam(
          data['street_address'],
          ParamType.String,
          false,
        ),
        aptNo: deserializeParam(
          data['apt_no'],
          ParamType.String,
          false,
        ),
        locationLat: deserializeParam(
          data['location_lat'],
          ParamType.String,
          false,
        ),
        locationLng: deserializeParam(
          data['location_lng'],
          ParamType.String,
          false,
        ),
        isMainAddress: deserializeParam(
          data['is_main_address'],
          ParamType.bool,
          false,
        ),
        userProfile: deserializeParam(
          data['user_profile'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AddressesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AddressesStruct &&
        id == other.id &&
        createdAt == other.createdAt &&
        modifiedAt == other.modifiedAt &&
        address == other.address &&
        city == other.city &&
        country == other.country &&
        postalCode == other.postalCode &&
        state == other.state &&
        streetAddress == other.streetAddress &&
        aptNo == other.aptNo &&
        locationLat == other.locationLat &&
        locationLng == other.locationLng &&
        isMainAddress == other.isMainAddress &&
        userProfile == other.userProfile;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        createdAt,
        modifiedAt,
        address,
        city,
        country,
        postalCode,
        state,
        streetAddress,
        aptNo,
        locationLat,
        locationLng,
        isMainAddress,
        userProfile
      ]);
}

AddressesStruct createAddressesStruct({
  int? id,
  String? createdAt,
  String? modifiedAt,
  String? address,
  String? city,
  String? country,
  String? postalCode,
  String? state,
  String? streetAddress,
  String? aptNo,
  String? locationLat,
  String? locationLng,
  bool? isMainAddress,
  int? userProfile,
}) =>
    AddressesStruct(
      id: id,
      createdAt: createdAt,
      modifiedAt: modifiedAt,
      address: address,
      city: city,
      country: country,
      postalCode: postalCode,
      state: state,
      streetAddress: streetAddress,
      aptNo: aptNo,
      locationLat: locationLat,
      locationLng: locationLng,
      isMainAddress: isMainAddress,
      userProfile: userProfile,
    );
