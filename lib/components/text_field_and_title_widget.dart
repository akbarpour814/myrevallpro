import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'text_field_and_title_model.dart';
export 'text_field_and_title_model.dart';

class TextFieldAndTitleWidget extends StatefulWidget {
  const TextFieldAndTitleWidget({
    Key? key,
    required this.label,
    required this.defaultValue,
  }) : super(key: key);

  final String? label;
  final String? defaultValue;

  @override
  _TextFieldAndTitleWidgetState createState() =>
      _TextFieldAndTitleWidgetState();
}

class _TextFieldAndTitleWidgetState extends State<TextFieldAndTitleWidget> {
  late TextFieldAndTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldAndTitleModel());

    _model.stateController ??= TextEditingController(text: widget.defaultValue);
    _model.stateFocusNode ??= FocusNode();

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.label!,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lato',
                    color: Color(0xFF292929),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                width: 184.0,
                child: TextFormField(
                  controller: _model.stateController,
                  focusNode: _model.stateFocusNode,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  decoration: InputDecoration(
                    isDense: true,
                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFF212121),
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).tertiary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE8083F),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFFE8083F),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Color(0xFF212121),
                        fontSize: 14.0,
                      ),
                  validator:
                      _model.stateControllerValidator.asValidator(context),
                ),
              ),
            ),
          ],
        ),
      ].divide(SizedBox(height: 6.0)),
    );
  }
}
