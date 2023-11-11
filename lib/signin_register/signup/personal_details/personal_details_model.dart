import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/requard_star_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'personal_details_widget.dart' show PersonalDetailsWidget;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PersonalDetailsModel extends FlutterFlowModel<PersonalDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for requard_star component.
  late RequardStarModel requardStarModel1;
  // State field(s) for CompanyName widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameController;
  String? Function(BuildContext, String?)? companyNameControllerValidator;
  // Model for requard_star component.
  late RequardStarModel requardStarModel2;
  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameController;
  String? Function(BuildContext, String?)? firstNameControllerValidator;
  // Model for requard_star component.
  late RequardStarModel requardStarModel3;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameController;
  String? Function(BuildContext, String?)? lastNameControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController4;
  final textFieldMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? textController4Validator;
  // Model for requard_star component.
  late RequardStarModel requardStarModel4;
  DateTime? datePicked;
  // Model for button_Next component.
  late ButtonNextModel buttonNextModel;
  // Stores action output result for [Backend Call - API (userProfileBasicInfo)] action in button_Next widget.
  ApiCallResponse? userProfileBasicInfoResult;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    requardStarModel1 = createModel(context, () => RequardStarModel());
    requardStarModel2 = createModel(context, () => RequardStarModel());
    requardStarModel3 = createModel(context, () => RequardStarModel());
    requardStarModel4 = createModel(context, () => RequardStarModel());
    buttonNextModel = createModel(context, () => ButtonNextModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    requardStarModel1.dispose();
    companyNameFocusNode?.dispose();
    companyNameController?.dispose();

    requardStarModel2.dispose();
    firstNameFocusNode?.dispose();
    firstNameController?.dispose();

    requardStarModel3.dispose();
    lastNameFocusNode?.dispose();
    lastNameController?.dispose();

    textFieldFocusNode?.dispose();
    textController4?.dispose();

    requardStarModel4.dispose();
    buttonNextModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
