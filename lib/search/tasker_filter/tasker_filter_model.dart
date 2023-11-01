import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/emty_container_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'tasker_filter_widget.dart' show TaskerFilterWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TaskerFilterModel extends FlutterFlowModel<TaskerFilterWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Customer Profile Skills List)] action in Text widget.
  ApiCallResponse? customerProfileName;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - API (getAddressDetails)] action in DropDown widget.
  ApiCallResponse? addressDetails;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Switch widget.
  bool? switchValue4;
  // State field(s) for Switch widget.
  bool? switchValue5;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
}
