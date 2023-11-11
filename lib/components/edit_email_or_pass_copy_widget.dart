import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_email_or_pass_copy_model.dart';
export 'edit_email_or_pass_copy_model.dart';

class EditEmailOrPassCopyWidget extends StatefulWidget {
  const EditEmailOrPassCopyWidget({Key? key}) : super(key: key);

  @override
  _EditEmailOrPassCopyWidgetState createState() =>
      _EditEmailOrPassCopyWidgetState();
}

class _EditEmailOrPassCopyWidgetState extends State<EditEmailOrPassCopyWidget>
    with TickerProviderStateMixin {
  late EditEmailOrPassCopyModel _model;

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditEmailOrPassCopyModel());

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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 450.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 21.0,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 25.0, 32.0, 25.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: TaskerpageBackendGroup.myAddressesCall.call(
                    apiGlobalKey: FFAppState().apiKey,
                    fields:
                        '[\"latitude\",\"longitude\",\"address\",\"name\",\"city\",\"country\"]',
                    filters: '[[\"customer_profile\",\"=\",\"${getJsonField(
                      FFAppState().userProfile,
                      r'''$.data.name''',
                    ).toString()}\"]]',
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
                    final listViewMyAddressesResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final myaddresses =
                            (TaskerpageBackendGroup.myAddressesCall
                                        .myAddressList(
                                          listViewMyAddressesResponse.jsonBody,
                                        )
                                        ?.toList() ??
                                    [])
                                .take(4)
                                .toList();
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: myaddresses.length,
                          separatorBuilder: (_, __) => SizedBox(height: 16.0),
                          itemBuilder: (context, myaddressesIndex) {
                            final myaddressesItem =
                                myaddresses[myaddressesIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  FFAppState().updateCreateTaskStruct(
                                    (e) => e
                                      ..taskAddress = TaskAddressStruct(
                                        address: getJsonField(
                                          myaddressesItem,
                                          r'''$.name''',
                                        ).toString(),
                                        fullAddress: getJsonField(
                                          myaddressesItem,
                                          r'''$.address''',
                                        ).toString(),
                                        latitude: getJsonField(
                                          myaddressesItem,
                                          r'''$.latitude''',
                                        ),
                                        longitude: getJsonField(
                                          myaddressesItem,
                                          r'''$.longitude''',
                                        ),
                                        country: getJsonField(
                                          myaddressesItem,
                                          r'''$.country''',
                                        ).toString(),
                                        city: getJsonField(
                                          myaddressesItem,
                                          r'''$.city''',
                                        ).toString(),
                                      ),
                                  );
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: functions.jsonToString(getJsonField(
                                            myaddressesItem,
                                            r'''$.name''',
                                          )) ==
                                          FFAppState()
                                              .createTask
                                              .taskAddress
                                              .address
                                      ? Color(0xFF5450E2)
                                      : Color(0xFFF6F6F6),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: functions.jsonToString(getJsonField(
                                              myaddressesItem,
                                              r'''$.name''',
                                            )) ==
                                            FFAppState()
                                                .createTask
                                                .taskAddress
                                                .address
                                        ? Color(0xFF5450E2)
                                        : Color(0xFFACABAB),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.5, 20.0, 20.5, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (FFAppState()
                                              .DeleteAddressBackGroundColor ==
                                          false)
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                getJsonField(
                                                  myaddressesItem,
                                                  r'''$.address''',
                                                ).toString(),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: functions
                                                                  .jsonToString(
                                                                      getJsonField(
                                                                myaddressesItem,
                                                                r'''$.name''',
                                                              )) ==
                                                              FFAppState()
                                                                  .createTask
                                                                  .taskAddress
                                                                  .address
                                                          ? Color(0xFFF6F6F6)
                                                          : Color(0xFFACABAB),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      if (FFAppState()
                                              .DeleteAddressBackGroundColor ==
                                          true)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 35.0, 0.0, 35.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 16.0, 0.0),
                                                child: Container(
                                                  width: 104.0,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF3D3D3D),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    border: Border.all(
                                                      color: Color(0xFF5450E2),
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
                                                        'Cancel',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              color: Color(
                                                                  0xFFF6F6F6),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 104.0,
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF5450E2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Delete',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFFF6F6F6),
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ).animateOnPageLoad(animationsMap[
                                              'rowOnPageLoadAnimation']!),
                                        ),
                                    ],
                                  ),
                                ),
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
    );
  }
}
