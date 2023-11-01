import '/backend/schema/structs/index.dart';
import '/components/chat_message_actions_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chat_message_widget.dart' show ChatMessageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatMessageModel extends FlutterFlowModel<ChatMessageWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for chatMessageActions component.
  late ChatMessageActionsModel chatMessageActionsModel1;
  // Model for chatMessageActions component.
  late ChatMessageActionsModel chatMessageActionsModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    chatMessageActionsModel1 =
        createModel(context, () => ChatMessageActionsModel());
    chatMessageActionsModel2 =
        createModel(context, () => ChatMessageActionsModel());
  }

  void dispose() {
    chatMessageActionsModel1.dispose();
    chatMessageActionsModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
