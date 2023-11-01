// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskerTypeFilterStruct extends BaseStruct {
  TaskerTypeFilterStruct({
    String? gender,
    String? ageRange,
    String? languages,
    bool? hasInsurance,
    bool? hasIdentification,
    String? driverLicense,
  })  : _gender = gender,
        _ageRange = ageRange,
        _languages = languages,
        _hasInsurance = hasInsurance,
        _hasIdentification = hasIdentification,
        _driverLicense = driverLicense;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "ageRange" field.
  String? _ageRange;
  String get ageRange => _ageRange ?? '';
  set ageRange(String? val) => _ageRange = val;
  bool hasAgeRange() => _ageRange != null;

  // "languages" field.
  String? _languages;
  String get languages => _languages ?? '';
  set languages(String? val) => _languages = val;
  bool hasLanguages() => _languages != null;

  // "hasInsurance" field.
  bool? _hasInsurance;
  bool get hasInsurance => _hasInsurance ?? false;
  set hasInsurance(bool? val) => _hasInsurance = val;
  bool hasHasInsurance() => _hasInsurance != null;

  // "hasIdentification" field.
  bool? _hasIdentification;
  bool get hasIdentification => _hasIdentification ?? false;
  set hasIdentification(bool? val) => _hasIdentification = val;
  bool hasHasIdentification() => _hasIdentification != null;

  // "driverLicense" field.
  String? _driverLicense;
  String get driverLicense => _driverLicense ?? '';
  set driverLicense(String? val) => _driverLicense = val;
  bool hasDriverLicense() => _driverLicense != null;

  static TaskerTypeFilterStruct fromMap(Map<String, dynamic> data) =>
      TaskerTypeFilterStruct(
        gender: data['gender'] as String?,
        ageRange: data['ageRange'] as String?,
        languages: data['languages'] as String?,
        hasInsurance: data['hasInsurance'] as bool?,
        hasIdentification: data['hasIdentification'] as bool?,
        driverLicense: data['driverLicense'] as String?,
      );

  static TaskerTypeFilterStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? TaskerTypeFilterStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'gender': _gender,
        'ageRange': _ageRange,
        'languages': _languages,
        'hasInsurance': _hasInsurance,
        'hasIdentification': _hasIdentification,
        'driverLicense': _driverLicense,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'ageRange': serializeParam(
          _ageRange,
          ParamType.String,
        ),
        'languages': serializeParam(
          _languages,
          ParamType.String,
        ),
        'hasInsurance': serializeParam(
          _hasInsurance,
          ParamType.bool,
        ),
        'hasIdentification': serializeParam(
          _hasIdentification,
          ParamType.bool,
        ),
        'driverLicense': serializeParam(
          _driverLicense,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskerTypeFilterStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TaskerTypeFilterStruct(
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        ageRange: deserializeParam(
          data['ageRange'],
          ParamType.String,
          false,
        ),
        languages: deserializeParam(
          data['languages'],
          ParamType.String,
          false,
        ),
        hasInsurance: deserializeParam(
          data['hasInsurance'],
          ParamType.bool,
          false,
        ),
        hasIdentification: deserializeParam(
          data['hasIdentification'],
          ParamType.bool,
          false,
        ),
        driverLicense: deserializeParam(
          data['driverLicense'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskerTypeFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskerTypeFilterStruct &&
        gender == other.gender &&
        ageRange == other.ageRange &&
        languages == other.languages &&
        hasInsurance == other.hasInsurance &&
        hasIdentification == other.hasIdentification &&
        driverLicense == other.driverLicense;
  }

  @override
  int get hashCode => const ListEquality().hash([
        gender,
        ageRange,
        languages,
        hasInsurance,
        hasIdentification,
        driverLicense
      ]);
}

TaskerTypeFilterStruct createTaskerTypeFilterStruct({
  String? gender,
  String? ageRange,
  String? languages,
  bool? hasInsurance,
  bool? hasIdentification,
  String? driverLicense,
}) =>
    TaskerTypeFilterStruct(
      gender: gender,
      ageRange: ageRange,
      languages: languages,
      hasInsurance: hasInsurance,
      hasIdentification: hasIdentification,
      driverLicense: driverLicense,
    );
