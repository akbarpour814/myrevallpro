import '/backend/api_requests/api_calls.dart';
import '/components/tasker_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'bid_on_tasker_widget.dart' show BidOnTaskerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BidOnTaskerModel extends FlutterFlowModel<BidOnTaskerWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TaskerCard component.
  late TaskerCardModel taskerCardModel;
  // State field(s) for BidAmount widget.
  FocusNode? bidAmountFocusNode;
  TextEditingController? bidAmountController;
  final bidAmountMask = MaskTextInputFormatter(mask: '###.###.###');
  String? Function(BuildContext, String?)? bidAmountControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (Create Bid)] action in Container widget.
  ApiCallResponse? bidCreated;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    taskerCardModel = createModel(context, () => TaskerCardModel());
  }

  void dispose() {
    taskerCardModel.dispose();
    bidAmountFocusNode?.dispose();
    bidAmountController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
