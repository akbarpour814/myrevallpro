import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future openDrawer(BuildContext context) async {}

Future upload(
  BuildContext context, {
  FFUploadedFile? file,
  String? apiGlobalKey,
}) async {
  ApiCallResponse? apiResultekx;

  apiResultekx = await TaskerpageBackendGroup.uploadCall.call(
    file: file,
    apiGlobalKey: apiGlobalKey,
  );
  if ((apiResultekx?.succeeded ?? true)) {
    return;
  }

  return;
}

Future navigateToUserProfile(BuildContext context) async {
  context.pushNamed(
    'User_profile',
    queryParameters: {
      'id': serializeParam(
        getJsonField(
          FFAppState().userProfile,
          r'''$.data.name''',
        ).toString().toString(),
        ParamType.String,
      ),
    }.withoutNulls,
  );
}

Future<dynamic> updateCustomerProfileBadge(
  BuildContext context, {
  required String? appBadge,
}) async {
  ApiCallResponse? apiResultq16;

  apiResultq16 =
      await TaskerpageBackendGroup.updateCustomerProfileBadgesCall.call(
    customerProfile: getJsonField(
      FFAppState().userProfile,
      r'''$.data.name''',
    ).toString().toString(),
    apiGlobalKey: FFAppState().apiKey,
    appBadge: appBadge,
  );

  return null;
}
