import '/backend/api_requests/api_calls.dart';
import '/components/edit_number_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:pin_code_fields/pin_code_fields.dart';
import 'phone_verification_page_widget.dart' show PhoneVerificationPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneVerificationPageModel
    extends FlutterFlowModel<PhoneVerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (userProfileRead)] action in PhoneVerificationPage widget.
  ApiCallResponse? sendCode;
  // Stores action output result for [Backend Call - API (send to verification code)] action in PhoneVerificationPage widget.
  ApiCallResponse? apiResult5wf;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (userProfileRead)] action in Text widget.
  ApiCallResponse? sendAgain;
  // Stores action output result for [Backend Call - API (send to verification code)] action in Text widget.
  ApiCallResponse? apiResult5wf3;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  // Stores action output result for [Backend Call - API (check verification code)] action in Container widget.
  ApiCallResponse? apiResult3lo;
  // Stores action output result for [Backend Call - API (Update phone verification)] action in Container widget.
  ApiCallResponse? apiResult77u;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    pinCodeController = TextEditingController();
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    pinCodeController?.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
