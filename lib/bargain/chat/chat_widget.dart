import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/bargain/chat_message/chat_message_widget.dart';
import '/components/chat_message_actions_widget.dart';
import '/components/header_web_widget.dart';
import '/components/side_bar_left_profile_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    Key? key,
    required this.room,
  }) : super(key: key);

  final String? room;

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chatRoomDetails =
          await TaskerpageBackendGroup.getChatRoomDetailsCall.call(
        roomName: widget.room,
        email: getJsonField(
          FFAppState().userProfile,
          r'''$.data.user''',
        ).toString().toString(),
        apiGlobalKey: FFAppState().apiKey,
      );
      if ((_model.chatRoomDetails?.succeeded ?? true)) {
        setState(() {
          _model.chatRoom = TaskerpageBackendGroup.getChatRoomDetailsCall
                          .chatRoomJson(
                        (_model.chatRoomDetails?.jsonBody ?? ''),
                      ) !=
                      null &&
                  TaskerpageBackendGroup.getChatRoomDetailsCall.chatRoomJson(
                        (_model.chatRoomDetails?.jsonBody ?? ''),
                      ) !=
                      ''
              ? ChatRoomStruct.fromMap(
                  TaskerpageBackendGroup.getChatRoomDetailsCall.chatRoomJson(
                  (_model.chatRoomDetails?.jsonBody ?? ''),
                ))
              : null;
        });
        _model.apiResult39c = await TaskerpageBackendGroup.markAsReadCall.call(
          room: widget.room,
          apiGlobalKey: FFAppState().apiKey,
        );
        await actions.listenSocketEvent(
          widget.room!,
          () async {
            setState(() {
              _model.clearChatMessagesCacheKey(_model.apiRequestLastUniqueKey);
              _model.apiRequestCompleted = false;
            });
          },
        );
      } else {
        context.pushNamed(
          'chat_list',
          queryParameters: {
            'task': serializeParam(
              0,
              ParamType.int,
            ),
          }.withoutNulls,
        );
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF2F2F2),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: wrapWithModel(
                        model: _model.headerWebModel,
                        updateCallback: () => setState(() {}),
                        child: HeaderWebWidget(),
                      ),
                    ),
                  ],
                ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: wrapWithModel(
                              model: _model.sideBarLeftProfileModel,
                              updateCallback: () => setState(() {}),
                              child: SideBarLeftProfileWidget(),
                            ),
                          ),
                        ],
                      ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    13.0, 0.0, 17.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (responsiveVisibility(
                                                      context: context,
                                                      desktop: false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'chat_list',
                                                              queryParameters: {
                                                                'task':
                                                                    serializeParam(
                                                                  0,
                                                                  ParamType.int,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons.chevron_left,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            size: 25.0,
                                                          ),
                                                        ),
                                                      ),
                                                    Builder(
                                                      builder: (context) {
                                                        if (_model.chatRoom
                                                                ?.hasOppositePersonAvatar() ??
                                                            false) {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap:
                                                                  () async {},
                                                              child: Container(
                                                                width: 45.0,
                                                                height: 45.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  '${FFAppState().baseUrl}${_model.chatRoom?.oppositePersonAvatar}',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/Group_2176.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                    ),
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {},
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              _model.chatRoom
                                                                  ?.room,
                                                              'Chat Room',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            'Post ${_model.chatRoom?.customerTask}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.keyboard_control,
                                                      color: Color(0xFF8A8A8A),
                                                      size: 25.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 10.0),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future: _model
                                                          .chatMessages(
                                                        uniqueQueryKey:
                                                            widget.room,
                                                        requestFn: () =>
                                                            TaskerpageBackendGroup
                                                                .chatRoomMessagesCall
                                                                .call(
                                                          room: widget.room,
                                                          email: getJsonField(
                                                            FFAppState()
                                                                .userProfile,
                                                            r'''$.data.user''',
                                                          ).toString(),
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                          orderBy:
                                                              'creation desc',
                                                          start: 0,
                                                          pageLength: 100,
                                                        ),
                                                      )
                                                          .then((result) {
                                                        try {
                                                          _model.apiRequestCompleted =
                                                              true;
                                                          _model.apiRequestLastUniqueKey =
                                                              widget.room;
                                                        } finally {}
                                                        return result;
                                                      }),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              child:
                                                                  SpinKitThreeBounce(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 35.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final listViewChatRoomMessagesResponse =
                                                            snapshot.data!;
                                                        return Builder(
                                                          builder: (context) {
                                                            final chats =
                                                                functions
                                                                    .convertMap(TaskerpageBackendGroup
                                                                        .chatRoomMessagesCall
                                                                        .chatMessagesJson(
                                                                          listViewChatRoomMessagesResponse
                                                                              .jsonBody,
                                                                        )!
                                                                        .toList())
                                                                    .map((e) => e !=
                                                                                null &&
                                                                            e !=
                                                                                ''
                                                                        ? ChatMessageStruct
                                                                            .fromMap(e)
                                                                        : null)
                                                                    .withoutNulls
                                                                    .toList();
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              reverse: true,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  chats.length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          20.0),
                                                              itemBuilder:
                                                                  (context,
                                                                      chatsIndex) {
                                                                final chatsItem =
                                                                    chats[
                                                                        chatsIndex];
                                                                return wrapWithModel(
                                                                  model: _model
                                                                      .chatMessageModels
                                                                      .getModel(
                                                                    chatsItem
                                                                        .name,
                                                                    chatsIndex,
                                                                  ),
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  child:
                                                                      ChatMessageWidget(
                                                                    key: Key(
                                                                      'Keyony_${chatsItem.name}',
                                                                    ),
                                                                    chatMessage:
                                                                        chatsItem,
                                                                    chatRoom: _model
                                                                        .chatRoom!,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 32.0, 15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: FutureBuilder<
                                                  ApiCallResponse>(
                                                future: TaskerpageBackendGroup
                                                    .getPossibleTransitionsCall
                                                    .call(
                                                  currentState:
                                                      valueOrDefault<String>(
                                                    _model.chatRoom
                                                        ?.workflowState,
                                                    'Initial',
                                                  ),
                                                  doctype: 'Chat Room',
                                                  apiGlobalKey:
                                                      FFAppState().apiKey,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 35.0,
                                                        height: 35.0,
                                                        child:
                                                            SpinKitThreeBounce(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 35.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final chatMessageActionsGetPossibleTransitionsResponse =
                                                      snapshot.data!;
                                                  return wrapWithModel(
                                                    model: _model
                                                        .chatMessageActionsModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        ChatMessageActionsWidget(
                                                      parameter1: widget.room,
                                                      parameter2: functions
                                                          .convertMap(
                                                              TaskerpageBackendGroup
                                                                  .getPossibleTransitionsCall
                                                                  .actionsJson(
                                                                    chatMessageActionsGetPossibleTransitionsResponse
                                                                        .jsonBody,
                                                                  )!
                                                                  .toList())
                                                          .map((e) => e !=
                                                                      null &&
                                                                  e != ''
                                                              ? TransitionsStruct
                                                                  .fromMap(e)
                                                              : null)
                                                          .withoutNulls
                                                          .toList(),
                                                      doctype: 'Chat Room',
                                                      chatRoom:
                                                          _model.chatRoom!,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          1.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.more_vert,
                                                            color: Color(
                                                                0xFF8A8A8A),
                                                            size: 25.0,
                                                          ),
                                                          SizedBox(
                                                            height: 100.0,
                                                            child:
                                                                VerticalDivider(
                                                              thickness: 1.0,
                                                              indent: 6.0,
                                                              endIndent: 6.0,
                                                              color: Color(
                                                                  0xFFC9C9C9),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController,
                                                              focusNode: _model
                                                                  .textFieldFocusNode,
                                                              textInputAction:
                                                                  TextInputAction
                                                                      .send,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                                hintText:
                                                                    'Write a message...',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .tertiary,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                                enabledBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedBorder:
                                                                    InputBorder
                                                                        .none,
                                                                errorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                focusedErrorBorder:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                              minLines: 1,
                                                              validator: _model
                                                                  .textControllerValidator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.apiResult55u =
                                                      await TaskerpageBackendGroup
                                                          .sendMessageCall
                                                          .call(
                                                    email: getJsonField(
                                                      FFAppState().userProfile,
                                                      r'''$.data.user''',
                                                    ).toString(),
                                                    user: getJsonField(
                                                      FFAppState().userProfile,
                                                      r'''$.data.user''',
                                                    ).toString(),
                                                    room: widget.room,
                                                    content: _model
                                                        .textController.text,
                                                    apiGlobalKey:
                                                        FFAppState().apiKey,
                                                  );
                                                  if ((_model.apiResult55u
                                                          ?.succeeded ??
                                                      true)) {
                                                    setState(() {
                                                      _model.textController
                                                          ?.text = '';
                                                    });
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                            child: AlertDialog(
                                                          title: Text('error'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        ));
                                                      },
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                child: Icon(
                                                  Icons.send_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.sideBarRightModel,
                            updateCallback: () => setState(() {}),
                            child: SideBarRightWidget(),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
