// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CrateTaskStruct extends BaseStruct {
  CrateTaskStruct({
    int? skill,
    List<String>? language,
    String? description,
    int? skillCategory,
    String? address,
    double? latitude,
    double? longitude,
    DateTime? startDate,
    DateTime? startTime,
    DateTime? startRangeTime,
    bool? isExactStartTime,
    int? numberOfHoursPerSession,
    bool? isRepeatable,
    String? repeatType,
    String? endDateType,
    DateTime? endOn,
    int? endAfterNumberOfSessions,
    String? repeatEvery,
    String? monthlyRepeatType,
    String? taskerGender,
    String? taskerAgeRange,
    bool? identified,
    int? yearsOfExperience,
    bool? insurance,
    String? driverLicense,
    String? maxDistance,
    int? poster,
    String? skillLevel,
    String? file,
    String? fullAddress,
    List<String>? preferredDays,
  })  : _skill = skill,
        _language = language,
        _description = description,
        _skillCategory = skillCategory,
        _address = address,
        _latitude = latitude,
        _longitude = longitude,
        _startDate = startDate,
        _startTime = startTime,
        _startRangeTime = startRangeTime,
        _isExactStartTime = isExactStartTime,
        _numberOfHoursPerSession = numberOfHoursPerSession,
        _isRepeatable = isRepeatable,
        _repeatType = repeatType,
        _endDateType = endDateType,
        _endOn = endOn,
        _endAfterNumberOfSessions = endAfterNumberOfSessions,
        _repeatEvery = repeatEvery,
        _monthlyRepeatType = monthlyRepeatType,
        _taskerGender = taskerGender,
        _taskerAgeRange = taskerAgeRange,
        _identified = identified,
        _yearsOfExperience = yearsOfExperience,
        _insurance = insurance,
        _driverLicense = driverLicense,
        _maxDistance = maxDistance,
        _poster = poster,
        _skillLevel = skillLevel,
        _file = file,
        _fullAddress = fullAddress,
        _preferredDays = preferredDays;

  // "skill" field.
  int? _skill;
  int get skill => _skill ?? 0;
  set skill(int? val) => _skill = val;
  void incrementSkill(int amount) => _skill = skill + amount;
  bool hasSkill() => _skill != null;

  // "Language" field.
  List<String>? _language;
  List<String> get language => _language ?? const [];
  set language(List<String>? val) => _language = val;
  void updateLanguage(Function(List<String>) updateFn) =>
      updateFn(_language ??= []);
  bool hasLanguage() => _language != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "skill_category" field.
  int? _skillCategory;
  int get skillCategory => _skillCategory ?? 0;
  set skillCategory(int? val) => _skillCategory = val;
  void incrementSkillCategory(int amount) =>
      _skillCategory = skillCategory + amount;
  bool hasSkillCategory() => _skillCategory != null;

  // "Address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;
  bool hasAddress() => _address != null;

  // "latitude" field.
  double? _latitude;
  double get latitude => _latitude ?? 0.0;
  set latitude(double? val) => _latitude = val;
  void incrementLatitude(double amount) => _latitude = latitude + amount;
  bool hasLatitude() => _latitude != null;

  // "longitude" field.
  double? _longitude;
  double get longitude => _longitude ?? 0.0;
  set longitude(double? val) => _longitude = val;
  void incrementLongitude(double amount) => _longitude = longitude + amount;
  bool hasLongitude() => _longitude != null;

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "start_range_time" field.
  DateTime? _startRangeTime;
  DateTime? get startRangeTime => _startRangeTime;
  set startRangeTime(DateTime? val) => _startRangeTime = val;
  bool hasStartRangeTime() => _startRangeTime != null;

  // "is_exact_start_time" field.
  bool? _isExactStartTime;
  bool get isExactStartTime => _isExactStartTime ?? false;
  set isExactStartTime(bool? val) => _isExactStartTime = val;
  bool hasIsExactStartTime() => _isExactStartTime != null;

  // "number_of_hours_per_session" field.
  int? _numberOfHoursPerSession;
  int get numberOfHoursPerSession => _numberOfHoursPerSession ?? 0;
  set numberOfHoursPerSession(int? val) => _numberOfHoursPerSession = val;
  void incrementNumberOfHoursPerSession(int amount) =>
      _numberOfHoursPerSession = numberOfHoursPerSession + amount;
  bool hasNumberOfHoursPerSession() => _numberOfHoursPerSession != null;

  // "is_repeatable" field.
  bool? _isRepeatable;
  bool get isRepeatable => _isRepeatable ?? false;
  set isRepeatable(bool? val) => _isRepeatable = val;
  bool hasIsRepeatable() => _isRepeatable != null;

  // "repeat_type" field.
  String? _repeatType;
  String get repeatType => _repeatType ?? '';
  set repeatType(String? val) => _repeatType = val;
  bool hasRepeatType() => _repeatType != null;

  // "end_date_type" field.
  String? _endDateType;
  String get endDateType => _endDateType ?? '';
  set endDateType(String? val) => _endDateType = val;
  bool hasEndDateType() => _endDateType != null;

  // "end_on" field.
  DateTime? _endOn;
  DateTime? get endOn => _endOn;
  set endOn(DateTime? val) => _endOn = val;
  bool hasEndOn() => _endOn != null;

  // "end_after_number_of_sessions" field.
  int? _endAfterNumberOfSessions;
  int get endAfterNumberOfSessions => _endAfterNumberOfSessions ?? 0;
  set endAfterNumberOfSessions(int? val) => _endAfterNumberOfSessions = val;
  void incrementEndAfterNumberOfSessions(int amount) =>
      _endAfterNumberOfSessions = endAfterNumberOfSessions + amount;
  bool hasEndAfterNumberOfSessions() => _endAfterNumberOfSessions != null;

  // "repeat_every" field.
  String? _repeatEvery;
  String get repeatEvery => _repeatEvery ?? '';
  set repeatEvery(String? val) => _repeatEvery = val;
  bool hasRepeatEvery() => _repeatEvery != null;

  // "monthly_repeat_type" field.
  String? _monthlyRepeatType;
  String get monthlyRepeatType => _monthlyRepeatType ?? '';
  set monthlyRepeatType(String? val) => _monthlyRepeatType = val;
  bool hasMonthlyRepeatType() => _monthlyRepeatType != null;

  // "tasker_gender" field.
  String? _taskerGender;
  String get taskerGender => _taskerGender ?? '';
  set taskerGender(String? val) => _taskerGender = val;
  bool hasTaskerGender() => _taskerGender != null;

  // "tasker_age_range" field.
  String? _taskerAgeRange;
  String get taskerAgeRange => _taskerAgeRange ?? '';
  set taskerAgeRange(String? val) => _taskerAgeRange = val;
  bool hasTaskerAgeRange() => _taskerAgeRange != null;

  // "identified" field.
  bool? _identified;
  bool get identified => _identified ?? false;
  set identified(bool? val) => _identified = val;
  bool hasIdentified() => _identified != null;

  // "years_of_experience" field.
  int? _yearsOfExperience;
  int get yearsOfExperience => _yearsOfExperience ?? 0;
  set yearsOfExperience(int? val) => _yearsOfExperience = val;
  void incrementYearsOfExperience(int amount) =>
      _yearsOfExperience = yearsOfExperience + amount;
  bool hasYearsOfExperience() => _yearsOfExperience != null;

  // "insurance" field.
  bool? _insurance;
  bool get insurance => _insurance ?? false;
  set insurance(bool? val) => _insurance = val;
  bool hasInsurance() => _insurance != null;

  // "driver_license" field.
  String? _driverLicense;
  String get driverLicense => _driverLicense ?? '';
  set driverLicense(String? val) => _driverLicense = val;
  bool hasDriverLicense() => _driverLicense != null;

  // "max_distance" field.
  String? _maxDistance;
  String get maxDistance => _maxDistance ?? '';
  set maxDistance(String? val) => _maxDistance = val;
  bool hasMaxDistance() => _maxDistance != null;

  // "poster" field.
  int? _poster;
  int get poster => _poster ?? 0;
  set poster(int? val) => _poster = val;
  void incrementPoster(int amount) => _poster = poster + amount;
  bool hasPoster() => _poster != null;

  // "skill_level" field.
  String? _skillLevel;
  String get skillLevel => _skillLevel ?? '';
  set skillLevel(String? val) => _skillLevel = val;
  bool hasSkillLevel() => _skillLevel != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  set file(String? val) => _file = val;
  bool hasFile() => _file != null;

  // "full_address" field.
  String? _fullAddress;
  String get fullAddress => _fullAddress ?? '';
  set fullAddress(String? val) => _fullAddress = val;
  bool hasFullAddress() => _fullAddress != null;

  // "preferred_days" field.
  List<String>? _preferredDays;
  List<String> get preferredDays => _preferredDays ?? const [];
  set preferredDays(List<String>? val) => _preferredDays = val;
  void updatePreferredDays(Function(List<String>) updateFn) =>
      updateFn(_preferredDays ??= []);
  bool hasPreferredDays() => _preferredDays != null;

  static CrateTaskStruct fromMap(Map<String, dynamic> data) => CrateTaskStruct(
        skill: castToType<int>(data['skill']),
        language: getDataList(data['Language']),
        description: data['Description'] as String?,
        skillCategory: castToType<int>(data['skill_category']),
        address: data['Address'] as String?,
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        startDate: data['start_date'] as DateTime?,
        startTime: data['start_time'] as DateTime?,
        startRangeTime: data['start_range_time'] as DateTime?,
        isExactStartTime: data['is_exact_start_time'] as bool?,
        numberOfHoursPerSession:
            castToType<int>(data['number_of_hours_per_session']),
        isRepeatable: data['is_repeatable'] as bool?,
        repeatType: data['repeat_type'] as String?,
        endDateType: data['end_date_type'] as String?,
        endOn: data['end_on'] as DateTime?,
        endAfterNumberOfSessions:
            castToType<int>(data['end_after_number_of_sessions']),
        repeatEvery: data['repeat_every'] as String?,
        monthlyRepeatType: data['monthly_repeat_type'] as String?,
        taskerGender: data['tasker_gender'] as String?,
        taskerAgeRange: data['tasker_age_range'] as String?,
        identified: data['identified'] as bool?,
        yearsOfExperience: castToType<int>(data['years_of_experience']),
        insurance: data['insurance'] as bool?,
        driverLicense: data['driver_license'] as String?,
        maxDistance: data['max_distance'] as String?,
        poster: castToType<int>(data['poster']),
        skillLevel: data['skill_level'] as String?,
        file: data['file'] as String?,
        fullAddress: data['full_address'] as String?,
        preferredDays: getDataList(data['preferred_days']),
      );

  static CrateTaskStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CrateTaskStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'skill': _skill,
        'Language': _language,
        'Description': _description,
        'skill_category': _skillCategory,
        'Address': _address,
        'latitude': _latitude,
        'longitude': _longitude,
        'start_date': _startDate,
        'start_time': _startTime,
        'start_range_time': _startRangeTime,
        'is_exact_start_time': _isExactStartTime,
        'number_of_hours_per_session': _numberOfHoursPerSession,
        'is_repeatable': _isRepeatable,
        'repeat_type': _repeatType,
        'end_date_type': _endDateType,
        'end_on': _endOn,
        'end_after_number_of_sessions': _endAfterNumberOfSessions,
        'repeat_every': _repeatEvery,
        'monthly_repeat_type': _monthlyRepeatType,
        'tasker_gender': _taskerGender,
        'tasker_age_range': _taskerAgeRange,
        'identified': _identified,
        'years_of_experience': _yearsOfExperience,
        'insurance': _insurance,
        'driver_license': _driverLicense,
        'max_distance': _maxDistance,
        'poster': _poster,
        'skill_level': _skillLevel,
        'file': _file,
        'full_address': _fullAddress,
        'preferred_days': _preferredDays,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'skill': serializeParam(
          _skill,
          ParamType.int,
        ),
        'Language': serializeParam(
          _language,
          ParamType.String,
          true,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'skill_category': serializeParam(
          _skillCategory,
          ParamType.int,
        ),
        'Address': serializeParam(
          _address,
          ParamType.String,
        ),
        'latitude': serializeParam(
          _latitude,
          ParamType.double,
        ),
        'longitude': serializeParam(
          _longitude,
          ParamType.double,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'start_range_time': serializeParam(
          _startRangeTime,
          ParamType.DateTime,
        ),
        'is_exact_start_time': serializeParam(
          _isExactStartTime,
          ParamType.bool,
        ),
        'number_of_hours_per_session': serializeParam(
          _numberOfHoursPerSession,
          ParamType.int,
        ),
        'is_repeatable': serializeParam(
          _isRepeatable,
          ParamType.bool,
        ),
        'repeat_type': serializeParam(
          _repeatType,
          ParamType.String,
        ),
        'end_date_type': serializeParam(
          _endDateType,
          ParamType.String,
        ),
        'end_on': serializeParam(
          _endOn,
          ParamType.DateTime,
        ),
        'end_after_number_of_sessions': serializeParam(
          _endAfterNumberOfSessions,
          ParamType.int,
        ),
        'repeat_every': serializeParam(
          _repeatEvery,
          ParamType.String,
        ),
        'monthly_repeat_type': serializeParam(
          _monthlyRepeatType,
          ParamType.String,
        ),
        'tasker_gender': serializeParam(
          _taskerGender,
          ParamType.String,
        ),
        'tasker_age_range': serializeParam(
          _taskerAgeRange,
          ParamType.String,
        ),
        'identified': serializeParam(
          _identified,
          ParamType.bool,
        ),
        'years_of_experience': serializeParam(
          _yearsOfExperience,
          ParamType.int,
        ),
        'insurance': serializeParam(
          _insurance,
          ParamType.bool,
        ),
        'driver_license': serializeParam(
          _driverLicense,
          ParamType.String,
        ),
        'max_distance': serializeParam(
          _maxDistance,
          ParamType.String,
        ),
        'poster': serializeParam(
          _poster,
          ParamType.int,
        ),
        'skill_level': serializeParam(
          _skillLevel,
          ParamType.String,
        ),
        'file': serializeParam(
          _file,
          ParamType.String,
        ),
        'full_address': serializeParam(
          _fullAddress,
          ParamType.String,
        ),
        'preferred_days': serializeParam(
          _preferredDays,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static CrateTaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      CrateTaskStruct(
        skill: deserializeParam(
          data['skill'],
          ParamType.int,
          false,
        ),
        language: deserializeParam<String>(
          data['Language'],
          ParamType.String,
          true,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        skillCategory: deserializeParam(
          data['skill_category'],
          ParamType.int,
          false,
        ),
        address: deserializeParam(
          data['Address'],
          ParamType.String,
          false,
        ),
        latitude: deserializeParam(
          data['latitude'],
          ParamType.double,
          false,
        ),
        longitude: deserializeParam(
          data['longitude'],
          ParamType.double,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.DateTime,
          false,
        ),
        startRangeTime: deserializeParam(
          data['start_range_time'],
          ParamType.DateTime,
          false,
        ),
        isExactStartTime: deserializeParam(
          data['is_exact_start_time'],
          ParamType.bool,
          false,
        ),
        numberOfHoursPerSession: deserializeParam(
          data['number_of_hours_per_session'],
          ParamType.int,
          false,
        ),
        isRepeatable: deserializeParam(
          data['is_repeatable'],
          ParamType.bool,
          false,
        ),
        repeatType: deserializeParam(
          data['repeat_type'],
          ParamType.String,
          false,
        ),
        endDateType: deserializeParam(
          data['end_date_type'],
          ParamType.String,
          false,
        ),
        endOn: deserializeParam(
          data['end_on'],
          ParamType.DateTime,
          false,
        ),
        endAfterNumberOfSessions: deserializeParam(
          data['end_after_number_of_sessions'],
          ParamType.int,
          false,
        ),
        repeatEvery: deserializeParam(
          data['repeat_every'],
          ParamType.String,
          false,
        ),
        monthlyRepeatType: deserializeParam(
          data['monthly_repeat_type'],
          ParamType.String,
          false,
        ),
        taskerGender: deserializeParam(
          data['tasker_gender'],
          ParamType.String,
          false,
        ),
        taskerAgeRange: deserializeParam(
          data['tasker_age_range'],
          ParamType.String,
          false,
        ),
        identified: deserializeParam(
          data['identified'],
          ParamType.bool,
          false,
        ),
        yearsOfExperience: deserializeParam(
          data['years_of_experience'],
          ParamType.int,
          false,
        ),
        insurance: deserializeParam(
          data['insurance'],
          ParamType.bool,
          false,
        ),
        driverLicense: deserializeParam(
          data['driver_license'],
          ParamType.String,
          false,
        ),
        maxDistance: deserializeParam(
          data['max_distance'],
          ParamType.String,
          false,
        ),
        poster: deserializeParam(
          data['poster'],
          ParamType.int,
          false,
        ),
        skillLevel: deserializeParam(
          data['skill_level'],
          ParamType.String,
          false,
        ),
        file: deserializeParam(
          data['file'],
          ParamType.String,
          false,
        ),
        fullAddress: deserializeParam(
          data['full_address'],
          ParamType.String,
          false,
        ),
        preferredDays: deserializeParam<String>(
          data['preferred_days'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'CrateTaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CrateTaskStruct &&
        skill == other.skill &&
        listEquality.equals(language, other.language) &&
        description == other.description &&
        skillCategory == other.skillCategory &&
        address == other.address &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        startDate == other.startDate &&
        startTime == other.startTime &&
        startRangeTime == other.startRangeTime &&
        isExactStartTime == other.isExactStartTime &&
        numberOfHoursPerSession == other.numberOfHoursPerSession &&
        isRepeatable == other.isRepeatable &&
        repeatType == other.repeatType &&
        endDateType == other.endDateType &&
        endOn == other.endOn &&
        endAfterNumberOfSessions == other.endAfterNumberOfSessions &&
        repeatEvery == other.repeatEvery &&
        monthlyRepeatType == other.monthlyRepeatType &&
        taskerGender == other.taskerGender &&
        taskerAgeRange == other.taskerAgeRange &&
        identified == other.identified &&
        yearsOfExperience == other.yearsOfExperience &&
        insurance == other.insurance &&
        driverLicense == other.driverLicense &&
        maxDistance == other.maxDistance &&
        poster == other.poster &&
        skillLevel == other.skillLevel &&
        file == other.file &&
        fullAddress == other.fullAddress &&
        listEquality.equals(preferredDays, other.preferredDays);
  }

  @override
  int get hashCode => const ListEquality().hash([
        skill,
        language,
        description,
        skillCategory,
        address,
        latitude,
        longitude,
        startDate,
        startTime,
        startRangeTime,
        isExactStartTime,
        numberOfHoursPerSession,
        isRepeatable,
        repeatType,
        endDateType,
        endOn,
        endAfterNumberOfSessions,
        repeatEvery,
        monthlyRepeatType,
        taskerGender,
        taskerAgeRange,
        identified,
        yearsOfExperience,
        insurance,
        driverLicense,
        maxDistance,
        poster,
        skillLevel,
        file,
        fullAddress,
        preferredDays
      ]);
}

CrateTaskStruct createCrateTaskStruct({
  int? skill,
  String? description,
  int? skillCategory,
  String? address,
  double? latitude,
  double? longitude,
  DateTime? startDate,
  DateTime? startTime,
  DateTime? startRangeTime,
  bool? isExactStartTime,
  int? numberOfHoursPerSession,
  bool? isRepeatable,
  String? repeatType,
  String? endDateType,
  DateTime? endOn,
  int? endAfterNumberOfSessions,
  String? repeatEvery,
  String? monthlyRepeatType,
  String? taskerGender,
  String? taskerAgeRange,
  bool? identified,
  int? yearsOfExperience,
  bool? insurance,
  String? driverLicense,
  String? maxDistance,
  int? poster,
  String? skillLevel,
  String? file,
  String? fullAddress,
}) =>
    CrateTaskStruct(
      skill: skill,
      description: description,
      skillCategory: skillCategory,
      address: address,
      latitude: latitude,
      longitude: longitude,
      startDate: startDate,
      startTime: startTime,
      startRangeTime: startRangeTime,
      isExactStartTime: isExactStartTime,
      numberOfHoursPerSession: numberOfHoursPerSession,
      isRepeatable: isRepeatable,
      repeatType: repeatType,
      endDateType: endDateType,
      endOn: endOn,
      endAfterNumberOfSessions: endAfterNumberOfSessions,
      repeatEvery: repeatEvery,
      monthlyRepeatType: monthlyRepeatType,
      taskerGender: taskerGender,
      taskerAgeRange: taskerAgeRange,
      identified: identified,
      yearsOfExperience: yearsOfExperience,
      insurance: insurance,
      driverLicense: driverLicense,
      maxDistance: maxDistance,
      poster: poster,
      skillLevel: skillLevel,
      file: file,
      fullAddress: fullAddress,
    );
