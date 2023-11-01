// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PosCalendarStruct extends BaseStruct {
  PosCalendarStruct({
    DateTime? startDate,
    bool? isPeriodic,
    String? periodType,
    String? endType,
    DateTime? endDateOn,
    int? endDateAfterSessions,
    bool? isExactStartingTime,
    DateTime? exactStartTime,
    String? rangeStartTime,
    String? sessionDuration,
    List<String>? periodicPreferredWeekDays,
    String? customPeriodicType,
  })  : _startDate = startDate,
        _isPeriodic = isPeriodic,
        _periodType = periodType,
        _endType = endType,
        _endDateOn = endDateOn,
        _endDateAfterSessions = endDateAfterSessions,
        _isExactStartingTime = isExactStartingTime,
        _exactStartTime = exactStartTime,
        _rangeStartTime = rangeStartTime,
        _sessionDuration = sessionDuration,
        _periodicPreferredWeekDays = periodicPreferredWeekDays,
        _customPeriodicType = customPeriodicType;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "isPeriodic" field.
  bool? _isPeriodic;
  bool get isPeriodic => _isPeriodic ?? false;
  set isPeriodic(bool? val) => _isPeriodic = val;
  bool hasIsPeriodic() => _isPeriodic != null;

  // "periodType" field.
  String? _periodType;
  String get periodType => _periodType ?? '';
  set periodType(String? val) => _periodType = val;
  bool hasPeriodType() => _periodType != null;

  // "endType" field.
  String? _endType;
  String get endType => _endType ?? '';
  set endType(String? val) => _endType = val;
  bool hasEndType() => _endType != null;

  // "endDateOn" field.
  DateTime? _endDateOn;
  DateTime? get endDateOn => _endDateOn;
  set endDateOn(DateTime? val) => _endDateOn = val;
  bool hasEndDateOn() => _endDateOn != null;

  // "endDateAfterSessions" field.
  int? _endDateAfterSessions;
  int get endDateAfterSessions => _endDateAfterSessions ?? 0;
  set endDateAfterSessions(int? val) => _endDateAfterSessions = val;
  void incrementEndDateAfterSessions(int amount) =>
      _endDateAfterSessions = endDateAfterSessions + amount;
  bool hasEndDateAfterSessions() => _endDateAfterSessions != null;

  // "isExactStartingTime" field.
  bool? _isExactStartingTime;
  bool get isExactStartingTime => _isExactStartingTime ?? false;
  set isExactStartingTime(bool? val) => _isExactStartingTime = val;
  bool hasIsExactStartingTime() => _isExactStartingTime != null;

  // "exactStartTime" field.
  DateTime? _exactStartTime;
  DateTime? get exactStartTime => _exactStartTime;
  set exactStartTime(DateTime? val) => _exactStartTime = val;
  bool hasExactStartTime() => _exactStartTime != null;

  // "rangeStartTime" field.
  String? _rangeStartTime;
  String get rangeStartTime => _rangeStartTime ?? '';
  set rangeStartTime(String? val) => _rangeStartTime = val;
  bool hasRangeStartTime() => _rangeStartTime != null;

  // "sessionDuration" field.
  String? _sessionDuration;
  String get sessionDuration => _sessionDuration ?? '';
  set sessionDuration(String? val) => _sessionDuration = val;
  bool hasSessionDuration() => _sessionDuration != null;

  // "periodicPreferredWeekDays" field.
  List<String>? _periodicPreferredWeekDays;
  List<String> get periodicPreferredWeekDays =>
      _periodicPreferredWeekDays ?? const [];
  set periodicPreferredWeekDays(List<String>? val) =>
      _periodicPreferredWeekDays = val;
  void updatePeriodicPreferredWeekDays(Function(List<String>) updateFn) =>
      updateFn(_periodicPreferredWeekDays ??= []);
  bool hasPeriodicPreferredWeekDays() => _periodicPreferredWeekDays != null;

  // "customPeriodicType" field.
  String? _customPeriodicType;
  String get customPeriodicType => _customPeriodicType ?? '';
  set customPeriodicType(String? val) => _customPeriodicType = val;
  bool hasCustomPeriodicType() => _customPeriodicType != null;

  static PosCalendarStruct fromMap(Map<String, dynamic> data) =>
      PosCalendarStruct(
        startDate: data['startDate'] as DateTime?,
        isPeriodic: data['isPeriodic'] as bool?,
        periodType: data['periodType'] as String?,
        endType: data['endType'] as String?,
        endDateOn: data['endDateOn'] as DateTime?,
        endDateAfterSessions: castToType<int>(data['endDateAfterSessions']),
        isExactStartingTime: data['isExactStartingTime'] as bool?,
        exactStartTime: data['exactStartTime'] as DateTime?,
        rangeStartTime: data['rangeStartTime'] as String?,
        sessionDuration: data['sessionDuration'] as String?,
        periodicPreferredWeekDays:
            getDataList(data['periodicPreferredWeekDays']),
        customPeriodicType: data['customPeriodicType'] as String?,
      );

  static PosCalendarStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PosCalendarStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'startDate': _startDate,
        'isPeriodic': _isPeriodic,
        'periodType': _periodType,
        'endType': _endType,
        'endDateOn': _endDateOn,
        'endDateAfterSessions': _endDateAfterSessions,
        'isExactStartingTime': _isExactStartingTime,
        'exactStartTime': _exactStartTime,
        'rangeStartTime': _rangeStartTime,
        'sessionDuration': _sessionDuration,
        'periodicPreferredWeekDays': _periodicPreferredWeekDays,
        'customPeriodicType': _customPeriodicType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'startDate': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'isPeriodic': serializeParam(
          _isPeriodic,
          ParamType.bool,
        ),
        'periodType': serializeParam(
          _periodType,
          ParamType.String,
        ),
        'endType': serializeParam(
          _endType,
          ParamType.String,
        ),
        'endDateOn': serializeParam(
          _endDateOn,
          ParamType.DateTime,
        ),
        'endDateAfterSessions': serializeParam(
          _endDateAfterSessions,
          ParamType.int,
        ),
        'isExactStartingTime': serializeParam(
          _isExactStartingTime,
          ParamType.bool,
        ),
        'exactStartTime': serializeParam(
          _exactStartTime,
          ParamType.DateTime,
        ),
        'rangeStartTime': serializeParam(
          _rangeStartTime,
          ParamType.String,
        ),
        'sessionDuration': serializeParam(
          _sessionDuration,
          ParamType.String,
        ),
        'periodicPreferredWeekDays': serializeParam(
          _periodicPreferredWeekDays,
          ParamType.String,
          true,
        ),
        'customPeriodicType': serializeParam(
          _customPeriodicType,
          ParamType.String,
        ),
      }.withoutNulls;

  static PosCalendarStruct fromSerializableMap(Map<String, dynamic> data) =>
      PosCalendarStruct(
        startDate: deserializeParam(
          data['startDate'],
          ParamType.DateTime,
          false,
        ),
        isPeriodic: deserializeParam(
          data['isPeriodic'],
          ParamType.bool,
          false,
        ),
        periodType: deserializeParam(
          data['periodType'],
          ParamType.String,
          false,
        ),
        endType: deserializeParam(
          data['endType'],
          ParamType.String,
          false,
        ),
        endDateOn: deserializeParam(
          data['endDateOn'],
          ParamType.DateTime,
          false,
        ),
        endDateAfterSessions: deserializeParam(
          data['endDateAfterSessions'],
          ParamType.int,
          false,
        ),
        isExactStartingTime: deserializeParam(
          data['isExactStartingTime'],
          ParamType.bool,
          false,
        ),
        exactStartTime: deserializeParam(
          data['exactStartTime'],
          ParamType.DateTime,
          false,
        ),
        rangeStartTime: deserializeParam(
          data['rangeStartTime'],
          ParamType.String,
          false,
        ),
        sessionDuration: deserializeParam(
          data['sessionDuration'],
          ParamType.String,
          false,
        ),
        periodicPreferredWeekDays: deserializeParam<String>(
          data['periodicPreferredWeekDays'],
          ParamType.String,
          true,
        ),
        customPeriodicType: deserializeParam(
          data['customPeriodicType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'PosCalendarStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PosCalendarStruct &&
        startDate == other.startDate &&
        isPeriodic == other.isPeriodic &&
        periodType == other.periodType &&
        endType == other.endType &&
        endDateOn == other.endDateOn &&
        endDateAfterSessions == other.endDateAfterSessions &&
        isExactStartingTime == other.isExactStartingTime &&
        exactStartTime == other.exactStartTime &&
        rangeStartTime == other.rangeStartTime &&
        sessionDuration == other.sessionDuration &&
        listEquality.equals(
            periodicPreferredWeekDays, other.periodicPreferredWeekDays) &&
        customPeriodicType == other.customPeriodicType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        startDate,
        isPeriodic,
        periodType,
        endType,
        endDateOn,
        endDateAfterSessions,
        isExactStartingTime,
        exactStartTime,
        rangeStartTime,
        sessionDuration,
        periodicPreferredWeekDays,
        customPeriodicType
      ]);
}

PosCalendarStruct createPosCalendarStruct({
  DateTime? startDate,
  bool? isPeriodic,
  String? periodType,
  String? endType,
  DateTime? endDateOn,
  int? endDateAfterSessions,
  bool? isExactStartingTime,
  DateTime? exactStartTime,
  String? rangeStartTime,
  String? sessionDuration,
  String? customPeriodicType,
}) =>
    PosCalendarStruct(
      startDate: startDate,
      isPeriodic: isPeriodic,
      periodType: periodType,
      endType: endType,
      endDateOn: endDateOn,
      endDateAfterSessions: endDateAfterSessions,
      isExactStartingTime: isExactStartingTime,
      exactStartTime: exactStartTime,
      rangeStartTime: rangeStartTime,
      sessionDuration: sessionDuration,
      customPeriodicType: customPeriodicType,
    );
