// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerProfileBadgeStruct extends BaseStruct {
  CustomerProfileBadgeStruct({
    String? name,
    String? badgeName,
    String? label,
    String? deactiveIcon,
    String? activeIcon,
    int? enabled,
    String? parent,
    String? parentfield,
    String? parenttype,
    String? doctype,
  })  : _name = name,
        _badgeName = badgeName,
        _label = label,
        _deactiveIcon = deactiveIcon,
        _activeIcon = activeIcon,
        _enabled = enabled,
        _parent = parent,
        _parentfield = parentfield,
        _parenttype = parenttype,
        _doctype = doctype;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "badge_name" field.
  String? _badgeName;
  String get badgeName => _badgeName ?? '';
  set badgeName(String? val) => _badgeName = val;
  bool hasBadgeName() => _badgeName != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;
  bool hasLabel() => _label != null;

  // "deactive_icon" field.
  String? _deactiveIcon;
  String get deactiveIcon => _deactiveIcon ?? '';
  set deactiveIcon(String? val) => _deactiveIcon = val;
  bool hasDeactiveIcon() => _deactiveIcon != null;

  // "active_icon" field.
  String? _activeIcon;
  String get activeIcon => _activeIcon ?? '';
  set activeIcon(String? val) => _activeIcon = val;
  bool hasActiveIcon() => _activeIcon != null;

  // "enabled" field.
  int? _enabled;
  int get enabled => _enabled ?? 0;
  set enabled(int? val) => _enabled = val;
  void incrementEnabled(int amount) => _enabled = enabled + amount;
  bool hasEnabled() => _enabled != null;

  // "parent" field.
  String? _parent;
  String get parent => _parent ?? '';
  set parent(String? val) => _parent = val;
  bool hasParent() => _parent != null;

  // "parentfield" field.
  String? _parentfield;
  String get parentfield => _parentfield ?? '';
  set parentfield(String? val) => _parentfield = val;
  bool hasParentfield() => _parentfield != null;

  // "parenttype" field.
  String? _parenttype;
  String get parenttype => _parenttype ?? '';
  set parenttype(String? val) => _parenttype = val;
  bool hasParenttype() => _parenttype != null;

  // "doctype" field.
  String? _doctype;
  String get doctype => _doctype ?? '';
  set doctype(String? val) => _doctype = val;
  bool hasDoctype() => _doctype != null;

  static CustomerProfileBadgeStruct fromMap(Map<String, dynamic> data) =>
      CustomerProfileBadgeStruct(
        name: data['name'] as String?,
        badgeName: data['badge_name'] as String?,
        label: data['label'] as String?,
        deactiveIcon: data['deactive_icon'] as String?,
        activeIcon: data['active_icon'] as String?,
        enabled: castToType<int>(data['enabled']),
        parent: data['parent'] as String?,
        parentfield: data['parentfield'] as String?,
        parenttype: data['parenttype'] as String?,
        doctype: data['doctype'] as String?,
      );

  static CustomerProfileBadgeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? CustomerProfileBadgeStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'badge_name': _badgeName,
        'label': _label,
        'deactive_icon': _deactiveIcon,
        'active_icon': _activeIcon,
        'enabled': _enabled,
        'parent': _parent,
        'parentfield': _parentfield,
        'parenttype': _parenttype,
        'doctype': _doctype,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'badge_name': serializeParam(
          _badgeName,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'deactive_icon': serializeParam(
          _deactiveIcon,
          ParamType.String,
        ),
        'active_icon': serializeParam(
          _activeIcon,
          ParamType.String,
        ),
        'enabled': serializeParam(
          _enabled,
          ParamType.int,
        ),
        'parent': serializeParam(
          _parent,
          ParamType.String,
        ),
        'parentfield': serializeParam(
          _parentfield,
          ParamType.String,
        ),
        'parenttype': serializeParam(
          _parenttype,
          ParamType.String,
        ),
        'doctype': serializeParam(
          _doctype,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomerProfileBadgeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CustomerProfileBadgeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        badgeName: deserializeParam(
          data['badge_name'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        deactiveIcon: deserializeParam(
          data['deactive_icon'],
          ParamType.String,
          false,
        ),
        activeIcon: deserializeParam(
          data['active_icon'],
          ParamType.String,
          false,
        ),
        enabled: deserializeParam(
          data['enabled'],
          ParamType.int,
          false,
        ),
        parent: deserializeParam(
          data['parent'],
          ParamType.String,
          false,
        ),
        parentfield: deserializeParam(
          data['parentfield'],
          ParamType.String,
          false,
        ),
        parenttype: deserializeParam(
          data['parenttype'],
          ParamType.String,
          false,
        ),
        doctype: deserializeParam(
          data['doctype'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomerProfileBadgeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomerProfileBadgeStruct &&
        name == other.name &&
        badgeName == other.badgeName &&
        label == other.label &&
        deactiveIcon == other.deactiveIcon &&
        activeIcon == other.activeIcon &&
        enabled == other.enabled &&
        parent == other.parent &&
        parentfield == other.parentfield &&
        parenttype == other.parenttype &&
        doctype == other.doctype;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        badgeName,
        label,
        deactiveIcon,
        activeIcon,
        enabled,
        parent,
        parentfield,
        parenttype,
        doctype
      ]);
}

CustomerProfileBadgeStruct createCustomerProfileBadgeStruct({
  String? name,
  String? badgeName,
  String? label,
  String? deactiveIcon,
  String? activeIcon,
  int? enabled,
  String? parent,
  String? parentfield,
  String? parenttype,
  String? doctype,
}) =>
    CustomerProfileBadgeStruct(
      name: name,
      badgeName: badgeName,
      label: label,
      deactiveIcon: deactiveIcon,
      activeIcon: activeIcon,
      enabled: enabled,
      parent: parent,
      parentfield: parentfield,
      parenttype: parenttype,
      doctype: doctype,
    );
