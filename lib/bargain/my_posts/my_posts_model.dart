import '/backend/api_requests/api_calls.dart';
import '/components/ad_card_web_widget.dart';
import '/components/badges_header_widget.dart';
import '/components/header_web_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/my_post_card_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_left_profile_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'my_posts_widget.dart' show MyPostsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MyPostsModel extends FlutterFlowModel<MyPostsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;
  // Model for Header_web component.
  late HeaderWebModel headerWebModel;
  // Model for sideBar_left_profile component.
  late SideBarLeftProfileModel sideBarLeftProfileModel;
  // Model for Badges_header component.
  late BadgesHeaderModel badgesHeaderModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for ad_card_web component.
  late AdCardWebModel adCardWebModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for sideBar_Right component.
  late SideBarRightModel sideBarRightModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    mainDrawerModel = createModel(context, () => MainDrawerModel());
    headerWebModel = createModel(context, () => HeaderWebModel());
    sideBarLeftProfileModel =
        createModel(context, () => SideBarLeftProfileModel());
    badgesHeaderModel = createModel(context, () => BadgesHeaderModel());
    headerModel = createModel(context, () => HeaderModel());
    adCardWebModel = createModel(context, () => AdCardWebModel());
    navBarModel = createModel(context, () => NavBarModel());
    sideBarRightModel = createModel(context, () => SideBarRightModel());
  }

  void dispose() {
    unfocusNode.dispose();
    mainDrawerModel.dispose();
    headerWebModel.dispose();
    sideBarLeftProfileModel.dispose();
    badgesHeaderModel.dispose();
    headerModel.dispose();
    adCardWebModel.dispose();
    navBarModel.dispose();
    sideBarRightModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
