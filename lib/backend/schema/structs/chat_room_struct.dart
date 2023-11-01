// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRoomStruct extends BaseStruct {
  ChatRoomStruct({
    String? roomName,
    String? type,
    String? members,
    String? lastMessage,
    int? isRead,
    String? oppositePersonEmail,
    String? customerTask,
    String? chatBot,
    String? room,
    String? modified,
    String? oppositePersonAvatar,
    String? oppositePersonCustomerProfile,
    List<TransitionsStruct>? possibleTransitions,
    String? workflowState,
  })  : _roomName = roomName,
        _type = type,
        _members = members,
        _lastMessage = lastMessage,
        _isRead = isRead,
        _oppositePersonEmail = oppositePersonEmail,
        _customerTask = customerTask,
        _chatBot = chatBot,
        _room = room,
        _modified = modified,
        _oppositePersonAvatar = oppositePersonAvatar,
        _oppositePersonCustomerProfile = oppositePersonCustomerProfile,
        _possibleTransitions = possibleTransitions,
        _workflowState = workflowState;

  // "room_name" field.
  String? _roomName;
  String get roomName => _roomName ?? '';
  set roomName(String? val) => _roomName = val;
  bool hasRoomName() => _roomName != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "members" field.
  String? _members;
  String get members => _members ?? '';
  set members(String? val) => _members = val;
  bool hasMembers() => _members != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  set lastMessage(String? val) => _lastMessage = val;
  bool hasLastMessage() => _lastMessage != null;

  // "is_read" field.
  int? _isRead;
  int get isRead => _isRead ?? 0;
  set isRead(int? val) => _isRead = val;
  void incrementIsRead(int amount) => _isRead = isRead + amount;
  bool hasIsRead() => _isRead != null;

  // "opposite_person_email" field.
  String? _oppositePersonEmail;
  String get oppositePersonEmail => _oppositePersonEmail ?? '';
  set oppositePersonEmail(String? val) => _oppositePersonEmail = val;
  bool hasOppositePersonEmail() => _oppositePersonEmail != null;

  // "customer_task" field.
  String? _customerTask;
  String get customerTask => _customerTask ?? '';
  set customerTask(String? val) => _customerTask = val;
  bool hasCustomerTask() => _customerTask != null;

  // "chat_bot" field.
  String? _chatBot;
  String get chatBot => _chatBot ?? '';
  set chatBot(String? val) => _chatBot = val;
  bool hasChatBot() => _chatBot != null;

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  set room(String? val) => _room = val;
  bool hasRoom() => _room != null;

  // "modified" field.
  String? _modified;
  String get modified => _modified ?? '';
  set modified(String? val) => _modified = val;
  bool hasModified() => _modified != null;

  // "opposite_person_avatar" field.
  String? _oppositePersonAvatar;
  String get oppositePersonAvatar => _oppositePersonAvatar ?? '';
  set oppositePersonAvatar(String? val) => _oppositePersonAvatar = val;
  bool hasOppositePersonAvatar() => _oppositePersonAvatar != null;

  // "opposite_person_customer_profile" field.
  String? _oppositePersonCustomerProfile;
  String get oppositePersonCustomerProfile =>
      _oppositePersonCustomerProfile ?? '';
  set oppositePersonCustomerProfile(String? val) =>
      _oppositePersonCustomerProfile = val;
  bool hasOppositePersonCustomerProfile() =>
      _oppositePersonCustomerProfile != null;

  // "possible_transitions" field.
  List<TransitionsStruct>? _possibleTransitions;
  List<TransitionsStruct> get possibleTransitions =>
      _possibleTransitions ?? const [];
  set possibleTransitions(List<TransitionsStruct>? val) =>
      _possibleTransitions = val;
  void updatePossibleTransitions(Function(List<TransitionsStruct>) updateFn) =>
      updateFn(_possibleTransitions ??= []);
  bool hasPossibleTransitions() => _possibleTransitions != null;

  // "workflow_state" field.
  String? _workflowState;
  String get workflowState => _workflowState ?? '';
  set workflowState(String? val) => _workflowState = val;
  bool hasWorkflowState() => _workflowState != null;

  static ChatRoomStruct fromMap(Map<String, dynamic> data) => ChatRoomStruct(
        roomName: data['room_name'] as String?,
        type: data['type'] as String?,
        members: data['members'] as String?,
        lastMessage: data['last_message'] as String?,
        isRead: castToType<int>(data['is_read']),
        oppositePersonEmail: data['opposite_person_email'] as String?,
        customerTask: data['customer_task'] as String?,
        chatBot: data['chat_bot'] as String?,
        room: data['room'] as String?,
        modified: data['modified'] as String?,
        oppositePersonAvatar: data['opposite_person_avatar'] as String?,
        oppositePersonCustomerProfile:
            data['opposite_person_customer_profile'] as String?,
        possibleTransitions: getStructList(
          data['possible_transitions'],
          TransitionsStruct.fromMap,
        ),
        workflowState: data['workflow_state'] as String?,
      );

  static ChatRoomStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatRoomStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'room_name': _roomName,
        'type': _type,
        'members': _members,
        'last_message': _lastMessage,
        'is_read': _isRead,
        'opposite_person_email': _oppositePersonEmail,
        'customer_task': _customerTask,
        'chat_bot': _chatBot,
        'room': _room,
        'modified': _modified,
        'opposite_person_avatar': _oppositePersonAvatar,
        'opposite_person_customer_profile': _oppositePersonCustomerProfile,
        'possible_transitions':
            _possibleTransitions?.map((e) => e.toMap()).toList(),
        'workflow_state': _workflowState,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'room_name': serializeParam(
          _roomName,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'members': serializeParam(
          _members,
          ParamType.String,
        ),
        'last_message': serializeParam(
          _lastMessage,
          ParamType.String,
        ),
        'is_read': serializeParam(
          _isRead,
          ParamType.int,
        ),
        'opposite_person_email': serializeParam(
          _oppositePersonEmail,
          ParamType.String,
        ),
        'customer_task': serializeParam(
          _customerTask,
          ParamType.String,
        ),
        'chat_bot': serializeParam(
          _chatBot,
          ParamType.String,
        ),
        'room': serializeParam(
          _room,
          ParamType.String,
        ),
        'modified': serializeParam(
          _modified,
          ParamType.String,
        ),
        'opposite_person_avatar': serializeParam(
          _oppositePersonAvatar,
          ParamType.String,
        ),
        'opposite_person_customer_profile': serializeParam(
          _oppositePersonCustomerProfile,
          ParamType.String,
        ),
        'possible_transitions': serializeParam(
          _possibleTransitions,
          ParamType.DataStruct,
          true,
        ),
        'workflow_state': serializeParam(
          _workflowState,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChatRoomStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatRoomStruct(
        roomName: deserializeParam(
          data['room_name'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        members: deserializeParam(
          data['members'],
          ParamType.String,
          false,
        ),
        lastMessage: deserializeParam(
          data['last_message'],
          ParamType.String,
          false,
        ),
        isRead: deserializeParam(
          data['is_read'],
          ParamType.int,
          false,
        ),
        oppositePersonEmail: deserializeParam(
          data['opposite_person_email'],
          ParamType.String,
          false,
        ),
        customerTask: deserializeParam(
          data['customer_task'],
          ParamType.String,
          false,
        ),
        chatBot: deserializeParam(
          data['chat_bot'],
          ParamType.String,
          false,
        ),
        room: deserializeParam(
          data['room'],
          ParamType.String,
          false,
        ),
        modified: deserializeParam(
          data['modified'],
          ParamType.String,
          false,
        ),
        oppositePersonAvatar: deserializeParam(
          data['opposite_person_avatar'],
          ParamType.String,
          false,
        ),
        oppositePersonCustomerProfile: deserializeParam(
          data['opposite_person_customer_profile'],
          ParamType.String,
          false,
        ),
        possibleTransitions: deserializeStructParam<TransitionsStruct>(
          data['possible_transitions'],
          ParamType.DataStruct,
          true,
          structBuilder: TransitionsStruct.fromSerializableMap,
        ),
        workflowState: deserializeParam(
          data['workflow_state'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChatRoomStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatRoomStruct &&
        roomName == other.roomName &&
        type == other.type &&
        members == other.members &&
        lastMessage == other.lastMessage &&
        isRead == other.isRead &&
        oppositePersonEmail == other.oppositePersonEmail &&
        customerTask == other.customerTask &&
        chatBot == other.chatBot &&
        room == other.room &&
        modified == other.modified &&
        oppositePersonAvatar == other.oppositePersonAvatar &&
        oppositePersonCustomerProfile == other.oppositePersonCustomerProfile &&
        listEquality.equals(possibleTransitions, other.possibleTransitions) &&
        workflowState == other.workflowState;
  }

  @override
  int get hashCode => const ListEquality().hash([
        roomName,
        type,
        members,
        lastMessage,
        isRead,
        oppositePersonEmail,
        customerTask,
        chatBot,
        room,
        modified,
        oppositePersonAvatar,
        oppositePersonCustomerProfile,
        possibleTransitions,
        workflowState
      ]);
}

ChatRoomStruct createChatRoomStruct({
  String? roomName,
  String? type,
  String? members,
  String? lastMessage,
  int? isRead,
  String? oppositePersonEmail,
  String? customerTask,
  String? chatBot,
  String? room,
  String? modified,
  String? oppositePersonAvatar,
  String? oppositePersonCustomerProfile,
  String? workflowState,
}) =>
    ChatRoomStruct(
      roomName: roomName,
      type: type,
      members: members,
      lastMessage: lastMessage,
      isRead: isRead,
      oppositePersonEmail: oppositePersonEmail,
      customerTask: customerTask,
      chatBot: chatBot,
      room: room,
      modified: modified,
      oppositePersonAvatar: oppositePersonAvatar,
      oppositePersonCustomerProfile: oppositePersonCustomerProfile,
      workflowState: workflowState,
    );
