// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserServiceStruct extends BaseStruct {
  UserServiceStruct({
    String? skillCategoryName,
    String? skillName,
    String? skillLevel,
    String? customerProfile,
    String? icon,
    List<SkillStruct>? skills,
    List<SkillOptionsStruct>? customerSkillOptions,
    int? name,
  })  : _skillCategoryName = skillCategoryName,
        _skillName = skillName,
        _skillLevel = skillLevel,
        _customerProfile = customerProfile,
        _icon = icon,
        _skills = skills,
        _customerSkillOptions = customerSkillOptions,
        _name = name;

  // "skill_category_name" field.
  String? _skillCategoryName;
  String get skillCategoryName => _skillCategoryName ?? '';
  set skillCategoryName(String? val) => _skillCategoryName = val;
  bool hasSkillCategoryName() => _skillCategoryName != null;

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

  // "customer_profile" field.
  String? _customerProfile;
  String get customerProfile => _customerProfile ?? '';
  set customerProfile(String? val) => _customerProfile = val;
  bool hasCustomerProfile() => _customerProfile != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;
  bool hasIcon() => _icon != null;

  // "skills" field.
  List<SkillStruct>? _skills;
  List<SkillStruct> get skills => _skills ?? const [];
  set skills(List<SkillStruct>? val) => _skills = val;
  void updateSkills(Function(List<SkillStruct>) updateFn) =>
      updateFn(_skills ??= []);
  bool hasSkills() => _skills != null;

  // "customer_skill_options" field.
  List<SkillOptionsStruct>? _customerSkillOptions;
  List<SkillOptionsStruct> get customerSkillOptions =>
      _customerSkillOptions ?? const [];
  set customerSkillOptions(List<SkillOptionsStruct>? val) =>
      _customerSkillOptions = val;
  void updateCustomerSkillOptions(
          Function(List<SkillOptionsStruct>) updateFn) =>
      updateFn(_customerSkillOptions ??= []);
  bool hasCustomerSkillOptions() => _customerSkillOptions != null;

  // "name" field.
  int? _name;
  int get name => _name ?? 0;
  set name(int? val) => _name = val;
  void incrementName(int amount) => _name = name + amount;
  bool hasName() => _name != null;

  static UserServiceStruct fromMap(Map<String, dynamic> data) =>
      UserServiceStruct(
        skillCategoryName: data['skill_category_name'] as String?,
        skillName: data['skill_name'] as String?,
        skillLevel: data['skill_level'] as String?,
        customerProfile: data['customer_profile'] as String?,
        icon: data['icon'] as String?,
        skills: getStructList(
          data['skills'],
          SkillStruct.fromMap,
        ),
        customerSkillOptions: getStructList(
          data['customer_skill_options'],
          SkillOptionsStruct.fromMap,
        ),
        name: castToType<int>(data['name']),
      );

  static UserServiceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserServiceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'skill_category_name': _skillCategoryName,
        'skill_name': _skillName,
        'skill_level': _skillLevel,
        'customer_profile': _customerProfile,
        'icon': _icon,
        'skills': _skills?.map((e) => e.toMap()).toList(),
        'customer_skill_options':
            _customerSkillOptions?.map((e) => e.toMap()).toList(),
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill_category_name': serializeParam(
          _skillCategoryName,
          ParamType.String,
        ),
        'skill_name': serializeParam(
          _skillName,
          ParamType.String,
        ),
        'skill_level': serializeParam(
          _skillLevel,
          ParamType.String,
        ),
        'customer_profile': serializeParam(
          _customerProfile,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'skills': serializeParam(
          _skills,
          ParamType.DataStruct,
          true,
        ),
        'customer_skill_options': serializeParam(
          _customerSkillOptions,
          ParamType.DataStruct,
          true,
        ),
        'name': serializeParam(
          _name,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserServiceStruct(
        skillCategoryName: deserializeParam(
          data['skill_category_name'],
          ParamType.String,
          false,
        ),
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
        customerProfile: deserializeParam(
          data['customer_profile'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        skills: deserializeStructParam<SkillStruct>(
          data['skills'],
          ParamType.DataStruct,
          true,
          structBuilder: SkillStruct.fromSerializableMap,
        ),
        customerSkillOptions: deserializeStructParam<SkillOptionsStruct>(
          data['customer_skill_options'],
          ParamType.DataStruct,
          true,
          structBuilder: SkillOptionsStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserServiceStruct &&
        skillCategoryName == other.skillCategoryName &&
        skillName == other.skillName &&
        skillLevel == other.skillLevel &&
        customerProfile == other.customerProfile &&
        icon == other.icon &&
        listEquality.equals(skills, other.skills) &&
        listEquality.equals(customerSkillOptions, other.customerSkillOptions) &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([
        skillCategoryName,
        skillName,
        skillLevel,
        customerProfile,
        icon,
        skills,
        customerSkillOptions,
        name
      ]);
}

UserServiceStruct createUserServiceStruct({
  String? skillCategoryName,
  String? skillName,
  String? skillLevel,
  String? customerProfile,
  String? icon,
  int? name,
}) =>
    UserServiceStruct(
      skillCategoryName: skillCategoryName,
      skillName: skillName,
      skillLevel: skillLevel,
      customerProfile: customerProfile,
      icon: icon,
      name: name,
    );
