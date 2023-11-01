// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageHeaderStruct extends BaseStruct {
  ChatMessageHeaderStruct({
    String? type,
    String? value,
  })  : _type = type,
        _value = value;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;
  bool hasValue() => _value != null;

  static ChatMessageHeaderStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageHeaderStruct(
        type: data['type'] as String?,
        value: data['value'] as String?,
      );

  static ChatMessageHeaderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? ChatMessageHeaderStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatMessageHeaderStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChatMessageHeaderStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageHeaderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageHeaderStruct &&
        type == other.type &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([type, value]);
}

ChatMessageHeaderStruct createChatMessageHeaderStruct({
  String? type,
  String? value,
}) =>
    ChatMessageHeaderStruct(
      type: type,
      value: value,
    );
