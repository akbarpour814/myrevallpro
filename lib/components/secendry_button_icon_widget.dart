import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'secendry_button_icon_model.dart';
export 'secendry_button_icon_model.dart';

class SecendryButtonIconWidget extends StatefulWidget {
  const SecendryButtonIconWidget({
    Key? key,
    required this.text,
    required this.borderColor,
    required this.fillColor,
    required this.testColor,
    required this.img,
  }) : super(key: key);

  final String? text;
  final Color? borderColor;
  final Color? fillColor;
  final Color? testColor;
  final String? img;

  @override
  _SecendryButtonIconWidgetState createState() =>
      _SecendryButtonIconWidgetState();
}

class _SecendryButtonIconWidgetState extends State<SecendryButtonIconWidget> {
  late SecendryButtonIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecendryButtonIconModel());

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
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(
                widget.img!,
                width: 25.0,
                height: 15.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: Text(
                widget.text!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: Color(0xFF5E5D5D),
                      fontSize: 14.0,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
