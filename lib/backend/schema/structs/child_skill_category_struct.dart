// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChildSkillCategoryStruct extends BaseStruct {
  ChildSkillCategoryStruct({
    String? skillCategoryName,
    String? name,
  })  : _skillCategoryName = skillCategoryName,
        _name = name;

  // "skill_category_name" field.
  String? _skillCategoryName;
  String get skillCategoryName => _skillCategoryName ?? '';
  set skillCategoryName(String? val) => _skillCategoryName = val;
  bool hasSkillCategoryName() => _skillCategoryName != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static ChildSkillCategoryStruct fromMap(Map<String, dynamic> data) =>
      ChildSkillCategoryStruct(
        skillCategoryName: data['skill_category_name'] as String?,
        name: data['name'] as String?,
      );

  static ChildSkillCategoryStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? ChildSkillCategoryStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'skill_category_name': _skillCategoryName,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill_category_name': serializeParam(
          _skillCategoryName,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ChildSkillCategoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ChildSkillCategoryStruct(
        skillCategoryName: deserializeParam(
          data['skill_category_name'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ChildSkillCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChildSkillCategoryStruct &&
        skillCategoryName == other.skillCategoryName &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([skillCategoryName, name]);
}

ChildSkillCategoryStruct createChildSkillCategoryStruct({
  String? skillCategoryName,
  String? name,
}) =>
    ChildSkillCategoryStruct(
      skillCategoryName: skillCategoryName,
      name: name,
    );
