import '/backend/api_requests/api_calls.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
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
import 'skills3_model.dart';
export 'skills3_model.dart';

class Skills3Widget extends StatefulWidget {
  const Skills3Widget({
    Key? key,
    bool? addAnother,
  })  : this.addAnother = addAnother ?? false,
        super(key: key);

  final bool addAnother;

  @override
  _Skills3WidgetState createState() => _Skills3WidgetState();
}

class _Skills3WidgetState extends State<Skills3Widget> {
  late Skills3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Skills3Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.mySkillCategories =
          await TaskerpageBackendGroup.getMySkillCategoriesCall.call(
        apiGlobalKey: FFAppState().apiKey,
        customerProfile: getJsonField(
          FFAppState().userProfile,
          r'''$.data.name''',
        ),
      );
      if ((_model.mySkillCategories?.succeeded ?? true)) {
        setState(() {
          _model.chosenSkillCategory = (TaskerpageBackendGroup
                  .getMySkillCategoriesCall
                  .mySkillCategoryNames(
            (_model.mySkillCategories?.jsonBody ?? ''),
          ) as List)
              .map<String>((s) => s.toString())
              .toList()!
              .map((e) => e.toString())
              .toList()
              .toList()
              .cast<String>();
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.headerModel,
                          updateCallback: () => setState(() {}),
                          child: Hero(
                            tag: 'header',
                            transitionOnUserGestures: true,
                            child: Material(
                              color: Colors.transparent,
                              child: HeaderWidget(
                                openDrawer: () async {
                                  scaffoldKey.currentState!.openEndDrawer();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FutureBuilder<ApiCallResponse>(
                      future: FFAppState().appRoleDetails(
                        uniqueQueryKey:
                            '${FFAppState().apiKey}_${valueOrDefault<String>(
                          getJsonField(
                            FFAppState().userProfile,
                            r'''$.data.role_profile_name''',
                          ).toString(),
                          'End User',
                        )}',
                        requestFn: () =>
                            TaskerpageBackendGroup.readAppRoleCall.call(
                          name: valueOrDefault<String>(
                            getJsonField(
                              FFAppState().userProfile,
                              r'''$.data.role_profile_name''',
                            ).toString(),
                            'End User',
                          ),
                          apiGlobalKey: FFAppState().apiKey,
                        ),
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
                        final columnReadAppRoleResponse = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  44.0, 32.0, 44.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      TaskerpageBackendGroup.readAppRoleCall
                                          .addSkillsText(
                                            columnReadAppRoleResponse.jsonBody,
                                          )
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 38.0, 32.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: TaskerpageBackendGroup
                                          .serviceCategoryListCall
                                          .call(
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
                                        final gridViewServiceCategoryListResponse =
                                            snapshot.data!;
                                        return Builder(
                                          builder: (context) {
                                            final serviceCategories =
                                                TaskerpageBackendGroup
                                                        .serviceCategoryListCall
                                                        .serviceCategoryList(
                                                          gridViewServiceCategoryListResponse
                                                              .jsonBody,
                                                        )
                                                        ?.toList() ??
                                                    [];
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 12.0,
                                                mainAxisSpacing: 6.0,
                                                childAspectRatio: 4.2,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  serviceCategories.length,
                                              itemBuilder: (context,
                                                  serviceCategoriesIndex) {
                                                final serviceCategoriesItem =
                                                    serviceCategories[
                                                        serviceCategoriesIndex];
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    if (_model
                                                        .chosenSkillCategory
                                                        .contains(getJsonField(
                                                      serviceCategoriesItem,
                                                      r'''$.name''',
                                                    ).toString())) {
                                                      setState(() {
                                                        _model
                                                            .removeFromChosenSkillCategory(
                                                                getJsonField(
                                                          serviceCategoriesItem,
                                                          r'''$.name''',
                                                        ).toString());
                                                      });
                                                    } else {
                                                      if (_model
                                                              .chosenSkillCategory
                                                              .length <
                                                          TaskerpageBackendGroup
                                                              .readAppRoleCall
                                                              .skillsLimit(
                                                            columnReadAppRoleResponse
                                                                .jsonBody,
                                                          )) {
                                                        setState(() {
                                                          _model
                                                              .addToChosenSkillCategory(
                                                                  getJsonField(
                                                            serviceCategoriesItem,
                                                            r'''$.name''',
                                                          ).toString());
                                                        });
                                                      } else {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'You can\'t choose more than ${TaskerpageBackendGroup.readAppRoleCall.skillsLimit(
                                                                    columnReadAppRoleResponse
                                                                        .jsonBody,
                                                                  ).toString()} Categories.',
                                                              style: TextStyle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    4000),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                          ),
                                                        );
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                    width: 100.0,
                                                    height: 100.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2.0),
                                                      border: Border.all(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.chosenSkillCategory
                                                                      .contains(
                                                                          getJsonField(
                                                                    serviceCategoriesItem,
                                                                    r'''$.name''',
                                                                  )
                                                                              .toString()) ==
                                                                  true
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primary
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                        ),
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  0.0,
                                                                  15.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            getJsonField(
                                                              serviceCategoriesItem,
                                                              r'''$.name''',
                                                            )
                                                                .toString()
                                                                .maybeHandleOverflow(
                                                                  maxChars: 17,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color:
                                                                      valueOrDefault<
                                                                          Color>(
                                                                    _model.chosenSkillCategory.contains(
                                                                                getJsonField(
                                                                              serviceCategoriesItem,
                                                                              r'''$.name''',
                                                                            )
                                                                                    .toString()) ==
                                                                            true
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .primary
                                                                        : FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                  ),
                                                                  fontSize:
                                                                      12.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
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
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x33000000),
                          offset: Offset(5.0, 5.0),
                          spreadRadius: 10.0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (!widget.addAnother)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('Contactdata-1');
                                  },
                                  child: Text(
                                    'I\'ll do it later',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF8A8A8A),
                                          fontSize: 14.0,
                                        ),
                                  ),
                                ),
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (_model.chosenSkillCategory.length > 0) {
                                _model.syncedSkills =
                                    await TaskerpageBackendGroup
                                        .syncSkillCategoriesCall
                                        .call(
                                  newSkillsList:
                                      functions.convertListOfStringToString(
                                          _model.chosenSkillCategory.toList()),
                                  customerProfileName: getJsonField(
                                    FFAppState().userProfile,
                                    r'''$.data.name''',
                                  ),
                                  apiGlobalKey: FFAppState().apiKey,
                                );
                                if ((_model.syncedSkills?.succeeded ?? true)) {
                                  context.pushNamed(
                                    'Skills-4',
                                    queryParameters: {
                                      'addAnother': serializeParam(
                                        widget.addAnother ? true : false,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'there was a problem syncing your skill categories',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 4000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                    ),
                                  );
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'You must choose at least one',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              }

                              setState(() {});
                            },
                            child: Container(
                              width: 104.0,
                              height: 36.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(1.0),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Save',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
