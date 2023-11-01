import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drope_down_languages_post_model.dart';
export 'drope_down_languages_post_model.dart';

class DropeDownLanguagesPostWidget extends StatefulWidget {
  const DropeDownLanguagesPostWidget({Key? key}) : super(key: key);

  @override
  _DropeDownLanguagesPostWidgetState createState() =>
      _DropeDownLanguagesPostWidgetState();
}

class _DropeDownLanguagesPostWidgetState
    extends State<DropeDownLanguagesPostWidget> with TickerProviderStateMixin {
  late DropeDownLanguagesPostModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(8.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(8.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -10.0),
          end: Offset(0.0, 0.0),
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
    _model = createModel(context, () => DropeDownLanguagesPostModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Color(0xFF5E5D5D),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                color: Color(0x00FFFFFF),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if ((FFAppState().SelectLanguageDropDown ==
                                          false) ||
                                      (FFAppState()
                                              .LanguagesListForDropDown
                                              .length ==
                                          0))
                                    Text(
                                      'Select your language',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF3D3D3D),
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (FFAppState().SelectLanguageDropDown == true)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().SelectLanguageDropDown =
                                            false;
                                      });
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_up_rounded,
                                      color: Color(0xFF3D3D3D),
                                      size: 24.0,
                                    ),
                                  ),
                                if (FFAppState().SelectLanguageDropDown ==
                                    false)
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      setState(() {
                                        FFAppState().SelectLanguageDropDown =
                                            true;
                                      });
                                    },
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Color(0xFF3D3D3D),
                                      size: 24.0,
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 7.0, 40.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final languages = FFAppState()
                                .TaskCreation
                                .languages
                                .toList()
                                .take(2)
                                .toList();
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(languages.length,
                                  (languagesIndex) {
                                final languagesItem = languages[languagesIndex];
                                return Container(
                                  height: 26.0,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF5450E2),
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          languagesItem == 'EN'
                                              ? 'English'
                                              : 'Germany',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFFF6F6F6),
                                                fontSize: 12.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState()
                                                    .updateTaskCreationStruct(
                                                  (e) => e
                                                    ..updateLanguages(
                                                      (e) => e.remove(
                                                          languagesItem),
                                                    ),
                                                );
                                              });
                                            },
                                            child: Icon(
                                              Icons.close_rounded,
                                              color: Color(0xFFF6F6F6),
                                              size: 15.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                    .animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation']!)
                                    .animateOnActionTrigger(
                                      animationsMap[
                                          'containerOnActionTriggerAnimation']!,
                                    );
                              }).divide(SizedBox(width: 8.0)),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (FFAppState().SelectLanguageDropDown == true)
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Container(
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Color(0xFF5E5D5D),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 10.0, 10.0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Germany',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                if (!FFAppState()
                                    .TaskCreation
                                    .languages
                                    .contains('DE'))
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF5E5D5D),
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue1 ??=
                                          FFAppState()
                                              .LanguagesListForDropDown
                                              .contains('DE'),
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxValue1 = newValue!);
                                        if (newValue!) {
                                          setState(() {
                                            FFAppState()
                                                .updateTaskCreationStruct(
                                              (e) => e
                                                ..updateLanguages(
                                                  (e) => e.add('DE'),
                                                ),
                                            );
                                          });
                                        } else {
                                          setState(() {
                                            FFAppState()
                                                .updateTaskCreationStruct(
                                              (e) => e
                                                ..updateLanguages(
                                                  (e) => e.remove('DE'),
                                                ),
                                            );
                                          });
                                        }
                                      },
                                      activeColor: Color(0xFF5450E2),
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'English',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Color(0xFF3D3D3D),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                if (!FFAppState()
                                    .TaskCreation
                                    .languages
                                    .contains('EN'))
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                      ),
                                      unselectedWidgetColor: Color(0xFF5E5D5D),
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue2 ??=
                                          FFAppState()
                                              .LanguagesListForDropDown
                                              .contains('EN'),
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxValue2 = newValue!);
                                        if (newValue!) {
                                          setState(() {
                                            FFAppState()
                                                .updateTaskCreationStruct(
                                              (e) => e
                                                ..updateLanguages(
                                                  (e) => e.add('EN'),
                                                ),
                                            );
                                          });
                                        } else {
                                          setState(() {
                                            FFAppState()
                                                .updateTaskCreationStruct(
                                              (e) => e
                                                ..updateLanguages(
                                                  (e) => e.add('EN'),
                                                ),
                                            );
                                          });
                                        }
                                      },
                                      activeColor: Color(0xFF5450E2),
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                              ],
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
            ),
          ),
      ],
    );
  }
}
