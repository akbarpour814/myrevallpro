import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'secendry_button_model.dart';
export 'secendry_button_model.dart';

class SecendryButtonWidget extends StatefulWidget {
  const SecendryButtonWidget({
    Key? key,
    required this.text,
    required this.borderColor,
    required this.fillColor,
    required this.testColor,
  }) : super(key: key);

  final String? text;
  final Color? borderColor;
  final Color? fillColor;
  final Color? testColor;

  @override
  _SecendryButtonWidgetState createState() => _SecendryButtonWidgetState();
}

class _SecendryButtonWidgetState extends State<SecendryButtonWidget> {
  late SecendryButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecendryButtonModel());

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
      width: 155.0,
      height: 40.0,
      decoration: BoxDecoration(
        color: Color(0x005450E2),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Color(0xFF5E5D5D),
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
                  color: Color(0xFF5E5D5D),
                  fontSize: 14.0,
                ),
          ),
        ],
      ),
    );
  }
}
