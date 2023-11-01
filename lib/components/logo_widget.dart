import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'logo_model.dart';
export 'logo_model.dart';

class LogoWidget extends StatefulWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  _LogoWidgetState createState() => _LogoWidgetState();
}

class _LogoWidgetState extends State<LogoWidget> {
  late LogoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogoModel());

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

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tasker',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Gothic A1',
                color: Color(0xFFE23C12),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          '.Page',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Gothic A1',
                color: Color(0xFF211DAF),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
