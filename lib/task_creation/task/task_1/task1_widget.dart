import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/selectable_container_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'task1_model.dart';
export 'task1_model.dart';

class Task1Widget extends StatefulWidget {
  const Task1Widget({
    Key? key,
    this.id,
  }) : super(key: key);

  final String? id;

  @override
  _Task1WidgetState createState() => _Task1WidgetState();
}

class _Task1WidgetState extends State<Task1Widget> {
  late Task1Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Task1Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.id != null && widget.id != '') {
        _model.apiResulture = await TaskerpageBackendGroup.postReadCall.call(
          id: widget.id,
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.apiResulture?.succeeded ?? true)) {
          setState(() {
            FFAppState().updateCreateTaskStruct(
              (e) => e
                ..skillCategory = getJsonField(
                  (_model.apiResulture?.jsonBody ?? ''),
                  r'''$.data.skill_category_name''',
                ).toString().toString(),
            );
          });
        } else {
          return;
        }
      } else {
        setState(() {
          FFAppState().createTask = CreateTaskStruct();
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
        drawer: Container(
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: WebViewAware(
              child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.navigationBarModel,
              updateCallback: () => setState(() {}),
              child: NavigationBarWidget(
                currentPage: 'task',
                postId: widget.id,
                closeDrawer: () async {
                  if (scaffoldKey.currentState!.isDrawerOpen ||
                      scaffoldKey.currentState!.isEndDrawerOpen) {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
          )),
        ),
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
                          child: HeaderWidget(
                            openDrawer: () async {
                              scaffoldKey.currentState!.openEndDrawer();
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          wrapWithModel(
                            model: _model.taskcreationMenueModel,
                            updateCallback: () => setState(() {}),
                            child: TaskcreationMenueWidget(
                              openDrawer: () async {
                                scaffoldKey.currentState!.openDrawer();
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Select your task',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(32.0, 38.0, 32.0, 0.0),
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
                                        color: FlutterFlowTheme.of(context)
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
                                      itemCount: serviceCategories.length,
                                      itemBuilder:
                                          (context, serviceCategoriesIndex) {
                                        final serviceCategoriesItem =
                                            serviceCategories[
                                                serviceCategoriesIndex];
                                        return wrapWithModel(
                                          model: _model
                                              .selectableContainerModels
                                              .getModel(
                                            getJsonField(
                                              serviceCategoriesItem,
                                              r'''$.name''',
                                            ).toString(),
                                            serviceCategoriesIndex,
                                          ),
                                          updateCallback: () => setState(() {}),
                                          child: SelectableContainerWidget(
                                            key: Key(
                                              'Key9de_${getJsonField(
                                                serviceCategoriesItem,
                                                r'''$.name''',
                                              ).toString()}',
                                            ),
                                            parameter1: getJsonField(
                                              serviceCategoriesItem,
                                              r'''$.name''',
                                            ),
                                            selected: FFAppState()
                                                    .createTask
                                                    .skillCategory ==
                                                getJsonField(
                                                  serviceCategoriesItem,
                                                  r'''$.name''',
                                                ),
                                            text: getJsonField(
                                              serviceCategoriesItem,
                                              r'''$.name''',
                                            ).toString(),
                                            action: () async {
                                              if (FFAppState()
                                                      .createTask
                                                      .skillCategory ==
                                                  getJsonField(
                                                    serviceCategoriesItem,
                                                    r'''$.name''',
                                                  )) {
                                                setState(() {
                                                  FFAppState()
                                                      .updateCreateTaskStruct(
                                                    (e) =>
                                                        e..skillCategory = null,
                                                  );
                                                });
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .updateCreateTaskStruct(
                                                    (e) => e
                                                      ..skillCategory =
                                                          getJsonField(
                                                        serviceCategoriesItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                  );
                                                });
                                              }
                                            },
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              var _shouldSetState = false;
                              if ((FFAppState().createTask.skillCategory !=
                                          null &&
                                      FFAppState().createTask.skillCategory !=
                                          '') &&
                                  (widget.id == null || widget.id == '')) {
                                _model.create = await TaskerpageBackendGroup
                                    .taskCreationSkillCategoryCall
                                    .call(
                                  skillCategoryName:
                                      FFAppState().createTask.skillCategory,
                                  apiGlobalKey: FFAppState().apiKey,
                                  poster: getJsonField(
                                    FFAppState().userProfile,
                                    r'''$.data.name''',
                                  ).toString(),
                                );
                                _shouldSetState = true;
                                if ((_model.create?.succeeded ?? true)) {
                                  context.pushNamed(
                                    'Task-2',
                                    queryParameters: {
                                      'id': serializeParam(
                                        getJsonField(
                                          (_model.create?.jsonBody ?? ''),
                                          r'''$.data.name''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              } else if (widget.id != null && widget.id != '') {
                                _model.apiResultggw =
                                    await TaskerpageBackendGroup
                                        .updateSkillCategoryInTaskCall
                                        .call(
                                  id: widget.id,
                                  skillCategoryName:
                                      FFAppState().createTask.skillCategory,
                                  apiGlobalKey: FFAppState().apiKey,
                                );
                                _shouldSetState = true;
                                if ((_model.apiResultggw?.succeeded ?? true)) {
                                  context.pushNamed(
                                    'Task-2',
                                    queryParameters: {
                                      'id': serializeParam(
                                        getJsonField(
                                          (_model.apiResultggw?.jsonBody ?? ''),
                                          r'''$.data.name''',
                                        ).toString(),
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                } else {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                        child: AlertDialog(
                                      title: Text('Notice'),
                                      content:
                                          Text('you must choose one category'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    ));
                                  },
                                );
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.buttonNextModel,
                              updateCallback: () => setState(() {}),
                              child: ButtonNextWidget(
                                text: 'Next',
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
