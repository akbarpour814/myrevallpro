// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterStruct extends BaseStruct {
  FilterStruct({
    bool? anyLocation,
    LocationFilterStruct? locationFilter,
    bool? anySkill,
    SkillFilterStruct? skillFilter,
    bool? anyDate,
    DateTime? dateFilter,
    bool? anyTaskerGender,
    TaskerTypeFilterStruct? taskerTypeFilter,
    bool? onlyOpen,
    bool? anytasker,
    String? searchString,
  })  : _anyLocation = anyLocation,
        _locationFilter = locationFilter,
        _anySkill = anySkill,
        _skillFilter = skillFilter,
        _anyDate = anyDate,
        _dateFilter = dateFilter,
        _anyTaskerGender = anyTaskerGender,
        _taskerTypeFilter = taskerTypeFilter,
        _onlyOpen = onlyOpen,
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

  // "anyDate" field.
  bool? _anyDate;
  bool get anyDate => _anyDate ?? false;
  set anyDate(bool? val) => _anyDate = val;
  bool hasAnyDate() => _anyDate != null;

  // "dateFilter" field.
  DateTime? _dateFilter;
  DateTime? get dateFilter => _dateFilter;
  set dateFilter(DateTime? val) => _dateFilter = val;
  bool hasDateFilter() => _dateFilter != null;

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

  // "onlyOpen" field.
  bool? _onlyOpen;
  bool get onlyOpen => _onlyOpen ?? false;
  set onlyOpen(bool? val) => _onlyOpen = val;
  bool hasOnlyOpen() => _onlyOpen != null;

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

  static FilterStruct fromMap(Map<String, dynamic> data) => FilterStruct(
        anyLocation: data['anyLocation'] as bool?,
        locationFilter:
            LocationFilterStruct.maybeFromMap(data['locationFilter']),
        anySkill: data['anySkill'] as bool?,
        skillFilter: SkillFilterStruct.maybeFromMap(data['skillFilter']),
        anyDate: data['anyDate'] as bool?,
        dateFilter: data['dateFilter'] as DateTime?,
        anyTaskerGender: data['anyTaskerGender'] as bool?,
        taskerTypeFilter:
            TaskerTypeFilterStruct.maybeFromMap(data['taskerTypeFilter']),
        onlyOpen: data['onlyOpen'] as bool?,
        anytasker: data['anytasker'] as bool?,
        searchString: data['searchString'] as String?,
      );

  static FilterStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? FilterStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'anyLocation': _anyLocation,
        'locationFilter': _locationFilter?.toMap(),
        'anySkill': _anySkill,
        'skillFilter': _skillFilter?.toMap(),
        'anyDate': _anyDate,
        'dateFilter': _dateFilter,
        'anyTaskerGender': _anyTaskerGender,
        'taskerTypeFilter': _taskerTypeFilter?.toMap(),
        'onlyOpen': _onlyOpen,
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
        'anyDate': serializeParam(
          _anyDate,
          ParamType.bool,
        ),
        'dateFilter': serializeParam(
          _dateFilter,
          ParamType.DateTime,
        ),
        'anyTaskerGender': serializeParam(
          _anyTaskerGender,
          ParamType.bool,
        ),
        'taskerTypeFilter': serializeParam(
          _taskerTypeFilter,
          ParamType.DataStruct,
        ),
        'onlyOpen': serializeParam(
          _onlyOpen,
          ParamType.bool,
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

  static FilterStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterStruct(
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
        anyDate: deserializeParam(
          data['anyDate'],
          ParamType.bool,
          false,
        ),
        dateFilter: deserializeParam(
          data['dateFilter'],
          ParamType.DateTime,
          false,
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
        onlyOpen: deserializeParam(
          data['onlyOpen'],
          ParamType.bool,
          false,
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
  String toString() => 'FilterStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterStruct &&
        anyLocation == other.anyLocation &&
        locationFilter == other.locationFilter &&
        anySkill == other.anySkill &&
        skillFilter == other.skillFilter &&
        anyDate == other.anyDate &&
        dateFilter == other.dateFilter &&
        anyTaskerGender == other.anyTaskerGender &&
        taskerTypeFilter == other.taskerTypeFilter &&
        onlyOpen == other.onlyOpen &&
        anytasker == other.anytasker &&
        searchString == other.searchString;
  }

  @override
  int get hashCode => const ListEquality().hash([
        anyLocation,
        locationFilter,
        anySkill,
        skillFilter,
        anyDate,
        dateFilter,
        anyTaskerGender,
        taskerTypeFilter,
        onlyOpen,
        anytasker,
        searchString
      ]);
}

FilterStruct createFilterStruct({
  bool? anyLocation,
  LocationFilterStruct? locationFilter,
  bool? anySkill,
  SkillFilterStruct? skillFilter,
  bool? anyDate,
  DateTime? dateFilter,
  bool? anyTaskerGender,
  TaskerTypeFilterStruct? taskerTypeFilter,
  bool? onlyOpen,
  bool? anytasker,
  String? searchString,
}) =>
    FilterStruct(
      anyLocation: anyLocation,
      locationFilter: locationFilter ?? LocationFilterStruct(),
      anySkill: anySkill,
      skillFilter: skillFilter ?? SkillFilterStruct(),
      anyDate: anyDate,
      dateFilter: dateFilter,
      anyTaskerGender: anyTaskerGender,
      taskerTypeFilter: taskerTypeFilter ?? TaskerTypeFilterStruct(),
      onlyOpen: onlyOpen,
      anytasker: anytasker,
      searchString: searchString,
    );
