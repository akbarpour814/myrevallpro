// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillFilterStruct extends BaseStruct {
  SkillFilterStruct({
    String? skillCategoryName,
    String? skillName,
    String? skillLevel,
    String? options,
  })  : _skillCategoryName = skillCategoryName,
        _skillName = skillName,
        _skillLevel = skillLevel,
        _options = options;

  // "skillCategoryName" field.
  String? _skillCategoryName;
  String get skillCategoryName => _skillCategoryName ?? '';
  set skillCategoryName(String? val) => _skillCategoryName = val;
  bool hasSkillCategoryName() => _skillCategoryName != null;

  // "skillName" field.
  String? _skillName;
  String get skillName => _skillName ?? '';
  set skillName(String? val) => _skillName = val;
  bool hasSkillName() => _skillName != null;

  // "skillLevel" field.
  String? _skillLevel;
  String get skillLevel => _skillLevel ?? '';
  set skillLevel(String? val) => _skillLevel = val;
  bool hasSkillLevel() => _skillLevel != null;

  // "options" field.
  String? _options;
  String get options => _options ?? '';
  set options(String? val) => _options = val;
  bool hasOptions() => _options != null;

  static SkillFilterStruct fromMap(Map<String, dynamic> data) =>
      SkillFilterStruct(
        skillCategoryName: data['skillCategoryName'] as String?,
        skillName: data['skillName'] as String?,
        skillLevel: data['skillLevel'] as String?,
        options: data['options'] as String?,
      );

  static SkillFilterStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SkillFilterStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'skillCategoryName': _skillCategoryName,
        'skillName': _skillName,
        'skillLevel': _skillLevel,
        'options': _options,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skillCategoryName': serializeParam(
          _skillCategoryName,
          ParamType.String,
        ),
        'skillName': serializeParam(
          _skillName,
          ParamType.String,
        ),
        'skillLevel': serializeParam(
          _skillLevel,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
        ),
      }.withoutNulls;

  static SkillFilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      SkillFilterStruct(
        skillCategoryName: deserializeParam(
          data['skillCategoryName'],
          ParamType.String,
          false,
        ),
        skillName: deserializeParam(
          data['skillName'],
          ParamType.String,
          false,
        ),
        skillLevel: deserializeParam(
          data['skillLevel'],
          ParamType.String,
          false,
        ),
        options: deserializeParam(
          data['options'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SkillFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SkillFilterStruct &&
        skillCategoryName == other.skillCategoryName &&
        skillName == other.skillName &&
        skillLevel == other.skillLevel &&
        options == other.options;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([skillCategoryName, skillName, skillLevel, options]);
}

SkillFilterStruct createSkillFilterStruct({
  String? skillCategoryName,
  String? skillName,
  String? skillLevel,
  String? options,
}) =>
    SkillFilterStruct(
      skillCategoryName: skillCategoryName,
      skillName: skillName,
      skillLevel: skillLevel,
      options: options,
    );
