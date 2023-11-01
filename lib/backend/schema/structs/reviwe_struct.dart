// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviweStruct extends BaseStruct {
  ReviweStruct({
    double? rate,
    String? description,
  })  : _rate = rate,
        _description = description;

  // "Rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;
  void incrementRate(double amount) => _rate = rate + amount;
  bool hasRate() => _rate != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static ReviweStruct fromMap(Map<String, dynamic> data) => ReviweStruct(
        rate: castToType<double>(data['Rate']),
        description: data['Description'] as String?,
      );

  static ReviweStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ReviweStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Rate': _rate,
        'Description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static ReviweStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReviweStruct(
        rate: deserializeParam(
          data['Rate'],
          ParamType.double,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ReviweStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReviweStruct &&
        rate == other.rate &&
        description == other.description;
  }

  @override
  int get hashCode => const ListEquality().hash([rate, description]);
}

ReviweStruct createReviweStruct({
  double? rate,
  String? description,
}) =>
    ReviweStruct(
      rate: rate,
      description: description,
    );
