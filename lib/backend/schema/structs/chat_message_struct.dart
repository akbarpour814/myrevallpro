// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStruct extends BaseStruct {
  ChatMessageStruct({
    String? name,
    String? content,
    String? sender,
    String? creation,
    String? senderEmail,
    String? contentType,
    String? refrenceDoctype,
    String? refrenceDoc,
    String? workflowState,
    ChatMessageHeaderStruct? header,
    List<TransitionsStruct>? possibleTransitions,
  })  : _name = name,
        _content = content,
        _sender = sender,
        _creation = creation,
        _senderEmail = senderEmail,
        _contentType = contentType,
        _refrenceDoctype = refrenceDoctype,
        _refrenceDoc = refrenceDoc,
        _workflowState = workflowState,
        _header = header,
        _possibleTransitions = possibleTransitions;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;
  bool hasContent() => _content != null;

  // "sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  set sender(String? val) => _sender = val;
  bool hasSender() => _sender != null;

  // "creation" field.
  String? _creation;
  String get creation => _creation ?? '';
  set creation(String? val) => _creation = val;
  bool hasCreation() => _creation != null;

  // "sender_email" field.
  String? _senderEmail;
  String get senderEmail => _senderEmail ?? '';
  set senderEmail(String? val) => _senderEmail = val;
  bool hasSenderEmail() => _senderEmail != null;

  // "content_type" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  set contentType(String? val) => _contentType = val;
  bool hasContentType() => _contentType != null;

  // "refrence_doctype" field.
  String? _refrenceDoctype;
  String get refrenceDoctype => _refrenceDoctype ?? '';
  set refrenceDoctype(String? val) => _refrenceDoctype = val;
  bool hasRefrenceDoctype() => _refrenceDoctype != null;

  // "refrence_doc" field.
  String? _refrenceDoc;
  String get refrenceDoc => _refrenceDoc ?? '';
  set refrenceDoc(String? val) => _refrenceDoc = val;
  bool hasRefrenceDoc() => _refrenceDoc != null;

  // "workflow_state" field.
  String? _workflowState;
  String get workflowState => _workflowState ?? '';
  set workflowState(String? val) => _workflowState = val;
  bool hasWorkflowState() => _workflowState != null;

  // "header" field.
  ChatMessageHeaderStruct? _header;
  ChatMessageHeaderStruct get header => _header ?? ChatMessageHeaderStruct();
  set header(ChatMessageHeaderStruct? val) => _header = val;
  void updateHeader(Function(ChatMessageHeaderStruct) updateFn) =>
      updateFn(_header ??= ChatMessageHeaderStruct());
  bool hasHeader() => _header != null;

  // "possible_transitions" field.
  List<TransitionsStruct>? _possibleTransitions;
  List<TransitionsStruct> get possibleTransitions =>
      _possibleTransitions ?? const [];
  set possibleTransitions(List<TransitionsStruct>? val) =>
      _possibleTransitions = val;
  void updatePossibleTransitions(Function(List<TransitionsStruct>) updateFn) =>
      updateFn(_possibleTransitions ??= []);
  bool hasPossibleTransitions() => _possibleTransitions != null;

  static ChatMessageStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        name: data['name'] as String?,
        content: data['content'] as String?,
        sender: data['sender'] as String?,
        creation: data['creation'] as String?,
        senderEmail: data['sender_email'] as String?,
        contentType: data['content_type'] as String?,
        refrenceDoctype: data['refrence_doctype'] as String?,
        refrenceDoc: data['refrence_doc'] as String?,
        workflowState: data['workflow_state'] as String?,
        header: ChatMessageHeaderStruct.maybeFromMap(data['header']),
        possibleTransitions: getStructList(
          data['possible_transitions'],
          TransitionsStruct.fromMap,
        ),
      );

  static ChatMessageStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ChatMessageStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'content': _content,
        'sender': _sender,
        'creation': _creation,
        'sender_email': _senderEmail,
        'content_type': _contentType,
        'refrence_doctype': _refrenceDoctype,
        'refrence_doc': _refrenceDoc,
        'workflow_state': _workflowState,
        'header': _header?.toMap(),
        'possible_transitions':
            _possibleTransitions?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'sender': serializeParam(
          _sender,
          ParamType.String,
        ),
        'creation': serializeParam(
          _creation,
          ParamType.String,
        ),
        'sender_email': serializeParam(
          _senderEmail,
          ParamType.String,
        ),
        'content_type': serializeParam(
          _contentType,
          ParamType.String,
        ),
        'refrence_doctype': serializeParam(
          _refrenceDoctype,
          ParamType.String,
        ),
        'refrence_doc': serializeParam(
          _refrenceDoc,
          ParamType.String,
        ),
        'workflow_state': serializeParam(
          _workflowState,
          ParamType.String,
        ),
        'header': serializeParam(
          _header,
          ParamType.DataStruct,
        ),
        'possible_transitions': serializeParam(
          _possibleTransitions,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ChatMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        sender: deserializeParam(
          data['sender'],
          ParamType.String,
          false,
        ),
        creation: deserializeParam(
          data['creation'],
          ParamType.String,
          false,
        ),
        senderEmail: deserializeParam(
          data['sender_email'],
          ParamType.String,
          false,
        ),
        contentType: deserializeParam(
          data['content_type'],
          ParamType.String,
          false,
        ),
        refrenceDoctype: deserializeParam(
          data['refrence_doctype'],
          ParamType.String,
          false,
        ),
        refrenceDoc: deserializeParam(
          data['refrence_doc'],
          ParamType.String,
          false,
        ),
        workflowState: deserializeParam(
          data['workflow_state'],
          ParamType.String,
          false,
        ),
        header: deserializeStructParam(
          data['header'],
          ParamType.DataStruct,
          false,
          structBuilder: ChatMessageHeaderStruct.fromSerializableMap,
        ),
        possibleTransitions: deserializeStructParam<TransitionsStruct>(
          data['possible_transitions'],
          ParamType.DataStruct,
          true,
          structBuilder: TransitionsStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ChatMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ChatMessageStruct &&
        name == other.name &&
        content == other.content &&
        sender == other.sender &&
        creation == other.creation &&
        senderEmail == other.senderEmail &&
        contentType == other.contentType &&
        refrenceDoctype == other.refrenceDoctype &&
        refrenceDoc == other.refrenceDoc &&
        workflowState == other.workflowState &&
        header == other.header &&
        listEquality.equals(possibleTransitions, other.possibleTransitions);
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        content,
        sender,
        creation,
        senderEmail,
        contentType,
        refrenceDoctype,
        refrenceDoc,
        workflowState,
        header,
        possibleTransitions
      ]);
}

ChatMessageStruct createChatMessageStruct({
  String? name,
  String? content,
  String? sender,
  String? creation,
  String? senderEmail,
  String? contentType,
  String? refrenceDoctype,
  String? refrenceDoc,
  String? workflowState,
  ChatMessageHeaderStruct? header,
}) =>
    ChatMessageStruct(
      name: name,
      content: content,
      sender: sender,
      creation: creation,
      senderEmail: senderEmail,
      contentType: contentType,
      refrenceDoctype: refrenceDoctype,
      refrenceDoc: refrenceDoc,
      workflowState: workflowState,
      header: header ?? ChatMessageHeaderStruct(),
    );
