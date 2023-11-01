import '/backend/schema/structs/index.dart';
import '/components/set_appointment_widget.dart';
import '/components/share_customer_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_action_bottom_sheet_widget.dart' show ChatActionBottomSheetWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatActionBottomSheetModel
    extends FlutterFlowModel<ChatActionBottomSheetWidget> {
  ///  Local state fields for this component.

  int? selectedAddress;

  double selectedLatitude = 0.0;

  double selectedLongitude = 0.0;

  String appointmentType = 'Online';

  ///  State fields for stateful widgets in this component.

  // Model for SetAppointment component.
  late SetAppointmentModel setAppointmentModel;
  // Model for ShareCustomerProfile component.
  late ShareCustomerProfileModel shareCustomerProfileModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    setAppointmentModel = createModel(context, () => SetAppointmentModel());
    shareCustomerProfileModel =
        createModel(context, () => ShareCustomerProfileModel());
  }

  void dispose() {
    setAppointmentModel.dispose();
    shareCustomerProfileModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
