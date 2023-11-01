// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillCategoryStruct extends BaseStruct {
  SkillCategoryStruct({
    String? skillCategoryName,
    String? icon,
    String? description,
    String? amendedFrom,
    List<SkillOptionsStruct>? skillOptions,
    List<SkillStruct>? skills,
  })  : _skillCategoryName = skillCategoryName,
        _icon = icon,
        _description = description,
        _amendedFrom = amendedFrom,
        _skillOptions = skillOptions,
        _skills = skills;

  // "skill_category_name" field.
  String? _skillCategoryName;
  String get skillCategoryName => _skillCategoryName ?? '';
  set skillCategoryName(String? val) => _skillCategoryName = val;
  bool hasSkillCategoryName() => _skillCategoryName != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;
  bool hasIcon() => _icon != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "amended_from" field.
  String? _amendedFrom;
  String get amendedFrom => _amendedFrom ?? '';
  set amendedFrom(String? val) => _amendedFrom = val;
  bool hasAmendedFrom() => _amendedFrom != null;

  // "skill_options" field.
  List<SkillOptionsStruct>? _skillOptions;
  List<SkillOptionsStruct> get skillOptions => _skillOptions ?? const [];
  set skillOptions(List<SkillOptionsStruct>? val) => _skillOptions = val;
  void updateSkillOptions(Function(List<SkillOptionsStruct>) updateFn) =>
      updateFn(_skillOptions ??= []);
  bool hasSkillOptions() => _skillOptions != null;

  // "skills" field.
  List<SkillStruct>? _skills;
  List<SkillStruct> get skills => _skills ?? const [];
  set skills(List<SkillStruct>? val) => _skills = val;
  void updateSkills(Function(List<SkillStruct>) updateFn) =>
      updateFn(_skills ??= []);
  bool hasSkills() => _skills != null;

  static SkillCategoryStruct fromMap(Map<String, dynamic> data) =>
      SkillCategoryStruct(
        skillCategoryName: data['skill_category_name'] as String?,
        icon: data['icon'] as String?,
        description: data['description'] as String?,
        amendedFrom: data['amended_from'] as String?,
        skillOptions: getStructList(
          data['skill_options'],
          SkillOptionsStruct.fromMap,
        ),
        skills: getStructList(
          data['skills'],
          SkillStruct.fromMap,
        ),
      );

  static SkillCategoryStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SkillCategoryStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'skill_category_name': _skillCategoryName,
        'icon': _icon,
        'description': _description,
        'amended_from': _amendedFrom,
        'skill_options': _skillOptions?.map((e) => e.toMap()).toList(),
        'skills': _skills?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill_category_name': serializeParam(
          _skillCategoryName,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'amended_from': serializeParam(
          _amendedFrom,
          ParamType.String,
        ),
        'skill_options': serializeParam(
          _skillOptions,
          ParamType.DataStruct,
          true,
        ),
        'skills': serializeParam(
          _skills,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static SkillCategoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      SkillCategoryStruct(
        skillCategoryName: deserializeParam(
          data['skill_category_name'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        amendedFrom: deserializeParam(
          data['amended_from'],
          ParamType.String,
          false,
        ),
        skillOptions: deserializeStructParam<SkillOptionsStruct>(
          data['skill_options'],
          ParamType.DataStruct,
          true,
          structBuilder: SkillOptionsStruct.fromSerializableMap,
        ),
        skills: deserializeStructParam<SkillStruct>(
          data['skills'],
          ParamType.DataStruct,
          true,
          structBuilder: SkillStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SkillCategoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SkillCategoryStruct &&
        skillCategoryName == other.skillCategoryName &&
        icon == other.icon &&
        description == other.description &&
        amendedFrom == other.amendedFrom &&
        listEquality.equals(skillOptions, other.skillOptions) &&
        listEquality.equals(skills, other.skills);
  }

  @override
  int get hashCode => const ListEquality().hash([
        skillCategoryName,
        icon,
        description,
        amendedFrom,
        skillOptions,
        skills
      ]);
}

SkillCategoryStruct createSkillCategoryStruct({
  String? skillCategoryName,
  String? icon,
  String? description,
  String? amendedFrom,
}) =>
    SkillCategoryStruct(
      skillCategoryName: skillCategoryName,
      icon: icon,
      description: description,
      amendedFrom: amendedFrom,
    );
