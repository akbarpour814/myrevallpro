import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/checkbox_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flip_card/flip_card.dart';
import 'skill_card_widget.dart' show SkillCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SkillCardModel extends FlutterFlowModel<SkillCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for checkbox dynamic component.
  late FlutterFlowDynamicModels<CheckboxModel> checkboxModels;
  // Stores action output result for [Backend Call - API (skill delet)] action in Container widget.
  ApiCallResponse? apiResult8x8;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    checkboxModels = FlutterFlowDynamicModels(() => CheckboxModel());
  }

  void dispose() {
    checkboxModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
