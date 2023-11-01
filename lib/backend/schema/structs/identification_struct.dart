// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IdentificationStruct extends BaseStruct {
  IdentificationStruct({
    String? name,
    String? customerProfileType,
    String? title,
    String? firstName,
    String? lastName,
    String? documentType,
    String? documentNumber,
    String? documentFile,
    String? documentUserPhoto,
    String? status,
    String? amendedFrom,
    String? customerProfile,
    String? dateOfBirth,
    String? expiryDate,
  })  : _name = name,
        _customerProfileType = customerProfileType,
        _title = title,
        _firstName = firstName,
        _lastName = lastName,
        _documentType = documentType,
        _documentNumber = documentNumber,
        _documentFile = documentFile,
        _documentUserPhoto = documentUserPhoto,
        _status = status,
        _amendedFrom = amendedFrom,
        _customerProfile = customerProfile,
        _dateOfBirth = dateOfBirth,
        _expiryDate = expiryDate;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "customer_profile_type" field.
  String? _customerProfileType;
  String get customerProfileType => _customerProfileType ?? '';
  set customerProfileType(String? val) => _customerProfileType = val;
  bool hasCustomerProfileType() => _customerProfileType != null;

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

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;
  bool hasLastName() => _lastName != null;

  // "document_type" field.
  String? _documentType;
  String get documentType => _documentType ?? '';
  set documentType(String? val) => _documentType = val;
  bool hasDocumentType() => _documentType != null;

  // "document_number" field.
  String? _documentNumber;
  String get documentNumber => _documentNumber ?? '';
  set documentNumber(String? val) => _documentNumber = val;
  bool hasDocumentNumber() => _documentNumber != null;

  // "document_file" field.
  String? _documentFile;
  String get documentFile => _documentFile ?? '';
  set documentFile(String? val) => _documentFile = val;
  bool hasDocumentFile() => _documentFile != null;

  // "document_user_photo" field.
  String? _documentUserPhoto;
  String get documentUserPhoto => _documentUserPhoto ?? '';
  set documentUserPhoto(String? val) => _documentUserPhoto = val;
  bool hasDocumentUserPhoto() => _documentUserPhoto != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "amended_from" field.
  String? _amendedFrom;
  String get amendedFrom => _amendedFrom ?? '';
  set amendedFrom(String? val) => _amendedFrom = val;
  bool hasAmendedFrom() => _amendedFrom != null;

  // "customer_profile" field.
  String? _customerProfile;
  String get customerProfile => _customerProfile ?? '';
  set customerProfile(String? val) => _customerProfile = val;
  bool hasCustomerProfile() => _customerProfile != null;

  // "date_of_birth" field.
  String? _dateOfBirth;
  String get dateOfBirth => _dateOfBirth ?? '';
  set dateOfBirth(String? val) => _dateOfBirth = val;
  bool hasDateOfBirth() => _dateOfBirth != null;

  // "expiry_date" field.
  String? _expiryDate;
  String get expiryDate => _expiryDate ?? '';
  set expiryDate(String? val) => _expiryDate = val;
  bool hasExpiryDate() => _expiryDate != null;

  static IdentificationStruct fromMap(Map<String, dynamic> data) =>
      IdentificationStruct(
        name: data['name'] as String?,
        customerProfileType: data['customer_profile_type'] as String?,
        title: data['title'] as String?,
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        documentType: data['document_type'] as String?,
        documentNumber: data['document_number'] as String?,
        documentFile: data['document_file'] as String?,
        documentUserPhoto: data['document_user_photo'] as String?,
        status: data['status'] as String?,
        amendedFrom: data['amended_from'] as String?,
        customerProfile: data['customer_profile'] as String?,
        dateOfBirth: data['date_of_birth'] as String?,
        expiryDate: data['expiry_date'] as String?,
      );

  static IdentificationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? IdentificationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'customer_profile_type': _customerProfileType,
        'title': _title,
        'first_name': _firstName,
        'last_name': _lastName,
        'document_type': _documentType,
        'document_number': _documentNumber,
        'document_file': _documentFile,
        'document_user_photo': _documentUserPhoto,
        'status': _status,
        'amended_from': _amendedFrom,
        'customer_profile': _customerProfile,
        'date_of_birth': _dateOfBirth,
        'expiry_date': _expiryDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'customer_profile_type': serializeParam(
          _customerProfileType,
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
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'document_type': serializeParam(
          _documentType,
          ParamType.String,
        ),
        'document_number': serializeParam(
          _documentNumber,
          ParamType.String,
        ),
        'document_file': serializeParam(
          _documentFile,
          ParamType.String,
        ),
        'document_user_photo': serializeParam(
          _documentUserPhoto,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'amended_from': serializeParam(
          _amendedFrom,
          ParamType.String,
        ),
        'customer_profile': serializeParam(
          _customerProfile,
          ParamType.String,
        ),
        'date_of_birth': serializeParam(
          _dateOfBirth,
          ParamType.String,
        ),
        'expiry_date': serializeParam(
          _expiryDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static IdentificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      IdentificationStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        customerProfileType: deserializeParam(
          data['customer_profile_type'],
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
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        documentType: deserializeParam(
          data['document_type'],
          ParamType.String,
          false,
        ),
        documentNumber: deserializeParam(
          data['document_number'],
          ParamType.String,
          false,
        ),
        documentFile: deserializeParam(
          data['document_file'],
          ParamType.String,
          false,
        ),
        documentUserPhoto: deserializeParam(
          data['document_user_photo'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        amendedFrom: deserializeParam(
          data['amended_from'],
          ParamType.String,
          false,
        ),
        customerProfile: deserializeParam(
          data['customer_profile'],
          ParamType.String,
          false,
        ),
        dateOfBirth: deserializeParam(
          data['date_of_birth'],
          ParamType.String,
          false,
        ),
        expiryDate: deserializeParam(
          data['expiry_date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'IdentificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IdentificationStruct &&
        name == other.name &&
        customerProfileType == other.customerProfileType &&
        title == other.title &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        documentType == other.documentType &&
        documentNumber == other.documentNumber &&
        documentFile == other.documentFile &&
        documentUserPhoto == other.documentUserPhoto &&
        status == other.status &&
        amendedFrom == other.amendedFrom &&
        customerProfile == other.customerProfile &&
        dateOfBirth == other.dateOfBirth &&
        expiryDate == other.expiryDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        customerProfileType,
        title,
        firstName,
        lastName,
        documentType,
        documentNumber,
        documentFile,
        documentUserPhoto,
        status,
        amendedFrom,
        customerProfile,
        dateOfBirth,
        expiryDate
      ]);
}

IdentificationStruct createIdentificationStruct({
  String? name,
  String? customerProfileType,
  String? title,
  String? firstName,
  String? lastName,
  String? documentType,
  String? documentNumber,
  String? documentFile,
  String? documentUserPhoto,
  String? status,
  String? amendedFrom,
  String? customerProfile,
  String? dateOfBirth,
  String? expiryDate,
}) =>
    IdentificationStruct(
      name: name,
      customerProfileType: customerProfileType,
      title: title,
      firstName: firstName,
      lastName: lastName,
      documentType: documentType,
      documentNumber: documentNumber,
      documentFile: documentFile,
      documentUserPhoto: documentUserPhoto,
      status: status,
      amendedFrom: amendedFrom,
      customerProfile: customerProfile,
      dateOfBirth: dateOfBirth,
      expiryDate: expiryDate,
    );
