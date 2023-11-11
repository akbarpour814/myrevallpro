import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/my_post_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'chat_list_model.dart';
export 'chat_list_model.dart';

class ChatListWidget extends StatefulWidget {
  const ChatListWidget({
    Key? key,
    required this.task,
    this.myPost,
  }) : super(key: key);

  final int? task;
  final dynamic myPost;

  @override
  _ChatListWidgetState createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends State<ChatListWidget> {
  late ChatListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatListModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.taskID = valueOrDefault<int>(
          widget.task,
          0,
        );
      });
      await actions.listenSocketEvent(
        'private_room_creation',
        () async {
          setState(() => _model.apiRequestCompleter3 = null);
          await _model.waitForApiRequestCompleted3();
        },
      );
      await actions.listenSocketEvent(
        'latest_chat_updates',
        () async {
          setState(() => _model.apiRequestCompleter3 = null);
          await _model.waitForApiRequestCompleted3();
        },
      );
      setState(() => _model.apiRequestCompleter1 = null);
      await _model.waitForApiRequestCompleted1();
      setState(() => _model.apiRequestCompleter4 = null);
      await _model.waitForApiRequestCompleted4();
      setState(() => _model.apiRequestCompleter2 = null);
      await _model.waitForApiRequestCompleted2();
      setState(() => _model.apiRequestCompleter3 = null);
      await _model.waitForApiRequestCompleted3();
    });

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
        endDrawer: Container(
          width: double.infinity,
          child: WebViewAware(
              child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.mainDrawerModel,
              updateCallback: () => setState(() {}),
              child: MainDrawerWidget(),
            ),
          )),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                wrapWithModel(
                  model: _model.headerModel,
                  updateCallback: () => setState(() {}),
                  child: HeaderWidget(
                    openDrawer: () async {
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                  ),
                ),
              ],
            ),
            if (widget.task! > 0)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(27.0, 32.0, 0.0, 20.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: TaskerpageBackendGroup.myPostsCall.call(
                    filters: '[[\"poster\",\"=\",\"${getJsonField(
                      FFAppState().userProfile,
                      r'''$.data.name''',
                    ).toString()}\"]]',
                    fields: '[\"name\"]',
                    apiGlobalKey: FFAppState().apiKey,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 35.0,
                          height: 35.0,
                          child: SpinKitThreeBounce(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 35.0,
                          ),
                        ),
                      );
                    }
                    final postRowMyPostsResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final myPosts = getJsonField(
                          postRowMyPostsResponse.jsonBody,
                          r'''$.data''',
                        ).toList();
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(myPosts.length, (myPostsIndex) {
                              final myPostsItem = myPosts[myPostsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    _model.taskID = getJsonField(
                                      myPostsItem,
                                      r'''$.name''',
                                    );
                                  });
                                  setState(
                                      () => _model.apiRequestCompleter1 = null);
                                  await _model.waitForApiRequestCompleted1();
                                  setState(
                                      () => _model.apiRequestCompleter4 = null);
                                  await _model.waitForApiRequestCompleted4();
                                  setState(
                                      () => _model.apiRequestCompleter2 = null);
                                  await _model.waitForApiRequestCompleted2();
                                  setState(
                                      () => _model.apiRequestCompleter3 = null);
                                  await _model.waitForApiRequestCompleted3();
                                },
                                child: Container(
                                  width: 320.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00FFFFFF),
                                    borderRadius: BorderRadius.circular(2.0),
                                    border: Border.all(
                                      color: Color(0x00F36121),
                                    ),
                                  ),
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: TaskerpageBackendGroup.postReadCall
                                        .call(
                                      id: getJsonField(
                                        myPostsItem,
                                        r'''$.name''',
                                      ).toString(),
                                      apiGlobalKey: FFAppState().apiKey,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 35.0,
                                            height: 35.0,
                                            child: SpinKitThreeBounce(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 35.0,
                                            ),
                                          ),
                                        );
                                      }
                                      final columnPostReadResponse =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, 1.0),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 0.0),
                                                  child: MyPostCardWidget(
                                                    key: Key(
                                                        'Keyo4w_${myPostsIndex}_of_${myPosts.length}'),
                                                    postData: widget.myPost!,
                                                  ),
                                                ),
                                                if (_model.taskID !=
                                                    getJsonField(
                                                      myPostsItem,
                                                      r'''$.name''',
                                                    ))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 5.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 175.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x298A8A8A),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            width: 130.0,
                                                            height: 36.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x83F36121),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'view related chats',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lato',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              );
                            }).divide(SizedBox(width: 15.0)),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            if (widget.task! > 0)
              Divider(
                height: 0.0,
                thickness: 1.0,
                color: FlutterFlowTheme.of(context).secondary,
              ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (false)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Users related to this post',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter1 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(TaskerpageBackendGroup
                                              .getMyTasksGroupByCall
                                              .call(
                                            filters:
                                                '[[\"customer_task\",\"=\",\"${_model.taskID?.toString()}\"]]',
                                            fields:
                                                '[\"customer_task\",\"user\"]',
                                            orderBy: 'creation desc',
                                            limitStart: 0,
                                            limit: 100,
                                            apiGlobalKey: FFAppState().apiKey,
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 35.0,
                                        height: 35.0,
                                        child: SpinKitThreeBounce(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 35.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final containerGetMyTasksGroupByResponse =
                                      snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 8.0, 8.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            functions
                                                .numberofListitems(
                                                    (TaskerpageBackendGroup
                                                            .getMyTasksGroupByCall
                                                            .users(
                                                  containerGetMyTasksGroupByResponse
                                                      .jsonBody,
                                                ) as List)
                                                        .map<String>(
                                                            (s) => s.toString())
                                                        .toList()
                                                        ?.map(
                                                            (e) => e.toString())
                                                        .toList()
                                                        ?.toList())
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 10.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Visibility(
                          visible: false,
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 15.0, 0.0, 0.0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_model.apiRequestCompleter4 ??=
                                      Completer<ApiCallResponse>()
                                        ..complete(TaskerpageBackendGroup
                                            .getMyTasksGroupByCall
                                            .call(
                                          filters:
                                              '[[\"customer_task\",\"=\",\"${_model.taskID?.toString()}\"]]',
                                          fields:
                                              '[\"customer_task\",\"user\"]',
                                          orderBy: 'creation desc',
                                          limitStart: 0,
                                          limit: 100,
                                          apiGlobalKey: FFAppState().apiKey,
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 35.0,
                                      height: 35.0,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 35.0,
                                      ),
                                    ),
                                  );
                                }
                                final rowGetMyTasksGroupByResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final usersThisPost = getJsonField(
                                      rowGetMyTasksGroupByResponse.jsonBody,
                                      r'''$.data''',
                                    ).toList();
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children:
                                            List.generate(usersThisPost.length,
                                                (usersThisPostIndex) {
                                          final usersThisPostItem =
                                              usersThisPost[usersThisPostIndex];
                                          return Stack(
                                            alignment:
                                                AlignmentDirectional(1.0, 1.0),
                                            children: [
                                              FutureBuilder<ApiCallResponse>(
                                                future: TaskerpageBackendGroup
                                                    .readByEmailCall
                                                    .call(
                                                  filters:
                                                      '[[\"user\",\"=\",\"${getJsonField(
                                                    usersThisPostItem,
                                                    r'''$.user''',
                                                  ).toString()}\"]]',
                                                  fields: '[\"avatar\"]',
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
                                                  final circleImageReadByEmailResponse =
                                                      snapshot.data!;
                                                  return Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      '${FFAppState().baseUrl}${TaskerpageBackendGroup.readByEmailCall.avatar(
                                                            circleImageReadByEmailResponse
                                                                .jsonBody,
                                                          ).toString()}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                              Container(
                                                width: 13.0,
                                                height: 13.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF71DD3A),
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).divide(SizedBox(width: 13.0)),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.task != null ? 'Chats related' : 'Chats',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            if (false)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: (_model.apiRequestCompleter2 ??=
                                          Completer<ApiCallResponse>()
                                            ..complete(TaskerpageBackendGroup
                                                .chatListCall
                                                .call(
                                              user: getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.user''',
                                              ).toString(),
                                              apiGlobalKey: FFAppState().apiKey,
                                              task: _model.taskID,
                                            )))
                                      .future,
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 35.0,
                                          height: 35.0,
                                          child: SpinKitThreeBounce(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 35.0,
                                          ),
                                        ),
                                      );
                                    }
                                    final containerChatListResponse =
                                        snapshot.data!;
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              functions
                                                  .numberofListitems(
                                                      (TaskerpageBackendGroup
                                                              .chatListCall
                                                              .name(
                                                    containerChatListResponse
                                                        .jsonBody,
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()
                                                          ?.toList())
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontSize: 10.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 20.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future: (_model.apiRequestCompleter3 ??= Completer<
                                    ApiCallResponse>()
                                  ..complete(
                                      TaskerpageBackendGroup.chatListCall.call(
                                    user: getJsonField(
                                      FFAppState().userProfile,
                                      r'''$.data.user''',
                                    ).toString(),
                                    apiGlobalKey: FFAppState().apiKey,
                                    task: valueOrDefault<int>(
                                      widget.task,
                                      0,
                                    ),
                                  )))
                                .future,
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 35.0,
                                    height: 35.0,
                                    child: SpinKitThreeBounce(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 35.0,
                                    ),
                                  ),
                                );
                              }
                              final listViewChatListResponse = snapshot.data!;
                              return Builder(
                                builder: (context) {
                                  final myChats = functions
                                      .convertMap(
                                          TaskerpageBackendGroup.chatListCall
                                              .chatListJson(
                                                listViewChatListResponse
                                                    .jsonBody,
                                              )!
                                              .toList())
                                      .map((e) => e != null && e != ''
                                          ? ChatRoomStruct.fromMap(e)
                                          : null)
                                      .withoutNulls
                                      .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: myChats.length,
                                    itemBuilder: (context, myChatsIndex) {
                                      final myChatsItem = myChats[myChatsIndex];
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'chat',
                                                pathParameters: {
                                                  'room': serializeParam(
                                                    myChatsItem.room,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (myChatsItem
                                                                    .hasOppositePersonAvatar()) {
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          47.0,
                                                                      height:
                                                                          47.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        fadeInDuration:
                                                                            Duration(milliseconds: 500),
                                                                        fadeOutDuration:
                                                                            Duration(milliseconds: 500),
                                                                        imageUrl:
                                                                            '${FFAppState().baseUrl}${myChatsItem.oppositePersonAvatar}',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          45.0,
                                                                      height:
                                                                          45.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/Group_2176.png',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          myChatsItem
                                                                              .roomName,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                fontSize: 14.0,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          dateTimeFormat(
                                                                              'MMMEd',
                                                                              functions.jsonToDateTime(myChatsItem.modified)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Lato',
                                                                                color: Color(0x74292929),
                                                                                fontSize: 13.0,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            myChatsItem.lastMessage.maybeHandleOverflow(
                                                                              maxChars: 15,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Lato',
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  fontSize: 13.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (myChatsItem.isRead ==
                                                                              0)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: Container(
                                                                                width: 10.0,
                                                                                height: 10.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          Icon(
                                                                            Icons.keyboard_arrow_right,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                21.0,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        4.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 26.0,
                                            thickness: 1.0,
                                            color: Color(0xFFDEDEDE),
                                          ),
                                        ],
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
            ),
          ],
        ),
      ),
    );
  }
}
