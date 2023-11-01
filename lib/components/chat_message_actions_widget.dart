import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/chat_action_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_message_actions_model.dart';
export 'chat_message_actions_model.dart';

class ChatMessageActionsWidget extends StatefulWidget {
  const ChatMessageActionsWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    String? doctype,
    required this.chatRoom,
  })  : this.doctype = doctype ?? 'Chat Message',
        super(key: key);

  final String? parameter1;
  final List<TransitionsStruct>? parameter2;
  final String doctype;
  final ChatRoomStruct? chatRoom;

  @override
  _ChatMessageActionsWidgetState createState() =>
      _ChatMessageActionsWidgetState();
}

class _ChatMessageActionsWidgetState extends State<ChatMessageActionsWidget> {
  late ChatMessageActionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatMessageActionsModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 0.0, 0.0),
      child: Builder(
        builder: (context) {
          final possibleTransitions = widget.parameter2?.toList() ?? [];
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(possibleTransitions.length,
                (possibleTransitionsIndex) {
              final possibleTransitionsItem =
                  possibleTransitions[possibleTransitionsIndex];
              return InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: ChatActionBottomSheetWidget(
                          action: possibleTransitionsItem.action,
                          chatRoom: widget.chatRoom!,
                        ),
                      );
                    },
                  ).then((value) =>
                      safeSetState(() => _model.chatActionBottomSheet = value));

                  if (_model.chatActionBottomSheet!.hasRefrenceDoctype()) {
                    _model.apiResultu11 =
                        await TaskerpageBackendGroup.processActionCall.call(
                      doctype: widget.doctype,
                      docname: widget.parameter1,
                      action: possibleTransitionsItem.action,
                      refrenceDoctype: 'Customer Profile',
                      refrenceDocname: getJsonField(
                        FFAppState().userProfile,
                        r'''$.data.name''',
                      ).toString(),
                      apiGlobalKey: FFAppState().apiKey,
                    );
                    if ((_model.apiResultu11?.succeeded ?? true)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Message sent successfuly',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'There was a problem with sending your message.',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                    }
                  }

                  setState(() {});
                },
                child: Container(
                  height: 26.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          possibleTransitionsItem.action,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Lato',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).divide(SizedBox(width: 8.0)),
          );
        },
      ),
    );
  }
}
