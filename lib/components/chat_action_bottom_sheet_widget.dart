import '/backend/schema/structs/index.dart';
import '/components/set_appointment_widget.dart';
import '/components/share_customer_profile_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_action_bottom_sheet_model.dart';
export 'chat_action_bottom_sheet_model.dart';

class ChatActionBottomSheetWidget extends StatefulWidget {
  const ChatActionBottomSheetWidget({
    Key? key,
    required this.action,
    required this.chatRoom,
  }) : super(key: key);

  final String? action;
  final ChatRoomStruct? chatRoom;

  @override
  _ChatActionBottomSheetWidgetState createState() =>
      _ChatActionBottomSheetWidgetState();
}

class _ChatActionBottomSheetWidgetState
    extends State<ChatActionBottomSheetWidget> {
  late ChatActionBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatActionBottomSheetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) {
        if (widget.action == 'Propose Appointment') {
          return wrapWithModel(
            model: _model.setAppointmentModel,
            updateCallback: () => setState(() {}),
            child: SetAppointmentWidget(
              setOredit: false,
              id: widget.chatRoom!.oppositePersonCustomerProfile,
              postID: widget.chatRoom!.customerTask,
            ),
          );
        } else if (widget.action == 'Share Contact') {
          return wrapWithModel(
            model: _model.shareCustomerProfileModel,
            updateCallback: () => setState(() {}),
            child: ShareCustomerProfileWidget(),
          );
        } else {
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              Navigator.pop(
                  context,
                  ChatMessageStruct(
                    refrenceDoctype: 'Customer Profile',
                    refrenceDoc: getJsonField(
                      FFAppState().userProfile,
                      r'''$.data.name''',
                    ).toString(),
                  ));
            },
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Text(
                'Coming soon',
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          );
        }
      },
    );
  }
}
