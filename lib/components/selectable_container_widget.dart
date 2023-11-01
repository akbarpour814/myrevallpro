import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selectable_container_model.dart';
export 'selectable_container_model.dart';

class SelectableContainerWidget extends StatefulWidget {
  const SelectableContainerWidget({
    Key? key,
    this.parameter1,
    required this.action,
    required this.selected,
    required this.text,
  }) : super(key: key);

  final dynamic parameter1;
  final Future<dynamic> Function()? action;
  final bool? selected;
  final String? text;

  @override
  _SelectableContainerWidgetState createState() =>
      _SelectableContainerWidgetState();
}

class _SelectableContainerWidgetState extends State<SelectableContainerWidget> {
  late SelectableContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectableContainerModel());

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
        await widget.action?.call();
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              widget.selected!
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondary,
              FlutterFlowTheme.of(context).secondaryText,
            ),
            width: 1.3,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text!.maybeHandleOverflow(
                  maxChars: 17,
                  replacement: '…',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: valueOrDefault<Color>(
                        widget.selected!
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondary,
                        FlutterFlowTheme.of(context).secondaryText,
                      ),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
