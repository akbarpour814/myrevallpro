import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_next2_model.dart';
export 'button_next2_model.dart';

class ButtonNext2Widget extends StatefulWidget {
  const ButtonNext2Widget({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  _ButtonNext2WidgetState createState() => _ButtonNext2WidgetState();
}

class _ButtonNext2WidgetState extends State<ButtonNext2Widget> {
  late ButtonNext2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonNext2Model());

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
      width: 96.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Color(0x006B6B6B),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Color(0xFF5450E2),
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.text!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lato',
                  color: Color(0xFF5450E2),
                  fontSize: 14.0,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Color(0xFF5450E2),
              size: 10.0,
            ),
          ),
        ],
      ),
    );
  }
}
