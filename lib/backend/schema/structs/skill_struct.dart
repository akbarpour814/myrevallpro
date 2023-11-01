// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillStruct extends BaseStruct {
  SkillStruct({
    String? skill,
    String? skillName,
  })  : _skill = skill,
        _skillName = skillName;

  // "skill" field.
  String? _skill;
  String get skill => _skill ?? '';
  set skill(String? val) => _skill = val;
  bool hasSkill() => _skill != null;

  // "skill_name" field.
  String? _skillName;
  String get skillName => _skillName ?? '';
  set skillName(String? val) => _skillName = val;
  bool hasSkillName() => _skillName != null;

  static SkillStruct fromMap(Map<String, dynamic> data) => SkillStruct(
        skill: data['skill'] as String?,
        skillName: data['skill_name'] as String?,
      );

  static SkillStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SkillStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'skill': _skill,
        'skill_name': _skillName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill': serializeParam(
          _skill,
          ParamType.String,
        ),
        'skill_name': serializeParam(
          _skillName,
          ParamType.String,
        ),
      }.withoutNulls;

  static SkillStruct fromSerializableMap(Map<String, dynamic> data) =>
      SkillStruct(
        skill: deserializeParam(
          data['skill'],
          ParamType.String,
          false,
        ),
        skillName: deserializeParam(
          data['skill_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SkillStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SkillStruct &&
        skill == other.skill &&
        skillName == other.skillName;
  }

  @override
  int get hashCode => const ListEquality().hash([skill, skillName]);
}

SkillStruct createSkillStruct({
  String? skill,
  String? skillName,
}) =>
    SkillStruct(
      skill: skill,
      skillName: skillName,
    );
