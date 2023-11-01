import '/backend/api_requests/api_calls.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'all_connection_widget.dart' show AllConnectionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllConnectionModel extends FlutterFlowModel<AllConnectionWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavigateBack component.
  late NavigateBackModel navigateBackModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navigateBackModel = createModel(context, () => NavigateBackModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navigateBackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
