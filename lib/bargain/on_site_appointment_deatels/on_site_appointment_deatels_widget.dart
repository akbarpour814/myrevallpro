import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigate_back_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:styled_divider/styled_divider.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'on_site_appointment_deatels_model.dart';
export 'on_site_appointment_deatels_model.dart';

class OnSiteAppointmentDeatelsWidget extends StatefulWidget {
  const OnSiteAppointmentDeatelsWidget({
    Key? key,
    required this.appointmentId,
  }) : super(key: key);

  final String? appointmentId;

  @override
  _OnSiteAppointmentDeatelsWidgetState createState() =>
      _OnSiteAppointmentDeatelsWidgetState();
}

class _OnSiteAppointmentDeatelsWidgetState
    extends State<OnSiteAppointmentDeatelsWidget> {
  late OnSiteAppointmentDeatelsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnSiteAppointmentDeatelsModel());

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
        id: widget.appointmentId,
        apiGlobalKey: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitThreeBounce(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final onSiteAppointmentDeatelsAppointmentReadResponse = snapshot.data!;
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
              child: Drawer(
                elevation: 16.0,
                child: wrapWithModel(
                  model: _model.mainDrawerModel,
                  updateCallback: () => setState(() {}),
                  child: MainDrawerWidget(),
                ),
              ),
            ),
            body: SafeArea(
              top: true,
              child: Column(
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
                  Expanded(
                    child: FutureBuilder<ApiCallResponse>(
                      future: TaskerpageBackendGroup.customerProfileDetailsCall
                          .call(
                        name: functions.jsonToString(getJsonField(
                                  FFAppState().userProfile,
                                  r'''$.data.role_profile_name''',
                                )) ==
                                'Tasker'
                            ? functions.jsonToString(getJsonField(
                                onSiteAppointmentDeatelsAppointmentReadResponse
                                    .jsonBody,
                                r'''$.data.poster''',
                              ))
                            : functions.jsonToString(getJsonField(
                                onSiteAppointmentDeatelsAppointmentReadResponse
                                    .jsonBody,
                                r'''$.data.tasker''',
                              )),
                        apiGlobalKey: FFAppState().apiKey,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitThreeBounce(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final columnCustomerProfileDetailsResponse =
                            snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
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
                                          text: 'Appointment Details',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if ((functions.jsonToString(getJsonField(
                                        onSiteAppointmentDeatelsAppointmentReadResponse
                                            .jsonBody,
                                        r'''$.data.is_tasker_accepted''',
                                      )) ==
                                      '1') &&
                                  (functions.jsonToString(getJsonField(
                                        onSiteAppointmentDeatelsAppointmentReadResponse
                                            .jsonBody,
                                        r'''$.data.is_poster_accepted''',
                                      )) ==
                                      '1') &&
                                  (functions.jsonToString(getJsonField(
                                        FFAppState().userProfile,
                                        r'''$.data.role''',
                                      )) ==
                                      'Tasker'))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 28.0, 32.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
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
                                                    0.0, 20.0, 0.0, 20.0),
                                            child: BarcodeWidget(
                                              data:
                                                  '${FFAppState().appUrl}/scanedQRCODE?appointmentID=${widget.appointmentId}',
                                              barcode: Barcode.qrCode(),
                                              width: 192.0,
                                              height: 192.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              backgroundColor:
                                                  Colors.transparent,
                                              errorBuilder:
                                                  (_context, _error) =>
                                                      SizedBox(
                                                width: 192.0,
                                                height: 192.0,
                                              ),
                                              drawText: false,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if ((functions.jsonToString(getJsonField(
                                        onSiteAppointmentDeatelsAppointmentReadResponse
                                            .jsonBody,
                                        r'''$.data.is_tasker_accepted''',
                                      )) ==
                                      '1') &&
                                  (functions.jsonToString(getJsonField(
                                        onSiteAppointmentDeatelsAppointmentReadResponse
                                            .jsonBody,
                                        r'''$.data.is_poster_accepted''',
                                      )) ==
                                      '1') &&
                                  (functions.jsonToString(getJsonField(
                                        FFAppState().userProfile,
                                        r'''$.data.role''',
                                      )) ==
                                      'Poster'))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 28.0, 32.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            _model.appointmentUrl =
                                                await FlutterBarcodeScanner
                                                    .scanBarcode(
                                              '#C62828', // scanning line color
                                              'Cancel', // cancel button text
                                              true, // whether to show the flash icon
                                              ScanMode.QR,
                                            );

                                            context.pushNamed(
                                              'scaned_QRCODE',
                                              queryParameters: {
                                                'appointmentID': serializeParam(
                                                  0,
                                                  ParamType.int,
                                                ),
                                              }.withoutNulls,
                                            );

                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 120.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Scan QR CODE',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                          if (functions
                                                  .jsonToString(getJsonField(
                                                columnCustomerProfileDetailsResponse
                                                    .jsonBody,
                                                r'''$.data.role''',
                                              )) ==
                                              'Tasker') {
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
                                          } else {
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
                                          }
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                MainAxisSize
                                                                    .max,
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
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                              'On-Site',
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                getJsonField(
                                                                  onSiteAppointmentDeatelsAppointmentReadResponse
                                                                      .jsonBody,
                                                                  r'''$.data.appointment_time''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 24.0, 32.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 90.0,
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
                                            color: FFAppState().CopyText == true
                                                ? Color(0xFF00C853)
                                                : Color(0x00000000),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  17.0, 0.0, 17.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 80.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'start time',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'jm',
                                                          functions
                                                              .jsonToDateTime(
                                                                  getJsonField(
                                                            onSiteAppointmentDeatelsAppointmentReadResponse
                                                                .jsonBody,
                                                            r'''$.data.appointment_start_time''',
                                                          ).toString())),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 5.0, 15.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 120.0,
                                                      child: StyledDivider(
                                                        thickness: 1.0,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        lineStyle:
                                                            DividerLineStyle
                                                                .dashed,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 80.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'end time',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 5.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      dateTimeFormat(
                                                          'jm',
                                                          functions
                                                              .jsonToDateTime(
                                                                  getJsonField(
                                                            onSiteAppointmentDeatelsAppointmentReadResponse
                                                                .jsonBody,
                                                            r'''$.data.appointment_end_time''',
                                                          ).toString())),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                fontSize: 12.0,
                                                              ),
                                                    ),
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 24.0, 32.0, 24.0),
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
                                              height: 200.0,
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
                                                        17.0, 17.0, 17.0, 17.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Builder(
                                                          builder: (context) {
                                                        final _googleMapMarker =
                                                            functions.fulllatLong(
                                                                getJsonField(
                                                                  onSiteAppointmentDeatelsAppointmentReadResponse
                                                                      .jsonBody,
                                                                  r'''$.data.appointment_location_lat''',
                                                                ).toString(),
                                                                getJsonField(
                                                                  onSiteAppointmentDeatelsAppointmentReadResponse
                                                                      .jsonBody,
                                                                  r'''$.data.appointment_location_lng''',
                                                                ).toString());
                                                        return FlutterFlowGoogleMap(
                                                          controller: _model
                                                              .googleMapsController,
                                                          onCameraIdle:
                                                              (latLng) => _model
                                                                      .googleMapsCenter =
                                                                  latLng,
                                                          initialLocation: _model
                                                                  .googleMapsCenter ??=
                                                              functions.fulllatLong(
                                                                  getJsonField(
                                                                    onSiteAppointmentDeatelsAppointmentReadResponse
                                                                        .jsonBody,
                                                                    r'''$.data.appointment_location_lat''',
                                                                  ).toString(),
                                                                  getJsonField(
                                                                    onSiteAppointmentDeatelsAppointmentReadResponse
                                                                        .jsonBody,
                                                                    r'''$.data.appointment_location_lng''',
                                                                  ).toString()),
                                                          markers: [
                                                            FlutterFlowMarker(
                                                              _googleMapMarker
                                                                  .serialize(),
                                                              _googleMapMarker,
                                                            ),
                                                          ],
                                                          markerColor:
                                                              GoogleMarkerColor
                                                                  .violet,
                                                          mapType:
                                                              MapType.normal,
                                                          style: GoogleMapStyle
                                                              .standard,
                                                          initialZoom: 15.0,
                                                          allowInteraction:
                                                              true,
                                                          allowZoom: false,
                                                          showZoomControls:
                                                              false,
                                                          showLocation: true,
                                                          showCompass: false,
                                                          showMapToolbar: false,
                                                          showTraffic: true,
                                                          centerMapOnMarkerTap:
                                                              true,
                                                        );
                                                      }),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (!((functions.jsonToString(
                                                        getJsonField(
                                                      onSiteAppointmentDeatelsAppointmentReadResponse
                                                          .jsonBody,
                                                      r'''$.data.is_tasker_accepted''',
                                                    )) ==
                                                    '1') &&
                                                (functions.jsonToString(
                                                        getJsonField(
                                                      onSiteAppointmentDeatelsAppointmentReadResponse
                                                          .jsonBody,
                                                      r'''$.data.is_poster_accepted''',
                                                    )) ==
                                                    '1')))
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                          sigmaX: 3.0,
                                                          sigmaY: 3.0,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      80.0,
                                                                      0.0,
                                                                      80.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
