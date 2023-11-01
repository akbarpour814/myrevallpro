import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/button_next_widget.dart';
import '/components/header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_intersted_model.dart';
export 'profile_intersted_model.dart';

class ProfileInterstedWidget extends StatefulWidget {
  const ProfileInterstedWidget({Key? key}) : super(key: key);

  @override
  _ProfileInterstedWidgetState createState() => _ProfileInterstedWidgetState();
}

class _ProfileInterstedWidgetState extends State<ProfileInterstedWidget> {
  late ProfileInterstedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileInterstedModel());

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
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'What are you intersted in!',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 142.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState().appRoles(
                            uniqueQueryKey: FFAppState().apiKey,
                            requestFn: () =>
                                TaskerpageBackendGroup.getAppRolesCall.call(
                              apiGlobalKey: FFAppState().apiKey,
                              fields:
                                  '[\"name\",\"role_profile_name\",\"message\",\"add_skills_text\",\"skills_limit\"]',
                            ),
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
                            final columnGetAppRolesResponse = snapshot.data!;
                            return Builder(
                              builder: (context) {
                                final roleProfile = functions
                                        .listJsonToAppRolesStruct(
                                            TaskerpageBackendGroup
                                                .getAppRolesCall
                                                .roleProfilesList(
                                                  columnGetAppRolesResponse
                                                      .jsonBody,
                                                )!
                                                .toList())
                                        ?.toList() ??
                                    [];
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(roleProfile.length,
                                      (roleProfileIndex) {
                                    final roleProfileItem =
                                        roleProfile[roleProfileIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 0.0, 32.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState()
                                                    .watingForSelectRole = true;
                                              });
                                              setState(() {
                                                FFAppState()
                                                    .updateUserInformationStruct(
                                                  (e) => e
                                                    ..role =
                                                        '${roleProfileItem.roleProfileName}',
                                                );
                                              });
                                              _model.apiResult786 =
                                                  await TaskerpageBackendGroup
                                                      .updateUserRoleCall
                                                      .call(
                                                roleProfileName: roleProfileItem
                                                    .roleProfileName,
                                                name: getJsonField(
                                                  FFAppState().userProfile,
                                                  r'''$.data.user''',
                                                ).toString(),
                                              );
                                              _model.apiResultgzf =
                                                  await TaskerpageBackendGroup
                                                      .updateRoleCall
                                                      .call(
                                                id: getJsonField(
                                                  FFAppState().userProfile,
                                                  r'''$.data.name''',
                                                ).toString(),
                                                roleProfileName: roleProfileItem
                                                    .roleProfileName,
                                                role: roleProfileItem
                                                    .roleProfileName,
                                                apiGlobalKey:
                                                    FFAppState().apiKey,
                                              );
                                              setState(() {
                                                FFAppState()
                                                        .watingForSelectRole =
                                                    false;
                                              });

                                              setState(() {});
                                            },
                                            child: Container(
                                              width: 216.0,
                                              height: 36.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(2.0),
                                                border: Border.all(
                                                  color: FFAppState()
                                                              .UserInformation
                                                              .role ==
                                                          roleProfileItem
                                                              .roleProfileName
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    roleProfileItem.message,
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Lato',
                                                              color: FFAppState()
                                                                          .UserInformation
                                                                          .role ==
                                                                      roleProfileItem
                                                                          .roleProfileName
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
                                          ),
                                        ],
                                      ),
                                    );
                                  }).divide(SizedBox(height: 8.0)),
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
                              if (FFAppState().watingForSelectRole) {
                                if (_shouldSetState) setState(() {});
                                return;
                              }

                              _model.apiResults8k = await TaskerpageBackendGroup
                                  .userProfileMeCall
                                  .call(
                                apiGlobalKey: FFAppState().apiKey,
                              );
                              _shouldSetState = true;
                              setState(() {
                                FFAppState().userProfile =
                                    (_model.apiResults8k?.jsonBody ?? '');
                              });
                              if (FFAppState().UserInformation.role == 'test') {
                                context.pushNamed('Skills-1');
                              } else {
                                context.pushNamed('Skills-3');
                              }

                              if (_shouldSetState) setState(() {});
                            },
                            child: wrapWithModel(
                              model: _model.buttonNextModel,
                              updateCallback: () => setState(() {}),
                              child: ButtonNextWidget(
                                text: FFAppState().watingForSelectRole
                                    ? 'Wating'
                                    : 'Next',
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
