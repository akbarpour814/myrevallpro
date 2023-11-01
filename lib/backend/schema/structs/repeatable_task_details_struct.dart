// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RepeatableTaskDetailsStruct extends BaseStruct {
  RepeatableTaskDetailsStruct({
    String? repeatType,
    String? endDateType,
    DateTime? endOn,
    int? endAfterNumberOfSession,
    String? repeatEvery,
    String? monthlyRepeatType,
    List<String>? preferredDays,
  })  : _repeatType = repeatType,
        _endDateType = endDateType,
        _endOn = endOn,
        _endAfterNumberOfSession = endAfterNumberOfSession,
        _repeatEvery = repeatEvery,
        _monthlyRepeatType = monthlyRepeatType,
        _preferredDays = preferredDays;

  // "repeat_type" field.
  String? _repeatType;
  String get repeatType => _repeatType ?? '';
  set repeatType(String? val) => _repeatType = val;
  bool hasRepeatType() => _repeatType != null;

  // "end_date_type" field.
  String? _endDateType;
  String get endDateType => _endDateType ?? '';
  set endDateType(String? val) => _endDateType = val;
  bool hasEndDateType() => _endDateType != null;

  // "end_on" field.
  DateTime? _endOn;
  DateTime? get endOn => _endOn;
  set endOn(DateTime? val) => _endOn = val;
  bool hasEndOn() => _endOn != null;

  // "end_after_number_of_session" field.
  int? _endAfterNumberOfSession;
  int get endAfterNumberOfSession => _endAfterNumberOfSession ?? 0;
  set endAfterNumberOfSession(int? val) => _endAfterNumberOfSession = val;
  void incrementEndAfterNumberOfSession(int amount) =>
      _endAfterNumberOfSession = endAfterNumberOfSession + amount;
  bool hasEndAfterNumberOfSession() => _endAfterNumberOfSession != null;

  // "repeat_every" field.
  String? _repeatEvery;
  String get repeatEvery => _repeatEvery ?? '';
  set repeatEvery(String? val) => _repeatEvery = val;
  bool hasRepeatEvery() => _repeatEvery != null;

  // "monthly_repeat_type" field.
  String? _monthlyRepeatType;
  String get monthlyRepeatType => _monthlyRepeatType ?? '';
  set monthlyRepeatType(String? val) => _monthlyRepeatType = val;
  bool hasMonthlyRepeatType() => _monthlyRepeatType != null;

  // "preferred_days" field.
  List<String>? _preferredDays;
  List<String> get preferredDays => _preferredDays ?? const [];
  set preferredDays(List<String>? val) => _preferredDays = val;
  void updatePreferredDays(Function(List<String>) updateFn) =>
      updateFn(_preferredDays ??= []);
  bool hasPreferredDays() => _preferredDays != null;

  static RepeatableTaskDetailsStruct fromMap(Map<String, dynamic> data) =>
      RepeatableTaskDetailsStruct(
        repeatType: data['repeat_type'] as String?,
        endDateType: data['end_date_type'] as String?,
        endOn: data['end_on'] as DateTime?,
        endAfterNumberOfSession:
            castToType<int>(data['end_after_number_of_session']),
        repeatEvery: data['repeat_every'] as String?,
        monthlyRepeatType: data['monthly_repeat_type'] as String?,
        preferredDays: getDataList(data['preferred_days']),
      );

  static RepeatableTaskDetailsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? RepeatableTaskDetailsStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'repeat_type': _repeatType,
        'end_date_type': _endDateType,
        'end_on': _endOn,
        'end_after_number_of_session': _endAfterNumberOfSession,
        'repeat_every': _repeatEvery,
        'monthly_repeat_type': _monthlyRepeatType,
        'preferred_days': _preferredDays,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'repeat_type': serializeParam(
          _repeatType,
          ParamType.String,
        ),
        'end_date_type': serializeParam(
          _endDateType,
          ParamType.String,
        ),
        'end_on': serializeParam(
          _endOn,
          ParamType.DateTime,
        ),
        'end_after_number_of_session': serializeParam(
          _endAfterNumberOfSession,
          ParamType.int,
        ),
        'repeat_every': serializeParam(
          _repeatEvery,
          ParamType.String,
        ),
        'monthly_repeat_type': serializeParam(
          _monthlyRepeatType,
          ParamType.String,
        ),
        'preferred_days': serializeParam(
          _preferredDays,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static RepeatableTaskDetailsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RepeatableTaskDetailsStruct(
        repeatType: deserializeParam(
          data['repeat_type'],
          ParamType.String,
          false,
        ),
        endDateType: deserializeParam(
          data['end_date_type'],
          ParamType.String,
          false,
        ),
        endOn: deserializeParam(
          data['end_on'],
          ParamType.DateTime,
          false,
        ),
        endAfterNumberOfSession: deserializeParam(
          data['end_after_number_of_session'],
          ParamType.int,
          false,
        ),
        repeatEvery: deserializeParam(
          data['repeat_every'],
          ParamType.String,
          false,
        ),
        monthlyRepeatType: deserializeParam(
          data['monthly_repeat_type'],
          ParamType.String,
          false,
        ),
        preferredDays: deserializeParam<String>(
          data['preferred_days'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'RepeatableTaskDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RepeatableTaskDetailsStruct &&
        repeatType == other.repeatType &&
        endDateType == other.endDateType &&
        endOn == other.endOn &&
        endAfterNumberOfSession == other.endAfterNumberOfSession &&
        repeatEvery == other.repeatEvery &&
        monthlyRepeatType == other.monthlyRepeatType &&
        listEquality.equals(preferredDays, other.preferredDays);
  }

  @override
  int get hashCode => const ListEquality().hash([
        repeatType,
        endDateType,
        endOn,
        endAfterNumberOfSession,
        repeatEvery,
        monthlyRepeatType,
        preferredDays
      ]);
}

RepeatableTaskDetailsStruct createRepeatableTaskDetailsStruct({
  String? repeatType,
  String? endDateType,
  DateTime? endOn,
  int? endAfterNumberOfSession,
  String? repeatEvery,
  String? monthlyRepeatType,
}) =>
    RepeatableTaskDetailsStruct(
      repeatType: repeatType,
      endDateType: endDateType,
      endOn: endOn,
      endAfterNumberOfSession: endAfterNumberOfSession,
      repeatEvery: repeatEvery,
      monthlyRepeatType: monthlyRepeatType,
    );
