// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskerTypeStruct extends BaseStruct {
  TaskerTypeStruct({
    String? taskerGender,
    String? taskerAgeRange,
    bool? identified,
    int? yearsOfExperience,
    bool? insurance,
    String? driverLicense,
    int? maxDistance,
  })  : _taskerGender = taskerGender,
        _taskerAgeRange = taskerAgeRange,
        _identified = identified,
        _yearsOfExperience = yearsOfExperience,
        _insurance = insurance,
        _driverLicense = driverLicense,
        _maxDistance = maxDistance;

  // "tasker_gender" field.
  String? _taskerGender;
  String get taskerGender => _taskerGender ?? '';
  set taskerGender(String? val) => _taskerGender = val;
  bool hasTaskerGender() => _taskerGender != null;

  // "tasker_age_range" field.
  String? _taskerAgeRange;
  String get taskerAgeRange => _taskerAgeRange ?? '';
  set taskerAgeRange(String? val) => _taskerAgeRange = val;
  bool hasTaskerAgeRange() => _taskerAgeRange != null;

  // "identified" field.
  bool? _identified;
  bool get identified => _identified ?? false;
  set identified(bool? val) => _identified = val;
  bool hasIdentified() => _identified != null;

  // "years_of_experience" field.
  int? _yearsOfExperience;
  int get yearsOfExperience => _yearsOfExperience ?? 0;
  set yearsOfExperience(int? val) => _yearsOfExperience = val;
  void incrementYearsOfExperience(int amount) =>
      _yearsOfExperience = yearsOfExperience + amount;
  bool hasYearsOfExperience() => _yearsOfExperience != null;

  // "insurance" field.
  bool? _insurance;
  bool get insurance => _insurance ?? false;
  set insurance(bool? val) => _insurance = val;
  bool hasInsurance() => _insurance != null;

  // "driver_license" field.
  String? _driverLicense;
  String get driverLicense => _driverLicense ?? '';
  set driverLicense(String? val) => _driverLicense = val;
  bool hasDriverLicense() => _driverLicense != null;

  // "max_distance" field.
  int? _maxDistance;
  int get maxDistance => _maxDistance ?? 0;
  set maxDistance(int? val) => _maxDistance = val;
  void incrementMaxDistance(int amount) => _maxDistance = maxDistance + amount;
  bool hasMaxDistance() => _maxDistance != null;

  static TaskerTypeStruct fromMap(Map<String, dynamic> data) =>
      TaskerTypeStruct(
        taskerGender: data['tasker_gender'] as String?,
        taskerAgeRange: data['tasker_age_range'] as String?,
        identified: data['identified'] as bool?,
        yearsOfExperience: castToType<int>(data['years_of_experience']),
        insurance: data['insurance'] as bool?,
        driverLicense: data['driver_license'] as String?,
        maxDistance: castToType<int>(data['max_distance']),
      );

  static TaskerTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskerTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'tasker_gender': _taskerGender,
        'tasker_age_range': _taskerAgeRange,
        'identified': _identified,
        'years_of_experience': _yearsOfExperience,
        'insurance': _insurance,
        'driver_license': _driverLicense,
        'max_distance': _maxDistance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tasker_gender': serializeParam(
          _taskerGender,
          ParamType.String,
        ),
        'tasker_age_range': serializeParam(
          _taskerAgeRange,
          ParamType.String,
        ),
        'identified': serializeParam(
          _identified,
          ParamType.bool,
        ),
        'years_of_experience': serializeParam(
          _yearsOfExperience,
          ParamType.int,
        ),
        'insurance': serializeParam(
          _insurance,
          ParamType.bool,
        ),
        'driver_license': serializeParam(
          _driverLicense,
          ParamType.String,
        ),
        'max_distance': serializeParam(
          _maxDistance,
          ParamType.int,
        ),
      }.withoutNulls;

  static TaskerTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskerTypeStruct(
        taskerGender: deserializeParam(
          data['tasker_gender'],
          ParamType.String,
          false,
        ),
        taskerAgeRange: deserializeParam(
          data['tasker_age_range'],
          ParamType.String,
          false,
        ),
        identified: deserializeParam(
          data['identified'],
          ParamType.bool,
          false,
        ),
        yearsOfExperience: deserializeParam(
          data['years_of_experience'],
          ParamType.int,
          false,
        ),
        insurance: deserializeParam(
          data['insurance'],
          ParamType.bool,
          false,
        ),
        driverLicense: deserializeParam(
          data['driver_license'],
          ParamType.String,
          false,
        ),
        maxDistance: deserializeParam(
          data['max_distance'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TaskerTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskerTypeStruct &&
        taskerGender == other.taskerGender &&
        taskerAgeRange == other.taskerAgeRange &&
        identified == other.identified &&
        yearsOfExperience == other.yearsOfExperience &&
        insurance == other.insurance &&
        driverLicense == other.driverLicense &&
        maxDistance == other.maxDistance;
  }

  @override
  int get hashCode => const ListEquality().hash([
        taskerGender,
        taskerAgeRange,
        identified,
        yearsOfExperience,
        insurance,
        driverLicense,
        maxDistance
      ]);
}

TaskerTypeStruct createTaskerTypeStruct({
  String? taskerGender,
  String? taskerAgeRange,
  bool? identified,
  int? yearsOfExperience,
  bool? insurance,
  String? driverLicense,
  int? maxDistance,
}) =>
    TaskerTypeStruct(
      taskerGender: taskerGender,
      taskerAgeRange: taskerAgeRange,
      identified: identified,
      yearsOfExperience: yearsOfExperience,
      insurance: insurance,
      driverLicense: driverLicense,
      maxDistance: maxDistance,
    );
