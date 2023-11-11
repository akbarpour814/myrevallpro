import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/view_certificate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_another_education_widget.dart' show AddAnotherEducationWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddAnotherEducationModel
    extends FlutterFlowModel<AddAnotherEducationWidget> {
  ///  Local state fields for this page.

  String? certificateUrl = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (userEducationAdd)] action in Container widget.
  ApiCallResponse? educationRequest;
  // Stores action output result for [Backend Call - API (userEducationAdd)] action in Container widget.
  ApiCallResponse? educationRequest2;
  // Stores action output result for [Backend Call - API (userEducationAdd)] action in Container widget.
  ApiCallResponse? educationRequest236;
  // Stores action output result for [Backend Call - API (educationPartialUpdate)] action in Container widget.
  ApiCallResponse? educationRequest23;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (upload)] action in Container widget.
  ApiCallResponse? apiResultekx2;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  Future<dynamic> upload(
    BuildContext context, {
    required FFUploadedFile? uploadedFile,
  }) async {
    dynamic? uploadFileResponse;

    uploadFileResponse = await actions.uploadFile(
      uploadedLocalFile2,
      FFAppState().apiKey,
    );
    if (getJsonField(
          uploadFileResponse,
          r'''$.message.name''',
        ) !=
        null) {
      certificateUrl = getJsonField(
        uploadFileResponse,
        r'''$.message.file_url''',
      ).toString().toString();
    } else {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return WebViewAware(
              child: AlertDialog(
            title: Text('Not Done'),
            content: Text('Not Done'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: Text('Ok'),
              ),
            ],
          ));
        },
      );
    }

    FFAppState().AddCertificateForEducation = false;

    return null;
  }

  /// Additional helper methods are added here.
}
