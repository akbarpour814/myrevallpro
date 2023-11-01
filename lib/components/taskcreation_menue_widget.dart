import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'taskcreation_menue_model.dart';
export 'taskcreation_menue_model.dart';

class TaskcreationMenueWidget extends StatefulWidget {
  const TaskcreationMenueWidget({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  final Future<dynamic> Function()? openDrawer;

  @override
  _TaskcreationMenueWidgetState createState() =>
      _TaskcreationMenueWidgetState();
}

class _TaskcreationMenueWidgetState extends State<TaskcreationMenueWidget> {
  late TaskcreationMenueModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskcreationMenueModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.openDrawer?.call();
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 0.0),
              spreadRadius: 3.0,
            )
          ],
          shape: BoxShape.circle,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.keyboard_control,
              color: FlutterFlowTheme.of(context).primary,
              size: 27.0,
            ),
          ],
        ),
      ),
    );
  }
}
