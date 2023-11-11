import '/backend/api_requests/api_calls.dart';
import '/components/drawer_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_drawer_model.dart';
export 'main_drawer_model.dart';

class MainDrawerWidget extends StatefulWidget {
  const MainDrawerWidget({Key? key}) : super(key: key);

  @override
  _MainDrawerWidgetState createState() => _MainDrawerWidgetState();
}

class _MainDrawerWidgetState extends State<MainDrawerWidget> {
  late MainDrawerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainDrawerModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: TaskerpageBackendGroup.userProfileReadCall.call(
        id: getJsonField(
          FFAppState().userProfile,
          r'''$.data.name''',
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
                color: FlutterFlowTheme.of(context).primary,
                size: 35.0,
              ),
            ),
          );
        }
        final containerUserProfileReadResponse = snapshot.data!;
        return Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 15.0, 32.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 7.0, 0.0),
                                      child: Icon(
                                        Icons.card_membership_rounded,
                                        color: Color(0xFF292929),
                                        size: 19.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 13.0, 0.0),
                                      child: Text(
                                        'Member Number: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF292929),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      getJsonField(
                                        containerUserProfileReadResponse
                                            .jsonBody,
                                        r'''$.data.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF292929),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 7.0, 0.0),
                                      child: Icon(
                                        Icons.card_membership_rounded,
                                        color: Color(0xFF292929),
                                        size: 19.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 13.0, 0.0),
                                      child: Text(
                                        'Member Since: ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF292929),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    Text(
                                      dateTimeFormat(
                                          'd/M/y',
                                          functions.jsonToDateTime(getJsonField(
                                            containerUserProfileReadResponse
                                                .jsonBody,
                                            r'''$.data.creation''',
                                          ).toString())),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF292929),
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 7.0)),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
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
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 15.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed('User_profile');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 160.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                    spreadRadius: 2.0,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 20.0, 20.0, 20.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Container(
                                                width: 90.0,
                                                height: 90.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color(0xFFDBDBDB),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 75.0,
                                                height: 75.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  getJsonField(
                                                            containerUserProfileReadResponse
                                                                .jsonBody,
                                                            r'''$.data.avatar''',
                                                          ) !=
                                                          null
                                                      ? '${FFAppState().baseUrl}${getJsonField(
                                                          containerUserProfileReadResponse
                                                              .jsonBody,
                                                          r'''$.data.avatar''',
                                                        ).toString()}'
                                                      : '${FFAppState().baseUrl}/files/Group 2177.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${getJsonField(
                                              containerUserProfileReadResponse
                                                  .jsonBody,
                                              r'''$.data.first_name''',
                                            ).toString()} ${getJsonField(
                                              containerUserProfileReadResponse
                                                  .jsonBody,
                                              r'''$.data.last_name''',
                                            ).toString()}',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.2, 0.0, 0.0),
                                            child: Text(
                                              '${getJsonField(
                                                containerUserProfileReadResponse
                                                    .jsonBody,
                                                r'''$.data.city''',
                                              ).toString()} | ${getJsonField(
                                                containerUserProfileReadResponse
                                                    .jsonBody,
                                                r'''$.data.language''',
                                              ).toString()}',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Lato',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    fontSize: 13.0,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 11.5, 0.0, 0.0),
                                            child: RatingBarIndicator(
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star_rounded,
                                                color: Color(0xFFEFC349),
                                              ),
                                              direction: Axis.horizontal,
                                              rating: getJsonField(
                                                containerUserProfileReadResponse
                                                    .jsonBody,
                                                r'''$.data.review_average''',
                                              ),
                                              unratedColor: Color(0xFFDCDCDC),
                                              itemCount: 5,
                                              itemSize: 16.0,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Container(
                                              width: 194.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius:
                                                    BorderRadius.circular(1.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    functions
                                                                .jsonToInt(
                                                                    getJsonField(
                                                                  containerUserProfileReadResponse
                                                                      .jsonBody,
                                                                  r'''$.data.is_subscribed''',
                                                                ))
                                                                .toString() ==
                                                            '0'
                                                        ? 'Upgrade to premium'
                                                        : 'Premium',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color: Colors.white,
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                  if (functions
                                                          .jsonToInt(
                                                              getJsonField(
                                                            containerUserProfileReadResponse
                                                                .jsonBody,
                                                            r'''$.data.is_subscribed''',
                                                          ))
                                                          .toString() ==
                                                      '1')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.verified,
                                                        color: Colors.white,
                                                        size: 17.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 11.5)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 9.0, 0.0, 30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel1,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'Profile',
                                        icon: Icon(
                                          Icons.person_outline,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {
                                          context.pushNamed('Profile');
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel2,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'Contact data',
                                        icon: Icon(
                                          Icons.perm_contact_cal_outlined,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {
                                          context.pushNamed('Contactdata-3');
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.7)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel3,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'Skills',
                                        icon: Icon(
                                          Icons.checklist_rtl_rounded,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {
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
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel4,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'Identification',
                                        icon: Icon(
                                          Icons.verified_outlined,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {
                                          context.pushNamed(
                                            'identification_card',
                                            queryParameters: {
                                              'signUp': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.7)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel5,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'Education',
                                        icon: Icon(
                                          Icons.auto_stories_outlined,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {
                                          context.pushNamed(
                                            'Education-2',
                                            queryParameters: {
                                              'isSignUp': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel6,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'My tasks',
                                        icon: Icon(
                                          Icons.assignment_outlined,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {
                                          context.pushNamed('MyPosts');
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.7)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel7,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'Rates',
                                        icon: Icon(
                                          Icons.discount_outlined,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {
                                          context.pushNamed(
                                            'Rates_list',
                                            queryParameters: {
                                              'isEdit': serializeParam(
                                                false,
                                                ParamType.bool,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel8,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'My Visit Card',
                                        icon: Icon(
                                          Icons.badge_outlined,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {},
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.7)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {},
                                      child: wrapWithModel(
                                        model: _model.drawerCardModel9,
                                        updateCallback: () => setState(() {}),
                                        child: DrawerCardWidget(
                                          textButton: 'Ticket',
                                          icon: Icon(
                                            Icons.support_agent,
                                            color: Color(0xFF494949),
                                            size: 25.0,
                                          ),
                                          clickAction: () async {
                                            context.pushNamed('issue_list');
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model.drawerCardModel10,
                                      updateCallback: () => setState(() {}),
                                      child: DrawerCardWidget(
                                        textButton: 'Payment',
                                        icon: Icon(
                                          Icons.receipt_long_outlined,
                                          color: Color(0xFF494949),
                                          size: 25.0,
                                        ),
                                        clickAction: () async {
                                          context.pushNamed('paymentshistory');
                                        },
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 12.7)),
                              ),
                            ].divide(SizedBox(height: 6.6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 367.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 2.0),
                        spreadRadius: 2.0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 17.5, 25.0, 30.9),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('ShowPlans');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.discount_outlined,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              Text(
                                'Plans & Prices',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          thickness: 1.0,
                          color: Color(0xFFD2D2D2),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('KnowledgeBase');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.question_mark_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              Text(
                                'How its work',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          thickness: 1.0,
                          color: Color(0xFFD2D2D2),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Categories');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.checklist_rtl_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              Text(
                                'Category',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          thickness: 1.0,
                          color: Color(0xFFD2D2D2),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('TaskList');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.search,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              Text(
                                'Search task',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          thickness: 1.0,
                          color: Color(0xFFD2D2D2),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('TaskerList');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.search,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              Text(
                                'Search tasker',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          thickness: 1.0,
                          color: Color(0xFFD2D2D2),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('SelectCountryLanguage');
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.g_translate,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              Text(
                                'language',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF292929),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                        Divider(
                          height: 30.0,
                          thickness: 1.0,
                          color: Color(0xFFD2D2D2),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.settings_outlined,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 20.0,
                            ),
                            Text(
                              'Privacy setting',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Lato',
                                    color: Color(0xFF292929),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed('Sign-in');

                          setState(() {
                            FFAppState().apiKey = '';
                            FFAppState().userProfile = null;
                          });
                        },
                        child: Container(
                          width: 103.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(1.0),
                            border: Border.all(
                              color: Color(0xFF8A8A8A),
                              width: 2.0,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                color: Color(0xFF8A8A8A),
                                size: 20.8,
                              ),
                              Text(
                                'Log out',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFF8A8A8A),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ].divide(SizedBox(width: 7.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
