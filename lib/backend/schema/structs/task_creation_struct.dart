// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskCreationStruct extends BaseStruct {
  TaskCreationStruct({
    List<String>? taskerLanguages,
    String? description,
    int? radiusOfWork,
    bool? isVerified,
    String? postOpenCloseStatus,
    String? skillLevel,
    String? startDate,
    String? startTime,
    String? customStartTime,
    String? endDatetime,
    String? isPeriodic,
    int? numSessions,
    String? sessionDuration,
    bool? repeatDate,
    String? repeatType,
    String? repeatEvery,
    String? monthlyRepeatType,
    String? endDateType,
    int? poster,
    int? address,
    int? postStatus,
    int? relatedService,
    int? relatedServiceCategory,
    int? session,
    String? file,
    String? date,
    int? yearsofExperience,
    List<String>? languages,
    bool? insurance,
    String? driverslicense,
    int? maxDistance,
    bool? paytravelcosts,
    String? paytravelcostsPerhour,
    bool? cancellationPenaltyApplies,
    String? cancellationPenaltyPerhour,
    String? ifCancelledBefore,
    int? id,
    String? preferredDays,
    List<String>? daysOfWeek,
    String? skill,
  })  : _taskerLanguages = taskerLanguages,
        _description = description,
        _radiusOfWork = radiusOfWork,
        _isVerified = isVerified,
        _postOpenCloseStatus = postOpenCloseStatus,
        _skillLevel = skillLevel,
        _startDate = startDate,
        _startTime = startTime,
        _customStartTime = customStartTime,
        _endDatetime = endDatetime,
        _isPeriodic = isPeriodic,
        _numSessions = numSessions,
        _sessionDuration = sessionDuration,
        _repeatDate = repeatDate,
        _repeatType = repeatType,
        _repeatEvery = repeatEvery,
        _monthlyRepeatType = monthlyRepeatType,
        _endDateType = endDateType,
        _poster = poster,
        _address = address,
        _postStatus = postStatus,
        _relatedService = relatedService,
        _relatedServiceCategory = relatedServiceCategory,
        _session = session,
        _file = file,
        _date = date,
        _yearsofExperience = yearsofExperience,
        _languages = languages,
        _insurance = insurance,
        _driverslicense = driverslicense,
        _maxDistance = maxDistance,
        _paytravelcosts = paytravelcosts,
        _paytravelcostsPerhour = paytravelcostsPerhour,
        _cancellationPenaltyApplies = cancellationPenaltyApplies,
        _cancellationPenaltyPerhour = cancellationPenaltyPerhour,
        _ifCancelledBefore = ifCancelledBefore,
        _id = id,
        _preferredDays = preferredDays,
        _daysOfWeek = daysOfWeek,
        _skill = skill;

  // "tasker_languages" field.
  List<String>? _taskerLanguages;
  List<String> get taskerLanguages => _taskerLanguages ?? const [];
  set taskerLanguages(List<String>? val) => _taskerLanguages = val;
  void updateTaskerLanguages(Function(List<String>) updateFn) =>
      updateFn(_taskerLanguages ??= []);
  bool hasTaskerLanguages() => _taskerLanguages != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "radius_of_work" field.
  int? _radiusOfWork;
  int get radiusOfWork => _radiusOfWork ?? 0;
  set radiusOfWork(int? val) => _radiusOfWork = val;
  void incrementRadiusOfWork(int amount) =>
      _radiusOfWork = radiusOfWork + amount;
  bool hasRadiusOfWork() => _radiusOfWork != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  set isVerified(bool? val) => _isVerified = val;
  bool hasIsVerified() => _isVerified != null;

  // "post_open_close_status" field.
  String? _postOpenCloseStatus;
  String get postOpenCloseStatus => _postOpenCloseStatus ?? '';
  set postOpenCloseStatus(String? val) => _postOpenCloseStatus = val;
  bool hasPostOpenCloseStatus() => _postOpenCloseStatus != null;

  // "skill_level" field.
  String? _skillLevel;
  String get skillLevel => _skillLevel ?? '';
  set skillLevel(String? val) => _skillLevel = val;
  bool hasSkillLevel() => _skillLevel != null;

  // "start_date" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "custom_start_time" field.
  String? _customStartTime;
  String get customStartTime => _customStartTime ?? '';
  set customStartTime(String? val) => _customStartTime = val;
  bool hasCustomStartTime() => _customStartTime != null;

  // "end_datetime" field.
  String? _endDatetime;
  String get endDatetime => _endDatetime ?? '';
  set endDatetime(String? val) => _endDatetime = val;
  bool hasEndDatetime() => _endDatetime != null;

  // "is_periodic" field.
  String? _isPeriodic;
  String get isPeriodic => _isPeriodic ?? '';
  set isPeriodic(String? val) => _isPeriodic = val;
  bool hasIsPeriodic() => _isPeriodic != null;

  // "num_sessions" field.
  int? _numSessions;
  int get numSessions => _numSessions ?? 0;
  set numSessions(int? val) => _numSessions = val;
  void incrementNumSessions(int amount) => _numSessions = numSessions + amount;
  bool hasNumSessions() => _numSessions != null;

  // "session_duration" field.
  String? _sessionDuration;
  String get sessionDuration => _sessionDuration ?? '';
  set sessionDuration(String? val) => _sessionDuration = val;
  bool hasSessionDuration() => _sessionDuration != null;

  // "repeat_date" field.
  bool? _repeatDate;
  bool get repeatDate => _repeatDate ?? false;
  set repeatDate(bool? val) => _repeatDate = val;
  bool hasRepeatDate() => _repeatDate != null;

  // "repeat_type" field.
  String? _repeatType;
  String get repeatType => _repeatType ?? '';
  set repeatType(String? val) => _repeatType = val;
  bool hasRepeatType() => _repeatType != null;

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

  // "end_date_type" field.
  String? _endDateType;
  String get endDateType => _endDateType ?? '';
  set endDateType(String? val) => _endDateType = val;
  bool hasEndDateType() => _endDateType != null;

  // "poster" field.
  int? _poster;
  int get poster => _poster ?? 0;
  set poster(int? val) => _poster = val;
  void incrementPoster(int amount) => _poster = poster + amount;
  bool hasPoster() => _poster != null;

  // "address" field.
  int? _address;
  int get address => _address ?? 0;
  set address(int? val) => _address = val;
  void incrementAddress(int amount) => _address = address + amount;
  bool hasAddress() => _address != null;

  // "post_status" field.
  int? _postStatus;
  int get postStatus => _postStatus ?? 0;
  set postStatus(int? val) => _postStatus = val;
  void incrementPostStatus(int amount) => _postStatus = postStatus + amount;
  bool hasPostStatus() => _postStatus != null;

  // "related_service" field.
  int? _relatedService;
  int get relatedService => _relatedService ?? 0;
  set relatedService(int? val) => _relatedService = val;
  void incrementRelatedService(int amount) =>
      _relatedService = relatedService + amount;
  bool hasRelatedService() => _relatedService != null;

  // "related_service_category" field.
  int? _relatedServiceCategory;
  int get relatedServiceCategory => _relatedServiceCategory ?? 0;
  set relatedServiceCategory(int? val) => _relatedServiceCategory = val;
  void incrementRelatedServiceCategory(int amount) =>
      _relatedServiceCategory = relatedServiceCategory + amount;
  bool hasRelatedServiceCategory() => _relatedServiceCategory != null;

  // "session" field.
  int? _session;
  int get session => _session ?? 0;
  set session(int? val) => _session = val;
  void incrementSession(int amount) => _session = session + amount;
  bool hasSession() => _session != null;

  // "file" field.
  String? _file;
  String get file => _file ?? '';
  set file(String? val) => _file = val;
  bool hasFile() => _file != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;
  bool hasDate() => _date != null;

  // "YearsofExperience" field.
  int? _yearsofExperience;
  int get yearsofExperience => _yearsofExperience ?? 0;
  set yearsofExperience(int? val) => _yearsofExperience = val;
  void incrementYearsofExperience(int amount) =>
      _yearsofExperience = yearsofExperience + amount;
  bool hasYearsofExperience() => _yearsofExperience != null;

  // "Languages" field.
  List<String>? _languages;
  List<String> get languages => _languages ?? const [];
  set languages(List<String>? val) => _languages = val;
  void updateLanguages(Function(List<String>) updateFn) =>
      updateFn(_languages ??= []);
  bool hasLanguages() => _languages != null;

  // "Insurance" field.
  bool? _insurance;
  bool get insurance => _insurance ?? false;
  set insurance(bool? val) => _insurance = val;
  bool hasInsurance() => _insurance != null;

  // "Driverslicense" field.
  String? _driverslicense;
  String get driverslicense => _driverslicense ?? '';
  set driverslicense(String? val) => _driverslicense = val;
  bool hasDriverslicense() => _driverslicense != null;

  // "MaxDistance" field.
  int? _maxDistance;
  int get maxDistance => _maxDistance ?? 0;
  set maxDistance(int? val) => _maxDistance = val;
  void incrementMaxDistance(int amount) => _maxDistance = maxDistance + amount;
  bool hasMaxDistance() => _maxDistance != null;

  // "Paytravelcosts" field.
  bool? _paytravelcosts;
  bool get paytravelcosts => _paytravelcosts ?? false;
  set paytravelcosts(bool? val) => _paytravelcosts = val;
  bool hasPaytravelcosts() => _paytravelcosts != null;

  // "PaytravelcostsPerhour" field.
  String? _paytravelcostsPerhour;
  String get paytravelcostsPerhour => _paytravelcostsPerhour ?? '';
  set paytravelcostsPerhour(String? val) => _paytravelcostsPerhour = val;
  bool hasPaytravelcostsPerhour() => _paytravelcostsPerhour != null;

  // "CancellationPenaltyApplies" field.
  bool? _cancellationPenaltyApplies;
  bool get cancellationPenaltyApplies => _cancellationPenaltyApplies ?? false;
  set cancellationPenaltyApplies(bool? val) =>
      _cancellationPenaltyApplies = val;
  bool hasCancellationPenaltyApplies() => _cancellationPenaltyApplies != null;

  // "CancellationPenaltyPerhour" field.
  String? _cancellationPenaltyPerhour;
  String get cancellationPenaltyPerhour => _cancellationPenaltyPerhour ?? '';
  set cancellationPenaltyPerhour(String? val) =>
      _cancellationPenaltyPerhour = val;
  bool hasCancellationPenaltyPerhour() => _cancellationPenaltyPerhour != null;

  // "If_cancelled_before" field.
  String? _ifCancelledBefore;
  String get ifCancelledBefore => _ifCancelledBefore ?? '';
  set ifCancelledBefore(String? val) => _ifCancelledBefore = val;
  bool hasIfCancelledBefore() => _ifCancelledBefore != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "preferred_days" field.
  String? _preferredDays;
  String get preferredDays => _preferredDays ?? '';
  set preferredDays(String? val) => _preferredDays = val;
  bool hasPreferredDays() => _preferredDays != null;

  // "days_of_week" field.
  List<String>? _daysOfWeek;
  List<String> get daysOfWeek => _daysOfWeek ?? const [];
  set daysOfWeek(List<String>? val) => _daysOfWeek = val;
  void updateDaysOfWeek(Function(List<String>) updateFn) =>
      updateFn(_daysOfWeek ??= []);
  bool hasDaysOfWeek() => _daysOfWeek != null;

  // "skill" field.
  String? _skill;
  String get skill => _skill ?? '';
  set skill(String? val) => _skill = val;
  bool hasSkill() => _skill != null;

  static TaskCreationStruct fromMap(Map<String, dynamic> data) =>
      TaskCreationStruct(
        taskerLanguages: getDataList(data['tasker_languages']),
        description: data['description'] as String?,
        radiusOfWork: castToType<int>(data['radius_of_work']),
        isVerified: data['is_verified'] as bool?,
        postOpenCloseStatus: data['post_open_close_status'] as String?,
        skillLevel: data['skill_level'] as String?,
        startDate: data['start_date'] as String?,
        startTime: data['start_time'] as String?,
        customStartTime: data['custom_start_time'] as String?,
        endDatetime: data['end_datetime'] as String?,
        isPeriodic: data['is_periodic'] as String?,
        numSessions: castToType<int>(data['num_sessions']),
        sessionDuration: data['session_duration'] as String?,
        repeatDate: data['repeat_date'] as bool?,
        repeatType: data['repeat_type'] as String?,
        repeatEvery: data['repeat_every'] as String?,
        monthlyRepeatType: data['monthly_repeat_type'] as String?,
        endDateType: data['end_date_type'] as String?,
        poster: castToType<int>(data['poster']),
        address: castToType<int>(data['address']),
        postStatus: castToType<int>(data['post_status']),
        relatedService: castToType<int>(data['related_service']),
        relatedServiceCategory:
            castToType<int>(data['related_service_category']),
        session: castToType<int>(data['session']),
        file: data['file'] as String?,
        date: data['date'] as String?,
        yearsofExperience: castToType<int>(data['YearsofExperience']),
        languages: getDataList(data['Languages']),
        insurance: data['Insurance'] as bool?,
        driverslicense: data['Driverslicense'] as String?,
        maxDistance: castToType<int>(data['MaxDistance']),
        paytravelcosts: data['Paytravelcosts'] as bool?,
        paytravelcostsPerhour: data['PaytravelcostsPerhour'] as String?,
        cancellationPenaltyApplies: data['CancellationPenaltyApplies'] as bool?,
        cancellationPenaltyPerhour:
            data['CancellationPenaltyPerhour'] as String?,
        ifCancelledBefore: data['If_cancelled_before'] as String?,
        id: castToType<int>(data['id']),
        preferredDays: data['preferred_days'] as String?,
        daysOfWeek: getDataList(data['days_of_week']),
        skill: data['skill'] as String?,
      );

  static TaskCreationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TaskCreationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'tasker_languages': _taskerLanguages,
        'description': _description,
        'radius_of_work': _radiusOfWork,
        'is_verified': _isVerified,
        'post_open_close_status': _postOpenCloseStatus,
        'skill_level': _skillLevel,
        'start_date': _startDate,
        'start_time': _startTime,
        'custom_start_time': _customStartTime,
        'end_datetime': _endDatetime,
        'is_periodic': _isPeriodic,
        'num_sessions': _numSessions,
        'session_duration': _sessionDuration,
        'repeat_date': _repeatDate,
        'repeat_type': _repeatType,
        'repeat_every': _repeatEvery,
        'monthly_repeat_type': _monthlyRepeatType,
        'end_date_type': _endDateType,
        'poster': _poster,
        'address': _address,
        'post_status': _postStatus,
        'related_service': _relatedService,
        'related_service_category': _relatedServiceCategory,
        'session': _session,
        'file': _file,
        'date': _date,
        'YearsofExperience': _yearsofExperience,
        'Languages': _languages,
        'Insurance': _insurance,
        'Driverslicense': _driverslicense,
        'MaxDistance': _maxDistance,
        'Paytravelcosts': _paytravelcosts,
        'PaytravelcostsPerhour': _paytravelcostsPerhour,
        'CancellationPenaltyApplies': _cancellationPenaltyApplies,
        'CancellationPenaltyPerhour': _cancellationPenaltyPerhour,
        'If_cancelled_before': _ifCancelledBefore,
        'id': _id,
        'preferred_days': _preferredDays,
        'days_of_week': _daysOfWeek,
        'skill': _skill,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tasker_languages': serializeParam(
          _taskerLanguages,
          ParamType.String,
          true,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'radius_of_work': serializeParam(
          _radiusOfWork,
          ParamType.int,
        ),
        'is_verified': serializeParam(
          _isVerified,
          ParamType.bool,
        ),
        'post_open_close_status': serializeParam(
          _postOpenCloseStatus,
          ParamType.String,
        ),
        'skill_level': serializeParam(
          _skillLevel,
          ParamType.String,
        ),
        'start_date': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.String,
        ),
        'custom_start_time': serializeParam(
          _customStartTime,
          ParamType.String,
        ),
        'end_datetime': serializeParam(
          _endDatetime,
          ParamType.String,
        ),
        'is_periodic': serializeParam(
          _isPeriodic,
          ParamType.String,
        ),
        'num_sessions': serializeParam(
          _numSessions,
          ParamType.int,
        ),
        'session_duration': serializeParam(
          _sessionDuration,
          ParamType.String,
        ),
        'repeat_date': serializeParam(
          _repeatDate,
          ParamType.bool,
        ),
        'repeat_type': serializeParam(
          _repeatType,
          ParamType.String,
        ),
        'repeat_every': serializeParam(
          _repeatEvery,
          ParamType.String,
        ),
        'monthly_repeat_type': serializeParam(
          _monthlyRepeatType,
          ParamType.String,
        ),
        'end_date_type': serializeParam(
          _endDateType,
          ParamType.String,
        ),
        'poster': serializeParam(
          _poster,
          ParamType.int,
        ),
        'address': serializeParam(
          _address,
          ParamType.int,
        ),
        'post_status': serializeParam(
          _postStatus,
          ParamType.int,
        ),
        'related_service': serializeParam(
          _relatedService,
          ParamType.int,
        ),
        'related_service_category': serializeParam(
          _relatedServiceCategory,
          ParamType.int,
        ),
        'session': serializeParam(
          _session,
          ParamType.int,
        ),
        'file': serializeParam(
          _file,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
        'YearsofExperience': serializeParam(
          _yearsofExperience,
          ParamType.int,
        ),
        'Languages': serializeParam(
          _languages,
          ParamType.String,
          true,
        ),
        'Insurance': serializeParam(
          _insurance,
          ParamType.bool,
        ),
        'Driverslicense': serializeParam(
          _driverslicense,
          ParamType.String,
        ),
        'MaxDistance': serializeParam(
          _maxDistance,
          ParamType.int,
        ),
        'Paytravelcosts': serializeParam(
          _paytravelcosts,
          ParamType.bool,
        ),
        'PaytravelcostsPerhour': serializeParam(
          _paytravelcostsPerhour,
          ParamType.String,
        ),
        'CancellationPenaltyApplies': serializeParam(
          _cancellationPenaltyApplies,
          ParamType.bool,
        ),
        'CancellationPenaltyPerhour': serializeParam(
          _cancellationPenaltyPerhour,
          ParamType.String,
        ),
        'If_cancelled_before': serializeParam(
          _ifCancelledBefore,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'preferred_days': serializeParam(
          _preferredDays,
          ParamType.String,
        ),
        'days_of_week': serializeParam(
          _daysOfWeek,
          ParamType.String,
          true,
        ),
        'skill': serializeParam(
          _skill,
          ParamType.String,
        ),
      }.withoutNulls;

  static TaskCreationStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskCreationStruct(
        taskerLanguages: deserializeParam<String>(
          data['tasker_languages'],
          ParamType.String,
          true,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        radiusOfWork: deserializeParam(
          data['radius_of_work'],
          ParamType.int,
          false,
        ),
        isVerified: deserializeParam(
          data['is_verified'],
          ParamType.bool,
          false,
        ),
        postOpenCloseStatus: deserializeParam(
          data['post_open_close_status'],
          ParamType.String,
          false,
        ),
        skillLevel: deserializeParam(
          data['skill_level'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['start_date'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.String,
          false,
        ),
        customStartTime: deserializeParam(
          data['custom_start_time'],
          ParamType.String,
          false,
        ),
        endDatetime: deserializeParam(
          data['end_datetime'],
          ParamType.String,
          false,
        ),
        isPeriodic: deserializeParam(
          data['is_periodic'],
          ParamType.String,
          false,
        ),
        numSessions: deserializeParam(
          data['num_sessions'],
          ParamType.int,
          false,
        ),
        sessionDuration: deserializeParam(
          data['session_duration'],
          ParamType.String,
          false,
        ),
        repeatDate: deserializeParam(
          data['repeat_date'],
          ParamType.bool,
          false,
        ),
        repeatType: deserializeParam(
          data['repeat_type'],
          ParamType.String,
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
        endDateType: deserializeParam(
          data['end_date_type'],
          ParamType.String,
          false,
        ),
        poster: deserializeParam(
          data['poster'],
          ParamType.int,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.int,
          false,
        ),
        postStatus: deserializeParam(
          data['post_status'],
          ParamType.int,
          false,
        ),
        relatedService: deserializeParam(
          data['related_service'],
          ParamType.int,
          false,
        ),
        relatedServiceCategory: deserializeParam(
          data['related_service_category'],
          ParamType.int,
          false,
        ),
        session: deserializeParam(
          data['session'],
          ParamType.int,
          false,
        ),
        file: deserializeParam(
          data['file'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
        yearsofExperience: deserializeParam(
          data['YearsofExperience'],
          ParamType.int,
          false,
        ),
        languages: deserializeParam<String>(
          data['Languages'],
          ParamType.String,
          true,
        ),
        insurance: deserializeParam(
          data['Insurance'],
          ParamType.bool,
          false,
        ),
        driverslicense: deserializeParam(
          data['Driverslicense'],
          ParamType.String,
          false,
        ),
        maxDistance: deserializeParam(
          data['MaxDistance'],
          ParamType.int,
          false,
        ),
        paytravelcosts: deserializeParam(
          data['Paytravelcosts'],
          ParamType.bool,
          false,
        ),
        paytravelcostsPerhour: deserializeParam(
          data['PaytravelcostsPerhour'],
          ParamType.String,
          false,
        ),
        cancellationPenaltyApplies: deserializeParam(
          data['CancellationPenaltyApplies'],
          ParamType.bool,
          false,
        ),
        cancellationPenaltyPerhour: deserializeParam(
          data['CancellationPenaltyPerhour'],
          ParamType.String,
          false,
        ),
        ifCancelledBefore: deserializeParam(
          data['If_cancelled_before'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        preferredDays: deserializeParam(
          data['preferred_days'],
          ParamType.String,
          false,
        ),
        daysOfWeek: deserializeParam<String>(
          data['days_of_week'],
          ParamType.String,
          true,
        ),
        skill: deserializeParam(
          data['skill'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TaskCreationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TaskCreationStruct &&
        listEquality.equals(taskerLanguages, other.taskerLanguages) &&
        description == other.description &&
        radiusOfWork == other.radiusOfWork &&
        isVerified == other.isVerified &&
        postOpenCloseStatus == other.postOpenCloseStatus &&
        skillLevel == other.skillLevel &&
        startDate == other.startDate &&
        startTime == other.startTime &&
        customStartTime == other.customStartTime &&
        endDatetime == other.endDatetime &&
        isPeriodic == other.isPeriodic &&
        numSessions == other.numSessions &&
        sessionDuration == other.sessionDuration &&
        repeatDate == other.repeatDate &&
        repeatType == other.repeatType &&
        repeatEvery == other.repeatEvery &&
        monthlyRepeatType == other.monthlyRepeatType &&
        endDateType == other.endDateType &&
        poster == other.poster &&
        address == other.address &&
        postStatus == other.postStatus &&
        relatedService == other.relatedService &&
        relatedServiceCategory == other.relatedServiceCategory &&
        session == other.session &&
        file == other.file &&
        date == other.date &&
        yearsofExperience == other.yearsofExperience &&
        listEquality.equals(languages, other.languages) &&
        insurance == other.insurance &&
        driverslicense == other.driverslicense &&
        maxDistance == other.maxDistance &&
        paytravelcosts == other.paytravelcosts &&
        paytravelcostsPerhour == other.paytravelcostsPerhour &&
        cancellationPenaltyApplies == other.cancellationPenaltyApplies &&
        cancellationPenaltyPerhour == other.cancellationPenaltyPerhour &&
        ifCancelledBefore == other.ifCancelledBefore &&
        id == other.id &&
        preferredDays == other.preferredDays &&
        listEquality.equals(daysOfWeek, other.daysOfWeek) &&
        skill == other.skill;
  }

  @override
  int get hashCode => const ListEquality().hash([
        taskerLanguages,
        description,
        radiusOfWork,
        isVerified,
        postOpenCloseStatus,
        skillLevel,
        startDate,
        startTime,
        customStartTime,
        endDatetime,
        isPeriodic,
        numSessions,
        sessionDuration,
        repeatDate,
        repeatType,
        repeatEvery,
        monthlyRepeatType,
        endDateType,
        poster,
        address,
        postStatus,
        relatedService,
        relatedServiceCategory,
        session,
        file,
        date,
        yearsofExperience,
        languages,
        insurance,
        driverslicense,
        maxDistance,
        paytravelcosts,
        paytravelcostsPerhour,
        cancellationPenaltyApplies,
        cancellationPenaltyPerhour,
        ifCancelledBefore,
        id,
        preferredDays,
        daysOfWeek,
        skill
      ]);
}

TaskCreationStruct createTaskCreationStruct({
  String? description,
  int? radiusOfWork,
  bool? isVerified,
  String? postOpenCloseStatus,
  String? skillLevel,
  String? startDate,
  String? startTime,
  String? customStartTime,
  String? endDatetime,
  String? isPeriodic,
  int? numSessions,
  String? sessionDuration,
  bool? repeatDate,
  String? repeatType,
  String? repeatEvery,
  String? monthlyRepeatType,
  String? endDateType,
  int? poster,
  int? address,
  int? postStatus,
  int? relatedService,
  int? relatedServiceCategory,
  int? session,
  String? file,
  String? date,
  int? yearsofExperience,
  bool? insurance,
  String? driverslicense,
  int? maxDistance,
  bool? paytravelcosts,
  String? paytravelcostsPerhour,
  bool? cancellationPenaltyApplies,
  String? cancellationPenaltyPerhour,
  String? ifCancelledBefore,
  int? id,
  String? preferredDays,
  String? skill,
}) =>
    TaskCreationStruct(
      description: description,
      radiusOfWork: radiusOfWork,
      isVerified: isVerified,
      postOpenCloseStatus: postOpenCloseStatus,
      skillLevel: skillLevel,
      startDate: startDate,
      startTime: startTime,
      customStartTime: customStartTime,
      endDatetime: endDatetime,
      isPeriodic: isPeriodic,
      numSessions: numSessions,
      sessionDuration: sessionDuration,
      repeatDate: repeatDate,
      repeatType: repeatType,
      repeatEvery: repeatEvery,
      monthlyRepeatType: monthlyRepeatType,
      endDateType: endDateType,
      poster: poster,
      address: address,
      postStatus: postStatus,
      relatedService: relatedService,
      relatedServiceCategory: relatedServiceCategory,
      session: session,
      file: file,
      date: date,
      yearsofExperience: yearsofExperience,
      insurance: insurance,
      driverslicense: driverslicense,
      maxDistance: maxDistance,
      paytravelcosts: paytravelcosts,
      paytravelcostsPerhour: paytravelcostsPerhour,
      cancellationPenaltyApplies: cancellationPenaltyApplies,
      cancellationPenaltyPerhour: cancellationPenaltyPerhour,
      ifCancelledBefore: ifCancelledBefore,
      id: id,
      preferredDays: preferredDays,
      skill: skill,
    );
