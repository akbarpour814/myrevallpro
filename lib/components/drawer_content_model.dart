import '/backend/api_requests/api_calls.dart';
import '/components/ad_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'drawer_content_widget.dart' show DrawerContentWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerContentModel extends FlutterFlowModel<DrawerContentWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Ad_Card component.
  late AdCardModel adCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    adCardModel = createModel(context, () => AdCardModel());
  }

  void dispose() {
    adCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
