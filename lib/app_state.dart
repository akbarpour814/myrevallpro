import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_UserInformation')) {
        try {
          final serializedData = prefs.getString('ff_UserInformation') ?? '{}';
          _UserInformation =
              CurrentUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _id = prefs.getInt('ff_id') ?? _id;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Appointment')) {
        try {
          final serializedData = prefs.getString('ff_Appointment') ?? '{}';
          _Appointment =
              AppointmentStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userProfile')) {
        try {
          _userProfile = jsonDecode(prefs.getString('ff_userProfile') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _apiKey = prefs.getString('ff_apiKey') ?? _apiKey;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_Address')) {
        try {
          final serializedData = prefs.getString('ff_Address') ?? '{}';
          _Address =
              AddressesStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_DraftPost')) {
        try {
          _DraftPost = jsonDecode(prefs.getString('ff_DraftPost') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_TaskCreation')) {
        try {
          final serializedData = prefs.getString('ff_TaskCreation') ?? '{}';
          _TaskCreation = TaskCreationStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _relatedServiseCategory =
          prefs.getInt('ff_relatedServiseCategory') ?? _relatedServiseCategory;
    });
    _safeInit(() {
      _ONLINE = prefs.getString('ff_ONLINE') ?? _ONLINE;
    });
    _safeInit(() {
      _BYPHONE = prefs.getString('ff_BYPHONE') ?? _BYPHONE;
    });
    _safeInit(() {
      _INPERSON = prefs.getString('ff_INPERSON') ?? _INPERSON;
    });
    _safeInit(() {
      _location =
          _latLngFromString(prefs.getString('ff_location')) ?? _location;
    });
    _safeInit(() {
      _selectedServiceCategory = prefs
              .getStringList('ff_selectedServiceCategory')
              ?.map(int.parse)
              .toList() ??
          _selectedServiceCategory;
    });
    _safeInit(() {
      _appApiKey = prefs.getString('ff_appApiKey') ?? _appApiKey;
    });
    _safeInit(() {
      _ChhosenSkillCategory = prefs.getStringList('ff_ChhosenSkillCategory') ??
          _ChhosenSkillCategory;
    });
    _safeInit(() {
      _SelectServices =
          prefs.getStringList('ff_SelectServices') ?? _SelectServices;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_task')) {
        try {
          final serializedData = prefs.getString('ff_task') ?? '{}';
          _task =
              CrateTaskStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _taskSearchString =
          prefs.getString('ff_taskSearchString') ?? _taskSearchString;
    });
    _safeInit(() {
      _mapView = prefs.getBool('ff_mapView') ?? _mapView;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_taskerFilter')) {
        try {
          final serializedData = prefs.getString('ff_taskerFilter') ?? '{}';
          _taskerFilter = TaskerFilterStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _baseUrl = prefs.getString('ff_baseUrl') ?? _baseUrl;
    });
    _safeInit(() {
      _appUrl = prefs.getString('ff_appUrl') ?? _appUrl;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_createTask')) {
        try {
          final serializedData = prefs.getString('ff_createTask') ?? '{}';
          _createTask =
              CreateTaskStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_globalSocket')) {
        try {
          _globalSocket = jsonDecode(prefs.getString('ff_globalSocket') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _sid = prefs.getString('ff_sid') ?? _sid;
    });
    _safeInit(() {
      _tasksTime = prefs.getStringList('ff_tasksTime') ?? _tasksTime;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_user')) {
        try {
          final serializedData = prefs.getString('ff_user') ?? '{}';
          _user = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      if (prefs.containsKey('ff_cheapsChat')) {
        try {
          final serializedData = prefs.getString('ff_cheapsChat') ?? '{}';
          _cheapsChat =
              CheapsChatStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _gender = prefs.getStringList('ff_gender') ?? _gender;
    });
    _safeInit(() {
      _DocumentType = prefs.getStringList('ff_DocumentType') ?? _DocumentType;
    });
    _safeInit(() {
      _appointmentType =
          prefs.getStringList('ff_appointmentType') ?? _appointmentType;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _DeleteAddressBackGroundColor = false;
  bool get DeleteAddressBackGroundColor => _DeleteAddressBackGroundColor;
  set DeleteAddressBackGroundColor(bool _value) {
    _DeleteAddressBackGroundColor = _value;
  }

  bool _AddCertificateForEducation = false;
  bool get AddCertificateForEducation => _AddCertificateForEducation;
  set AddCertificateForEducation(bool _value) {
    _AddCertificateForEducation = _value;
  }

  bool _SelectLanguageDropDown = false;
  bool get SelectLanguageDropDown => _SelectLanguageDropDown;
  set SelectLanguageDropDown(bool _value) {
    _SelectLanguageDropDown = _value;
  }

  String _PostsReviews = 'Post';
  String get PostsReviews => _PostsReviews;
  set PostsReviews(String _value) {
    _PostsReviews = _value;
  }

  bool _BottomSheetforPay = false;
  bool get BottomSheetforPay => _BottomSheetforPay;
  set BottomSheetforPay(bool _value) {
    _BottomSheetforPay = _value;
  }

  String _Sort = 'Newest';
  String get Sort => _Sort;
  set Sort(String _value) {
    _Sort = _value;
  }

  bool _BargainUserFilter = false;
  bool get BargainUserFilter => _BargainUserFilter;
  set BargainUserFilter(bool _value) {
    _BargainUserFilter = _value;
  }

  String _userFilter = '';
  String get userFilter => _userFilter;
  set userFilter(String _value) {
    _userFilter = _value;
  }

  bool _PostFilterBool = false;
  bool get PostFilterBool => _PostFilterBool;
  set PostFilterBool(bool _value) {
    _PostFilterBool = _value;
  }

  String _PostFilter = '';
  String get PostFilter => _PostFilter;
  set PostFilter(String _value) {
    _PostFilter = _value;
  }

  CurrentUserStruct _UserInformation =
      CurrentUserStruct.fromSerializableMap(jsonDecode('{\"Country\":\"\"}'));
  CurrentUserStruct get UserInformation => _UserInformation;
  set UserInformation(CurrentUserStruct _value) {
    _UserInformation = _value;
    prefs.setString('ff_UserInformation', _value.serialize());
  }

  void updateUserInformationStruct(Function(CurrentUserStruct) updateFn) {
    updateFn(_UserInformation);
    prefs.setString('ff_UserInformation', _UserInformation.serialize());
  }

  bool _requstNewCode = false;
  bool get requstNewCode => _requstNewCode;
  set requstNewCode(bool _value) {
    _requstNewCode = _value;
  }

  bool _IsntCorecctPassword = false;
  bool get IsntCorecctPassword => _IsntCorecctPassword;
  set IsntCorecctPassword(bool _value) {
    _IsntCorecctPassword = _value;
  }

  bool _closeHeaderInacceptedDigitCode = false;
  bool get closeHeaderInacceptedDigitCode => _closeHeaderInacceptedDigitCode;
  set closeHeaderInacceptedDigitCode(bool _value) {
    _closeHeaderInacceptedDigitCode = _value;
  }

  bool _ProfileCheck = false;
  bool get ProfileCheck => _ProfileCheck;
  set ProfileCheck(bool _value) {
    _ProfileCheck = _value;
  }

  bool _BannerCheck = false;
  bool get BannerCheck => _BannerCheck;
  set BannerCheck(bool _value) {
    _BannerCheck = _value;
  }

  String _ReqestNewCode = '';
  String get ReqestNewCode => _ReqestNewCode;
  set ReqestNewCode(String _value) {
    _ReqestNewCode = _value;
  }

  bool _IsNotCorrectPasswordNewPhonNumber = false;
  bool get IsNotCorrectPasswordNewPhonNumber =>
      _IsNotCorrectPasswordNewPhonNumber;
  set IsNotCorrectPasswordNewPhonNumber(bool _value) {
    _IsNotCorrectPasswordNewPhonNumber = _value;
  }

  bool _NotificationForAnewPassOrEmail = false;
  bool get NotificationForAnewPassOrEmail => _NotificationForAnewPassOrEmail;
  set NotificationForAnewPassOrEmail(bool _value) {
    _NotificationForAnewPassOrEmail = _value;
  }

  bool _CopyText = false;
  bool get CopyText => _CopyText;
  set CopyText(bool _value) {
    _CopyText = _value;
  }

  bool _BorderColorSuccses = false;
  bool get BorderColorSuccses => _BorderColorSuccses;
  set BorderColorSuccses(bool _value) {
    _BorderColorSuccses = _value;
  }

  List<UserServiceStruct> _userServices = [];
  List<UserServiceStruct> get userServices => _userServices;
  set userServices(List<UserServiceStruct> _value) {
    _userServices = _value;
  }

  void addToUserServices(UserServiceStruct _value) {
    _userServices.add(_value);
  }

  void removeFromUserServices(UserServiceStruct _value) {
    _userServices.remove(_value);
  }

  void removeAtIndexFromUserServices(int _index) {
    _userServices.removeAt(_index);
  }

  void updateUserServicesAtIndex(
    int _index,
    UserServiceStruct Function(UserServiceStruct) updateFn,
  ) {
    _userServices[_index] = updateFn(_userServices[_index]);
  }

  void insertAtIndexInUserServices(int _index, UserServiceStruct _value) {
    _userServices.insert(_index, _value);
  }

  List<String> _LanguagesListForDropDown = [];
  List<String> get LanguagesListForDropDown => _LanguagesListForDropDown;
  set LanguagesListForDropDown(List<String> _value) {
    _LanguagesListForDropDown = _value;
  }

  void addToLanguagesListForDropDown(String _value) {
    _LanguagesListForDropDown.add(_value);
  }

  void removeFromLanguagesListForDropDown(String _value) {
    _LanguagesListForDropDown.remove(_value);
  }

  void removeAtIndexFromLanguagesListForDropDown(int _index) {
    _LanguagesListForDropDown.removeAt(_index);
  }

  void updateLanguagesListForDropDownAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _LanguagesListForDropDown[_index] =
        updateFn(_LanguagesListForDropDown[_index]);
  }

  void insertAtIndexInLanguagesListForDropDown(int _index, String _value) {
    _LanguagesListForDropDown.insert(_index, _value);
  }

  String _StartingTime = '';
  String get StartingTime => _StartingTime;
  set StartingTime(String _value) {
    _StartingTime = _value;
  }

  int _id = 0;
  int get id => _id;
  set id(int _value) {
    _id = _value;
    prefs.setInt('ff_id', _value);
  }

  List<String> _RepeatType = [];
  List<String> get RepeatType => _RepeatType;
  set RepeatType(List<String> _value) {
    _RepeatType = _value;
  }

  void addToRepeatType(String _value) {
    _RepeatType.add(_value);
  }

  void removeFromRepeatType(String _value) {
    _RepeatType.remove(_value);
  }

  void removeAtIndexFromRepeatType(int _index) {
    _RepeatType.removeAt(_index);
  }

  void updateRepeatTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _RepeatType[_index] = updateFn(_RepeatType[_index]);
  }

  void insertAtIndexInRepeatType(int _index, String _value) {
    _RepeatType.insert(_index, _value);
  }

  String _TaskerType = '';
  String get TaskerType => _TaskerType;
  set TaskerType(String _value) {
    _TaskerType = _value;
  }

  String _TaskerAge = '';
  String get TaskerAge => _TaskerAge;
  set TaskerAge(String _value) {
    _TaskerAge = _value;
  }

  bool _Identified = false;
  bool get Identified => _Identified;
  set Identified(bool _value) {
    _Identified = _value;
  }

  String _BidReq = '';
  String get BidReq => _BidReq;
  set BidReq(String _value) {
    _BidReq = _value;
  }

  ReviweStruct _Review = ReviweStruct();
  ReviweStruct get Review => _Review;
  set Review(ReviweStruct _value) {
    _Review = _value;
  }

  void updateReviewStruct(Function(ReviweStruct) updateFn) {
    updateFn(_Review);
  }

  AppointmentStruct _Appointment = AppointmentStruct();
  AppointmentStruct get Appointment => _Appointment;
  set Appointment(AppointmentStruct _value) {
    _Appointment = _value;
    prefs.setString('ff_Appointment', _value.serialize());
  }

  void updateAppointmentStruct(Function(AppointmentStruct) updateFn) {
    updateFn(_Appointment);
    prefs.setString('ff_Appointment', _Appointment.serialize());
  }

  dynamic _userProfile;
  dynamic get userProfile => _userProfile;
  set userProfile(dynamic _value) {
    _userProfile = _value;
    prefs.setString('ff_userProfile', jsonEncode(_value));
  }

  String _streetDroper = '';
  String get streetDroper => _streetDroper;
  set streetDroper(String _value) {
    _streetDroper = _value;
  }

  bool _exactstartingtime = false;
  bool get exactstartingtime => _exactstartingtime;
  set exactstartingtime(bool _value) {
    _exactstartingtime = _value;
  }

  String _apiKey = '';
  String get apiKey => _apiKey;
  set apiKey(String _value) {
    _apiKey = _value;
    prefs.setString('ff_apiKey', _value);
  }

  AddressesStruct _Address = AddressesStruct();
  AddressesStruct get Address => _Address;
  set Address(AddressesStruct _value) {
    _Address = _value;
    prefs.setString('ff_Address', _value.serialize());
  }

  void updateAddressStruct(Function(AddressesStruct) updateFn) {
    updateFn(_Address);
    prefs.setString('ff_Address', _Address.serialize());
  }

  dynamic _DraftPost;
  dynamic get DraftPost => _DraftPost;
  set DraftPost(dynamic _value) {
    _DraftPost = _value;
    prefs.setString('ff_DraftPost', jsonEncode(_value));
  }

  TaskCreationStruct _TaskCreation = TaskCreationStruct();
  TaskCreationStruct get TaskCreation => _TaskCreation;
  set TaskCreation(TaskCreationStruct _value) {
    _TaskCreation = _value;
    prefs.setString('ff_TaskCreation', _value.serialize());
  }

  void updateTaskCreationStruct(Function(TaskCreationStruct) updateFn) {
    updateFn(_TaskCreation);
    prefs.setString('ff_TaskCreation', _TaskCreation.serialize());
  }

  int _relatedServiseCategory = 0;
  int get relatedServiseCategory => _relatedServiseCategory;
  set relatedServiseCategory(int _value) {
    _relatedServiseCategory = _value;
    prefs.setInt('ff_relatedServiseCategory', _value);
  }

  String _ONLINE = 'ONLINE ';
  String get ONLINE => _ONLINE;
  set ONLINE(String _value) {
    _ONLINE = _value;
    prefs.setString('ff_ONLINE', _value);
  }

  String _BYPHONE = 'BYPHONE';
  String get BYPHONE => _BYPHONE;
  set BYPHONE(String _value) {
    _BYPHONE = _value;
    prefs.setString('ff_BYPHONE', _value);
  }

  String _INPERSON = 'INPERSON';
  String get INPERSON => _INPERSON;
  set INPERSON(String _value) {
    _INPERSON = _value;
    prefs.setString('ff_INPERSON', _value);
  }

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? _value) {
    _location = _value;
    _value != null
        ? prefs.setString('ff_location', _value.serialize())
        : prefs.remove('ff_location');
  }

  List<int> _selectedServiceCategory = [];
  List<int> get selectedServiceCategory => _selectedServiceCategory;
  set selectedServiceCategory(List<int> _value) {
    _selectedServiceCategory = _value;
    prefs.setStringList(
        'ff_selectedServiceCategory', _value.map((x) => x.toString()).toList());
  }

  void addToSelectedServiceCategory(int _value) {
    _selectedServiceCategory.add(_value);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  void removeFromSelectedServiceCategory(int _value) {
    _selectedServiceCategory.remove(_value);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromSelectedServiceCategory(int _index) {
    _selectedServiceCategory.removeAt(_index);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  void updateSelectedServiceCategoryAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _selectedServiceCategory[_index] =
        updateFn(_selectedServiceCategory[_index]);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  void insertAtIndexInSelectedServiceCategory(int _index, int _value) {
    _selectedServiceCategory.insert(_index, _value);
    prefs.setStringList('ff_selectedServiceCategory',
        _selectedServiceCategory.map((x) => x.toString()).toList());
  }

  bool _isApiCall = false;
  bool get isApiCall => _isApiCall;
  set isApiCall(bool _value) {
    _isApiCall = _value;
  }

  bool _closeAd = false;
  bool get closeAd => _closeAd;
  set closeAd(bool _value) {
    _closeAd = _value;
  }

  String _appApiKey = 'token 93c031f5d19f49e:3dcd6aa87fd3e87';
  String get appApiKey => _appApiKey;
  set appApiKey(String _value) {
    _appApiKey = _value;
    prefs.setString('ff_appApiKey', _value);
  }

  List<String> _ChhosenSkillCategory = [];
  List<String> get ChhosenSkillCategory => _ChhosenSkillCategory;
  set ChhosenSkillCategory(List<String> _value) {
    _ChhosenSkillCategory = _value;
    prefs.setStringList('ff_ChhosenSkillCategory', _value);
  }

  void addToChhosenSkillCategory(String _value) {
    _ChhosenSkillCategory.add(_value);
    prefs.setStringList('ff_ChhosenSkillCategory', _ChhosenSkillCategory);
  }

  void removeFromChhosenSkillCategory(String _value) {
    _ChhosenSkillCategory.remove(_value);
    prefs.setStringList('ff_ChhosenSkillCategory', _ChhosenSkillCategory);
  }

  void removeAtIndexFromChhosenSkillCategory(int _index) {
    _ChhosenSkillCategory.removeAt(_index);
    prefs.setStringList('ff_ChhosenSkillCategory', _ChhosenSkillCategory);
  }

  void updateChhosenSkillCategoryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _ChhosenSkillCategory[_index] = updateFn(_ChhosenSkillCategory[_index]);
    prefs.setStringList('ff_ChhosenSkillCategory', _ChhosenSkillCategory);
  }

  void insertAtIndexInChhosenSkillCategory(int _index, String _value) {
    _ChhosenSkillCategory.insert(_index, _value);
    prefs.setStringList('ff_ChhosenSkillCategory', _ChhosenSkillCategory);
  }

  List<String> _SelectServices = [];
  List<String> get SelectServices => _SelectServices;
  set SelectServices(List<String> _value) {
    _SelectServices = _value;
    prefs.setStringList('ff_SelectServices', _value);
  }

  void addToSelectServices(String _value) {
    _SelectServices.add(_value);
    prefs.setStringList('ff_SelectServices', _SelectServices);
  }

  void removeFromSelectServices(String _value) {
    _SelectServices.remove(_value);
    prefs.setStringList('ff_SelectServices', _SelectServices);
  }

  void removeAtIndexFromSelectServices(int _index) {
    _SelectServices.removeAt(_index);
    prefs.setStringList('ff_SelectServices', _SelectServices);
  }

  void updateSelectServicesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _SelectServices[_index] = updateFn(_SelectServices[_index]);
    prefs.setStringList('ff_SelectServices', _SelectServices);
  }

  void insertAtIndexInSelectServices(int _index, String _value) {
    _SelectServices.insert(_index, _value);
    prefs.setStringList('ff_SelectServices', _SelectServices);
  }

  CrateTaskStruct _task = CrateTaskStruct();
  CrateTaskStruct get task => _task;
  set task(CrateTaskStruct _value) {
    _task = _value;
    prefs.setString('ff_task', _value.serialize());
  }

  void updateTaskStruct(Function(CrateTaskStruct) updateFn) {
    updateFn(_task);
    prefs.setString('ff_task', _task.serialize());
  }

  FilterStruct _taskFilter = FilterStruct.fromSerializableMap(jsonDecode(
      '{\"anyLocation\":\"true\",\"anySkill\":\"true\",\"anyDate\":\"true\",\"anyTaskerGender\":\"true\",\"onlyOpen\":\"true\",\"anytasker\":\"true\"}'));
  FilterStruct get taskFilter => _taskFilter;
  set taskFilter(FilterStruct _value) {
    _taskFilter = _value;
  }

  void updateTaskFilterStruct(Function(FilterStruct) updateFn) {
    updateFn(_taskFilter);
  }

  String _taskSearchString = '[]';
  String get taskSearchString => _taskSearchString;
  set taskSearchString(String _value) {
    _taskSearchString = _value;
    prefs.setString('ff_taskSearchString', _value);
  }

  bool _mapView = false;
  bool get mapView => _mapView;
  set mapView(bool _value) {
    _mapView = _value;
    prefs.setBool('ff_mapView', _value);
  }

  TaskerFilterStruct _taskerFilter = TaskerFilterStruct.fromSerializableMap(
      jsonDecode(
          '{\"anyLocation\":\"true\",\"anySkill\":\"true\",\"anyTaskerGender\":\"true\",\"names\":\"[]\",\"anytasker\":\"true\"}'));
  TaskerFilterStruct get taskerFilter => _taskerFilter;
  set taskerFilter(TaskerFilterStruct _value) {
    _taskerFilter = _value;
    prefs.setString('ff_taskerFilter', _value.serialize());
  }

  void updateTaskerFilterStruct(Function(TaskerFilterStruct) updateFn) {
    updateFn(_taskerFilter);
    prefs.setString('ff_taskerFilter', _taskerFilter.serialize());
  }

  String _baseUrl = 'https://taskerpage.com';
  String get baseUrl => _baseUrl;
  set baseUrl(String _value) {
    _baseUrl = _value;
    prefs.setString('ff_baseUrl', _value);
  }

  bool _ScanedQRCODE = false;
  bool get ScanedQRCODE => _ScanedQRCODE;
  set ScanedQRCODE(bool _value) {
    _ScanedQRCODE = _value;
  }

  bool _mapORlist = false;
  bool get mapORlist => _mapORlist;
  set mapORlist(bool _value) {
    _mapORlist = _value;
  }

  int _checkNavbarState = 0;
  int get checkNavbarState => _checkNavbarState;
  set checkNavbarState(int _value) {
    _checkNavbarState = _value;
  }

  String _appUrl = 'https://taskerpage.flutterflow.app';
  String get appUrl => _appUrl;
  set appUrl(String _value) {
    _appUrl = _value;
    prefs.setString('ff_appUrl', _value);
  }

  bool _editPhone = false;
  bool get editPhone => _editPhone;
  set editPhone(bool _value) {
    _editPhone = _value;
  }

  List<SkillOptionsStruct> _skillOptions = [];
  List<SkillOptionsStruct> get skillOptions => _skillOptions;
  set skillOptions(List<SkillOptionsStruct> _value) {
    _skillOptions = _value;
  }

  void addToSkillOptions(SkillOptionsStruct _value) {
    _skillOptions.add(_value);
  }

  void removeFromSkillOptions(SkillOptionsStruct _value) {
    _skillOptions.remove(_value);
  }

  void removeAtIndexFromSkillOptions(int _index) {
    _skillOptions.removeAt(_index);
  }

  void updateSkillOptionsAtIndex(
    int _index,
    SkillOptionsStruct Function(SkillOptionsStruct) updateFn,
  ) {
    _skillOptions[_index] = updateFn(_skillOptions[_index]);
  }

  void insertAtIndexInSkillOptions(int _index, SkillOptionsStruct _value) {
    _skillOptions.insert(_index, _value);
  }

  CreateTaskStruct _createTask = CreateTaskStruct();
  CreateTaskStruct get createTask => _createTask;
  set createTask(CreateTaskStruct _value) {
    _createTask = _value;
    prefs.setString('ff_createTask', _value.serialize());
  }

  void updateCreateTaskStruct(Function(CreateTaskStruct) updateFn) {
    updateFn(_createTask);
    prefs.setString('ff_createTask', _createTask.serialize());
  }

  dynamic _globalSocket;
  dynamic get globalSocket => _globalSocket;
  set globalSocket(dynamic _value) {
    _globalSocket = _value;
    prefs.setString('ff_globalSocket', jsonEncode(_value));
  }

  bool _loading = false;
  bool get loading => _loading;
  set loading(bool _value) {
    _loading = _value;
  }

  bool _startdate = false;
  bool get startdate => _startdate;
  set startdate(bool _value) {
    _startdate = _value;
  }

  bool _showAddress = false;
  bool get showAddress => _showAddress;
  set showAddress(bool _value) {
    _showAddress = _value;
  }

  LatLng? _centerMap;
  LatLng? get centerMap => _centerMap;
  set centerMap(LatLng? _value) {
    _centerMap = _value;
  }

  bool _showOptions = false;
  bool get showOptions => _showOptions;
  set showOptions(bool _value) {
    _showOptions = _value;
  }

  String _sid = '';
  String get sid => _sid;
  set sid(String _value) {
    _sid = _value;
    prefs.setString('ff_sid', _value);
  }

  bool _clearText = false;
  bool get clearText => _clearText;
  set clearText(bool _value) {
    _clearText = _value;
  }

  List<String> _tasksTime = ['Exact Dates', 'Weekly', 'Mountly'];
  List<String> get tasksTime => _tasksTime;
  set tasksTime(List<String> _value) {
    _tasksTime = _value;
    prefs.setStringList('ff_tasksTime', _value);
  }

  void addToTasksTime(String _value) {
    _tasksTime.add(_value);
    prefs.setStringList('ff_tasksTime', _tasksTime);
  }

  void removeFromTasksTime(String _value) {
    _tasksTime.remove(_value);
    prefs.setStringList('ff_tasksTime', _tasksTime);
  }

  void removeAtIndexFromTasksTime(int _index) {
    _tasksTime.removeAt(_index);
    prefs.setStringList('ff_tasksTime', _tasksTime);
  }

  void updateTasksTimeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _tasksTime[_index] = updateFn(_tasksTime[_index]);
    prefs.setStringList('ff_tasksTime', _tasksTime);
  }

  void insertAtIndexInTasksTime(int _index, String _value) {
    _tasksTime.insert(_index, _value);
    prefs.setStringList('ff_tasksTime', _tasksTime);
  }

  bool _showTaskCreationSteps = false;
  bool get showTaskCreationSteps => _showTaskCreationSteps;
  set showTaskCreationSteps(bool _value) {
    _showTaskCreationSteps = _value;
  }

  UserStruct _user = UserStruct();
  UserStruct get user => _user;
  set user(UserStruct _value) {
    _user = _value;
    prefs.setString('ff_user', _value.serialize());
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_user);
    prefs.setString('ff_user', _user.serialize());
  }

  CheapsChatStruct _cheapsChat = CheapsChatStruct();
  CheapsChatStruct get cheapsChat => _cheapsChat;
  set cheapsChat(CheapsChatStruct _value) {
    _cheapsChat = _value;
    prefs.setString('ff_cheapsChat', _value.serialize());
  }

  void updateCheapsChatStruct(Function(CheapsChatStruct) updateFn) {
    updateFn(_cheapsChat);
    prefs.setString('ff_cheapsChat', _cheapsChat.serialize());
  }

  List<String> _gender = ['Mr', 'Mrs', 'Mx'];
  List<String> get gender => _gender;
  set gender(List<String> _value) {
    _gender = _value;
    prefs.setStringList('ff_gender', _value);
  }

  void addToGender(String _value) {
    _gender.add(_value);
    prefs.setStringList('ff_gender', _gender);
  }

  void removeFromGender(String _value) {
    _gender.remove(_value);
    prefs.setStringList('ff_gender', _gender);
  }

  void removeAtIndexFromGender(int _index) {
    _gender.removeAt(_index);
    prefs.setStringList('ff_gender', _gender);
  }

  void updateGenderAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _gender[_index] = updateFn(_gender[_index]);
    prefs.setStringList('ff_gender', _gender);
  }

  void insertAtIndexInGender(int _index, String _value) {
    _gender.insert(_index, _value);
    prefs.setStringList('ff_gender', _gender);
  }

  List<String> _DocumentType = [
    'National ID',
    'Passport',
    'Residence Permit',
    'Driver‘s License'
  ];
  List<String> get DocumentType => _DocumentType;
  set DocumentType(List<String> _value) {
    _DocumentType = _value;
    prefs.setStringList('ff_DocumentType', _value);
  }

  void addToDocumentType(String _value) {
    _DocumentType.add(_value);
    prefs.setStringList('ff_DocumentType', _DocumentType);
  }

  void removeFromDocumentType(String _value) {
    _DocumentType.remove(_value);
    prefs.setStringList('ff_DocumentType', _DocumentType);
  }

  void removeAtIndexFromDocumentType(int _index) {
    _DocumentType.removeAt(_index);
    prefs.setStringList('ff_DocumentType', _DocumentType);
  }

  void updateDocumentTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _DocumentType[_index] = updateFn(_DocumentType[_index]);
    prefs.setStringList('ff_DocumentType', _DocumentType);
  }

  void insertAtIndexInDocumentType(int _index, String _value) {
    _DocumentType.insert(_index, _value);
    prefs.setStringList('ff_DocumentType', _DocumentType);
  }

  bool _closeWelcomeCard = true;
  bool get closeWelcomeCard => _closeWelcomeCard;
  set closeWelcomeCard(bool _value) {
    _closeWelcomeCard = _value;
  }

  bool _SortViewTasker = false;
  bool get SortViewTasker => _SortViewTasker;
  set SortViewTasker(bool _value) {
    _SortViewTasker = _value;
  }

  List<String> _appointmentType = ['Online', 'By Phone', 'On-Site'];
  List<String> get appointmentType => _appointmentType;
  set appointmentType(List<String> _value) {
    _appointmentType = _value;
    prefs.setStringList('ff_appointmentType', _value);
  }

  void addToAppointmentType(String _value) {
    _appointmentType.add(_value);
    prefs.setStringList('ff_appointmentType', _appointmentType);
  }

  void removeFromAppointmentType(String _value) {
    _appointmentType.remove(_value);
    prefs.setStringList('ff_appointmentType', _appointmentType);
  }

  void removeAtIndexFromAppointmentType(int _index) {
    _appointmentType.removeAt(_index);
    prefs.setStringList('ff_appointmentType', _appointmentType);
  }

  void updateAppointmentTypeAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _appointmentType[_index] = updateFn(_appointmentType[_index]);
    prefs.setStringList('ff_appointmentType', _appointmentType);
  }

  void insertAtIndexInAppointmentType(int _index, String _value) {
    _appointmentType.insert(_index, _value);
    prefs.setStringList('ff_appointmentType', _appointmentType);
  }

  bool _watingForSelectRole = false;
  bool get watingForSelectRole => _watingForSelectRole;
  set watingForSelectRole(bool _value) {
    _watingForSelectRole = _value;
  }

  final _myAddressesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> myAddresses({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _myAddressesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyAddressesCache() => _myAddressesManager.clear();
  void clearMyAddressesCacheKey(String? uniqueKey) =>
      _myAddressesManager.clearRequest(uniqueKey);

  final _appRolesManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> appRoles({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _appRolesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAppRolesCache() => _appRolesManager.clear();
  void clearAppRolesCacheKey(String? uniqueKey) =>
      _appRolesManager.clearRequest(uniqueKey);

  final _appRoleDetailsManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> appRoleDetails({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _appRoleDetailsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAppRoleDetailsCache() => _appRoleDetailsManager.clear();
  void clearAppRoleDetailsCacheKey(String? uniqueKey) =>
      _appRoleDetailsManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
