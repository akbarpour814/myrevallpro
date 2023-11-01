import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rate_card_model.dart';
export 'rate_card_model.dart';

class RateCardWidget extends StatefulWidget {
  const RateCardWidget({
    Key? key,
    required this.userRate,
    int? indexInList,
  })  : this.indexInList = indexInList ?? 0,
        super(key: key);

  final UserRateStruct? userRate;
  final int indexInList;

  @override
  _RateCardWidgetState createState() => _RateCardWidgetState();
}

class _RateCardWidgetState extends State<RateCardWidget> {
  late RateCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RateCardModel());

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

    return Container(
      width: double.infinity,
      height: 137.0,
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 17.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 17.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF8A8A8A),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            functions.plus1(widget.indexInList).toString(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 135.0,
                      height: 36.0,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${widget.userRate?.amount?.toString()} ${widget.userRate?.currency} per hour',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  color: FlutterFlowTheme.of(context).alternate,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(width: 16.0)),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'RateSignUp',
                        queryParameters: {
                          'name': serializeParam(
                            widget.userRate?.name,
                            ParamType.String,
                          ),
                        }.withoutNulls,
                      );
                    },
                    child: FaIcon(
                      FontAwesomeIcons.solidEdit,
                      color: Color(0xFF8A8A8A),
                      size: 19.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 20.0,
            thickness: 1.0,
            indent: 17.0,
            endIndent: 17.0,
            color: Color(0xFFD4D4D4),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(17.0, 10.0, 17.0, 17.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Skills : ',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: FlutterFlowTheme.of(context).alternate,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final skillCategories =
                          widget.userRate?.skillCategories?.toList() ?? [];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(skillCategories.length,
                            (skillCategoriesIndex) {
                          final skillCategoriesItem =
                              skillCategories[skillCategoriesIndex];
                          return Container(
                            height: 22.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFD4D4D4),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    skillCategoriesItem.skillCategoryName,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Color(0xFF494949),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).divide(SizedBox(width: 9.0)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
