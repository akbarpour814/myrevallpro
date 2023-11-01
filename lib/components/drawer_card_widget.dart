import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer_card_model.dart';
export 'drawer_card_model.dart';

class DrawerCardWidget extends StatefulWidget {
  const DrawerCardWidget({
    Key? key,
    required this.textButton,
    required this.icon,
    required this.clickAction,
  }) : super(key: key);

  final String? textButton;
  final Widget? icon;
  final Future<dynamic> Function()? clickAction;

  @override
  _DrawerCardWidgetState createState() => _DrawerCardWidgetState();
}

class _DrawerCardWidgetState extends State<DrawerCardWidget> {
  late DrawerCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DrawerCardModel());

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
        await widget.clickAction?.call();
      },
      child: Container(
        width: double.infinity,
        height: 75.4,
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
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon!,
            Text(
              widget.textButton!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lato',
                    color: Color(0xFF494949),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ].divide(SizedBox(height: 4.3)),
        ),
      ),
    );
  }
}
