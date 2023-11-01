// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRateStruct extends BaseStruct {
  UserRateStruct({
    String? name,
    String? label,
    List<ChildSkillCategoryStruct>? skillCategories,
    double? amount,
    String? currency,
    String? customerProfile,
    String? customerProfileUser,
    int? isAll,
  })  : _name = name,
        _label = label,
        _skillCategories = skillCategories,
        _amount = amount,
        _currency = currency,
        _customerProfile = customerProfile,
        _customerProfileUser = customerProfileUser,
        _isAll = isAll;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  // "skill_categories" field.
  List<ChildSkillCategoryStruct>? _skillCategories;
  List<ChildSkillCategoryStruct> get skillCategories =>
      _skillCategories ?? const [];
  set skillCategories(List<ChildSkillCategoryStruct>? val) =>
      _skillCategories = val;
  void updateSkillCategories(
          Function(List<ChildSkillCategoryStruct>) updateFn) =>
      updateFn(_skillCategories ??= []);
  bool hasSkillCategories() => _skillCategories != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;
  void incrementAmount(double amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  set currency(String? val) => _currency = val;
  bool hasCurrency() => _currency != null;

  // "customer_profile" field.
  String? _customerProfile;
  String get customerProfile => _customerProfile ?? '';
  set customerProfile(String? val) => _customerProfile = val;
  bool hasCustomerProfile() => _customerProfile != null;

  // "customer_profile_user" field.
  String? _customerProfileUser;
  String get customerProfileUser => _customerProfileUser ?? '';
  set customerProfileUser(String? val) => _customerProfileUser = val;
  bool hasCustomerProfileUser() => _customerProfileUser != null;

  // "is_all" field.
  int? _isAll;
  int get isAll => _isAll ?? 0;
  set isAll(int? val) => _isAll = val;
  void incrementIsAll(int amount) => _isAll = isAll + amount;
  bool hasIsAll() => _isAll != null;

  static UserRateStruct fromMap(Map<String, dynamic> data) => UserRateStruct(
        name: data['name'] as String?,
        label: data['label'] as String?,
        skillCategories: getStructList(
          data['skill_categories'],
          ChildSkillCategoryStruct.fromMap,
        ),
        amount: castToType<double>(data['amount']),
        currency: data['currency'] as String?,
        customerProfile: data['customer_profile'] as String?,
        customerProfileUser: data['customer_profile_user'] as String?,
        isAll: castToType<int>(data['is_all']),
      );

  static UserRateStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserRateStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'label': _label,
        'skill_categories': _skillCategories?.map((e) => e.toMap()).toList(),
        'amount': _amount,
        'currency': _currency,
        'customer_profile': _customerProfile,
        'customer_profile_user': _customerProfileUser,
        'is_all': _isAll,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'skill_categories': serializeParam(
          _skillCategories,
          ParamType.DataStruct,
          true,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'currency': serializeParam(
          _currency,
          ParamType.String,
        ),
        'customer_profile': serializeParam(
          _customerProfile,
          ParamType.String,
        ),
        'customer_profile_user': serializeParam(
          _customerProfileUser,
          ParamType.String,
        ),
        'is_all': serializeParam(
          _isAll,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserRateStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserRateStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        skillCategories: deserializeStructParam<ChildSkillCategoryStruct>(
          data['skill_categories'],
          ParamType.DataStruct,
          true,
          structBuilder: ChildSkillCategoryStruct.fromSerializableMap,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        currency: deserializeParam(
          data['currency'],
          ParamType.String,
          false,
        ),
        customerProfile: deserializeParam(
          data['customer_profile'],
          ParamType.String,
          false,
        ),
        customerProfileUser: deserializeParam(
          data['customer_profile_user'],
          ParamType.String,
          false,
        ),
        isAll: deserializeParam(
          data['is_all'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserRateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserRateStruct &&
        name == other.name &&
        label == other.label &&
        listEquality.equals(skillCategories, other.skillCategories) &&
        amount == other.amount &&
        currency == other.currency &&
        customerProfile == other.customerProfile &&
        customerProfileUser == other.customerProfileUser &&
        isAll == other.isAll;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        label,
        skillCategories,
        amount,
        currency,
        customerProfile,
        customerProfileUser,
        isAll
      ]);
}

UserRateStruct createUserRateStruct({
  String? name,
  String? label,
  double? amount,
  String? currency,
  String? customerProfile,
  String? customerProfileUser,
  int? isAll,
}) =>
    UserRateStruct(
      name: name,
      label: label,
      amount: amount,
      currency: currency,
      customerProfile: customerProfile,
      customerProfileUser: customerProfileUser,
      isAll: isAll,
    );
