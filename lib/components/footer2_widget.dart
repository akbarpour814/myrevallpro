import '/components/button_next_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'footer2_model.dart';
export 'footer2_model.dart';

class Footer2Widget extends StatefulWidget {
  const Footer2Widget({
    Key? key,
    required this.textButton,
    required this.textBack,
  }) : super(key: key);

  final String? textButton;
  final String? textBack;

  @override
  _Footer2WidgetState createState() => _Footer2WidgetState();
}

class _Footer2WidgetState extends State<Footer2Widget> {
  late Footer2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Footer2Model());

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
        padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 96.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: Color(0x005450E2),
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Color(0xFF5450E2),
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color(0xFF5450E2),
                      size: 10.0,
                    ),
                  ),
                  Text(
                    widget.textBack!,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF5450E2),
                          fontSize: 14.0,
                        ),
                  ),
                ],
              ),
            ),
            wrapWithModel(
              model: _model.buttonNextModel,
              updateCallback: () => setState(() {}),
              child: ButtonNextWidget(
                text: widget.textButton!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
