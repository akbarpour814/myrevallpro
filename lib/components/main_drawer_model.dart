import '/backend/api_requests/api_calls.dart';
import '/components/drawer_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'main_drawer_widget.dart' show MainDrawerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainDrawerModel extends FlutterFlowModel<MainDrawerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel1;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel2;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel3;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel4;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel5;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel6;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel7;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel8;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel9;
  // Model for drawer_card component.
  late DrawerCardModel drawerCardModel10;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerCardModel1 = createModel(context, () => DrawerCardModel());
    drawerCardModel2 = createModel(context, () => DrawerCardModel());
    drawerCardModel3 = createModel(context, () => DrawerCardModel());
    drawerCardModel4 = createModel(context, () => DrawerCardModel());
    drawerCardModel5 = createModel(context, () => DrawerCardModel());
    drawerCardModel6 = createModel(context, () => DrawerCardModel());
    drawerCardModel7 = createModel(context, () => DrawerCardModel());
    drawerCardModel8 = createModel(context, () => DrawerCardModel());
    drawerCardModel9 = createModel(context, () => DrawerCardModel());
    drawerCardModel10 = createModel(context, () => DrawerCardModel());
  }

  void dispose() {
    drawerCardModel1.dispose();
    drawerCardModel2.dispose();
    drawerCardModel3.dispose();
    drawerCardModel4.dispose();
    drawerCardModel5.dispose();
    drawerCardModel6.dispose();
    drawerCardModel7.dispose();
    drawerCardModel8.dispose();
    drawerCardModel9.dispose();
    drawerCardModel10.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
