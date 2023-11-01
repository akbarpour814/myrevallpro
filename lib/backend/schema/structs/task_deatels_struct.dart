// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskDeatelsStruct extends BaseStruct {
  TaskDeatelsStruct({
    String? skillName,
    String? skillLevel,
    List<String>? languages,
    String? description,
    String? file,
    bool? isOnline,
  })  : _skillName = skillName,
        _skillLevel = skillLevel,
        _languages = languages,
        _description = description,
        _file = file,
        _isOnline = isOnline;

  // "skill_name" field.
  String? _skillName;
  String get skillName => _skillName ?? '';
  set skillName(String? val) => _skillName = val;
  bool hasSkillName() => _skillName != null;

  // "skill_level" field.
  String? _skillLevel;
  String get skillLevel => _skillLevel ?? '';
  set skillLevel(String? val) => _skillLevel = val;
  bool hasSkillLevel() => _skillLevel != null;

  // "languages" field.
  List<String>? _languages;
  List<String> get languages => _languages ?? const [];
  set languages(List<String>? val) => _languages = val;
  void updateLanguages(Function(List<String>) updateFn) =>
      updateFn(_languages ??= []);
  bool hasLanguages() => _languages != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  set file(String? val) => _file = val;
  bool hasFile() => _file != null;

  // "is_online" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  set isOnline(bool? val) => _isOnline = val;
  bool hasIsOnline() => _isOnline != null;

  static TaskDeatelsStruct fromMap(Map<String, dynamic> data) =>
      TaskDeatelsStruct(
        skillName: data['skill_name'] as String?,
        skillLevel: data['skill_level'] as String?,
        languages: getDataList(data['languages']),
        description: data['description'] as String?,
        file: data['file'] as String?,
        isOnline: data['is_online'] as bool?,
      );

  static TaskDeatelsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskDeatelsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'skill_name': _skillName,
        'skill_level': _skillLevel,
        'languages': _languages,
        'description': _description,
        'file': _file,
        'is_online': _isOnline,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill_name': serializeParam(
          _skillName,
          ParamType.String,
        ),
        'skill_level': serializeParam(
          _skillLevel,
          ParamType.String,
        ),
        'languages': serializeParam(
          _languages,
          ParamType.String,
          true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'file': serializeParam(
          _file,
          ParamType.String,
        ),
        'is_online': serializeParam(
          _isOnline,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TaskDeatelsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskDeatelsStruct(
        skillName: deserializeParam(
          data['skill_name'],
          ParamType.String,
          false,
        ),
        skillLevel: deserializeParam(
          data['skill_level'],
          ParamType.String,
          false,
        ),
        languages: deserializeParam<String>(
          data['languages'],
          ParamType.String,
          true,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        file: deserializeParam(
          data['file'],
          ParamType.String,
          false,
        ),
        isOnline: deserializeParam(
          data['is_online'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TaskDeatelsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TaskDeatelsStruct &&
        skillName == other.skillName &&
        skillLevel == other.skillLevel &&
        listEquality.equals(languages, other.languages) &&
        description == other.description &&
        file == other.file &&
        isOnline == other.isOnline;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([skillName, skillLevel, languages, description, file, isOnline]);
}

TaskDeatelsStruct createTaskDeatelsStruct({
  String? skillName,
  String? skillLevel,
  String? description,
  String? file,
  bool? isOnline,
}) =>
    TaskDeatelsStruct(
      skillName: skillName,
      skillLevel: skillLevel,
      description: description,
      file: file,
      isOnline: isOnline,
    );
