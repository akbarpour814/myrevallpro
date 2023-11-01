import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_skill_model.dart';
export 'my_skill_model.dart';

class MySkillWidget extends StatefulWidget {
  const MySkillWidget({
    Key? key,
    required this.userRate,
  }) : super(key: key);

  final UserRateStruct? userRate;

  @override
  _MySkillWidgetState createState() => _MySkillWidgetState();
}

class _MySkillWidgetState extends State<MySkillWidget> {
  late MySkillModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MySkillModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.userRate == null) {
        setState(() {
          _model.userRate = widget.userRate;
        });
      } else {
        Navigator.pop(context);
      }
    });

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
          topLeft: Radius.circular(2.0),
          topRight: Radius.circular(2.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.4,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(2.0),
            topRight: Radius.circular(2.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(32.0, 23.0, 32.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FutureBuilder<ApiCallResponse>(
                      future:
                          TaskerpageBackendGroup.getMySkillCategoriesCall.call(
                        customerProfile: getJsonField(
                          FFAppState().userProfile,
                          r'''$.data.name''',
                        ),
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
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        final gridViewGetMySkillCategoriesResponse =
                            snapshot.data!;
                        return Builder(
                          builder: (context) {
                            final mySkillCategories = TaskerpageBackendGroup
                                    .getMySkillCategoriesCall
                                    .mySkillCategories(
                                      gridViewGetMySkillCategoriesResponse
                                          .jsonBody,
                                    )
                                    ?.map((e) => e != null && e != ''
                                        ? ChildSkillCategoryStruct.fromMap(e)
                                        : null)
                                    .withoutNulls
                                    .toList()
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
                              itemCount: mySkillCategories.length,
                              itemBuilder: (context, mySkillCategoriesIndex) {
                                final mySkillCategoriesItem =
                                    mySkillCategories[mySkillCategoriesIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (_model.userRate!.skillCategories
                                            .where((e) =>
                                                e.skillCategoryName ==
                                                mySkillCategoriesItem
                                                    .skillCategoryName)
                                            .toList()
                                            .length >
                                        0) {
                                      setState(() {
                                        _model.updateUserRateStruct(
                                          (e) => e
                                            ..updateSkillCategories(
                                              (e) => e.remove(_model
                                                  .userRate?.skillCategories
                                                  ?.where((e) =>
                                                      e.skillCategoryName ==
                                                      mySkillCategoriesItem
                                                          .skillCategoryName)
                                                  .toList()
                                                  ?.first),
                                            ),
                                        );
                                      });
                                    } else {
                                      setState(() {
                                        _model.updateUserRateStruct(
                                          (e) => e
                                            ..updateSkillCategories(
                                              (e) => e
                                                  .add(ChildSkillCategoryStruct(
                                                skillCategoryName:
                                                    mySkillCategoriesItem
                                                        .skillCategoryName,
                                              )),
                                            ),
                                        );
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 100.0,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: _model.userRate!.skillCategories
                                                  .where((e) =>
                                                      e.skillCategoryName ==
                                                      mySkillCategoriesItem
                                                          .skillCategoryName)
                                                  .toList()
                                                  .length >
                                              0
                                          ? FlutterFlowTheme.of(context).primary
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(2.0),
                                      border: Border.all(
                                        color: _model.userRate!.skillCategories
                                                    .where((e) =>
                                                        e.skillCategoryName ==
                                                        mySkillCategoriesItem
                                                            .skillCategoryName)
                                                    .toList()
                                                    .length >
                                                0
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          mySkillCategoriesItem
                                              .skillCategoryName,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: _model.userRate!
                                                            .skillCategories
                                                            .where((e) =>
                                                                e.skillCategoryName ==
                                                                mySkillCategoriesItem
                                                                    .skillCategoryName)
                                                            .toList()
                                                            .length >
                                                        0
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                fontSize: 14.0,
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
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context, widget.userRate);
                    },
                    child: Text(
                      'I\'ll do it later',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Color(0xFF8A8A8A),
                            fontSize: 14.0,
                          ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context, _model.userRate);
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
                            'Ok',
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
            ],
          ),
        ),
      ),
    );
  }
}
