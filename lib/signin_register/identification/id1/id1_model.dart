import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/date_of_birth_pick_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/text_field_and_title_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'id1_widget.dart' show Id1Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class Id1Model extends FlutterFlowModel<Id1Widget> {
  ///  Local state fields for this page.

  String? selectedGender;

  IdentificationStruct? identification;
  void updateIdentificationStruct(Function(IdentificationStruct) updateFn) =>
      updateFn(identification ??= IdentificationStruct());

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (Get Identification Details)] action in ID1 widget.
  ApiCallResponse? apiResultd0a;
  // Model for Header component.
  late HeaderModel headerModel;
  // Model for text_field_and_title component.
  late TextFieldAndTitleModel textFieldAndTitleModel1;
  // Model for text_field_and_title component.
  late TextFieldAndTitleModel textFieldAndTitleModel2;
  // Model for date_of_birth_pick component.
  late DateOfBirthPickModel dateOfBirthPickModel;
  // Stores action output result for [Backend Call - API (Create Identification)] action in Container widget.
  ApiCallResponse? createdIdentification;
  // Stores action output result for [Backend Call - API (Update Identification Details)] action in Container widget.
  ApiCallResponse? apiResultemi;
  // Model for Main_Drawer component.
  late MainDrawerModel mainDrawerModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    headerModel = createModel(context, () => HeaderModel());
    textFieldAndTitleModel1 =
        createModel(context, () => TextFieldAndTitleModel());
    textFieldAndTitleModel2 =
        createModel(context, () => TextFieldAndTitleModel());
    dateOfBirthPickModel = createModel(context, () => DateOfBirthPickModel());
    mainDrawerModel = createModel(context, () => MainDrawerModel());
  }

  void dispose() {
    unfocusNode.dispose();
    headerModel.dispose();
    textFieldAndTitleModel1.dispose();
    textFieldAndTitleModel2.dispose();
    dateOfBirthPickModel.dispose();
    mainDrawerModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
