import '/backend/api_requests/api_calls.dart';
import '/components/aler_modal_massage_accept_appointment_widget.dart';
import '/components/aler_modal_massage_reject_appointment_widget.dart';
import '/components/appointment_card_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/user_rate_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'appointment_list_model.dart';
export 'appointment_list_model.dart';

class AppointmentListWidget extends StatefulWidget {
  const AppointmentListWidget({Key? key}) : super(key: key);

  @override
  _AppointmentListWidgetState createState() => _AppointmentListWidgetState();
}

class _AppointmentListWidgetState extends State<AppointmentListWidget>
    with TickerProviderStateMixin {
  late AppointmentListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppointmentListModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 3,
    )..addListener(() => setState(() {}));
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            27.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.safePop();
                              },
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: FlutterFlowTheme.of(context).alternate,
                                size: 20.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Text(
                                  'Back to dashboard ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
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
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 0.0, 0.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Total Request',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        11.0, 0.0, 0.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: TaskerpageBackendGroup
                                          .appointmentListCall
                                          .call(
                                        filters: '[[\"${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                          FFAppState().userProfile,
                                          r'''$.data.name''',
                                        ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"0\"],[\"is_${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"]]',
                                        fields:
                                            '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
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
                                        final containerAppointmentListResponse =
                                            snapshot.data!;
                                        return Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8A8A8A),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              functions
                                                  .numberofListitems(
                                                      (getJsonField(
                                                    containerAppointmentListResponse
                                                        .jsonBody,
                                                    r'''$.data''',
                                                    true,
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList())
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'totlal Pendings',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        11.0, 0.0, 0.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: TaskerpageBackendGroup
                                          .appointmentListCall
                                          .call(
                                        filters: '[[\"${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                          FFAppState().userProfile,
                                          r'''$.data.name''',
                                        ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"1\"],[\"is_${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"0\"]]',
                                        fields:
                                            '[\"appointment_type\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\",\"post\"]',
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
                                        final containerAppointmentListResponse =
                                            snapshot.data!;
                                        return Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8A8A8A),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              functions
                                                  .numberofListitems(
                                                      (getJsonField(
                                                    containerAppointmentListResponse
                                                        .jsonBody,
                                                    r'''$.data''',
                                                    true,
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList())
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Total Event',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        11.0, 0.0, 0.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: TaskerpageBackendGroup
                                          .appointmentListCall
                                          .call(
                                        filters: '[[\"${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                          FFAppState().userProfile,
                                          r'''$.data.name''',
                                        ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"1\"],[\"is_${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"]]',
                                        fields:
                                            '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
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
                                        final containerAppointmentListResponse =
                                            snapshot.data!;
                                        return Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8A8A8A),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              functions
                                                  .numberofListitems(
                                                      (getJsonField(
                                                    containerAppointmentListResponse
                                                        .jsonBody,
                                                    r'''$.data''',
                                                    true,
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList())
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Total Rejected',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        11.0, 0.0, 0.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: TaskerpageBackendGroup
                                          .appointmentListCall
                                          .call(
                                        filters: '[[\"${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                          FFAppState().userProfile,
                                          r'''$.data.name''',
                                        ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"0\"],[\"is_${functions.jsonToString(getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.role_profile_name''',
                                            )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"0\"]]',
                                        fields:
                                            '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
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
                                        final containerAppointmentListResponse =
                                            snapshot.data!;
                                        return Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF8A8A8A),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment: AlignmentDirectional(
                                                0.00, 0.00),
                                            child: Text(
                                              functions
                                                  .numberofListitems(
                                                      (getJsonField(
                                                    containerAppointmentListResponse
                                                        .jsonBody,
                                                    r'''$.data''',
                                                    true,
                                                  ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList())
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.white,
                                                        fontSize: 12.0,
                                                      ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Done Appointments',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          11.0, 0.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
                                          filters: '[[\"${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                            FFAppState().userProfile,
                                            r'''$.data.name''',
                                          ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"1\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"],[\"docstatus\",\"=\",\"1\"]]',
                                          fields:
                                              '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"docstatus\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 35.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final containerAppointmentListResponse =
                                              snapshot.data!;
                                          return Container(
                                            width: 25.0,
                                            height: 25.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFF8A8A8A),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Text(
                                                functions
                                                    .numberofListitems(
                                                        (getJsonField(
                                                      containerAppointmentListResponse
                                                          .jsonBody,
                                                      r'''$.data''',
                                                      true,
                                                    ) as List)
                                                            .map<String>((s) =>
                                                                s.toString())
                                                            .toList())
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(width: 33.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 5.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 7.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final _datePickedDate =
                                        await showDatePicker(
                                      context: context,
                                      initialDate: getCurrentTimestamp,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime(2050),
                                    );

                                    if (_datePickedDate != null) {
                                      safeSetState(() {
                                        _model.datePicked = DateTime(
                                          _datePickedDate.year,
                                          _datePickedDate.month,
                                          _datePickedDate.day,
                                        );
                                      });
                                    }
                                  },
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                                'yMMMd', _model.datePicked),
                                            'Select date',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFFD2D2D2),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120.0,
                                        child: Divider(
                                          height: 8.0,
                                          thickness: 1.0,
                                          color: Color(0xFFD2D2D2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (_model.datePicked == null)
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 28.0,
                                ),
                              if (_model.datePicked != null)
                                Icon(
                                  Icons.close_rounded,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 28.0,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 10.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment(0.0, 0),
                          child: TabBar(
                            isScrollable: true,
                            labelColor: FlutterFlowTheme.of(context).primary,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondary,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            labelStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 12.8,
                                  fontWeight: FontWeight.bold,
                                ),
                            unselectedLabelStyle: TextStyle(),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            tabs: [
                              Tab(
                                text: 'Requests',
                              ),
                              Tab(
                                text: 'Pending',
                              ),
                              Tab(
                                text: 'Events',
                              ),
                              Tab(
                                text: 'Rejected',
                              ),
                              Tab(
                                text: 'Done',
                              ),
                            ],
                            controller: _model.tabBarController,
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 0.0, 24.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
                                          filters: '[[\"${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                            FFAppState().userProfile,
                                            r'''$.data.name''',
                                          ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"0\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"]]',
                                          fields:
                                              '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 35.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewAppointmentListResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final invationAppointment =
                                                  getJsonField(
                                                listViewAppointmentListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    invationAppointment.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 16.0),
                                                itemBuilder: (context,
                                                    invationAppointmentIndex) {
                                                  final invationAppointmentItem =
                                                      invationAppointment[
                                                          invationAppointmentIndex];
                                                  return Visibility(
                                                    visible: _model
                                                                .datePicked !=
                                                            null
                                                        ? (functions
                                                                .jsonToDateTime(
                                                                    getJsonField(
                                                              invationAppointmentItem,
                                                              r'''$.appointment_time''',
                                                            ).toString()) ==
                                                            _model.datePicked)
                                                        : true,
                                                    child:
                                                        AppointmentCardWidget(
                                                      key: Key(
                                                          'Keyppv_${invationAppointmentIndex}_of_${invationAppointment.length}'),
                                                      json:
                                                          invationAppointmentItem,
                                                      accepted: true,
                                                      state: 'invation',
                                                      accept: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    AlerModalMassageAcceptAppointmentWidget(
                                                                  id: getJsonField(
                                                                    invationAppointmentItem,
                                                                    r'''$.name''',
                                                                  ),
                                                                ),
                                                              ),
                                                            ));
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      reject: () async {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    AlerModalMassageRejectAppointmentWidget(
                                                                  id: getJsonField(
                                                                    invationAppointmentItem,
                                                                    r'''$.name''',
                                                                  ),
                                                                ),
                                                              ),
                                                            ));
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      view: () async {
                                                        if (functions
                                                                .jsonToString(
                                                                    getJsonField(
                                                              invationAppointmentItem,
                                                              r'''$.appointment_type''',
                                                            )) ==
                                                            'Online') {
                                                          context.pushNamed(
                                                            'Online_AppointmentDeatels',
                                                            queryParameters: {
                                                              'appointmentId':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  invationAppointmentItem,
                                                                  r'''$.name''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (functions
                                                                  .jsonToString(
                                                                      getJsonField(
                                                                invationAppointmentItem,
                                                                r'''$.appointment_type''',
                                                              )) ==
                                                              'By Phone') {
                                                            context.pushNamed(
                                                              'By_Phone_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    invationAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            context.pushNamed(
                                                              'On_site_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    invationAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        }
                                                      },
                                                      edit: () async {},
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 24.0, 0.0, 24.0),
                                        child: FutureBuilder<ApiCallResponse>(
                                          future: TaskerpageBackendGroup
                                              .appointmentListCall
                                              .call(
                                            filters: '[[\"${functions.jsonToString(getJsonField(
                                                  FFAppState().userProfile,
                                                  r'''$.data.role_profile_name''',
                                                )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                              FFAppState().userProfile,
                                              r'''$.data.name''',
                                            ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                                  FFAppState().userProfile,
                                                  r'''$.data.role_profile_name''',
                                                )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"1\"],[\"is_${functions.jsonToString(getJsonField(
                                                  FFAppState().userProfile,
                                                  r'''$.data.role_profile_name''',
                                                )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"0\"]]',
                                            fields:
                                                '[\"appointment_type\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\",\"post\"]',
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 35.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final listViewAppointmentListResponse =
                                                snapshot.data!;
                                            return Builder(
                                              builder: (context) {
                                                final pendingAppointment =
                                                    getJsonField(
                                                  listViewAppointmentListResponse
                                                      .jsonBody,
                                                  r'''$.data''',
                                                ).toList();
                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      pendingAppointment.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 16.0),
                                                  itemBuilder: (context,
                                                      pendingAppointmentIndex) {
                                                    final pendingAppointmentItem =
                                                        pendingAppointment[
                                                            pendingAppointmentIndex];
                                                    return Visibility(
                                                      visible: _model
                                                                  .datePicked !=
                                                              null
                                                          ? (functions
                                                                  .jsonToDateTime(
                                                                      getJsonField(
                                                                pendingAppointmentItem,
                                                                r'''$.appointment_time''',
                                                              ).toString()) ==
                                                              _model.datePicked)
                                                          : true,
                                                      child:
                                                          AppointmentCardWidget(
                                                        key: Key(
                                                            'Keypcy_${pendingAppointmentIndex}_of_${pendingAppointment.length}'),
                                                        json:
                                                            pendingAppointmentItem,
                                                        accepted: false,
                                                        state: 'pending',
                                                        accept: () async {},
                                                        reject: () async {},
                                                        view: () async {
                                                          if (functions
                                                                  .jsonToString(
                                                                      getJsonField(
                                                                pendingAppointmentItem,
                                                                r'''$.appointment_type''',
                                                              )) ==
                                                              'Online') {
                                                            context.pushNamed(
                                                              'Online_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    pendingAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            if (functions
                                                                    .jsonToString(
                                                                        getJsonField(
                                                                  pendingAppointmentItem,
                                                                  r'''$.appointment_type''',
                                                                )) ==
                                                                'By Phone') {
                                                              context.pushNamed(
                                                                'By_Phone_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      pendingAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            } else {
                                                              context.pushNamed(
                                                                'On_site_AppointmentDeatels',
                                                                queryParameters:
                                                                    {
                                                                  'appointmentId':
                                                                      serializeParam(
                                                                    getJsonField(
                                                                      pendingAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            }
                                                          }
                                                        },
                                                        edit: () async {},
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
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
                                          filters: '[[\"${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                            FFAppState().userProfile,
                                            r'''$.data.name''',
                                          ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"1\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"]]',
                                          fields:
                                              '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 35.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewAppointmentListResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final acceptedAppointment =
                                                  getJsonField(
                                                listViewAppointmentListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    acceptedAppointment.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 16.0),
                                                itemBuilder: (context,
                                                    acceptedAppointmentIndex) {
                                                  final acceptedAppointmentItem =
                                                      acceptedAppointment[
                                                          acceptedAppointmentIndex];
                                                  return Visibility(
                                                    visible: _model
                                                                .datePicked !=
                                                            null
                                                        ? (functions
                                                                .jsonToDateTime(
                                                                    getJsonField(
                                                              acceptedAppointmentItem,
                                                              r'''$.appointment_time''',
                                                            ).toString()) ==
                                                            _model.datePicked)
                                                        : true,
                                                    child:
                                                        AppointmentCardWidget(
                                                      key: Key(
                                                          'Key5c2_${acceptedAppointmentIndex}_of_${acceptedAppointment.length}'),
                                                      json:
                                                          acceptedAppointmentItem,
                                                      accepted: false,
                                                      state: 'accepted',
                                                      accept: () async {},
                                                      reject: () async {},
                                                      view: () async {
                                                        if (functions
                                                                .jsonToString(
                                                                    getJsonField(
                                                              acceptedAppointmentItem,
                                                              r'''$.appointment_type''',
                                                            )) ==
                                                            'Online') {
                                                          context.pushNamed(
                                                            'Online_AppointmentDeatels',
                                                            queryParameters: {
                                                              'appointmentId':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  acceptedAppointmentItem,
                                                                  r'''$.name''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (functions
                                                                  .jsonToString(
                                                                      getJsonField(
                                                                acceptedAppointmentItem,
                                                                r'''$.appointment_type''',
                                                              )) ==
                                                              'By Phone') {
                                                            context.pushNamed(
                                                              'By_Phone_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    acceptedAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            context.pushNamed(
                                                              'On_site_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    acceptedAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        }
                                                      },
                                                      edit: () async {},
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
                                          filters: '[[\"${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                            FFAppState().userProfile,
                                            r'''$.data.name''',
                                          ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"0\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"0\"]]',
                                          fields:
                                              '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 35.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewAppointmentListResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final rejectedAppointment =
                                                  getJsonField(
                                                listViewAppointmentListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    rejectedAppointment.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 16.0),
                                                itemBuilder: (context,
                                                    rejectedAppointmentIndex) {
                                                  final rejectedAppointmentItem =
                                                      rejectedAppointment[
                                                          rejectedAppointmentIndex];
                                                  return Visibility(
                                                    visible: _model
                                                                .datePicked !=
                                                            null
                                                        ? (functions
                                                                .jsonToDateTime(
                                                                    getJsonField(
                                                              rejectedAppointmentItem,
                                                              r'''$.appointment_time''',
                                                            ).toString()) ==
                                                            _model.datePicked)
                                                        : true,
                                                    child:
                                                        AppointmentCardWidget(
                                                      key: Key(
                                                          'Keyf2y_${rejectedAppointmentIndex}_of_${rejectedAppointment.length}'),
                                                      json:
                                                          rejectedAppointmentItem,
                                                      accepted: false,
                                                      state: 'cancel',
                                                      accept: () async {},
                                                      reject: () async {},
                                                      view: () async {
                                                        if (functions
                                                                .jsonToString(
                                                                    getJsonField(
                                                              rejectedAppointmentItem,
                                                              r'''$.appointment_type''',
                                                            )) ==
                                                            'Online') {
                                                          context.pushNamed(
                                                            'Online_AppointmentDeatels',
                                                            queryParameters: {
                                                              'appointmentId':
                                                                  serializeParam(
                                                                getJsonField(
                                                                  rejectedAppointmentItem,
                                                                  r'''$.name''',
                                                                ).toString(),
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          if (functions
                                                                  .jsonToString(
                                                                      getJsonField(
                                                                rejectedAppointmentItem,
                                                                r'''$.appointment_type''',
                                                              )) ==
                                                              'By Phone') {
                                                            context.pushNamed(
                                                              'By_Phone_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    rejectedAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          } else {
                                                            context.pushNamed(
                                                              'On_site_AppointmentDeatels',
                                                              queryParameters: {
                                                                'appointmentId':
                                                                    serializeParam(
                                                                  getJsonField(
                                                                    rejectedAppointmentItem,
                                                                    r'''$.name''',
                                                                  ).toString(),
                                                                  ParamType
                                                                      .String,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          }
                                                        }
                                                      },
                                                      edit: () async {},
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: TaskerpageBackendGroup
                                            .appointmentListCall
                                            .call(
                                          filters: '[[\"${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}\",\"=\",\"${getJsonField(
                                            FFAppState().userProfile,
                                            r'''$.data.name''',
                                          ).toString()}\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'tasker' : 'poster'}_accepted\",\"=\",\"1\"],[\"is_${functions.jsonToString(getJsonField(
                                                FFAppState().userProfile,
                                                r'''$.data.role_profile_name''',
                                              )) == 'Tasker' ? 'poster' : 'tasker'}_accepted\",\"=\",\"1\"],[\"docstatus\",\"=\",\"1\"]]',
                                          fields:
                                              '[\"appointment_type\",\"post\",\"appointment_time\",\"poster\",\"tasker\",\"is_tasker_accepted\",\"is_poster_accepted\",\"name\",\"docstatus\",\"creation\",\"appointment_start_time\",\"appointment_end_time\"]',
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 35.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final listViewAppointmentListResponse =
                                              snapshot.data!;
                                          return Builder(
                                            builder: (context) {
                                              final acceptedAppointment =
                                                  getJsonField(
                                                listViewAppointmentListResponse
                                                    .jsonBody,
                                                r'''$.data''',
                                              ).toList();
                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                primary: false,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    acceptedAppointment.length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(height: 16.0),
                                                itemBuilder: (context,
                                                    acceptedAppointmentIndex) {
                                                  final acceptedAppointmentItem =
                                                      acceptedAppointment[
                                                          acceptedAppointmentIndex];
                                                  return Visibility(
                                                    visible: _model
                                                                .datePicked !=
                                                            null
                                                        ? (functions
                                                                .jsonToDateTime(
                                                                    getJsonField(
                                                              acceptedAppointmentItem,
                                                              r'''$.appointment_time''',
                                                            ).toString()) ==
                                                            _model.datePicked)
                                                        : true,
                                                    child:
                                                        AppointmentCardWidget(
                                                      key: Key(
                                                          'Keyyby_${acceptedAppointmentIndex}_of_${acceptedAppointment.length}'),
                                                      accepted: false,
                                                      state: 'done',
                                                      json:
                                                          acceptedAppointmentItem,
                                                      accept: () async {},
                                                      reject: () async {},
                                                      view: () async {
                                                        _model.review =
                                                            await TaskerpageBackendGroup
                                                                .reviewReadByIdCall
                                                                .call(
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                          filters:
                                                              '[[\"appointment\",\"=\",\"${getJsonField(
                                                            acceptedAppointmentItem,
                                                            r'''$.name''',
                                                          ).toString()}\"],[\"reviewed_by\",\"=\",\"${getJsonField(
                                                            FFAppState()
                                                                .userProfile,
                                                            r'''$.data.name''',
                                                          ).toString()}\"]]',
                                                          fields:
                                                              '[\"appointment\",\"name\",\"reviewed_by\",\"review_rate\",\"comment\"]',
                                                        );
                                                        if (functions
                                                                .checkLenghtlist(
                                                                    getJsonField(
                                                              (_model.review
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data''',
                                                            )) ==
                                                            false) {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            enableDrag: false,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      UserRateWidget(
                                                                    appointmentId:
                                                                        getJsonField(
                                                                      acceptedAppointmentItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    action:
                                                                        () async {},
                                                                  ),
                                                                ),
                                                              ));
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                  child:
                                                                      AlertDialog(
                                                                title: Text(
                                                                    'Review'),
                                                                content: Text(
                                                                    'You have already commented on this appointment !'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              ));
                                                            },
                                                          );
                                                        }

                                                        setState(() {});
                                                      },
                                                      edit: () async {},
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
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
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.navBarModel,
                    updateCallback: () => setState(() {}),
                    child: NavBarWidget(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
