import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'skills3_widget.dart' show Skills3Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Skills3Model extends FlutterFlowModel<Skills3Widget> {
  ///  Local state fields for this page.

  List<String> chosenSkillCategory = [];
  void addToChosenSkillCategory(String item) => chosenSkillCategory.add(item);
  void removeFromChosenSkillCategory(String item) =>
      chosenSkillCategory.remove(item);
  void removeAtIndexFromChosenSkillCategory(int index) =>
      chosenSkillCategory.removeAt(index);
  void insertAtIndexInChosenSkillCategory(int index, String item) =>
      chosenSkillCategory.insert(index, item);
  void updateChosenSkillCategoryAtIndex(int index, Function(String) updateFn) =>
      chosenSkillCategory[index] = updateFn(chosenSkillCategory[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get My Skill Categories)] action in Skills-3 widget.
  ApiCallResponse? mySkillCategories;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (Sync Skill Categories)] action in Container widget.
  ApiCallResponse? syncedSkills;
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
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
