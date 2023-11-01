// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskRatesStruct extends BaseStruct {
  TaskRatesStruct({
    String? type,
    int? howMuch,
    String? currency,
  })  : _type = type,
        _howMuch = howMuch,
        _currency = currency;

  // "Type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "HowMuch" field.
  int? _howMuch;
  int get howMuch => _howMuch ?? 0;
  set howMuch(int? val) => _howMuch = val;
  void incrementHowMuch(int amount) => _howMuch = howMuch + amount;
  bool hasHowMuch() => _howMuch != null;

  // "Currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;
  bool hasCurrency() => _currency != null;

  static TaskRatesStruct fromMap(Map<String, dynamic> data) => TaskRatesStruct(
        type: data['Type'] as String?,
        howMuch: castToType<int>(data['HowMuch']),
        currency: data['Currency'] as String?,
      );

  static TaskRatesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskRatesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Type': _type,
        'HowMuch': _howMuch,
        'Currency': _currency,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Type': serializeParam(
          _type,
          ParamType.String,
        ),
        'HowMuch': serializeParam(
          _howMuch,
          ParamType.int,
        ),
        'Currency': serializeParam(
          _currency,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskRatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskRatesStruct(
        type: deserializeParam(
          data['Type'],
          ParamType.String,
          false,
        ),
        howMuch: deserializeParam(
          data['HowMuch'],
          ParamType.int,
          false,
        ),
        currency: deserializeParam(
          data['Currency'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskRatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskRatesStruct &&
        type == other.type &&
        howMuch == other.howMuch &&
        currency == other.currency;
  }

  @override
  int get hashCode => const ListEquality().hash([type, howMuch, currency]);
}

TaskRatesStruct createTaskRatesStruct({
  String? type,
  int? howMuch,
  String? currency,
}) =>
    TaskRatesStruct(
      type: type,
      howMuch: howMuch,
      currency: currency,
    );
