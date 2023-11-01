import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skills4_model.dart';
export 'skills4_model.dart';

class Skills4Widget extends StatefulWidget {
  const Skills4Widget({
    Key? key,
    bool? addAnother,
  })  : this.addAnother = addAnother ?? false,
        super(key: key);

  final bool addAnother;

  @override
  _Skills4WidgetState createState() => _Skills4WidgetState();
}

class _Skills4WidgetState extends State<Skills4Widget> {
  late Skills4Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Skills4Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultfko =
          await TaskerpageBackendGroup.customerProfileSkillsListCall.call(
        filters: '[[\"customer_profile\",\"=\",\"${getJsonField(
          FFAppState().userProfile,
          r'''$.data.name''',
        ).toString().toString()}\"]]',
        fields: '[\"*\"]',
      );
      if ((_model.apiResultfko?.succeeded ?? true)) {
        _model.customerProfileSkills = functions
            .listJsonToUserServiceStruct(
                TaskerpageBackendGroup.customerProfileSkillsListCall
                    .myServices(
                      (_model.apiResultfko?.jsonBody ?? ''),
                    )!
                    .toList())
            .toList()
            .cast<UserServiceStruct>();
        _model.selectedCategoryIndex = _model.selectedCategoryIndex != null
            ? _model.selectedCategoryIndex
            : 0;
        setState(() {
          _model.selectedServiceCategory = _model
              .customerProfileSkills[_model.selectedCategoryIndex!]
              .skillCategoryName;
          _model.selectedCustomerProfile =
              TaskerpageBackendGroup.customerProfileSkillsListCall.myServices(
            (_model.apiResultfko?.jsonBody ?? ''),
          )[_model.selectedCategoryIndex!];
        });
      } else {
        context.pushNamed(
          'Skills-3',
          queryParameters: {
            'addAnother': serializeParam(
              false,
              ParamType.bool,
            ),
          }.withoutNulls,
        );
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
          child: FutureBuilder<ApiCallResponse>(
            future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                  ..complete(
                      TaskerpageBackendGroup.customerProfileSkillsListCall.call(
                    filters: '[[\"customer_profile\",\"=\",\"${getJsonField(
                      FFAppState().userProfile,
                      r'''$.data.name''',
                    ).toString()}\"]]',
                    fields: '[\"*\"]',
                    apiGlobalKey: FFAppState().apiKey,
                  )))
                .future,
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
              final columnCustomerProfileSkillsListResponse = snapshot.data!;
              return Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 32.0, 15.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Click on each skill and add more info',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        90.0, 30.0, 90.0, 2.0),
                                    child: Builder(
                                      builder: (context) {
                                        final serviceCategoryIds =
                                            TaskerpageBackendGroup
                                                    .customerProfileSkillsListCall
                                                    .myServices(
                                                      columnCustomerProfileSkillsListResponse
                                                          .jsonBody,
                                                    )
                                                    ?.toList() ??
                                                [];
                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: serviceCategoryIds.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 6.0),
                                          itemBuilder: (context,
                                              serviceCategoryIdsIndex) {
                                            final serviceCategoryIdsItem =
                                                serviceCategoryIds[
                                                    serviceCategoryIdsIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.skillDetails =
                                                    await TaskerpageBackendGroup
                                                        .getCustomerProfileSkillsDetailsCall
                                                        .call(
                                                  name: getJsonField(
                                                    serviceCategoryIdsItem,
                                                    r'''$.name''',
                                                  ).toString(),
                                                  apiGlobalKey:
                                                      FFAppState().apiKey,
                                                );
                                                setState(() {
                                                  _model.selectedServiceCategory =
                                                      getJsonField(
                                                    serviceCategoryIdsItem,
                                                    r'''$.skill_category_name''',
                                                  ).toString();
                                                  _model.selectedCategoryIndex =
                                                      serviceCategoryIdsIndex;
                                                  _model.selectedCustomerProfile =
                                                      getJsonField(
                                                    (_model.skillDetails
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.data''',
                                                  );
                                                  _model
                                                      .updateCustomerProfileSkillsAtIndex(
                                                    serviceCategoryIdsIndex,
                                                    (_) => functions
                                                        .jsonToUserServiceStruct(
                                                            getJsonField(
                                                      (_model.skillDetails
                                                              ?.jsonBody ??
                                                          ''),
                                                      r'''$.data''',
                                                    )),
                                                  );
                                                });

                                                setState(() {});
                                              },
                                              child: Container(
                                                width: 160.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: _model
                                                              .selectedServiceCategory ==
                                                          getJsonField(
                                                            serviceCategoryIdsItem,
                                                            r'''$.skill_category_name''',
                                                          )
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(0.0, 2.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                  border: Border.all(
                                                    color: _model
                                                                .selectedServiceCategory ==
                                                            getJsonField(
                                                              serviceCategoryIdsItem,
                                                              r'''$.skill_category_name''',
                                                            )
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : Colors.white,
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      getJsonField(
                                                        serviceCategoryIdsItem,
                                                        r'''$.skill_category_name''',
                                                      ).toString(),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: _model
                                                                        .selectedServiceCategory ==
                                                                    getJsonField(
                                                                      serviceCategoryIdsItem,
                                                                      r'''$.skill_category_name''',
                                                                    )
                                                                ? Colors.white
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.w500,
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
                                ],
                              ),
                            ],
                          ),
                          Divider(
                            height: 36.0,
                            thickness: 1.0,
                            indent: 32.0,
                            endIndent: 32.0,
                            color: Color(0xFFE3E3E3),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 32.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Skills',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF292929),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          if (_model.selectedServiceCategory != null &&
                              _model.selectedServiceCategory != '')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 2.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 32.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: TaskerpageBackendGroup
                                                .getServicesCall
                                                .call(
                                              category:
                                                  '[[\"skill_category_name\",\"=\",\"${_model.selectedServiceCategory}\"]]',
                                              fields:
                                                  '[\"name\",\"skill_name\",\"skill_category_name\"]',
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final gridViewGetServicesResponse =
                                                  snapshot.data!;
                                              return Builder(
                                                builder: (context) {
                                                  final skills =
                                                      TaskerpageBackendGroup
                                                              .getServicesCall
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
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: skills.length,
                                                    itemBuilder:
                                                        (context, skillsIndex) {
                                                      final skillsItem =
                                                          skills[skillsIndex];
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
                                                                  .customerProfileSkills[
                                                                      _model
                                                                          .selectedCategoryIndex!]
                                                                  .skills
                                                                  .where((e) =>
                                                                      e.skill ==
                                                                      getJsonField(
                                                                        skillsItem,
                                                                        r'''$.name''',
                                                                      ))
                                                                  .toList()
                                                                  .length >
                                                              0) {
                                                            setState(() {
                                                              _model
                                                                  .updateCustomerProfileSkillsAtIndex(
                                                                _model
                                                                    .selectedCategoryIndex!,
                                                                (e) => e
                                                                  ..updateSkills(
                                                                    (e) => e.remove(
                                                                        SkillStruct(
                                                                      skill:
                                                                          getJsonField(
                                                                        skillsItem,
                                                                        r'''$.name''',
                                                                      ).toString(),
                                                                      skillName:
                                                                          getJsonField(
                                                                        skillsItem,
                                                                        r'''$.skill_name''',
                                                                      ).toString(),
                                                                    )),
                                                                  ),
                                                              );
                                                            });
                                                            _model.deletedSkill =
                                                                await TaskerpageBackendGroup
                                                                    .deleteSkillsCall
                                                                    .call(
                                                              skill:
                                                                  getJsonField(
                                                                skillsItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              customerProfileSkill:
                                                                  getJsonField(
                                                                _model
                                                                    .selectedCustomerProfile,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              apiGlobalKey:
                                                                  FFAppState()
                                                                      .apiKey,
                                                            );
                                                          } else {
                                                            setState(() {
                                                              _model
                                                                  .updateCustomerProfileSkillsAtIndex(
                                                                _model
                                                                    .selectedCategoryIndex!,
                                                                (e) => e
                                                                  ..updateSkills(
                                                                    (e) => e.add(
                                                                        SkillStruct(
                                                                      skill:
                                                                          getJsonField(
                                                                        skillsItem,
                                                                        r'''$.name''',
                                                                      ).toString(),
                                                                      skillName:
                                                                          getJsonField(
                                                                        skillsItem,
                                                                        r'''$.skill_name''',
                                                                      ).toString(),
                                                                    )),
                                                                  ),
                                                              );
                                                            });
                                                            _model.apiResultcsw =
                                                                await TaskerpageBackendGroup
                                                                    .updateSkillsCall
                                                                    .call(
                                                              skill:
                                                                  getJsonField(
                                                                skillsItem,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              customerProfileSkill:
                                                                  getJsonField(
                                                                _model
                                                                    .selectedCustomerProfile,
                                                                r'''$.name''',
                                                              ).toString(),
                                                              apiGlobalKey:
                                                                  FFAppState()
                                                                      .apiKey,
                                                            );
                                                          }

                                                          setState(() => _model
                                                                  .apiRequestCompleter =
                                                              null);

                                                          setState(() {});
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 36.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.0),
                                                            border: Border.all(
                                                              color: _model
                                                                          .customerProfileSkills[_model
                                                                              .selectedCategoryIndex!]
                                                                          .skills
                                                                          .where(
                                                                              (e) =>
                                                                                  e
                                                                                      .skill ==
                                                                                  getJsonField(
                                                                                    skillsItem,
                                                                                    r'''$.name''',
                                                                                  ))
                                                                          .toList()
                                                                          .length >
                                                                      0
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              width: 1.0,
                                                            ),
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
                                                                getJsonField(
                                                                  skillsItem,
                                                                  r'''$.skill_name''',
                                                                )
                                                                    .toString()
                                                                    .maybeHandleOverflow(
                                                                      maxChars:
                                                                          19,
                                                                      replacement:
                                                                          '…',
                                                                    ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: _model.customerProfileSkills[_model.selectedCategoryIndex!].skills
                                                                                  .where((e) =>
                                                                                      e.skill ==
                                                                                      getJsonField(
                                                                                        skillsItem,
                                                                                        r'''$.name''',
                                                                                      ))
                                                                                  .toList()
                                                                                  .length >
                                                                              0
                                                                          ? FlutterFlowTheme.of(context).primary
                                                                          : FlutterFlowTheme.of(context).secondary,
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                              ),
                                                            ],
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
                              ),
                            ),
                          Divider(
                            height: 36.0,
                            thickness: 1.0,
                            indent: 32.0,
                            endIndent: 32.0,
                            color: Color(0xFFE3E3E3),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                32.0, 0.0, 32.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Skill Level',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF292929),
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                79.5, 0.0, 79.5, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          final skillLevels = functions
                                              .returnSkillLevelEnums()
                                              .toList();
                                          return ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: skillLevels.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 6.0),
                                            itemBuilder:
                                                (context, skillLevelsIndex) {
                                              final skillLevelsItem =
                                                  skillLevels[skillLevelsIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model
                                                          .customerProfileSkills[
                                                              _model
                                                                  .selectedCategoryIndex!]
                                                          .skillLevel ==
                                                      skillLevelsItem) {
                                                    setState(() {
                                                      _model
                                                          .updateCustomerProfileSkillsAtIndex(
                                                        _model
                                                            .selectedCategoryIndex!,
                                                        (e) =>
                                                            e..skillLevel = '',
                                                      );
                                                    });
                                                    _model.apiResultj09 =
                                                        await TaskerpageBackendGroup
                                                            .updateCustomerProfileSkillLevelCall
                                                            .call(
                                                      name: getJsonField(
                                                        _model
                                                            .selectedCustomerProfile,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      skillLevel: '',
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    );
                                                  } else {
                                                    setState(() {
                                                      _model
                                                          .updateCustomerProfileSkillsAtIndex(
                                                        _model
                                                            .selectedCategoryIndex!,
                                                        (e) => e
                                                          ..skillLevel =
                                                              skillLevelsItem,
                                                      );
                                                    });
                                                    _model.apiResultj091 =
                                                        await TaskerpageBackendGroup
                                                            .updateCustomerProfileSkillLevelCall
                                                            .call(
                                                      name: getJsonField(
                                                        _model
                                                            .selectedCustomerProfile,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      skillLevel:
                                                          skillLevelsItem,
                                                      apiGlobalKey:
                                                          FFAppState().apiKey,
                                                    );
                                                  }

                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: 50.0,
                                                  height: 36.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2.0),
                                                    border: Border.all(
                                                      color: _model
                                                                  .customerProfileSkills[
                                                                      _model
                                                                          .selectedCategoryIndex!]
                                                                  .skillLevel ==
                                                              skillLevelsItem
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      width: 1.0,
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
                                                        skillLevelsItem,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              color: _model
                                                                          .customerProfileSkills[_model
                                                                              .selectedCategoryIndex!]
                                                                          .skillLevel ==
                                                                      skillLevelsItem
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
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
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                        context.pushNamed(
                                          'Skills_List',
                                          queryParameters: {
                                            'isEdit': serializeParam(
                                              false,
                                              ParamType.bool,
                                            ),
                                          }.withoutNulls,
                                        );
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
                                  context.pushNamed(
                                    'Skills_List',
                                    queryParameters: {
                                      'isEdit': serializeParam(
                                        true,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
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
                ].divide(SizedBox(height: 0.0)),
              );
            },
          ),
        ),
      ),
    );
  }
}
