import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/ad_card_web_widget.dart';
import '/components/badges_header_widget.dart';
import '/components/edit_email_or_pass_widget.dart';
import '/components/header_web_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_left_profile_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header_web component.
  late HeaderWebModel headerWebModel;
  // Model for sideBar_left_profile component.
  late SideBarLeftProfileModel sideBarLeftProfileModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for Badges_header component.
  late BadgesHeaderModel badgesHeaderModel;
  // Stores action output result for [Backend Call - API (updateUserRole)] action in Container widget.
  ApiCallResponse? apiResult786;
  // Stores action output result for [Backend Call - API (updateRole)] action in Container widget.
  ApiCallResponse? apiResultgzf;
  // Model for ad_card_web component.
  late AdCardWebModel adCardWebModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for sideBar_Right component.
  late SideBarRightModel sideBarRightModel;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerWebModel = createModel(context, () => HeaderWebModel());
    sideBarLeftProfileModel =
        createModel(context, () => SideBarLeftProfileModel());
    headerModel = createModel(context, () => HeaderModel());
    badgesHeaderModel = createModel(context, () => BadgesHeaderModel());
    adCardWebModel = createModel(context, () => AdCardWebModel());
    navBarModel = createModel(context, () => NavBarModel());
    sideBarRightModel = createModel(context, () => SideBarRightModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerWebModel.dispose();
    sideBarLeftProfileModel.dispose();
    headerModel.dispose();
    badgesHeaderModel.dispose();
    adCardWebModel.dispose();
    navBarModel.dispose();
    sideBarRightModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
