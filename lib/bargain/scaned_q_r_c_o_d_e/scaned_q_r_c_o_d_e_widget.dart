import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'scaned_q_r_c_o_d_e_model.dart';
export 'scaned_q_r_c_o_d_e_model.dart';

class ScanedQRCODEWidget extends StatefulWidget {
  const ScanedQRCODEWidget({
    Key? key,
    required this.appointmentID,
  }) : super(key: key);

  final int? appointmentID;

  @override
  _ScanedQRCODEWidgetState createState() => _ScanedQRCODEWidgetState();
}

class _ScanedQRCODEWidgetState extends State<ScanedQRCODEWidget> {
  late ScanedQRCODEModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanedQRCODEModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.appintmentread =
          await TaskerpageBackendGroup.appointmentReadCall.call(
        id: widget.appointmentID?.toString(),
        apiGlobalKey: FFAppState().apiKey,
      );
      _model.role = await TaskerpageBackendGroup.userProfileReadCall.call(
        id: getJsonField(
          (_model.appintmentread?.jsonBody ?? ''),
          r'''$.data.poster''',
        ).toString().toString(),
        apiGlobalKey: FFAppState().apiKey,
      );
      setState(() {
        FFAppState().ScanedQRCODE = false;
      });
      if ((getJsonField(
                (_model.appintmentread?.jsonBody ?? ''),
                r'''$.data.poster''',
              ) ==
              getJsonField(
                FFAppState().userProfile,
                r'''$.data.name''',
              )) &&
          (functions.jsonToString(getJsonField(
                (_model.role?.jsonBody ?? ''),
                r'''$.data.role''',
              )) ==
              'Poster')) {
        setState(() {
          FFAppState().ScanedQRCODE = true;
        });
        _model.apiResultqru =
            await TaskerpageBackendGroup.updateAppintmentStatusCall.call(
          id: widget.appointmentID?.toString(),
          docstatus: 1,
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.apiResultqru?.succeeded ?? true)) {
          await showDialog(
            context: context,
            builder: (alertDialogContext) {
              return WebViewAware(
                  child: AlertDialog(
                title: Text('identification '),
                content: Text('your appopointment is done'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(alertDialogContext),
                    child: Text('Ok'),
                  ),
                ],
              ));
            },
          );
        } else {
          return;
        }
      } else {
        setState(() {
          FFAppState().ScanedQRCODE = false;
        });
      }
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

    return FutureBuilder<ApiCallResponse>(
      future: TaskerpageBackendGroup.appointmentReadCall.call(
        id: widget.appointmentID?.toString(),
        apiGlobalKey: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 35.0,
                height: 35.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 35.0,
                ),
              ),
            ),
          );
        }
        final scanedQRCODEAppointmentReadResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
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
              child: FutureBuilder<ApiCallResponse>(
                future: TaskerpageBackendGroup.customerProfileDetailsCall.call(
                  name: functions.jsonToString(getJsonField(
                            FFAppState().userProfile,
                            r'''$.data.role_profile_name''',
                          )) ==
                          'Tasker'
                      ? functions.jsonToString(getJsonField(
                          scanedQRCODEAppointmentReadResponse.jsonBody,
                          r'''$.data.poster''',
                        ))
                      : functions.jsonToString(getJsonField(
                          scanedQRCODEAppointmentReadResponse.jsonBody,
                          r'''$.data.tasker''',
                        )),
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
                  final columnCustomerProfileDetailsResponse = snapshot.data!;
                  return Column(
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: wrapWithModel(
                                model: _model.navigateBackModel,
                                updateCallback: () => setState(() {}),
                                child: NavigateBackWidget(
                                  text: 'Identification appointment',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (FFAppState().ScanedQRCODE == true)
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 28.0, 32.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'User_profile',
                                          queryParameters: {
                                            'id': serializeParam(
                                              getJsonField(
                                                columnCustomerProfileDetailsResponse
                                                    .jsonBody,
                                                r'''$.data.name''',
                                              ).toString(),
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 105.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF6F6F6),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(1.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 16.0, 13.0, 20.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      '${FFAppState().baseUrl}${getJsonField(
                                                        columnCustomerProfileDetailsResponse
                                                            .jsonBody,
                                                        r'''$.data.avatar''',
                                                      ).toString()}',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
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
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              '${getJsonField(
                                                                columnCustomerProfileDetailsResponse
                                                                    .jsonBody,
                                                                r'''$.data.first_name''',
                                                              ).toString()} ${getJsonField(
                                                                columnCustomerProfileDetailsResponse
                                                                    .jsonBody,
                                                                r'''$.data.last_name''',
                                                              ).toString()}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      6.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: Text(
                                                            getJsonField(
                                                              scanedQRCODEAppointmentReadResponse
                                                                  .jsonBody,
                                                              r'''$.data.appointment_type''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              getJsonField(
                                                                scanedQRCODEAppointmentReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.appointment_time''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        12.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .info_outline_rounded,
                                                                color: Color(
                                                                    0xFF212121),
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.done_all_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 24.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (functions.jsonToString(getJsonField(
                                  scanedQRCODEAppointmentReadResponse.jsonBody,
                                  r'''$.data.appointment_type''',
                                )) ==
                                'By Phone')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 24.0, 32.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Container(
                                              height: 52.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF6F6F6),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                border: Border.all(
                                                  color:
                                                      FFAppState().CopyText ==
                                                              true
                                                          ? Color(0xFF00C853)
                                                          : Color(0x00000000),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        17.0, 0.0, 17.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .local_phone_rounded,
                                                              color: Color(
                                                                  0xFF3D3D3D),
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              getJsonField(
                                                                columnCustomerProfileDetailsResponse
                                                                    .jsonBody,
                                                                r'''$.data.phone_number''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Color(
                                                                        0xFF212121),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.done_all_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ],
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
                            if (functions.jsonToString(getJsonField(
                                  scanedQRCODEAppointmentReadResponse.jsonBody,
                                  r'''$.data.appointment_type''',
                                )) ==
                                'Online')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 24.0, 32.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          children: [
                                            Container(
                                              height: 52.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF6F6F6),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                                border: Border.all(
                                                  color:
                                                      FFAppState().CopyText ==
                                                              true
                                                          ? Color(0xFF00C853)
                                                          : Color(0x00000000),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        17.0, 0.0, 17.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .video_camera_back_rounded,
                                                              color: Color(
                                                                  0xFF3D3D3D),
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                          Flexible(
                                                            child: Text(
                                                              getJsonField(
                                                                scanedQRCODEAppointmentReadResponse
                                                                    .jsonBody,
                                                                r'''$.data.meeting_link''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Color(
                                                                        0xFF212121),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.done_all_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                  ],
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
                            if (functions.jsonToString(getJsonField(
                                  scanedQRCODEAppointmentReadResponse.jsonBody,
                                  r'''$.data.appointment_type''',
                                )) ==
                                'On-Site')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 24.0, 32.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.00, 0.00),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          children: [
                                            Container(
                                              height: 250.0,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF6F6F6),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        17.0, 25.0, 17.0, 25.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          FlutterFlowGoogleMap(
                                                        controller: _model
                                                            .googleMapsController,
                                                        onCameraIdle: (latLng) =>
                                                            _model.googleMapsCenter =
                                                                latLng,
                                                        initialLocation: _model
                                                                .googleMapsCenter ??=
                                                            functions.fulllatLong(
                                                                getJsonField(
                                                                  scanedQRCODEAppointmentReadResponse
                                                                      .jsonBody,
                                                                  r'''$.data.appointment_location_lat''',
                                                                ).toString(),
                                                                getJsonField(
                                                                  scanedQRCODEAppointmentReadResponse
                                                                      .jsonBody,
                                                                  r'''$.data.appointment_location_lng''',
                                                                ).toString()),
                                                        markerColor:
                                                            GoogleMarkerColor
                                                                .violet,
                                                        mapType: MapType.normal,
                                                        style: GoogleMapStyle
                                                            .standard,
                                                        initialZoom: 15.0,
                                                        allowInteraction: true,
                                                        allowZoom: false,
                                                        showZoomControls: false,
                                                        showLocation: true,
                                                        showCompass: false,
                                                        showMapToolbar: false,
                                                        showTraffic: true,
                                                        centerMapOnMarkerTap:
                                                            true,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.done_all_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 24.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      if (FFAppState().ScanedQRCODE == false)
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.cancel_rounded,
                                    color: Color(0xFFD40303),
                                    size: 60.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
