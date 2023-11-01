import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_icon_model.dart';
export 'edit_icon_model.dart';

class EditIconWidget extends StatefulWidget {
  const EditIconWidget({Key? key}) : super(key: key);

  @override
  _EditIconWidgetState createState() => _EditIconWidgetState();
}

class _EditIconWidgetState extends State<EditIconWidget> {
  late EditIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditIconModel());

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
      width: 23.0,
      height: 23.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.edit,
        color: Color(0xFFF6F6F6),
        size: 12.0,
      ),
    );
  }
}
