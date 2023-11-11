import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/chat_action_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_message_actions_widget.dart' show ChatMessageActionsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ChatMessageActionsModel
    extends FlutterFlowModel<ChatMessageActionsWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Bottom Sheet - ChatActionBottomSheet] action in Container widget.
  ChatMessageStruct? chatActionBottomSheet;
  // Stores action output result for [Backend Call - API (Process Action)] action in Container widget.
  ApiCallResponse? apiResultu11;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
