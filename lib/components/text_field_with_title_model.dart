import '/backend/schema/structs/index.dart';
import '/components/requard_star_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_with_title_widget.dart' show TextFieldWithTitleWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextFieldWithTitleModel
    extends FlutterFlowModel<TextFieldWithTitleWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for requard_star component.
  late RequardStarModel requardStarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    requardStarModel = createModel(context, () => RequardStarModel());
  }

  void dispose() {
    requardStarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
