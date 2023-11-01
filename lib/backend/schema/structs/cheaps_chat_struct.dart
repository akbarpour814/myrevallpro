// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheapsChatStruct extends BaseStruct {
  CheapsChatStruct({
    String? type,
    String? title,
    String? message,
  })  : _type = type,
        _title = title,
        _message = message;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  static CheapsChatStruct fromMap(Map<String, dynamic> data) =>
      CheapsChatStruct(
        type: data['type'] as String?,
        title: data['title'] as String?,
        message: data['message'] as String?,
      );

  static CheapsChatStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CheapsChatStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'title': _title,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static CheapsChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      CheapsChatStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CheapsChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CheapsChatStruct &&
        type == other.type &&
        title == other.title &&
        message == other.message;
  }

  @override
  int get hashCode => const ListEquality().hash([type, title, message]);
}

CheapsChatStruct createCheapsChatStruct({
  String? type,
  String? title,
  String? message,
}) =>
    CheapsChatStruct(
      type: type,
      title: title,
      message: message,
    );
