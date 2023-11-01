import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_and_title_widget.dart' show TextFieldAndTitleWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextFieldAndTitleModel extends FlutterFlowModel<TextFieldAndTitleWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for State widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateController;
  String? Function(BuildContext, String?)? stateControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    stateFocusNode?.dispose();
    stateController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
