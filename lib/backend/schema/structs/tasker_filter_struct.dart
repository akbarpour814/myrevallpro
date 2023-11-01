// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskerFilterStruct extends BaseStruct {
  TaskerFilterStruct({
    bool? anyLocation,
    LocationFilterStruct? locationFilter,
    bool? anySkill,
    SkillFilterStruct? skillFilter,
    bool? anyTaskerGender,
    TaskerTypeFilterStruct? taskerTypeFilter,
    String? name,
    List<String>? names,
    bool? anytasker,
    String? searchString,
  })  : _anyLocation = anyLocation,
        _locationFilter = locationFilter,
        _anySkill = anySkill,
        _skillFilter = skillFilter,
        _anyTaskerGender = anyTaskerGender,
        _taskerTypeFilter = taskerTypeFilter,
        _name = name,
        _names = names,
        _anytasker = anytasker,
        _searchString = searchString;

  // "anyLocation" field.
  bool? _anyLocation;
  bool get anyLocation => _anyLocation ?? false;
  set anyLocation(bool? val) => _anyLocation = val;
  bool hasAnyLocation() => _anyLocation != null;

  // "locationFilter" field.
  LocationFilterStruct? _locationFilter;
  LocationFilterStruct get locationFilter =>
      _locationFilter ?? LocationFilterStruct();
  set locationFilter(LocationFilterStruct? val) => _locationFilter = val;
  void updateLocationFilter(Function(LocationFilterStruct) updateFn) =>
      updateFn(_locationFilter ??= LocationFilterStruct());
  bool hasLocationFilter() => _locationFilter != null;

  // "anySkill" field.
  bool? _anySkill;
  bool get anySkill => _anySkill ?? false;
  set anySkill(bool? val) => _anySkill = val;
  bool hasAnySkill() => _anySkill != null;

  // "skillFilter" field.
  SkillFilterStruct? _skillFilter;
  SkillFilterStruct get skillFilter => _skillFilter ?? SkillFilterStruct();
  set skillFilter(SkillFilterStruct? val) => _skillFilter = val;
  void updateSkillFilter(Function(SkillFilterStruct) updateFn) =>
      updateFn(_skillFilter ??= SkillFilterStruct());
  bool hasSkillFilter() => _skillFilter != null;

  // "anyTaskerGender" field.
  bool? _anyTaskerGender;
  bool get anyTaskerGender => _anyTaskerGender ?? false;
  set anyTaskerGender(bool? val) => _anyTaskerGender = val;
  bool hasAnyTaskerGender() => _anyTaskerGender != null;

  // "taskerTypeFilter" field.
  TaskerTypeFilterStruct? _taskerTypeFilter;
  TaskerTypeFilterStruct get taskerTypeFilter =>
      _taskerTypeFilter ?? TaskerTypeFilterStruct();
  set taskerTypeFilter(TaskerTypeFilterStruct? val) => _taskerTypeFilter = val;
  void updateTaskerTypeFilter(Function(TaskerTypeFilterStruct) updateFn) =>
      updateFn(_taskerTypeFilter ??= TaskerTypeFilterStruct());
  bool hasTaskerTypeFilter() => _taskerTypeFilter != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "names" field.
  List<String>? _names;
  List<String> get names => _names ?? const [];
  set names(List<String>? val) => _names = val;
  void updateNames(Function(List<String>) updateFn) => updateFn(_names ??= []);
  bool hasNames() => _names != null;

  // "anytasker" field.
  bool? _anytasker;
  bool get anytasker => _anytasker ?? false;
  set anytasker(bool? val) => _anytasker = val;
  bool hasAnytasker() => _anytasker != null;

  // "searchString" field.
  String? _searchString;
  String get searchString => _searchString ?? '';
  set searchString(String? val) => _searchString = val;
  bool hasSearchString() => _searchString != null;

  static TaskerFilterStruct fromMap(Map<String, dynamic> data) =>
      TaskerFilterStruct(
        anyLocation: data['anyLocation'] as bool?,
        locationFilter:
            LocationFilterStruct.maybeFromMap(data['locationFilter']),
        anySkill: data['anySkill'] as bool?,
        skillFilter: SkillFilterStruct.maybeFromMap(data['skillFilter']),
        anyTaskerGender: data['anyTaskerGender'] as bool?,
        taskerTypeFilter:
            TaskerTypeFilterStruct.maybeFromMap(data['taskerTypeFilter']),
        name: data['name'] as String?,
        names: getDataList(data['names']),
        anytasker: data['anytasker'] as bool?,
        searchString: data['searchString'] as String?,
      );

  static TaskerFilterStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskerFilterStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'anyLocation': _anyLocation,
        'locationFilter': _locationFilter?.toMap(),
        'anySkill': _anySkill,
        'skillFilter': _skillFilter?.toMap(),
        'anyTaskerGender': _anyTaskerGender,
        'taskerTypeFilter': _taskerTypeFilter?.toMap(),
        'name': _name,
        'names': _names,
        'anytasker': _anytasker,
        'searchString': _searchString,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'anyLocation': serializeParam(
          _anyLocation,
          ParamType.bool,
        ),
        'locationFilter': serializeParam(
          _locationFilter,
          ParamType.DataStruct,
        ),
        'anySkill': serializeParam(
          _anySkill,
          ParamType.bool,
        ),
        'skillFilter': serializeParam(
          _skillFilter,
          ParamType.DataStruct,
        ),
        'anyTaskerGender': serializeParam(
          _anyTaskerGender,
          ParamType.bool,
        ),
        'taskerTypeFilter': serializeParam(
          _taskerTypeFilter,
          ParamType.DataStruct,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'names': serializeParam(
          _names,
          ParamType.String,
          true,
        ),
        'anytasker': serializeParam(
          _anytasker,
          ParamType.bool,
        ),
        'searchString': serializeParam(
          _searchString,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskerFilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskerFilterStruct(
        anyLocation: deserializeParam(
          data['anyLocation'],
          ParamType.bool,
          false,
        ),
        locationFilter: deserializeStructParam(
          data['locationFilter'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationFilterStruct.fromSerializableMap,
        ),
        anySkill: deserializeParam(
          data['anySkill'],
          ParamType.bool,
          false,
        ),
        skillFilter: deserializeStructParam(
          data['skillFilter'],
          ParamType.DataStruct,
          false,
          structBuilder: SkillFilterStruct.fromSerializableMap,
        ),
        anyTaskerGender: deserializeParam(
          data['anyTaskerGender'],
          ParamType.bool,
          false,
        ),
        taskerTypeFilter: deserializeStructParam(
          data['taskerTypeFilter'],
          ParamType.DataStruct,
          false,
          structBuilder: TaskerTypeFilterStruct.fromSerializableMap,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        names: deserializeParam<String>(
          data['names'],
          ParamType.String,
          true,
        ),
        anytasker: deserializeParam(
          data['anytasker'],
          ParamType.bool,
          false,
        ),
        searchString: deserializeParam(
          data['searchString'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskerFilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TaskerFilterStruct &&
        anyLocation == other.anyLocation &&
        locationFilter == other.locationFilter &&
        anySkill == other.anySkill &&
        skillFilter == other.skillFilter &&
        anyTaskerGender == other.anyTaskerGender &&
        taskerTypeFilter == other.taskerTypeFilter &&
        name == other.name &&
        listEquality.equals(names, other.names) &&
        anytasker == other.anytasker &&
        searchString == other.searchString;
  }

  @override
  int get hashCode => const ListEquality().hash([
        anyLocation,
        locationFilter,
        anySkill,
        skillFilter,
        anyTaskerGender,
        taskerTypeFilter,
        name,
        names,
        anytasker,
        searchString
      ]);
}

TaskerFilterStruct createTaskerFilterStruct({
  bool? anyLocation,
  LocationFilterStruct? locationFilter,
  bool? anySkill,
  SkillFilterStruct? skillFilter,
  bool? anyTaskerGender,
  TaskerTypeFilterStruct? taskerTypeFilter,
  String? name,
  bool? anytasker,
  String? searchString,
}) =>
    TaskerFilterStruct(
      anyLocation: anyLocation,
      locationFilter: locationFilter ?? LocationFilterStruct(),
      anySkill: anySkill,
      skillFilter: skillFilter ?? SkillFilterStruct(),
      anyTaskerGender: anyTaskerGender,
      taskerTypeFilter: taskerTypeFilter ?? TaskerTypeFilterStruct(),
      name: name,
      anytasker: anytasker,
      searchString: searchString,
    );
