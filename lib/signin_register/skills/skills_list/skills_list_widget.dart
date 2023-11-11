import '/backend/api_requests/api_calls.dart';
import '/components/ad_card_web_widget.dart';
import '/components/badges_header_widget.dart';
import '/components/button_next_widget.dart';
import '/components/header_web_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/side_bar_left_profile_widget.dart';
import '/components/side_bar_right_widget.dart';
import '/components/skill_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/backend/schema/structs/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'skills_list_model.dart';
export 'skills_list_model.dart';

class SkillsListWidget extends StatefulWidget {
  const SkillsListWidget({
    Key? key,
    bool? isEdit,
  })  : this.isEdit = isEdit ?? true,
        super(key: key);

  final bool isEdit;

  @override
  _SkillsListWidgetState createState() => _SkillsListWidgetState();
}

class _SkillsListWidgetState extends State<SkillsListWidget> {
  late SkillsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillsListModel());

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
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    desktop: false,
                                  ))
                                    wrapWithModel(
                                      model: _model.headerModel,
                                      updateCallback: () => setState(() {}),
                                      child: HeaderWidget(
                                        openDrawer: () async {
                                          scaffoldKey.currentState!
                                              .openEndDrawer();
                                        },
                                      ),
                                    ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: SingleChildScrollView(
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
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      27.0,
                                                                      0.0,
                                                                      27.0,
                                                                      0.0),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .badgesHeaderModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                BadgesHeaderWidget(),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(32.0, 32.0,
                                                          32.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Skills',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              color: Color(
                                                                  0xFF292929),
                                                              fontSize: 16.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(32.0, 20.0,
                                                          32.0, 16.0),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  TaskerpageBackendGroup
                                                                      .customerProfileSkillsListCall
                                                                      .call(
                                                                filters:
                                                                    '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                                  FFAppState()
                                                                      .userProfile,
                                                                  r'''$.data.name''',
                                                                ).toString()}\"]]',
                                                                fields:
                                                                    '[\"*\"]',
                                                                orderBy:
                                                                    'creation desc',
                                                                apiGlobalKey:
                                                                    FFAppState()
                                                                        .apiKey,
                                                              )))
                                                        .future,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final listViewCustomerProfileSkillsListResponse =
                                                          snapshot.data!;
                                                      return Builder(
                                                        builder: (context) {
                                                          final myServices =
                                                              TaskerpageBackendGroup
                                                                      .customerProfileSkillsListCall
                                                                      .myServices(
                                                                        listViewCustomerProfileSkillsListResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList() ??
                                                                  [];
                                                          if (myServices
                                                              .isEmpty) {
                                                            return Image.asset(
                                                              'assets/images/Group_2020.png',
                                                            );
                                                          }
                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                myServices
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    height:
                                                                        16.0),
                                                            itemBuilder: (context,
                                                                myServicesIndex) {
                                                              final myServicesItem =
                                                                  myServices[
                                                                      myServicesIndex];
                                                              return Container(
                                                                height: 285.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future: TaskerpageBackendGroup
                                                                      .getCustomerProfileSkillsDetailsCall
                                                                      .call(
                                                                    name:
                                                                        getJsonField(
                                                                      myServicesItem,
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    apiGlobalKey:
                                                                        FFAppState()
                                                                            .apiKey,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          child:
                                                                              SpinKitThreeBounce(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                35.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final skillCardGetCustomerProfileSkillsDetailsResponse =
                                                                        snapshot
                                                                            .data!;
                                                                    return wrapWithModel(
                                                                      model: _model
                                                                          .skillCardModels
                                                                          .getModel(
                                                                        myServicesIndex
                                                                            .toString(),
                                                                        myServicesIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          SkillCardWidget(
                                                                        key:
                                                                            Key(
                                                                          'Key935_${myServicesIndex.toString()}',
                                                                        ),
                                                                        userService:
                                                                            UserServiceStruct.fromMap(getJsonField(
                                                                          skillCardGetCustomerProfileSkillsDetailsResponse
                                                                              .jsonBody,
                                                                          r'''$.data''',
                                                                        )),
                                                                        index:
                                                                            myServicesIndex,
                                                                        action:
                                                                            () async {
                                                                          setState(() =>
                                                                              _model.apiRequestCompleter = null);
                                                                          await _model
                                                                              .waitForApiRequestCompleted();
                                                                        },
                                                                      ),
                                                                    );
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
                                                FutureBuilder<ApiCallResponse>(
                                                  future: TaskerpageBackendGroup
                                                      .customerProfileSkillsListCall
                                                      .call(
                                                    filters:
                                                        '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                      FFAppState().userProfile,
                                                      r'''$.data.name''',
                                                    ).toString()}\"]]',
                                                    fields: '[\"name\"]',
                                                    orderBy: 'creation desc',
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
                                                    final columnCustomerProfileSkillsListResponse =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (getJsonField(
                                                              columnCustomerProfileSkillsListResponse
                                                                  .jsonBody,
                                                              r'''$.data''',
                                                            ) !=
                                                            null)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        0.0,
                                                                        32.0,
                                                                        30.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 180.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x00FFFFFF),
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  image: Image
                                                                      .asset(
                                                                    'assets/images/Rectangle_1937.png',
                                                                  ).image,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        32.0,
                                                                        24.0,
                                                                        32.0,
                                                                        20.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'Skills-3',
                                                                          queryParameters:
                                                                              {
                                                                            'addAnother':
                                                                                serializeParam(
                                                                              true,
                                                                              ParamType.bool,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            184.0,
                                                                        height:
                                                                            36.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x00FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(1.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              '+ Add another Skills',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
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
                                                          ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                  tablet: false,
                                                  tabletLandscape: false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(32.0, 0.0,
                                                                32.0, 0.0),
                                                    child: wrapWithModel(
                                                      model:
                                                          _model.adCardWebModel,
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: AdCardWebWidget(),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (!widget.isEdit)
                                        wrapWithModel(
                                          model: _model.navBarModel,
                                          updateCallback: () => setState(() {}),
                                          child: NavBarWidget(),
                                        ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (widget.isEdit &&
                                          responsiveVisibility(
                                            context: context,
                                            desktop: false,
                                          ))
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
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
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 0.0, 32.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                        'Contactdata-1');
                                                  },
                                                  child: wrapWithModel(
                                                    model:
                                                        _model.buttonNextModel,
                                                    updateCallback: () =>
                                                        setState(() {}),
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
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                    ))
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.sideBarRightModel,
                              updateCallback: () => setState(() {}),
                              child: SideBarRightWidget(),
                            ),
                          ],
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
