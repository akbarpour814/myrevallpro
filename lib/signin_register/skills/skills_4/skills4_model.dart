import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'skills4_widget.dart' show Skills4Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Skills4Model extends FlutterFlowModel<Skills4Widget> {
  ///  Local state fields for this page.

  dynamic serviceCategoriesJson;

  String? selectedServiceCategory;

  String? selectedSkillLevel = '';

  dynamic userServiceOptions;

  String? skillLevelName = '';

  List<dynamic> userServices = [];
  void addToUserServices(dynamic item) => userServices.add(item);
  void removeFromUserServices(dynamic item) => userServices.remove(item);
  void removeAtIndexFromUserServices(int index) => userServices.removeAt(index);
  void insertAtIndexInUserServices(int index, dynamic item) =>
      userServices.insert(index, item);
  void updateUserServicesAtIndex(int index, Function(dynamic) updateFn) =>
      userServices[index] = updateFn(userServices[index]);

  List<UserServiceStruct> customerProfileSkills = [];
  void addToCustomerProfileSkills(UserServiceStruct item) =>
      customerProfileSkills.add(item);
  void removeFromCustomerProfileSkills(UserServiceStruct item) =>
      customerProfileSkills.remove(item);
  void removeAtIndexFromCustomerProfileSkills(int index) =>
      customerProfileSkills.removeAt(index);
  void insertAtIndexInCustomerProfileSkills(
          int index, UserServiceStruct item) =>
      customerProfileSkills.insert(index, item);
  void updateCustomerProfileSkillsAtIndex(
          int index, Function(UserServiceStruct) updateFn) =>
      customerProfileSkills[index] = updateFn(customerProfileSkills[index]);

  int? selectedCategoryIndex = 0;

  List<SkillStruct> selectedSkills = [];
  void addToSelectedSkills(SkillStruct item) => selectedSkills.add(item);
  void removeFromSelectedSkills(SkillStruct item) =>
      selectedSkills.remove(item);
  void removeAtIndexFromSelectedSkills(int index) =>
      selectedSkills.removeAt(index);
  void insertAtIndexInSelectedSkills(int index, SkillStruct item) =>
      selectedSkills.insert(index, item);
  void updateSelectedSkillsAtIndex(int index, Function(SkillStruct) updateFn) =>
      selectedSkills[index] = updateFn(selectedSkills[index]);

  int? innerLoopIndex = 0;

  dynamic selectedCustomerProfile;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Customer Profile Skills List)] action in Skills-4 widget.
  ApiCallResponse? apiResultfko;
  // Model for Header component.
  late HeaderModel headerModel;
  // Stores action output result for [Backend Call - API (Get Customer Profile Skills Details)] action in Container widget.
  ApiCallResponse? skillDetails;
  // Stores action output result for [Backend Call - API (Delete Skills)] action in Container widget.
  ApiCallResponse? deletedSkill;
  // Stores action output result for [Backend Call - API (Update Skills)] action in Container widget.
  ApiCallResponse? apiResultcsw;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (Update Customer Profile Skill Level)] action in Container widget.
  ApiCallResponse? apiResultj09;
  // Stores action output result for [Backend Call - API (Update Customer Profile Skill Level)] action in Container widget.
  ApiCallResponse? apiResultj091;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  Future updateUserServices(BuildContext context) async {}

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
