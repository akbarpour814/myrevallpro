import '/backend/api_requests/api_calls.dart';
import '/components/badge_single_icon_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/wizard_footer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/actions/actions.dart' as action_blocks;
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'identification_card_widget.dart' show IdentificationCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class IdentificationCardModel
    extends FlutterFlowModel<IdentificationCardWidget> {
  ///  Local state fields for this page.

  String? documentType;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for badgeSingleIcon component.
  late BadgeSingleIconModel badgeSingleIconModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for wizardFooter component.
  late WizardFooterModel wizardFooterModel;
  // Stores action output result for [Backend Call - API (Update Customer Profile Badges)] action in wizardFooter widget.
  ApiCallResponse? apiResultq16;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    badgeSingleIconModel = createModel(context, () => BadgeSingleIconModel());
    navBarModel = createModel(context, () => NavBarModel());
    wizardFooterModel = createModel(context, () => WizardFooterModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    badgeSingleIconModel.dispose();
    navBarModel.dispose();
    wizardFooterModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
