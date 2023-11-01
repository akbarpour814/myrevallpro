import '/backend/schema/structs/index.dart';
import '/components/emty_container_widget.dart';
import '/components/select_skill_level_widget.dart';
import '/components/skill_options_check_component_widget.dart';
import '/components/skill_options_chips_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'selectable_skill_details_widget.dart' show SelectableSkillDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectableSkillDetailsModel
    extends FlutterFlowModel<SelectableSkillDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for selectSkillLevel component.
  late SelectSkillLevelModel selectSkillLevelModel;
  // Models for skillOptionsCheckComponent dynamic component.
  late FlutterFlowDynamicModels<SkillOptionsCheckComponentModel>
      skillOptionsCheckComponentModels;
  // Models for skillOptionsChipsComponent dynamic component.
  late FlutterFlowDynamicModels<SkillOptionsChipsComponentModel>
      skillOptionsChipsComponentModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    selectSkillLevelModel = createModel(context, () => SelectSkillLevelModel());
    skillOptionsCheckComponentModels =
        FlutterFlowDynamicModels(() => SkillOptionsCheckComponentModel());
    skillOptionsChipsComponentModels =
        FlutterFlowDynamicModels(() => SkillOptionsChipsComponentModel());
  }

  void dispose() {
    selectSkillLevelModel.dispose();
    skillOptionsCheckComponentModels.dispose();
    skillOptionsChipsComponentModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}