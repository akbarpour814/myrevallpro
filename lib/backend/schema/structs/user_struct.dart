// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    List<UserServiceStruct>? customerSkills,
  }) : _customerSkills = customerSkills;

  // "customer_skills" field.
  List<UserServiceStruct>? _customerSkills;
  List<UserServiceStruct> get customerSkills => _customerSkills ?? const [];
  set customerSkills(List<UserServiceStruct>? val) => _customerSkills = val;
  void updateCustomerSkills(Function(List<UserServiceStruct>) updateFn) =>
      updateFn(_customerSkills ??= []);
  bool hasCustomerSkills() => _customerSkills != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        customerSkills: getStructList(
          data['customer_skills'],
          UserServiceStruct.fromMap,
        ),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? UserStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'customer_skills': _customerSkills?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'customer_skills': serializeParam(
          _customerSkills,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        customerSkills: deserializeStructParam<UserServiceStruct>(
          data['customer_skills'],
          ParamType.DataStruct,
          true,
          structBuilder: UserServiceStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        listEquality.equals(customerSkills, other.customerSkills);
  }

  @override
  int get hashCode => const ListEquality().hash([customerSkills]);
}

UserStruct createUserStruct() => UserStruct();
