import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/drope_down_languages_widget.dart';
import '/components/emty_container_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/components/skill_options_check_component_widget.dart';
import '/components/skill_options_chips_component_widget.dart';
import '/components/taskcreation_menue_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'task2_model.dart';
export 'task2_model.dart';

class Task2Widget extends StatefulWidget {
  const Task2Widget({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String? id;

  @override
  _Task2WidgetState createState() => _Task2WidgetState();
}

class _Task2WidgetState extends State<Task2Widget> {
  late Task2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Task2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().showOptions = false;
      });
      if (widget.id == null || widget.id == '') {
        context.pushNamed('Task-1');
      } else {
        _model.apiResultpuo = await TaskerpageBackendGroup.postReadCall.call(
          id: widget.id,
          apiGlobalKey: FFAppState().apiKey,
        );
        if ((_model.apiResultpuo?.succeeded ?? true)) {
          setState(() {
            FFAppState().updateCreateTaskStruct(
              (e) => e
                ..updateTaskDeatels(
                  (e) => e
                    ..skillName = getJsonField(
                      (_model.apiResultpuo?.jsonBody ?? ''),
                      r'''$.data.skill_name''',
                    ).toString().toString()
                    ..skillLevel = getJsonField(
                      (_model.apiResultpuo?.jsonBody ?? ''),
                      r'''$.data.skill_level''',
                    ).toString().toString()
                    ..languages = (getJsonField(
                      (_model.apiResultpuo?.jsonBody ?? ''),
                      r'''$.data.languages''',
                      true,
                    ) as List)
                        .map<String>((s) => s.toString())
                        .toList()!
                        .toList()
                    ..description = getJsonField(
                      (_model.apiResultpuo?.jsonBody ?? ''),
                      r'''$.data.description''',
                    ).toString().toString()
                    ..file = getJsonField(
                      (_model.apiResultpuo?.jsonBody ?? ''),
                      r'''$.data.file''',
                    ).toString().toString()
                    ..isOnline = getJsonField(
                      (_model.apiResultpuo?.jsonBody ?? ''),
                      r'''$.data.is_online''',
                    ),
                )
                ..skillCategory = getJsonField(
                  (_model.apiResultpuo?.jsonBody ?? ''),
                  r'''$.data.skill_category_name''',
                ).toString().toString()
                ..taskOptions = functions
                    .convertJsonListToDataTypeList(getJsonField(
                      (_model.apiResultpuo?.jsonBody ?? ''),
                      r'''$.data.options''',
                      true,
                    ))!
                    .toList(),
            );
          });
        } else {
          return;
        }
      }
    });

    _model.textController ??= TextEditingController(
        text: FFAppState().createTask.taskDeatels.description);
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 20.0, 32.0, 0.0),
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
                                FFAppState().createTask.skillCategory,
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
                      Divider(
                        height: 48.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Skills',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FutureBuilder<ApiCallResponse>(
                                future:
                                    TaskerpageBackendGroup.getServicesCall.call(
                                  category:
                                      '[[\"skill_category_name\",\"=\",\"${FFAppState().createTask.skillCategory}\"]]',
                                  apiGlobalKey: FFAppState().apiKey,
                                  fields: '[\"skill_name\",\"name\"]',
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
                                  final gridViewGetServicesResponse =
                                      snapshot.data!;
                                  return Builder(
                                    builder: (context) {
                                      final services =
                                          TaskerpageBackendGroup.getServicesCall
                                                  .servicesList(
                                                    gridViewGetServicesResponse
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
                                        itemCount: services.length,
                                        itemBuilder: (context, servicesIndex) {
                                          final servicesItem =
                                              services[servicesIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().showOptions = true;
                                              });
                                              if (FFAppState()
                                                      .createTask
                                                      .taskDeatels
                                                      .skillName ==
                                                  getJsonField(
                                                    servicesItem,
                                                    r'''$.name''',
                                                  )) {
                                                setState(() {
                                                  FFAppState()
                                                      .updateCreateTaskStruct(
                                                    (e) => e
                                                      ..updateTaskDeatels(
                                                        (e) =>
                                                            e..skillName = null,
                                                      ),
                                                  );
                                                });
                                              } else {
                                                setState(() {
                                                  FFAppState()
                                                      .updateCreateTaskStruct(
                                                    (e) => e
                                                      ..updateTaskDeatels(
                                                        (e) => e
                                                          ..skillName =
                                                              getJsonField(
                                                            servicesItem,
                                                            r'''$.name''',
                                                          ).toString(),
                                                      ),
                                                  );
                                                });
                                                _model.skillDetails =
                                                    await TaskerpageBackendGroup
                                                        .skillDetailsCall
                                                        .call(
                                                  name: getJsonField(
                                                    servicesItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  apiGlobalKey:
                                                      FFAppState().apiKey,
                                                );
                                                if ((_model.skillDetails
                                                        ?.succeeded ??
                                                    true)) {
                                                  setState(() {
                                                    _model.skillOptionList =
                                                        functions
                                                            .convertJsonListToDataTypeList(
                                                                getJsonField(
                                                              (_model.skillDetails
                                                                      ?.jsonBody ??
                                                                  ''),
                                                              r'''$.data.skill_options''',
                                                              true,
                                                            ))!
                                                            .toList()
                                                            .cast<
                                                                SkillOptionsStruct>();
                                                  });
                                                }
                                              }

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                                border: Border.all(
                                                  color: FFAppState()
                                                              .createTask
                                                              .taskDeatels
                                                              .skillName ==
                                                          getJsonField(
                                                            servicesItem,
                                                            r'''$.name''',
                                                          )
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                  width: 1.3,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        servicesItem,
                                                        r'''$.skill_name''',
                                                      )
                                                          .toString()
                                                          .maybeHandleOverflow(
                                                            maxChars: 17,
                                                            replacement: '…',
                                                          ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: FFAppState()
                                                                        .createTask
                                                                        .taskDeatels
                                                                        .skillName ==
                                                                    getJsonField(
                                                                      servicesItem,
                                                                      r'''$.name''',
                                                                    )
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                      Divider(
                        height: 48.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Skills Level',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            90.0, 10.0, 90.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final skillLevel =
                                functions.returnSkillLevelEnums().toList();
                            return ListView.separated(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: skillLevel.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, skillLevelIndex) {
                                final skillLevelItem =
                                    skillLevel[skillLevelIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().updateCreateTaskStruct(
                                        (e) => e
                                          ..updateTaskDeatels(
                                            (e) =>
                                                e..skillLevel = skillLevelItem,
                                          ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    width: 230.0,
                                    height: 36.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(2.0),
                                      border: Border.all(
                                        color: FFAppState()
                                                    .createTask
                                                    .taskDeatels
                                                    .skillLevel ==
                                                skillLevelItem
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondary,
                                        width: 1.3,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          skillLevelItem,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: FFAppState()
                                                            .createTask
                                                            .taskDeatels
                                                            .skillLevel ==
                                                        skillLevelItem
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      if (FFAppState().showOptions == true)
                        Divider(
                          height: 48.0,
                          thickness: 1.0,
                          indent: 32.0,
                          endIndent: 32.0,
                          color: Color(0xFFE3E3E3),
                        ),
                      if (FFAppState().showOptions == true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Skills option',
                                textAlign: TextAlign.justify,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      if (FFAppState().showOptions == true)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 10.0, 32.0, 8.0),
                                    child: Builder(
                                      builder: (context) {
                                        final skillOptions = getJsonField(
                                          (_model.skillDetails?.jsonBody ?? ''),
                                          r'''$.data.skill_options''',
                                        ).toList();
                                        if (skillOptions.isEmpty) {
                                          return EmtyContainerWidget(
                                            goTo: () async {},
                                          );
                                        }
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children:
                                              List.generate(skillOptions.length,
                                                  (skillOptionsIndex) {
                                            final skillOptionsItem =
                                                skillOptions[skillOptionsIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (functions.jsonToString(
                                                        getJsonField(
                                                      skillOptionsItem,
                                                      r'''$.type''',
                                                    )) ==
                                                    'Check')
                                                  Expanded(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .skillOptionsCheckComponentModels
                                                          .getModel(
                                                        getJsonField(
                                                          skillOptionsItem,
                                                          r'''$.option_name''',
                                                        ).toString(),
                                                        skillOptionsIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      updateOnChange: true,
                                                      child:
                                                          SkillOptionsCheckComponentWidget(
                                                        key: Key(
                                                          'Keycwk_${getJsonField(
                                                            skillOptionsItem,
                                                            r'''$.option_name''',
                                                          ).toString()}',
                                                        ),
                                                        skillOption:
                                                            SkillOptionsStruct
                                                                .fromMap(
                                                                    getJsonField(
                                                          skillOptionsItem,
                                                          r'''$''',
                                                        )),
                                                        defaultValue: FFAppState()
                                                                    .createTask
                                                                    .taskOptions[
                                                                        skillOptionsIndex]
                                                                    .values ==
                                                                'true'
                                                            ? true
                                                            : false,
                                                      ),
                                                    ),
                                                  ),
                                                if (functions.jsonToString(
                                                        getJsonField(
                                                      skillOptionsItem,
                                                      r'''$.type''',
                                                    )) ==
                                                    'Select')
                                                  Expanded(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .skillOptionsChipsComponentModels
                                                          .getModel(
                                                        getJsonField(
                                                          skillOptionsItem,
                                                          r'''$.option_name''',
                                                        ).toString(),
                                                        skillOptionsIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child:
                                                          SkillOptionsChipsComponentWidget(
                                                        key: Key(
                                                          'Keyl0u_${getJsonField(
                                                            skillOptionsItem,
                                                            r'''$.option_name''',
                                                          ).toString()}',
                                                        ),
                                                        skillOption:
                                                            SkillOptionsStruct
                                                                .fromMap(
                                                                    getJsonField(
                                                          skillOptionsItem,
                                                          r'''$''',
                                                        )),
                                                        selectedChips: '',
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      Divider(
                        height: 20.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Online Task',
                                    textAlign: TextAlign.justify,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF292929),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Switch.adaptive(
                                      value: _model.switchValue1 ??=
                                          FFAppState()
                                              .createTask
                                              .taskDeatels
                                              .isOnline,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.switchValue1 = newValue!);
                                        if (newValue!) {
                                          setState(() {
                                            FFAppState().updateCreateTaskStruct(
                                              (e) => e
                                                ..updateTaskDeatels(
                                                  (e) => e..isOnline = true,
                                                ),
                                            );
                                          });
                                        } else {
                                          setState(() {
                                            FFAppState().updateCreateTaskStruct(
                                              (e) => e
                                                ..updateTaskDeatels(
                                                  (e) => e..isOnline = false,
                                                ),
                                            );
                                          });
                                        }
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      activeTrackColor: Color(0xFFFAD1C6),
                                      inactiveTrackColor: Color(0xFFECECEC),
                                      inactiveThumbColor: Color(0xFF3D3D3D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 20.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      if (false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Brings own tools',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF3D3D3D),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Switch.adaptive(
                                  value: _model.switchValue2 ??= true,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue2 = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        FFAppState().updateTaskCreationStruct(
                                          (e) => e,
                                        );
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState()
                                            .updateUserInformationStruct(
                                          (e) => e..skillBringsowntools = false,
                                        );
                                      });
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor: Color(0xFFFAD1C6),
                                  inactiveTrackColor: Color(0xFFECECEC),
                                  inactiveThumbColor: Color(0xFF3D3D3D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (false)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 10.0, 32.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Buys material',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF3D3D3D),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Switch.adaptive(
                                  value: _model.switchValue3 ??= true,
                                  onChanged: (newValue) async {
                                    setState(
                                        () => _model.switchValue3 = newValue!);
                                    if (newValue!) {
                                      setState(() {
                                        FFAppState()
                                            .updateUserInformationStruct(
                                          (e) => e..skillBuysmaterial = true,
                                        );
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState()
                                            .updateUserInformationStruct(
                                          (e) => e..skillBuysmaterial = false,
                                        );
                                      });
                                    }
                                  },
                                  activeColor:
                                      FlutterFlowTheme.of(context).primary,
                                  activeTrackColor: Color(0xFFFAD1C6),
                                  inactiveTrackColor: Color(0xFFECECEC),
                                  inactiveThumbColor: Color(0xFF3D3D3D),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (false)
                        Divider(
                          height: 48.0,
                          thickness: 1.0,
                          indent: 32.0,
                          endIndent: 32.0,
                          color: Color(0xFFE3E3E3),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 8.0, 32.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Languages',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.dropeDownLanguagesModel,
                                updateCallback: () => setState(() {}),
                                child: DropeDownLanguagesWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 48.0,
                        thickness: 1.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFE3E3E3),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Description',
                              textAlign: TextAlign.justify,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                textInputAction: TextInputAction.done,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintText: 'Type Your Describtion ...',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF3D3D3D),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE8083F),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFE8083F),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF212121),
                                      fontSize: 14.0,
                                    ),
                                maxLines: 10,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 10.0, 32.0, 37.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                final selectedFiles = await selectFiles(
                                  multiFile: false,
                                );
                                if (selectedFiles != null) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  try {
                                    selectedUploadedFiles = selectedFiles
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                            ))
                                        .toList();
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                      selectedFiles.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                    });
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                }

                                _model.apiResultekx34 =
                                    await TaskerpageBackendGroup.uploadCall
                                        .call(
                                  file: _model.uploadedLocalFile,
                                  apiGlobalKey: FFAppState().apiKey,
                                );
                                if ((_model.apiResultekx34?.succeeded ??
                                    true)) {
                                  setState(() {
                                    FFAppState().updateCreateTaskStruct(
                                      (e) => e
                                        ..updateTaskDeatels(
                                          (e) => e
                                            ..file = getJsonField(
                                              (_model.apiResultekx34
                                                      ?.jsonBody ??
                                                  ''),
                                              r'''$.message.file_url''',
                                            ).toString(),
                                        ),
                                    );
                                  });
                                } else {
                                  await showDialog(
                                    context: context,
                                    builder: (alertDialogContext) {
                                      return WebViewAware(
                                          child: AlertDialog(
                                        title: Text('Not Done'),
                                        content: Text('Not Done'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
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
                              child: Container(
                                width: 120.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.cloud_upload_outlined,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 18.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Upload File',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(FFAppState()
                                          .createTask
                                          .taskDeatels
                                          .hasFile()
                                      ? '${FFAppState().baseUrl}${FFAppState().createTask.taskDeatels.file}'
                                      : ' ');
                                },
                                child: Text(
                                  FFAppState().createTask.taskDeatels.hasFile()
                                      ? '${FFAppState().baseUrl}${FFAppState().createTask.taskDeatels.file}'
                                      : ' '.maybeHandleOverflow(
                                          maxChars: 20,
                                          replacement: '…',
                                        ),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF494949),
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Icon(
                                          Icons.arrow_back_ios_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          size: 10.0,
                                        ),
                                      ),
                                      Text(
                                        'Back',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              fontSize: 14.0,
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
                                      var _shouldSetState = false;
                                      _model.skillOptionList = functions
                                          .convertJsonListToDataTypeList(
                                              getJsonField(
                                            (_model.skillDetails?.jsonBody ??
                                                ''),
                                            r'''$.data.skill_options''',
                                            true,
                                          ))!
                                          .toList()
                                          .cast<SkillOptionsStruct>();
                                      _model.tempSkillOptionList = [];
                                      while (
                                          _model.skillOptionList.length > 0) {
                                        if (_model.skillOptionList.first.type ==
                                            'Check') {
                                          _model.addToTempSkillOptionList(
                                              SkillOptionsStruct(
                                            name: _model
                                                .skillOptionList.first.name,
                                            type: _model
                                                .skillOptionList.first.type,
                                            values: _model
                                                    .skillOptionsCheckComponentModels
                                                    .getValueForKey(
                                              _model.skillOptionList.first
                                                  .optionName,
                                              (m) => m.switchValue,
                                            )!
                                                ? 'true'
                                                : 'false',
                                          ));
                                        } else {
                                          setState(() {
                                            _model.addToTempSkillOptionList(
                                                SkillOptionsStruct(
                                              name: _model
                                                  .skillOptionList.first.name,
                                              type: _model
                                                  .skillOptionList.first.type,
                                              values: functions
                                                  .convertListOfStringToString(
                                                      _model
                                                          .skillOptionsChipsComponentModels
                                                          .getValueForKey(
                                                            _model
                                                                .skillOptionList
                                                                .first
                                                                .optionName,
                                                            (m) => m
                                                                .choiceChipsValues,
                                                          )
                                                          ?.toList()),
                                            ));
                                          });
                                        }

                                        setState(() {
                                          _model
                                              .removeAtIndexFromSkillOptionList(
                                                  0);
                                        });
                                      }
                                      setState(() {
                                        FFAppState().updateCreateTaskStruct(
                                          (e) => e
                                            ..updateTaskDeatels(
                                              (e) => e
                                                ..description =
                                                    _model.textController.text
                                                ..languages = FFAppState()
                                                    .LanguagesListForDropDown
                                                    .toList(),
                                            )
                                            ..taskOptions = _model
                                                .tempSkillOptionList
                                                .toList(),
                                        );
                                      });
                                      _model.updatedTask =
                                          await TaskerpageBackendGroup
                                              .updateTaskDetailsCall
                                              .call(
                                        id: widget.id,
                                        skillName: FFAppState()
                                            .createTask
                                            .taskDeatels
                                            .skillName,
                                        skillLevel: FFAppState()
                                            .createTask
                                            .taskDeatels
                                            .skillLevel,
                                        languages: functions
                                            .convertListOfStringToString(
                                                FFAppState()
                                                    .createTask
                                                    .taskDeatels
                                                    .languages
                                                    .toList()),
                                        description: FFAppState()
                                            .createTask
                                            .taskDeatels
                                            .description,
                                        file: FFAppState()
                                            .createTask
                                            .taskDeatels
                                            .file,
                                        apiGlobalKey: FFAppState().apiKey,
                                        isOnline: functions.booltoInt(
                                            FFAppState()
                                                .createTask
                                                .taskDeatels
                                                .isOnline),
                                        optionsJson: functions
                                            .convertDataTypeListToJsonList(
                                                FFAppState()
                                                    .createTask
                                                    .taskOptions
                                                    .toList()),
                                      );
                                      _shouldSetState = true;
                                      if ((_model.updatedTask?.succeeded ??
                                          true)) {
                                        context.pushNamed(
                                          'Select_Address',
                                          queryParameters: {
                                            'id': serializeParam(
                                              widget.id,
                                              ParamType.String,
                                            ),
                                          }.withoutNulls,
                                        );
                                      } else {
                                        if (_shouldSetState) setState(() {});
                                        return;
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
            ],
          ),
        ),
      ),
    );
  }
}
