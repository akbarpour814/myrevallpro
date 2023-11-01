// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TransitionsStruct extends BaseStruct {
  TransitionsStruct({
    String? state,
    String? allowed,
    String? nextState,
    String? action,
  })  : _state = state,
        _allowed = allowed,
        _nextState = nextState,
        _action = action;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;
  bool hasState() => _state != null;

  // "allowed" field.
  String? _allowed;
  String get allowed => _allowed ?? '';
  set allowed(String? val) => _allowed = val;
  bool hasAllowed() => _allowed != null;

  // "next_state" field.
  String? _nextState;
  String get nextState => _nextState ?? '';
  set nextState(String? val) => _nextState = val;
  bool hasNextState() => _nextState != null;

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  set action(String? val) => _action = val;
  bool hasAction() => _action != null;

  static TransitionsStruct fromMap(Map<String, dynamic> data) =>
      TransitionsStruct(
        state: data['state'] as String?,
        allowed: data['allowed'] as String?,
        nextState: data['next_state'] as String?,
        action: data['action'] as String?,
      );

  static TransitionsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TransitionsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'state': _state,
        'allowed': _allowed,
        'next_state': _nextState,
        'action': _action,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
        'allowed': serializeParam(
          _allowed,
          ParamType.String,
        ),
        'next_state': serializeParam(
          _nextState,
          ParamType.String,
        ),
        'action': serializeParam(
          _action,
          ParamType.String,
        ),
      }.withoutNulls;

  static TransitionsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TransitionsStruct(
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
        allowed: deserializeParam(
          data['allowed'],
          ParamType.String,
          false,
        ),
        nextState: deserializeParam(
          data['next_state'],
          ParamType.String,
          false,
        ),
        action: deserializeParam(
          data['action'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TransitionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TransitionsStruct &&
        state == other.state &&
        allowed == other.allowed &&
        nextState == other.nextState &&
        action == other.action;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([state, allowed, nextState, action]);
}

TransitionsStruct createTransitionsStruct({
  String? state,
  String? allowed,
  String? nextState,
  String? action,
}) =>
    TransitionsStruct(
      state: state,
      allowed: allowed,
      nextState: nextState,
      action: action,
    );
