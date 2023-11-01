import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/privacy_policy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/place.dart';
import 'dart:async';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'contactdata1_widget.dart' show Contactdata1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Contactdata1Model extends FlutterFlowModel<Contactdata1Widget> {
  ///  Local state fields for this page.

  int? mapORno;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for Street widget.
  FocusNode? streetFocusNode;
  TextEditingController? streetController;
  String? Function(BuildContext, String?)? streetControllerValidator;
  // State field(s) for No widget.
  FocusNode? noFocusNode;
  TextEditingController? noController;
  String? Function(BuildContext, String?)? noControllerValidator;
  // State field(s) for PostalCode widget.
  FocusNode? postalCodeFocusNode;
  TextEditingController? postalCodeController;
  String? Function(BuildContext, String?)? postalCodeControllerValidator;
  // State field(s) for City widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for State widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateController;
  String? Function(BuildContext, String?)? stateControllerValidator;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryController;
  String? Function(BuildContext, String?)? countryControllerValidator;
  // Stores action output result for [Backend Call - API (addressCreate)] action in Container widget.
  ApiCallResponse? createAddress;
  // Stores action output result for [Backend Call - API (userProfileMe)] action in Container widget.
  ApiCallResponse? apiResultpek;
  // Stores action output result for [Backend Call - API (addressCreate)] action in Container widget.
  ApiCallResponse? createAddress1;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerContentModel = createModel(context, () => DrawerContentModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  void dispose() {
    unfocusNode.dispose();
    drawerContentModel.dispose();
    headerModel.dispose();
    streetFocusNode?.dispose();
    streetController?.dispose();

    noFocusNode?.dispose();
    noController?.dispose();

    postalCodeFocusNode?.dispose();
    postalCodeController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    stateFocusNode?.dispose();
    stateController?.dispose();

    countryFocusNode?.dispose();
    countryController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
