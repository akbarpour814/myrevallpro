// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerProfileStruct extends BaseStruct {
  CustomerProfileStruct({
    String? name,
    String? companyName,
    String? title,
    String? firstName,
    String? accountType,
    String? lastName,
    String? dateOfBirth,
    String? gender,
    String? describtion,
    String? banner,
    String? user,
    String? customer,
    int? isSubscribed,
    String? subscription,
    String? roleProfileName,
    String? role,
    double? reviewAverage,
    int? reviewCount,
    String? phoneNumber,
    int? phoneVerified,
    int? personalDetailsCompleted,
    String? emailVerificationCode,
    int? identified,
    int? emailVerified,
    int? isInWall,
    int? yearsOfExperience,
    int? insurance,
    String? driversLicense,
    String? avatar,
    String? city,
    String? country,
    String? language,
    double? latitude,
    double? longitude,
    List<CustomerProfileBadgeStruct>? badges,
  })  : _name = name,
        _companyName = companyName,
        _title = title,
        _firstName = firstName,
        _accountType = accountType,
        _lastName = lastName,
        _dateOfBirth = dateOfBirth,
        _gender = gender,
        _describtion = describtion,
        _banner = banner,
        _user = user,
        _customer = customer,
        _isSubscribed = isSubscribed,
        _subscription = subscription,
        _roleProfileName = roleProfileName,
        _role = role,
        _reviewAverage = reviewAverage,
        _reviewCount = reviewCount,
        _phoneNumber = phoneNumber,
        _phoneVerified = phoneVerified,
        _personalDetailsCompleted = personalDetailsCompleted,
        _emailVerificationCode = emailVerificationCode,
        _identified = identified,
        _emailVerified = emailVerified,
        _isInWall = isInWall,
        _yearsOfExperience = yearsOfExperience,
        _insurance = insurance,
        _driversLicense = driversLicense,
        _avatar = avatar,
        _city = city,
        _country = country,
        _language = language,
        _latitude = latitude,
        _longitude = longitude,
        _badges = badges;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;
  bool hasCompanyName() => _companyName != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "account_type" field.
  String? _accountType;
  String get accountType => _accountType ?? '';
  set accountType(String? val) => _accountType = val;
  bool hasAccountType() => _accountType != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;
  bool hasLastName() => _lastName != null;

  // "date_of_birth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  set dateOfBirth(String? val) => _dateOfBirth = val;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;
  bool hasGender() => _gender != null;

  // "describtion" field.
  String? _describtion;
  String get describtion => _describtion ?? '';
  set describtion(String? val) => _describtion = val;
  bool hasDescribtion() => _describtion != null;

  // "banner" field.
  String? _banner;
  String get banner => _banner ?? '';
  set banner(String? val) => _banner = val;
  bool hasBanner() => _banner != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  set user(String? val) => _user = val;
  bool hasUser() => _user != null;

  // "customer" field.
  String? _customer;
  String get customer => _customer ?? '';
  set customer(String? val) => _customer = val;
  bool hasCustomer() => _customer != null;

  // "is_subscribed" field.
  int? _isSubscribed;
  int get isSubscribed => _isSubscribed ?? 0;
  set isSubscribed(int? val) => _isSubscribed = val;
  void incrementIsSubscribed(int amount) =>
      _isSubscribed = isSubscribed + amount;
  bool hasIsSubscribed() => _isSubscribed != null;

  // "subscription" field.
  String? _subscription;
  String get subscription => _subscription ?? '';
  set subscription(String? val) => _subscription = val;
  bool hasSubscription() => _subscription != null;

  // "role_profile_name" field.
  String? _roleProfileName;
  String get roleProfileName => _roleProfileName ?? '';
  set roleProfileName(String? val) => _roleProfileName = val;
  bool hasRoleProfileName() => _roleProfileName != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;
  bool hasRole() => _role != null;

  // "review_average" field.
  double? _reviewAverage;
  double get reviewAverage => _reviewAverage ?? 0.0;
  set reviewAverage(double? val) => _reviewAverage = val;
  void incrementReviewAverage(double amount) =>
      _reviewAverage = reviewAverage + amount;
  bool hasReviewAverage() => _reviewAverage != null;

  // "review_count" field.
  int? _reviewCount;
  int get reviewCount => _reviewCount ?? 0;
  set reviewCount(int? val) => _reviewCount = val;
  void incrementReviewCount(int amount) => _reviewCount = reviewCount + amount;
  bool hasReviewCount() => _reviewCount != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "phone_verified" field.
  int? _phoneVerified;
  int get phoneVerified => _phoneVerified ?? 0;
  set phoneVerified(int? val) => _phoneVerified = val;
  void incrementPhoneVerified(int amount) =>
      _phoneVerified = phoneVerified + amount;
  bool hasPhoneVerified() => _phoneVerified != null;

  // "personal_details_completed" field.
  int? _personalDetailsCompleted;
  int get personalDetailsCompleted => _personalDetailsCompleted ?? 0;
  set personalDetailsCompleted(int? val) => _personalDetailsCompleted = val;
  void incrementPersonalDetailsCompleted(int amount) =>
      _personalDetailsCompleted = personalDetailsCompleted + amount;
  bool hasPersonalDetailsCompleted() => _personalDetailsCompleted != null;

  // "email_verification_code" field.
  String? _emailVerificationCode;
  String get emailVerificationCode => _emailVerificationCode ?? '';
  set emailVerificationCode(String? val) => _emailVerificationCode = val;
  bool hasEmailVerificationCode() => _emailVerificationCode != null;

  // "identified" field.
  int? _identified;
  int get identified => _identified ?? 0;
  set identified(int? val) => _identified = val;
  void incrementIdentified(int amount) => _identified = identified + amount;
  bool hasIdentified() => _identified != null;

  // "email_verified" field.
  int? _emailVerified;
  int get emailVerified => _emailVerified ?? 0;
  set emailVerified(int? val) => _emailVerified = val;
  void incrementEmailVerified(int amount) =>
      _emailVerified = emailVerified + amount;
  bool hasEmailVerified() => _emailVerified != null;

  // "is_in_wall" field.
  int? _isInWall;
  int get isInWall => _isInWall ?? 0;
  set isInWall(int? val) => _isInWall = val;
  void incrementIsInWall(int amount) => _isInWall = isInWall + amount;
  bool hasIsInWall() => _isInWall != null;

  // "years_of_experience" field.
  int? _yearsOfExperience;
  int get yearsOfExperience => _yearsOfExperience ?? 0;
  set yearsOfExperience(int? val) => _yearsOfExperience = val;
  void incrementYearsOfExperience(int amount) =>
      _yearsOfExperience = yearsOfExperience + amount;
  bool hasYearsOfExperience() => _yearsOfExperience != null;

  // "insurance" field.
  int? _insurance;
  int get insurance => _insurance ?? 0;
  set insurance(int? val) => _insurance = val;
  void incrementInsurance(int amount) => _insurance = insurance + amount;
  bool hasInsurance() => _insurance != null;

  // "drivers_license" field.
  String? _driversLicense;
  String get driversLicense => _driversLicense ?? '';
  set driversLicense(String? val) => _driversLicense = val;
  bool hasDriversLicense() => _driversLicense != null;

  // "avatar" field.
  String? _avatar;
  String get avatar => _avatar ?? '';
  set avatar(String? val) => _avatar = val;
  bool hasAvatar() => _avatar != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  set country(String? val) => _country = val;
  bool hasCountry() => _country != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  set language(String? val) => _language = val;
  bool hasLanguage() => _language != null;

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

  // "badges" field.
  List<CustomerProfileBadgeStruct>? _badges;
  List<CustomerProfileBadgeStruct> get badges => _badges ?? const [];
  set badges(List<CustomerProfileBadgeStruct>? val) => _badges = val;
  void updateBadges(Function(List<CustomerProfileBadgeStruct>) updateFn) =>
      updateFn(_badges ??= []);
  bool hasBadges() => _badges != null;

  static CustomerProfileStruct fromMap(Map<String, dynamic> data) =>
      CustomerProfileStruct(
        name: data['name'] as String?,
        companyName: data['company_name'] as String?,
        title: data['title'] as String?,
        firstName: data['first_name'] as String?,
        accountType: data['account_type'] as String?,
        lastName: data['last_name'] as String?,
        dateOfBirth: data['date_of_birth'] as String?,
        gender: data['gender'] as String?,
        describtion: data['describtion'] as String?,
        banner: data['banner'] as String?,
        user: data['user'] as String?,
        customer: data['customer'] as String?,
        isSubscribed: castToType<int>(data['is_subscribed']),
        subscription: data['subscription'] as String?,
        roleProfileName: data['role_profile_name'] as String?,
        role: data['role'] as String?,
        reviewAverage: castToType<double>(data['review_average']),
        reviewCount: castToType<int>(data['review_count']),
        phoneNumber: data['phone_number'] as String?,
        phoneVerified: castToType<int>(data['phone_verified']),
        personalDetailsCompleted:
            castToType<int>(data['personal_details_completed']),
        emailVerificationCode: data['email_verification_code'] as String?,
        identified: castToType<int>(data['identified']),
        emailVerified: castToType<int>(data['email_verified']),
        isInWall: castToType<int>(data['is_in_wall']),
        yearsOfExperience: castToType<int>(data['years_of_experience']),
        insurance: castToType<int>(data['insurance']),
        driversLicense: data['drivers_license'] as String?,
        avatar: data['avatar'] as String?,
        city: data['city'] as String?,
        country: data['country'] as String?,
        language: data['language'] as String?,
        latitude: castToType<double>(data['latitude']),
        longitude: castToType<double>(data['longitude']),
        badges: getStructList(
          data['badges'],
          CustomerProfileBadgeStruct.fromMap,
        ),
      );

  static CustomerProfileStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CustomerProfileStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'company_name': _companyName,
        'title': _title,
        'first_name': _firstName,
        'account_type': _accountType,
        'last_name': _lastName,
        'date_of_birth': _dateOfBirth,
        'gender': _gender,
        'describtion': _describtion,
        'banner': _banner,
        'user': _user,
        'customer': _customer,
        'is_subscribed': _isSubscribed,
        'subscription': _subscription,
        'role_profile_name': _roleProfileName,
        'role': _role,
        'review_average': _reviewAverage,
        'review_count': _reviewCount,
        'phone_number': _phoneNumber,
        'phone_verified': _phoneVerified,
        'personal_details_completed': _personalDetailsCompleted,
        'email_verification_code': _emailVerificationCode,
        'identified': _identified,
        'email_verified': _emailVerified,
        'is_in_wall': _isInWall,
        'years_of_experience': _yearsOfExperience,
        'insurance': _insurance,
        'drivers_license': _driversLicense,
        'avatar': _avatar,
        'city': _city,
        'country': _country,
        'language': _language,
        'latitude': _latitude,
        'longitude': _longitude,
        'badges': _badges?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'account_type': serializeParam(
          _accountType,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'date_of_birth': serializeParam(
          _dateOfBirth,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
        'describtion': serializeParam(
          _describtion,
          ParamType.String,
        ),
        'banner': serializeParam(
          _banner,
          ParamType.String,
        ),
        'user': serializeParam(
          _user,
          ParamType.String,
        ),
        'customer': serializeParam(
          _customer,
          ParamType.String,
        ),
        'is_subscribed': serializeParam(
          _isSubscribed,
          ParamType.int,
        ),
        'subscription': serializeParam(
          _subscription,
          ParamType.String,
        ),
        'role_profile_name': serializeParam(
          _roleProfileName,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'review_average': serializeParam(
          _reviewAverage,
          ParamType.double,
        ),
        'review_count': serializeParam(
          _reviewCount,
          ParamType.int,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'phone_verified': serializeParam(
          _phoneVerified,
          ParamType.int,
        ),
        'personal_details_completed': serializeParam(
          _personalDetailsCompleted,
          ParamType.int,
        ),
        'email_verification_code': serializeParam(
          _emailVerificationCode,
          ParamType.String,
        ),
        'identified': serializeParam(
          _identified,
          ParamType.int,
        ),
        'email_verified': serializeParam(
          _emailVerified,
          ParamType.int,
        ),
        'is_in_wall': serializeParam(
          _isInWall,
          ParamType.int,
        ),
        'years_of_experience': serializeParam(
          _yearsOfExperience,
          ParamType.int,
        ),
        'insurance': serializeParam(
          _insurance,
          ParamType.int,
        ),
        'drivers_license': serializeParam(
          _driversLicense,
          ParamType.String,
        ),
        'avatar': serializeParam(
          _avatar,
          ParamType.String,
        ),
        'city': serializeParam(
          _city,
          ParamType.String,
        ),
        'country': serializeParam(
          _country,
          ParamType.String,
        ),
        'language': serializeParam(
          _language,
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
        'badges': serializeParam(
          _badges,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CustomerProfileStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomerProfileStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        accountType: deserializeParam(
          data['account_type'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['date_of_birth'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
        describtion: deserializeParam(
          data['describtion'],
          ParamType.String,
          false,
        ),
        banner: deserializeParam(
          data['banner'],
          ParamType.String,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.String,
          false,
        ),
        customer: deserializeParam(
          data['customer'],
          ParamType.String,
          false,
        ),
        isSubscribed: deserializeParam(
          data['is_subscribed'],
          ParamType.int,
          false,
        ),
        subscription: deserializeParam(
          data['subscription'],
          ParamType.String,
          false,
        ),
        roleProfileName: deserializeParam(
          data['role_profile_name'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        reviewAverage: deserializeParam(
          data['review_average'],
          ParamType.double,
          false,
        ),
        reviewCount: deserializeParam(
          data['review_count'],
          ParamType.int,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        phoneVerified: deserializeParam(
          data['phone_verified'],
          ParamType.int,
          false,
        ),
        personalDetailsCompleted: deserializeParam(
          data['personal_details_completed'],
          ParamType.int,
          false,
        ),
        emailVerificationCode: deserializeParam(
          data['email_verification_code'],
          ParamType.String,
          false,
        ),
        identified: deserializeParam(
          data['identified'],
          ParamType.int,
          false,
        ),
        emailVerified: deserializeParam(
          data['email_verified'],
          ParamType.int,
          false,
        ),
        isInWall: deserializeParam(
          data['is_in_wall'],
          ParamType.int,
          false,
        ),
        yearsOfExperience: deserializeParam(
          data['years_of_experience'],
          ParamType.int,
          false,
        ),
        insurance: deserializeParam(
          data['insurance'],
          ParamType.int,
          false,
        ),
        driversLicense: deserializeParam(
          data['drivers_license'],
          ParamType.String,
          false,
        ),
        avatar: deserializeParam(
          data['avatar'],
          ParamType.String,
          false,
        ),
        city: deserializeParam(
          data['city'],
          ParamType.String,
          false,
        ),
        country: deserializeParam(
          data['country'],
          ParamType.String,
          false,
        ),
        language: deserializeParam(
          data['language'],
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
        badges: deserializeStructParam<CustomerProfileBadgeStruct>(
          data['badges'],
          ParamType.DataStruct,
          true,
          structBuilder: CustomerProfileBadgeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CustomerProfileStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CustomerProfileStruct &&
        name == other.name &&
        companyName == other.companyName &&
        title == other.title &&
        firstName == other.firstName &&
        accountType == other.accountType &&
        lastName == other.lastName &&
        dateOfBirth == other.dateOfBirth &&
        gender == other.gender &&
        describtion == other.describtion &&
        banner == other.banner &&
        user == other.user &&
        customer == other.customer &&
        isSubscribed == other.isSubscribed &&
        subscription == other.subscription &&
        roleProfileName == other.roleProfileName &&
        role == other.role &&
        reviewAverage == other.reviewAverage &&
        reviewCount == other.reviewCount &&
        phoneNumber == other.phoneNumber &&
        phoneVerified == other.phoneVerified &&
        personalDetailsCompleted == other.personalDetailsCompleted &&
        emailVerificationCode == other.emailVerificationCode &&
        identified == other.identified &&
        emailVerified == other.emailVerified &&
        isInWall == other.isInWall &&
        yearsOfExperience == other.yearsOfExperience &&
        insurance == other.insurance &&
        driversLicense == other.driversLicense &&
        avatar == other.avatar &&
        city == other.city &&
        country == other.country &&
        language == other.language &&
        latitude == other.latitude &&
        longitude == other.longitude &&
        listEquality.equals(badges, other.badges);
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        companyName,
        title,
        firstName,
        accountType,
        lastName,
        dateOfBirth,
        gender,
        describtion,
        banner,
        user,
        customer,
        isSubscribed,
        subscription,
        roleProfileName,
        role,
        reviewAverage,
        reviewCount,
        phoneNumber,
        phoneVerified,
        personalDetailsCompleted,
        emailVerificationCode,
        identified,
        emailVerified,
        isInWall,
        yearsOfExperience,
        insurance,
        driversLicense,
        avatar,
        city,
        country,
        language,
        latitude,
        longitude,
        badges
      ]);
}

CustomerProfileStruct createCustomerProfileStruct({
  String? name,
  String? companyName,
  String? title,
  String? firstName,
  String? accountType,
  String? lastName,
  String? dateOfBirth,
  String? gender,
  String? describtion,
  String? banner,
  String? user,
  String? customer,
  int? isSubscribed,
  String? subscription,
  String? roleProfileName,
  String? role,
  double? reviewAverage,
  int? reviewCount,
  String? phoneNumber,
  int? phoneVerified,
  int? personalDetailsCompleted,
  String? emailVerificationCode,
  int? identified,
  int? emailVerified,
  int? isInWall,
  int? yearsOfExperience,
  int? insurance,
  String? driversLicense,
  String? avatar,
  String? city,
  String? country,
  String? language,
  double? latitude,
  double? longitude,
}) =>
    CustomerProfileStruct(
      name: name,
      companyName: companyName,
      title: title,
      firstName: firstName,
      accountType: accountType,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      gender: gender,
      describtion: describtion,
      banner: banner,
      user: user,
      customer: customer,
      isSubscribed: isSubscribed,
      subscription: subscription,
      roleProfileName: roleProfileName,
      role: role,
      reviewAverage: reviewAverage,
      reviewCount: reviewCount,
      phoneNumber: phoneNumber,
      phoneVerified: phoneVerified,
      personalDetailsCompleted: personalDetailsCompleted,
      emailVerificationCode: emailVerificationCode,
      identified: identified,
      emailVerified: emailVerified,
      isInWall: isInWall,
      yearsOfExperience: yearsOfExperience,
      insurance: insurance,
      driversLicense: driversLicense,
      avatar: avatar,
      city: city,
      country: country,
      language: language,
      latitude: latitude,
      longitude: longitude,
    );
