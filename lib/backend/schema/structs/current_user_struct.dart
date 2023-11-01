// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CurrentUserStruct extends BaseStruct {
  CurrentUserStruct({
    String? email,
    String? password,
    String? country,
    String? language,
    String? accounttype,
    String? title,
    String? firstname,
    String? lastname,
    String? mobilenumber,
    int? digitcode,
    String? countrycode,
    String? role,
    bool? skillBringsowntools,
    bool? skillBuysmaterial,
    LatLng? location,
    String? street,
    String? city,
    String? postalCode,
    int? no,
    String? addressesCountry,
    bool? insuranceProfileDeatels,
    String? describation,
    double? rate,
    String? educationTrainingName,
    String? nameofInstituteCompany,
    String? banner,
    String? driverLicense,
    double? radiosOfWork,
    bool? isSubscribed,
    bool? isVerified,
    int? reviewCount,
    double? reviewAverage,
    String? dateOfBirth,
    String? educationType,
    List<String>? lanuagesListForPostTask,
    List<EducationStruct>? education,
    List<AddressesStruct>? addresses,
    int? yearsofexperience,
    String? avatar,
  })  : _email = email,
        _password = password,
        _country = country,
        _language = language,
        _accounttype = accounttype,
        _title = title,
        _firstname = firstname,
        _lastname = lastname,
        _mobilenumber = mobilenumber,
        _digitcode = digitcode,
        _countrycode = countrycode,
        _role = role,
        _skillBringsowntools = skillBringsowntools,
        _skillBuysmaterial = skillBuysmaterial,
        _location = location,
        _street = street,
        _city = city,
        _postalCode = postalCode,
        _no = no,
        _addressesCountry = addressesCountry,
        _insuranceProfileDeatels = insuranceProfileDeatels,
        _describation = describation,
        _rate = rate,
        _educationTrainingName = educationTrainingName,
        _nameofInstituteCompany = nameofInstituteCompany,
        _banner = banner,
        _driverLicense = driverLicense,
        _radiosOfWork = radiosOfWork,
        _isSubscribed = isSubscribed,
        _isVerified = isVerified,
        _reviewCount = reviewCount,
        _reviewAverage = reviewAverage,
        _dateOfBirth = dateOfBirth,
        _educationType = educationType,
        _lanuagesListForPostTask = lanuagesListForPostTask,
        _education = education,
        _addresses = addresses,
        _yearsofexperience = yearsofexperience,
        _avatar = avatar;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "Password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;
  bool hasPassword() => _password != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "Language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;
  bool hasLanguage() => _language != null;

  // "Accounttype" field.
  String? _accounttype;
  String get accounttype => _accounttype ?? '';
  set accounttype(String? val) => _accounttype = val;
  bool hasAccounttype() => _accounttype != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "Firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  set firstname(String? val) => _firstname = val;
  bool hasFirstname() => _firstname != null;

  // "Lastname" field.
  String? _lastname;
  String get lastname => _lastname ?? '';
  set lastname(String? val) => _lastname = val;
  bool hasLastname() => _lastname != null;

  // "Mobilenumber" field.
  String? _mobilenumber;
  String get mobilenumber => _mobilenumber ?? '';
  set mobilenumber(String? val) => _mobilenumber = val;
  bool hasMobilenumber() => _mobilenumber != null;

  // "Digitcode" field.
  int? _digitcode;
  int get digitcode => _digitcode ?? 0;
  set digitcode(int? val) => _digitcode = val;
  void incrementDigitcode(int amount) => _digitcode = digitcode + amount;
  bool hasDigitcode() => _digitcode != null;

  // "Countrycode" field.
  String? _countrycode;
  String get countrycode => _countrycode ?? '';
  set countrycode(String? val) => _countrycode = val;
  bool hasCountrycode() => _countrycode != null;

  // "Role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  // "SkillBringsowntools" field.
  bool? _skillBringsowntools;
  bool get skillBringsowntools => _skillBringsowntools ?? false;
  set skillBringsowntools(bool? val) => _skillBringsowntools = val;
  bool hasSkillBringsowntools() => _skillBringsowntools != null;

  // "SkillBuysmaterial" field.
  bool? _skillBuysmaterial;
  bool get skillBuysmaterial => _skillBuysmaterial ?? false;
  set skillBuysmaterial(bool? val) => _skillBuysmaterial = val;
  bool hasSkillBuysmaterial() => _skillBuysmaterial != null;

  // "Location" field.
  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? val) => _location = val;
  bool hasLocation() => _location != null;

  // "Street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;
  bool hasStreet() => _street != null;

  // "City" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "PostalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;
  bool hasPostalCode() => _postalCode != null;

  // "No" field.
  int? _no;
  int get no => _no ?? 0;
  set no(int? val) => _no = val;
  void incrementNo(int amount) => _no = no + amount;
  bool hasNo() => _no != null;

  // "AddressesCountry" field.
  String? _addressesCountry;
  String get addressesCountry => _addressesCountry ?? '';
  set addressesCountry(String? val) => _addressesCountry = val;
  bool hasAddressesCountry() => _addressesCountry != null;

  // "InsuranceProfileDeatels" field.
  bool? _insuranceProfileDeatels;
  bool get insuranceProfileDeatels => _insuranceProfileDeatels ?? false;
  set insuranceProfileDeatels(bool? val) => _insuranceProfileDeatels = val;
  bool hasInsuranceProfileDeatels() => _insuranceProfileDeatels != null;

  // "Describation" field.
  String? _describation;
  String get describation => _describation ?? '';
  set describation(String? val) => _describation = val;
  bool hasDescribation() => _describation != null;

  // "Rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;
  void incrementRate(double amount) => _rate = rate + amount;
  bool hasRate() => _rate != null;

  // "EducationTrainingName" field.
  String? _educationTrainingName;
  String get educationTrainingName => _educationTrainingName ?? '';
  set educationTrainingName(String? val) => _educationTrainingName = val;
  bool hasEducationTrainingName() => _educationTrainingName != null;

  // "NameofInstituteCompany" field.
  String? _nameofInstituteCompany;
  String get nameofInstituteCompany => _nameofInstituteCompany ?? '';
  set nameofInstituteCompany(String? val) => _nameofInstituteCompany = val;
  bool hasNameofInstituteCompany() => _nameofInstituteCompany != null;

  // "Banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  set banner(String? val) => _banner = val;
  bool hasBanner() => _banner != null;

  // "driver_license" field.
  String? _driverLicense;
  String get driverLicense => _driverLicense ?? '';
  set driverLicense(String? val) => _driverLicense = val;
  bool hasDriverLicense() => _driverLicense != null;

  // "radios_of_work" field.
  double? _radiosOfWork;
  double get radiosOfWork => _radiosOfWork ?? 0.0;
  set radiosOfWork(double? val) => _radiosOfWork = val;
  void incrementRadiosOfWork(double amount) =>
      _radiosOfWork = radiosOfWork + amount;
  bool hasRadiosOfWork() => _radiosOfWork != null;

  // "is_subscribed" field.
  bool? _isSubscribed;
  bool get isSubscribed => _isSubscribed ?? false;
  set isSubscribed(bool? val) => _isSubscribed = val;
  bool hasIsSubscribed() => _isSubscribed != null;

  // "is_verified" field.
  bool? _isVerified;
  bool get isVerified => _isVerified ?? false;
  set isVerified(bool? val) => _isVerified = val;
  bool hasIsVerified() => _isVerified != null;

  // "review_count" field.
  int? _reviewCount;
  int get reviewCount => _reviewCount ?? 0;
  set reviewCount(int? val) => _reviewCount = val;
  void incrementReviewCount(int amount) => _reviewCount = reviewCount + amount;
  bool hasReviewCount() => _reviewCount != null;

  // "review_average" field.
  double? _reviewAverage;
  double get reviewAverage => _reviewAverage ?? 0.0;
  set reviewAverage(double? val) => _reviewAverage = val;
  void incrementReviewAverage(double amount) =>
      _reviewAverage = reviewAverage + amount;
  bool hasReviewAverage() => _reviewAverage != null;

  // "date_of_birth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  set dateOfBirth(String? val) => _dateOfBirth = val;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "EducationType" field.
  String? _educationType;
  String get educationType => _educationType ?? '';
  set educationType(String? val) => _educationType = val;
  bool hasEducationType() => _educationType != null;

  // "lanuagesListForPostTask" field.
  List<String>? _lanuagesListForPostTask;
  List<String> get lanuagesListForPostTask =>
      _lanuagesListForPostTask ?? const [];
  set lanuagesListForPostTask(List<String>? val) =>
      _lanuagesListForPostTask = val;
  void updateLanuagesListForPostTask(Function(List<String>) updateFn) =>
      updateFn(_lanuagesListForPostTask ??= []);
  bool hasLanuagesListForPostTask() => _lanuagesListForPostTask != null;

  // "Education" field.
  List<EducationStruct>? _education;
  List<EducationStruct> get education => _education ?? const [];
  set education(List<EducationStruct>? val) => _education = val;
  void updateEducation(Function(List<EducationStruct>) updateFn) =>
      updateFn(_education ??= []);
  bool hasEducation() => _education != null;

  // "Addresses" field.
  List<AddressesStruct>? _addresses;
  List<AddressesStruct> get addresses => _addresses ?? const [];
  set addresses(List<AddressesStruct>? val) => _addresses = val;
  void updateAddresses(Function(List<AddressesStruct>) updateFn) =>
      updateFn(_addresses ??= []);
  bool hasAddresses() => _addresses != null;

  // "Yearsofexperience" field.
  int? _yearsofexperience;
  int get yearsofexperience => _yearsofexperience ?? 0;
  set yearsofexperience(int? val) => _yearsofexperience = val;
  void incrementYearsofexperience(int amount) =>
      _yearsofexperience = yearsofexperience + amount;
  bool hasYearsofexperience() => _yearsofexperience != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;
  bool hasAvatar() => _avatar != null;

  static CurrentUserStruct fromMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        email: data['Email'] as String?,
        password: data['Password'] as String?,
        country: data['Country'] as String?,
        language: data['Language'] as String?,
        accounttype: data['Accounttype'] as String?,
        title: data['Title'] as String?,
        firstname: data['Firstname'] as String?,
        lastname: data['Lastname'] as String?,
        mobilenumber: data['Mobilenumber'] as String?,
        digitcode: castToType<int>(data['Digitcode']),
        countrycode: data['Countrycode'] as String?,
        role: data['Role'] as String?,
        skillBringsowntools: data['SkillBringsowntools'] as bool?,
        skillBuysmaterial: data['SkillBuysmaterial'] as bool?,
        location: data['Location'] as LatLng?,
        street: data['Street'] as String?,
        city: data['City'] as String?,
        postalCode: data['PostalCode'] as String?,
        no: castToType<int>(data['No']),
        addressesCountry: data['AddressesCountry'] as String?,
        insuranceProfileDeatels: data['InsuranceProfileDeatels'] as bool?,
        describation: data['Describation'] as String?,
        rate: castToType<double>(data['Rate']),
        educationTrainingName: data['EducationTrainingName'] as String?,
        nameofInstituteCompany: data['NameofInstituteCompany'] as String?,
        banner: data['Banner'] as String?,
        driverLicense: data['driver_license'] as String?,
        radiosOfWork: castToType<double>(data['radios_of_work']),
        isSubscribed: data['is_subscribed'] as bool?,
        isVerified: data['is_verified'] as bool?,
        reviewCount: castToType<int>(data['review_count']),
        reviewAverage: castToType<double>(data['review_average']),
        dateOfBirth: data['date_of_birth'] as String?,
        educationType: data['EducationType'] as String?,
        lanuagesListForPostTask: getDataList(data['lanuagesListForPostTask']),
        education: getStructList(
          data['Education'],
          EducationStruct.fromMap,
        ),
        addresses: getStructList(
          data['Addresses'],
          AddressesStruct.fromMap,
        ),
        yearsofexperience: castToType<int>(data['Yearsofexperience']),
        avatar: data['avatar'] as String?,
      );

  static CurrentUserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CurrentUserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'Email': _email,
        'Password': _password,
        'Country': _country,
        'Language': _language,
        'Accounttype': _accounttype,
        'Title': _title,
        'Firstname': _firstname,
        'Lastname': _lastname,
        'Mobilenumber': _mobilenumber,
        'Digitcode': _digitcode,
        'Countrycode': _countrycode,
        'Role': _role,
        'SkillBringsowntools': _skillBringsowntools,
        'SkillBuysmaterial': _skillBuysmaterial,
        'Location': _location,
        'Street': _street,
        'City': _city,
        'PostalCode': _postalCode,
        'No': _no,
        'AddressesCountry': _addressesCountry,
        'InsuranceProfileDeatels': _insuranceProfileDeatels,
        'Describation': _describation,
        'Rate': _rate,
        'EducationTrainingName': _educationTrainingName,
        'NameofInstituteCompany': _nameofInstituteCompany,
        'Banner': _banner,
        'driver_license': _driverLicense,
        'radios_of_work': _radiosOfWork,
        'is_subscribed': _isSubscribed,
        'is_verified': _isVerified,
        'review_count': _reviewCount,
        'review_average': _reviewAverage,
        'date_of_birth': _dateOfBirth,
        'EducationType': _educationType,
        'lanuagesListForPostTask': _lanuagesListForPostTask,
        'Education': _education?.map((e) => e.toMap()).toList(),
        'Addresses': _addresses?.map((e) => e.toMap()).toList(),
        'Yearsofexperience': _yearsofexperience,
        'avatar': _avatar,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'Password': serializeParam(
          _password,
          ParamType.String,
        ),
        'Country': serializeParam(
          _country,
          ParamType.String,
        ),
        'Language': serializeParam(
          _language,
          ParamType.String,
        ),
        'Accounttype': serializeParam(
          _accounttype,
          ParamType.String,
        ),
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'Firstname': serializeParam(
          _firstname,
          ParamType.String,
        ),
        'Lastname': serializeParam(
          _lastname,
          ParamType.String,
        ),
        'Mobilenumber': serializeParam(
          _mobilenumber,
          ParamType.String,
        ),
        'Digitcode': serializeParam(
          _digitcode,
          ParamType.int,
        ),
        'Countrycode': serializeParam(
          _countrycode,
          ParamType.String,
        ),
        'Role': serializeParam(
          _role,
          ParamType.String,
        ),
        'SkillBringsowntools': serializeParam(
          _skillBringsowntools,
          ParamType.bool,
        ),
        'SkillBuysmaterial': serializeParam(
          _skillBuysmaterial,
          ParamType.bool,
        ),
        'Location': serializeParam(
          _location,
          ParamType.LatLng,
        ),
        'Street': serializeParam(
          _street,
          ParamType.String,
        ),
        'City': serializeParam(
          _city,
          ParamType.String,
        ),
        'PostalCode': serializeParam(
          _postalCode,
          ParamType.String,
        ),
        'No': serializeParam(
          _no,
          ParamType.int,
        ),
        'AddressesCountry': serializeParam(
          _addressesCountry,
          ParamType.String,
        ),
        'InsuranceProfileDeatels': serializeParam(
          _insuranceProfileDeatels,
          ParamType.bool,
        ),
        'Describation': serializeParam(
          _describation,
          ParamType.String,
        ),
        'Rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'EducationTrainingName': serializeParam(
          _educationTrainingName,
          ParamType.String,
        ),
        'NameofInstituteCompany': serializeParam(
          _nameofInstituteCompany,
          ParamType.String,
        ),
        'Banner': serializeParam(
          _banner,
          ParamType.String,
        ),
        'driver_license': serializeParam(
          _driverLicense,
          ParamType.String,
        ),
        'radios_of_work': serializeParam(
          _radiosOfWork,
          ParamType.double,
        ),
        'is_subscribed': serializeParam(
          _isSubscribed,
          ParamType.bool,
        ),
        'is_verified': serializeParam(
          _isVerified,
          ParamType.bool,
        ),
        'review_count': serializeParam(
          _reviewCount,
          ParamType.int,
        ),
        'review_average': serializeParam(
          _reviewAverage,
          ParamType.double,
        ),
        'date_of_birth': serializeParam(
          _dateOfBirth,
          ParamType.String,
        ),
        'EducationType': serializeParam(
          _educationType,
          ParamType.String,
        ),
        'lanuagesListForPostTask': serializeParam(
          _lanuagesListForPostTask,
          ParamType.String,
          true,
        ),
        'Education': serializeParam(
          _education,
          ParamType.DataStruct,
          true,
        ),
        'Addresses': serializeParam(
          _addresses,
          ParamType.DataStruct,
          true,
        ),
        'Yearsofexperience': serializeParam(
          _yearsofexperience,
          ParamType.int,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
      }.withoutNulls;

  static CurrentUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      CurrentUserStruct(
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['Password'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['Country'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['Language'],
          ParamType.String,
          false,
        ),
        accounttype: deserializeParam(
          data['Accounttype'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        firstname: deserializeParam(
          data['Firstname'],
          ParamType.String,
          false,
        ),
        lastname: deserializeParam(
          data['Lastname'],
          ParamType.String,
          false,
        ),
        mobilenumber: deserializeParam(
          data['Mobilenumber'],
          ParamType.String,
          false,
        ),
        digitcode: deserializeParam(
          data['Digitcode'],
          ParamType.int,
          false,
        ),
        countrycode: deserializeParam(
          data['Countrycode'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['Role'],
          ParamType.String,
          false,
        ),
        skillBringsowntools: deserializeParam(
          data['SkillBringsowntools'],
          ParamType.bool,
          false,
        ),
        skillBuysmaterial: deserializeParam(
          data['SkillBuysmaterial'],
          ParamType.bool,
          false,
        ),
        location: deserializeParam(
          data['Location'],
          ParamType.LatLng,
          false,
        ),
        street: deserializeParam(
          data['Street'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['City'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['PostalCode'],
          ParamType.String,
          false,
        ),
        no: deserializeParam(
          data['No'],
          ParamType.int,
          false,
        ),
        addressesCountry: deserializeParam(
          data['AddressesCountry'],
          ParamType.String,
          false,
        ),
        insuranceProfileDeatels: deserializeParam(
          data['InsuranceProfileDeatels'],
          ParamType.bool,
          false,
        ),
        describation: deserializeParam(
          data['Describation'],
          ParamType.String,
          false,
        ),
        rate: deserializeParam(
          data['Rate'],
          ParamType.double,
          false,
        ),
        educationTrainingName: deserializeParam(
          data['EducationTrainingName'],
          ParamType.String,
          false,
        ),
        nameofInstituteCompany: deserializeParam(
          data['NameofInstituteCompany'],
          ParamType.String,
          false,
        ),
        banner: deserializeParam(
          data['Banner'],
          ParamType.String,
          false,
        ),
        driverLicense: deserializeParam(
          data['driver_license'],
          ParamType.String,
          false,
        ),
        radiosOfWork: deserializeParam(
          data['radios_of_work'],
          ParamType.double,
          false,
        ),
        isSubscribed: deserializeParam(
          data['is_subscribed'],
          ParamType.bool,
          false,
        ),
        isVerified: deserializeParam(
          data['is_verified'],
          ParamType.bool,
          false,
        ),
        reviewCount: deserializeParam(
          data['review_count'],
          ParamType.int,
          false,
        ),
        reviewAverage: deserializeParam(
          data['review_average'],
          ParamType.double,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['date_of_birth'],
          ParamType.String,
          false,
        ),
        educationType: deserializeParam(
          data['EducationType'],
          ParamType.String,
          false,
        ),
        lanuagesListForPostTask: deserializeParam<String>(
          data['lanuagesListForPostTask'],
          ParamType.String,
          true,
        ),
        education: deserializeStructParam<EducationStruct>(
          data['Education'],
          ParamType.DataStruct,
          true,
          structBuilder: EducationStruct.fromSerializableMap,
        ),
        addresses: deserializeStructParam<AddressesStruct>(
          data['Addresses'],
          ParamType.DataStruct,
          true,
          structBuilder: AddressesStruct.fromSerializableMap,
        ),
        yearsofexperience: deserializeParam(
          data['Yearsofexperience'],
          ParamType.int,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CurrentUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CurrentUserStruct &&
        email == other.email &&
        password == other.password &&
        country == other.country &&
        language == other.language &&
        accounttype == other.accounttype &&
        title == other.title &&
        firstname == other.firstname &&
        lastname == other.lastname &&
        mobilenumber == other.mobilenumber &&
        digitcode == other.digitcode &&
        countrycode == other.countrycode &&
        role == other.role &&
        skillBringsowntools == other.skillBringsowntools &&
        skillBuysmaterial == other.skillBuysmaterial &&
        location == other.location &&
        street == other.street &&
        city == other.city &&
        postalCode == other.postalCode &&
        no == other.no &&
        addressesCountry == other.addressesCountry &&
        insuranceProfileDeatels == other.insuranceProfileDeatels &&
        describation == other.describation &&
        rate == other.rate &&
        educationTrainingName == other.educationTrainingName &&
        nameofInstituteCompany == other.nameofInstituteCompany &&
        banner == other.banner &&
        driverLicense == other.driverLicense &&
        radiosOfWork == other.radiosOfWork &&
        isSubscribed == other.isSubscribed &&
        isVerified == other.isVerified &&
        reviewCount == other.reviewCount &&
        reviewAverage == other.reviewAverage &&
        dateOfBirth == other.dateOfBirth &&
        educationType == other.educationType &&
        listEquality.equals(
            lanuagesListForPostTask, other.lanuagesListForPostTask) &&
        listEquality.equals(education, other.education) &&
        listEquality.equals(addresses, other.addresses) &&
        yearsofexperience == other.yearsofexperience &&
        avatar == other.avatar;
  }

  @override
  int get hashCode => const ListEquality().hash([
        email,
        password,
        country,
        language,
        accounttype,
        title,
        firstname,
        lastname,
        mobilenumber,
        digitcode,
        countrycode,
        role,
        skillBringsowntools,
        skillBuysmaterial,
        location,
        street,
        city,
        postalCode,
        no,
        addressesCountry,
        insuranceProfileDeatels,
        describation,
        rate,
        educationTrainingName,
        nameofInstituteCompany,
        banner,
        driverLicense,
        radiosOfWork,
        isSubscribed,
        isVerified,
        reviewCount,
        reviewAverage,
        dateOfBirth,
        educationType,
        lanuagesListForPostTask,
        education,
        addresses,
        yearsofexperience,
        avatar
      ]);
}

CurrentUserStruct createCurrentUserStruct({
  String? email,
  String? password,
  String? country,
  String? language,
  String? accounttype,
  String? title,
  String? firstname,
  String? lastname,
  String? mobilenumber,
  int? digitcode,
  String? countrycode,
  String? role,
  bool? skillBringsowntools,
  bool? skillBuysmaterial,
  LatLng? location,
  String? street,
  String? city,
  String? postalCode,
  int? no,
  String? addressesCountry,
  bool? insuranceProfileDeatels,
  String? describation,
  double? rate,
  String? educationTrainingName,
  String? nameofInstituteCompany,
  String? banner,
  String? driverLicense,
  double? radiosOfWork,
  bool? isSubscribed,
  bool? isVerified,
  int? reviewCount,
  double? reviewAverage,
  String? dateOfBirth,
  String? educationType,
  int? yearsofexperience,
  String? avatar,
}) =>
    CurrentUserStruct(
      email: email,
      password: password,
      country: country,
      language: language,
      accounttype: accounttype,
      title: title,
      firstname: firstname,
      lastname: lastname,
      mobilenumber: mobilenumber,
      digitcode: digitcode,
      countrycode: countrycode,
      role: role,
      skillBringsowntools: skillBringsowntools,
      skillBuysmaterial: skillBuysmaterial,
      location: location,
      street: street,
      city: city,
      postalCode: postalCode,
      no: no,
      addressesCountry: addressesCountry,
      insuranceProfileDeatels: insuranceProfileDeatels,
      describation: describation,
      rate: rate,
      educationTrainingName: educationTrainingName,
      nameofInstituteCompany: nameofInstituteCompany,
      banner: banner,
      driverLicense: driverLicense,
      radiosOfWork: radiosOfWork,
      isSubscribed: isSubscribed,
      isVerified: isVerified,
      reviewCount: reviewCount,
      reviewAverage: reviewAverage,
      dateOfBirth: dateOfBirth,
      educationType: educationType,
      yearsofexperience: yearsofexperience,
      avatar: avatar,
    );
