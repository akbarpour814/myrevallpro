import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/appointment_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
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

  // Model for appointment_card component.
  late AppointmentCardModel appointmentCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appointmentCardModel = createModel(context, () => AppointmentCardModel());
  }

  void dispose() {
    appointmentCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
