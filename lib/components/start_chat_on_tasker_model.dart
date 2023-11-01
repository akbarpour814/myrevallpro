import '/backend/api_requests/api_calls.dart';
import '/components/tasker_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'start_chat_on_tasker_widget.dart' show StartChatOnTaskerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StartChatOnTaskerModel extends FlutterFlowModel<StartChatOnTaskerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TaskerCard component.
  late TaskerCardModel taskerCardModel;
  // Stores action output result for [Backend Call - API (create chat)] action in Container widget.
  ApiCallResponse? startChat;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    taskerCardModel = createModel(context, () => TaskerCardModel());
  }

  void dispose() {
    taskerCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
