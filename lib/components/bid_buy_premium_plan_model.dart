import '/components/task_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bid_buy_premium_plan_widget.dart' show BidBuyPremiumPlanWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BidBuyPremiumPlanModel extends FlutterFlowModel<BidBuyPremiumPlanWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TaskCard component.
  late TaskCardModel taskCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    taskCardModel = createModel(context, () => TaskCardModel());
  }

  void dispose() {
    taskCardModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
