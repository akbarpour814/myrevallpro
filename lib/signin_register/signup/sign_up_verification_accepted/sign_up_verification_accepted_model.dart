import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'sign_up_verification_accepted_widget.dart'
    show SignUpVerificationAcceptedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpVerificationAcceptedModel
    extends FlutterFlowModel<SignUpVerificationAcceptedWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    headerModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}