// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskScheduleStruct extends BaseStruct {
  TaskScheduleStruct({
    DateTime? startDate,
    bool? isExactStartTime,
    int? numberOfHoursPerSession,
    bool? isRepeatable,
    DateTime? startTime,
    String? startRangeTime,
    RepeatableTaskDetailsStruct? repeatableTaskDetails,
  })  : _startDate = startDate,
        _isExactStartTime = isExactStartTime,
        _numberOfHoursPerSession = numberOfHoursPerSession,
        _isRepeatable = isRepeatable,
        _startTime = startTime,
        _startRangeTime = startRangeTime,
        _repeatableTaskDetails = repeatableTaskDetails;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "is_exact_start_time" field.
  bool? _isExactStartTime;
  bool get isExactStartTime => _isExactStartTime ?? false;
  set isExactStartTime(bool? val) => _isExactStartTime = val;
  bool hasIsExactStartTime() => _isExactStartTime != null;

  // "number_of_hours_per_session" field.
  int? _numberOfHoursPerSession;
  int get numberOfHoursPerSession => _numberOfHoursPerSession ?? 0;
  set numberOfHoursPerSession(int? val) => _numberOfHoursPerSession = val;
  void incrementNumberOfHoursPerSession(int amount) =>
      _numberOfHoursPerSession = numberOfHoursPerSession + amount;
  bool hasNumberOfHoursPerSession() => _numberOfHoursPerSession != null;

  // "is_repeatable" field.
  bool? _isRepeatable;
  bool get isRepeatable => _isRepeatable ?? false;
  set isRepeatable(bool? val) => _isRepeatable = val;
  bool hasIsRepeatable() => _isRepeatable != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "start_range_time" field.
  String? _startRangeTime;
  String get startRangeTime => _startRangeTime ?? '';
  set startRangeTime(String? val) => _startRangeTime = val;
  bool hasStartRangeTime() => _startRangeTime != null;

  // "repeatableTaskDetails" field.
  RepeatableTaskDetailsStruct? _repeatableTaskDetails;
  RepeatableTaskDetailsStruct get repeatableTaskDetails =>
      _repeatableTaskDetails ?? RepeatableTaskDetailsStruct();
  set repeatableTaskDetails(RepeatableTaskDetailsStruct? val) =>
      _repeatableTaskDetails = val;
  void updateRepeatableTaskDetails(
          Function(RepeatableTaskDetailsStruct) updateFn) =>
      updateFn(_repeatableTaskDetails ??= RepeatableTaskDetailsStruct());
  bool hasRepeatableTaskDetails() => _repeatableTaskDetails != null;

  static TaskScheduleStruct fromMap(Map<String, dynamic> data) =>
      TaskScheduleStruct(
        startDate: data['start_date'] as DateTime?,
        isExactStartTime: data['is_exact_start_time'] as bool?,
        numberOfHoursPerSession:
            castToType<int>(data['number_of_hours_per_session']),
        isRepeatable: data['is_repeatable'] as bool?,
        startTime: data['start_time'] as DateTime?,
        startRangeTime: data['start_range_time'] as String?,
        repeatableTaskDetails: RepeatableTaskDetailsStruct.maybeFromMap(
            data['repeatableTaskDetails']),
      );

  static TaskScheduleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskScheduleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'start_date': _startDate,
        'is_exact_start_time': _isExactStartTime,
        'number_of_hours_per_session': _numberOfHoursPerSession,
        'is_repeatable': _isRepeatable,
        'start_time': _startTime,
        'start_range_time': _startRangeTime,
        'repeatableTaskDetails': _repeatableTaskDetails?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'start_date': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'is_exact_start_time': serializeParam(
          _isExactStartTime,
          ParamType.bool,
        ),
        'number_of_hours_per_session': serializeParam(
          _numberOfHoursPerSession,
          ParamType.int,
        ),
        'is_repeatable': serializeParam(
          _isRepeatable,
          ParamType.bool,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'start_range_time': serializeParam(
          _startRangeTime,
          ParamType.String,
        ),
        'repeatableTaskDetails': serializeParam(
          _repeatableTaskDetails,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TaskScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskScheduleStruct(
        startDate: deserializeParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        isExactStartTime: deserializeParam(
          data['is_exact_start_time'],
          ParamType.bool,
          false,
        ),
        numberOfHoursPerSession: deserializeParam(
          data['number_of_hours_per_session'],
          ParamType.int,
          false,
        ),
        isRepeatable: deserializeParam(
          data['is_repeatable'],
          ParamType.bool,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.DateTime,
          false,
        ),
        startRangeTime: deserializeParam(
          data['start_range_time'],
          ParamType.String,
          false,
        ),
        repeatableTaskDetails: deserializeStructParam(
          data['repeatableTaskDetails'],
          ParamType.DataStruct,
          false,
          structBuilder: RepeatableTaskDetailsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TaskScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskScheduleStruct &&
        startDate == other.startDate &&
        isExactStartTime == other.isExactStartTime &&
        numberOfHoursPerSession == other.numberOfHoursPerSession &&
        isRepeatable == other.isRepeatable &&
        startTime == other.startTime &&
        startRangeTime == other.startRangeTime &&
        repeatableTaskDetails == other.repeatableTaskDetails;
  }

  @override
  int get hashCode => const ListEquality().hash([
        startDate,
        isExactStartTime,
        numberOfHoursPerSession,
        isRepeatable,
        startTime,
        startRangeTime,
        repeatableTaskDetails
      ]);
}

TaskScheduleStruct createTaskScheduleStruct({
  DateTime? startDate,
  bool? isExactStartTime,
  int? numberOfHoursPerSession,
  bool? isRepeatable,
  DateTime? startTime,
  String? startRangeTime,
  RepeatableTaskDetailsStruct? repeatableTaskDetails,
}) =>
    TaskScheduleStruct(
      startDate: startDate,
      isExactStartTime: isExactStartTime,
      numberOfHoursPerSession: numberOfHoursPerSession,
      isRepeatable: isRepeatable,
      startTime: startTime,
      startRangeTime: startRangeTime,
      repeatableTaskDetails:
          repeatableTaskDetails ?? RepeatableTaskDetailsStruct(),
    );
