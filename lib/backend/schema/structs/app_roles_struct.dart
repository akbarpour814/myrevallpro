// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppRolesStruct extends BaseStruct {
  AppRolesStruct({
    String? roleProfileName,
    String? message,
    String? addSkillsText,
    int? skillsLimit,
  })  : _roleProfileName = roleProfileName,
        _message = message,
        _addSkillsText = addSkillsText,
        _skillsLimit = skillsLimit;

  // "role_profile_name" field.
  String? _roleProfileName;
  String get roleProfileName => _roleProfileName ?? '';
  set roleProfileName(String? val) => _roleProfileName = val;
  bool hasRoleProfileName() => _roleProfileName != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;
  bool hasMessage() => _message != null;

  // "add_skills_text" field.
  String? _addSkillsText;
  String get addSkillsText => _addSkillsText ?? '';
  set addSkillsText(String? val) => _addSkillsText = val;
  bool hasAddSkillsText() => _addSkillsText != null;

  // "skills_limit" field.
  int? _skillsLimit;
  int get skillsLimit => _skillsLimit ?? 0;
  set skillsLimit(int? val) => _skillsLimit = val;
  void incrementSkillsLimit(int amount) => _skillsLimit = skillsLimit + amount;
  bool hasSkillsLimit() => _skillsLimit != null;

  static AppRolesStruct fromMap(Map<String, dynamic> data) => AppRolesStruct(
        roleProfileName: data['role_profile_name'] as String?,
        message: data['message'] as String?,
        addSkillsText: data['add_skills_text'] as String?,
        skillsLimit: castToType<int>(data['skills_limit']),
      );

  static AppRolesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AppRolesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'role_profile_name': _roleProfileName,
        'message': _message,
        'add_skills_text': _addSkillsText,
        'skills_limit': _skillsLimit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'role_profile_name': serializeParam(
          _roleProfileName,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'add_skills_text': serializeParam(
          _addSkillsText,
          ParamType.String,
        ),
        'skills_limit': serializeParam(
          _skillsLimit,
          ParamType.int,
        ),
      }.withoutNulls;

  static AppRolesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AppRolesStruct(
        roleProfileName: deserializeParam(
          data['role_profile_name'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        addSkillsText: deserializeParam(
          data['add_skills_text'],
          ParamType.String,
          false,
        ),
        skillsLimit: deserializeParam(
          data['skills_limit'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AppRolesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppRolesStruct &&
        roleProfileName == other.roleProfileName &&
        message == other.message &&
        addSkillsText == other.addSkillsText &&
        skillsLimit == other.skillsLimit;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([roleProfileName, message, addSkillsText, skillsLimit]);
}

AppRolesStruct createAppRolesStruct({
  String? roleProfileName,
  String? message,
  String? addSkillsText,
  int? skillsLimit,
}) =>
    AppRolesStruct(
      roleProfileName: roleProfileName,
      message: message,
      addSkillsText: addSkillsText,
      skillsLimit: skillsLimit,
    );
