// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationStruct extends BaseStruct {
  EducationStruct({
    String? title,
    String? educationLevel,
    String? schoolTitle,
    String? certificateUrl,
    int? relatedUserProfile,
  })  : _title = title,
        _educationLevel = educationLevel,
        _schoolTitle = schoolTitle,
        _certificateUrl = certificateUrl,
        _relatedUserProfile = relatedUserProfile;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "education_level" field.
  String? _educationLevel;
  String get educationLevel => _educationLevel ?? '';
  set educationLevel(String? val) => _educationLevel = val;
  bool hasEducationLevel() => _educationLevel != null;

  // "school_title" field.
  String? _schoolTitle;
  String get schoolTitle => _schoolTitle ?? '';
  set schoolTitle(String? val) => _schoolTitle = val;
  bool hasSchoolTitle() => _schoolTitle != null;

  // "certificate_url" field.
  String? _certificateUrl;
  String get certificateUrl => _certificateUrl ?? '';
  set certificateUrl(String? val) => _certificateUrl = val;
  bool hasCertificateUrl() => _certificateUrl != null;

  // "related_user_profile" field.
  int? _relatedUserProfile;
  int get relatedUserProfile => _relatedUserProfile ?? 0;
  set relatedUserProfile(int? val) => _relatedUserProfile = val;
  void incrementRelatedUserProfile(int amount) =>
      _relatedUserProfile = relatedUserProfile + amount;
  bool hasRelatedUserProfile() => _relatedUserProfile != null;

  static EducationStruct fromMap(Map<String, dynamic> data) => EducationStruct(
        title: data['title'] as String?,
        educationLevel: data['education_level'] as String?,
        schoolTitle: data['school_title'] as String?,
        certificateUrl: data['certificate_url'] as String?,
        relatedUserProfile: castToType<int>(data['related_user_profile']),
      );

  static EducationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? EducationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'education_level': _educationLevel,
        'school_title': _schoolTitle,
        'certificate_url': _certificateUrl,
        'related_user_profile': _relatedUserProfile,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'education_level': serializeParam(
          _educationLevel,
          ParamType.String,
        ),
        'school_title': serializeParam(
          _schoolTitle,
          ParamType.String,
        ),
        'certificate_url': serializeParam(
          _certificateUrl,
          ParamType.String,
        ),
        'related_user_profile': serializeParam(
          _relatedUserProfile,
          ParamType.int,
        ),
      }.withoutNulls;

  static EducationStruct fromSerializableMap(Map<String, dynamic> data) =>
      EducationStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        educationLevel: deserializeParam(
          data['education_level'],
          ParamType.String,
          false,
        ),
        schoolTitle: deserializeParam(
          data['school_title'],
          ParamType.String,
          false,
        ),
        certificateUrl: deserializeParam(
          data['certificate_url'],
          ParamType.String,
          false,
        ),
        relatedUserProfile: deserializeParam(
          data['related_user_profile'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'EducationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EducationStruct &&
        title == other.title &&
        educationLevel == other.educationLevel &&
        schoolTitle == other.schoolTitle &&
        certificateUrl == other.certificateUrl &&
        relatedUserProfile == other.relatedUserProfile;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [title, educationLevel, schoolTitle, certificateUrl, relatedUserProfile]);
}

EducationStruct createEducationStruct({
  String? title,
  String? educationLevel,
  String? schoolTitle,
  String? certificateUrl,
  int? relatedUserProfile,
}) =>
    EducationStruct(
      title: title,
      educationLevel: educationLevel,
      schoolTitle: schoolTitle,
      certificateUrl: certificateUrl,
      relatedUserProfile: relatedUserProfile,
    );
