import '/backend/api_requests/api_calls.dart';
import '/components/task_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'start_chat_widget.dart' show StartChatWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartChatModel extends FlutterFlowModel<StartChatWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TaskCard component.
  late TaskCardModel taskCardModel;
  // Stores action output result for [Backend Call - API (create chat)] action in Container widget.
  ApiCallResponse? startChat2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    taskCardModel = createModel(context, () => TaskCardModel());
  }

  void dispose() {
    taskCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
