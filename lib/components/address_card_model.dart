import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'address_card_widget.dart' show AddressCardWidget;
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddressCardModel extends FlutterFlowModel<AddressCardWidget> {
  ///  Local state fields for this component.

  bool isMain = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (change main address)] action in Text widget.
  ApiCallResponse? apiResultzxfCopyCopy2;
  // Stores action output result for [Backend Call - API (deleteAddress)] action in Container widget.
  ApiCallResponse? apiResultqzc;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
