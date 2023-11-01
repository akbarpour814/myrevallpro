import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/emty_container_widget.dart';
import '/components/skill_options_check_component_widget.dart';
import '/components/skill_options_chips_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'skill_level_sheet_widget.dart' show SkillLevelSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SkillLevelSheetModel extends FlutterFlowModel<SkillLevelSheetWidget> {
  ///  Local state fields for this component.

  String? chosenSkillLevel;

  List<SkillOptionsStruct> skillOptionsList = [];
  void addToSkillOptionsList(SkillOptionsStruct item) =>
      skillOptionsList.add(item);
  void removeFromSkillOptionsList(SkillOptionsStruct item) =>
      skillOptionsList.remove(item);
  void removeAtIndexFromSkillOptionsList(int index) =>
      skillOptionsList.removeAt(index);
  void insertAtIndexInSkillOptionsList(int index, SkillOptionsStruct item) =>
      skillOptionsList.insert(index, item);
  void updateSkillOptionsListAtIndex(
          int index, Function(SkillOptionsStruct) updateFn) =>
      skillOptionsList[index] = updateFn(skillOptionsList[index]);

  ///  State fields for stateful widgets in this component.

  // Models for skillOptionsCheckComponent dynamic component.
  late FlutterFlowDynamicModels<SkillOptionsCheckComponentModel>
      skillOptionsCheckComponentModels;
  // Models for skillOptionsChipsComponent dynamic component.
  late FlutterFlowDynamicModels<SkillOptionsChipsComponentModel>
      skillOptionsChipsComponentModels;
  // Stores action output result for [Backend Call - API (deleteUserServiceById)] action in Container widget.
  ApiCallResponse? delete;
  // Stores action output result for [Backend Call - API (editUserService)] action in Container widget.
  ApiCallResponse? editedUserService;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    skillOptionsCheckComponentModels =
        FlutterFlowDynamicModels(() => SkillOptionsCheckComponentModel());
    skillOptionsChipsComponentModels =
        FlutterFlowDynamicModels(() => SkillOptionsChipsComponentModel());
  }

  void dispose() {
    skillOptionsCheckComponentModels.dispose();
    skillOptionsChipsComponentModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
