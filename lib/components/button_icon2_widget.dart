import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'button_icon2_model.dart';
export 'button_icon2_model.dart';

class ButtonIcon2Widget extends StatefulWidget {
  const ButtonIcon2Widget({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String? text;
  final Widget? icon;

  @override
  _ButtonIcon2WidgetState createState() => _ButtonIcon2WidgetState();
}

class _ButtonIcon2WidgetState extends State<ButtonIcon2Widget> {
  late ButtonIcon2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ButtonIcon2Model());

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
            child: widget.icon!,
          ),
        ],
      ),
    );
  }
}
