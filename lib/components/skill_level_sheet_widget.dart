import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/emty_container_widget.dart';
import '/components/skill_options_check_component_widget.dart';
import '/components/skill_options_chips_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skill_level_sheet_model.dart';
export 'skill_level_sheet_model.dart';

class SkillLevelSheetWidget extends StatefulWidget {
  const SkillLevelSheetWidget({
    Key? key,
    required this.userService,
  }) : super(key: key);

  final dynamic userService;

  @override
  _SkillLevelSheetWidgetState createState() => _SkillLevelSheetWidgetState();
}

class _SkillLevelSheetWidgetState extends State<SkillLevelSheetWidget> {
  late SkillLevelSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillLevelSheetModel());

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
      future: TaskerpageBackendGroup.skillDetailsCall.call(
        name: getJsonField(
          widget.userService,
          r'''$.skill_name''',
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
        final optionsSkillDetailsResponse = snapshot.data!;
        return Material(
          color: Colors.transparent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.85,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(2.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 15.0, 32.0, 0.0),
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
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 0.0, 32.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${getJsonField(
                                          widget.userService,
                                          r'''$.skill_name''',
                                        ).toString()} Skill level',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Color(0xFF292929),
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    90.0, 25.0, 90.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final skillLevls = functions
                                        .returnSkillLevelEnums()
                                        .toList();
                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: skillLevls.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(height: 8.0),
                                      itemBuilder: (context, skillLevlsIndex) {
                                        final skillLevlsItem =
                                            skillLevls[skillLevlsIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            setState(() {
                                              _model.chosenSkillLevel =
                                                  skillLevlsItem;
                                            });
                                          },
                                          child: Container(
                                            width: 230.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                              border: Border.all(
                                                color: () {
                                                  if ((_model.chosenSkillLevel ==
                                                              null ||
                                                          _model.chosenSkillLevel ==
                                                              '') &&
                                                      (skillLevlsItem ==
                                                          getJsonField(
                                                            widget.userService,
                                                            r'''$.service_skill_level''',
                                                          ))) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else if (_model
                                                          .chosenSkillLevel ==
                                                      skillLevlsItem) {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondary;
                                                  }
                                                }(),
                                                width: 1.0,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  skillLevlsItem,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: () {
                                                              if ((_model.chosenSkillLevel ==
                                                                          null ||
                                                                      _model.chosenSkillLevel ==
                                                                          '') &&
                                                                  (skillLevlsItem ==
                                                                      getJsonField(
                                                                        widget
                                                                            .userService,
                                                                        r'''$.service_skill_level''',
                                                                      ))) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else if (_model
                                                                      .chosenSkillLevel ==
                                                                  skillLevlsItem) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary;
                                                              }
                                                            }(),
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
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Divider(
                              height: 60.0,
                              thickness: 1.0,
                              indent: 32.0,
                              endIndent: 32.0,
                              color: Color(0x615E5D5D),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Skill Options',
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
                                  32.0, 20.0, 32.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final skillOptions = getJsonField(
                                    optionsSkillDetailsResponse.jsonBody,
                                    r'''$.data.skill_options''',
                                  ).toList();
                                  if (skillOptions.isEmpty) {
                                    return EmtyContainerWidget(
                                      goTo: () async {},
                                    );
                                  }
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(skillOptions.length,
                                        (skillOptionsIndex) {
                                      final skillOptionsItem =
                                          skillOptions[skillOptionsIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (functions
                                                  .jsonToString(getJsonField(
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
                                                    'Keyfsm_${getJsonField(
                                                      skillOptionsItem,
                                                      r'''$.option_name''',
                                                    ).toString()}',
                                                  ),
                                                  skillOption:
                                                      SkillOptionsStruct
                                                          .fromMap(getJsonField(
                                                    skillOptionsItem,
                                                    r'''$''',
                                                  )),
                                                  defaultValue: false,
                                                ),
                                              ),
                                            ),
                                          if (functions
                                                  .jsonToString(getJsonField(
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
                                                    'Keyjww_${getJsonField(
                                                      skillOptionsItem,
                                                      r'''$.option_name''',
                                                    ).toString()}',
                                                  ),
                                                  skillOption:
                                                      SkillOptionsStruct
                                                          .fromMap(getJsonField(
                                                    skillOptionsItem,
                                                    r'''$''',
                                                  )),
                                                ),
                                              ),
                                            ),
                                        ],
                                      );
                                    }).divide(SizedBox(height: 8.0)),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 30.0),
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
                          var _shouldSetState = false;
                          _model.delete = await TaskerpageBackendGroup
                              .deleteUserServiceByIdCall
                              .call(
                            id: getJsonField(
                              widget.userService,
                              r'''$.name''',
                            ).toString(),
                            apiGlobalKey: FFAppState().apiKey,
                          );
                          _shouldSetState = true;
                          if ((_model.delete?.succeeded ?? true)) {
                            setState(() {
                              FFAppState()
                                  .removeFromSelectServices(getJsonField(
                                widget.userService,
                                r'''$.skill_name''',
                              ).toString());
                            });
                            Navigator.pop(context);
                          } else {
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        child: Container(
                          width: 116.0,
                          height: 36.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(1.0),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Delete',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var _shouldSetState = false;
                            setState(() {
                              _model.skillOptionsList = functions
                                  .convertJsonListToDataTypeList(getJsonField(
                                    optionsSkillDetailsResponse.jsonBody,
                                    r'''$.data.skill_options''',
                                    true,
                                  ))!
                                  .toList()
                                  .cast<SkillOptionsStruct>();
                            });
                            while (_model.skillOptionsList.length > 0) {
                              if (_model.skillOptionsList.first.type ==
                                  'Check') {
                                FFAppState()
                                    .addToSkillOptions(SkillOptionsStruct(
                                  name: _model.skillOptionsList.first.name,
                                  type: _model.skillOptionsList.first.type,
                                  values: _model
                                          .skillOptionsCheckComponentModels
                                          .getValueForKey(
                                    _model.skillOptionsList.first.name,
                                    (m) => m.switchValue,
                                  )!
                                      ? 'true'
                                      : 'false',
                                ));
                              } else {
                                FFAppState()
                                    .addToSkillOptions(SkillOptionsStruct(
                                  name: _model.skillOptionsList.first.name,
                                  type: _model.skillOptionsList.first.type,
                                  values: functions.convertListOfStringToString(
                                      _model.skillOptionsChipsComponentModels
                                          .getValueForKey(
                                            _model.skillOptionsList.first.name,
                                            (m) => m.choiceChipsValues,
                                          )
                                          ?.toList()),
                                ));
                              }

                              setState(() {
                                _model.removeAtIndexFromSkillOptionsList(0);
                              });
                            }
                            _model.editedUserService =
                                await TaskerpageBackendGroup.editUserServiceCall
                                    .call(
                              apiGlobalKey: FFAppState().apiKey,
                              serviceSkillLevel: _model.chosenSkillLevel,
                              id: getJsonField(
                                widget.userService,
                                r'''$.name''',
                              ).toString(),
                              skillOptionsJson:
                                  functions.convertDataTypeListToJsonList(
                                      FFAppState().skillOptions.toList()),
                            );
                            _shouldSetState = true;
                            if ((_model.editedUserService?.succeeded ?? true)) {
                              _model.updatePage(() {
                                FFAppState()
                                    .removeFromSelectServices(getJsonField(
                                  widget.userService,
                                  r'''$.skill_name''',
                                ).toString());
                              });
                              _model.updatePage(() {
                                FFAppState().addToSelectServices(getJsonField(
                                  widget.userService,
                                  r'''$.skill_name''',
                                ).toString());
                                FFAppState().skillOptions = [];
                              });
                            } else {
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            Navigator.pop(context);
                            if (_shouldSetState) setState(() {});
                          },
                          child: Container(
                            width: 116.0,
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
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(width: 10.0)),
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
