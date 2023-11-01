import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'bottom_sheetfor_pay_widget.dart' show BottomSheetforPayWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomSheetforPayModel extends FlutterFlowModel<BottomSheetforPayWidget> {
  ///  Local state fields for this component.

  double discount = 0.0;

  double? grandTotal;

  double? netTotlal;

  bool? isPercentage;

  bool? checkCoupon;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (plan read)] action in BottomSheetforPay widget.
  ApiCallResponse? apiResultgdv;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (aply copon)] action in Container widget.
  ApiCallResponse? apiResult82r;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - API (Get subscription update)] action in Container widget.
  ApiCallResponse? apiResultwp1;
  // Stores action output result for [Backend Call - API (Get payment url)] action in Container widget.
  ApiCallResponse? paymentUrl;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  String? get radioButtonValue => radioButtonValueController?.value;
}
