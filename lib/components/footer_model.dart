import '/components/button_next_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'footer_widget.dart' show FooterWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FooterModel extends FlutterFlowModel<FooterWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    buttonNextModel = createModel(context, () => ButtonNextModel());
  }

  void dispose() {
    buttonNextModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
