import '/backend/api_requests/api_calls.dart';
import '/components/drawer_content_widget.dart';
import '/components/header_widget.dart';
import '/components/home_page_footer_widget.dart';
import '/components/mini_task_card_widget.dart';
import '/components/mini_tasker_card_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_home_page_widget.dart' show MainHomePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MainHomePageModel extends FlutterFlowModel<MainHomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Models for MiniTaskCard dynamic component.
  late FlutterFlowDynamicModels<MiniTaskCardModel> miniTaskCardModels;
  // Model for homePageFooter component.
  late HomePageFooterModel homePageFooterModel;
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for drawerContent component.
  late DrawerContentModel drawerContentModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    miniTaskCardModels = FlutterFlowDynamicModels(() => MiniTaskCardModel());
    homePageFooterModel = createModel(context, () => HomePageFooterModel());
    navBarModel = createModel(context, () => NavBarModel());
    drawerContentModel = createModel(context, () => DrawerContentModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    miniTaskCardModels.dispose();
    homePageFooterModel.dispose();
    navBarModel.dispose();
    drawerContentModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
