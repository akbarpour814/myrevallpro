// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListStruct extends BaseStruct {
  ListStruct({
    List<ChatRoomStruct>? message,
  }) : _message = message;

  // "message" field.
  List<ChatRoomStruct>? _message;
  List<ChatRoomStruct> get message => _message ?? const [];
  set message(List<ChatRoomStruct>? val) => _message = val;
  void updateMessage(Function(List<ChatRoomStruct>) updateFn) =>
      updateFn(_message ??= []);
  bool hasMessage() => _message != null;

  static ListStruct fromMap(Map<String, dynamic> data) => ListStruct(
        message: getStructList(
          data['message'],
          ChatRoomStruct.fromMap,
        ),
      );

  static ListStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ListStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'message': _message?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'message': serializeParam(
          _message,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListStruct(
        message: deserializeStructParam<ChatRoomStruct>(
          data['message'],
          ParamType.DataStruct,
          true,
          structBuilder: ChatRoomStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListStruct && listEquality.equals(message, other.message);
  }

  @override
  int get hashCode => const ListEquality().hash([message]);
}

ListStruct createListStruct() => ListStruct();
