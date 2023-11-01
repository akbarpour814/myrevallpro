import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skill_options_check_component_model.dart';
export 'skill_options_check_component_model.dart';

class SkillOptionsCheckComponentWidget extends StatefulWidget {
  const SkillOptionsCheckComponentWidget({
    Key? key,
    required this.skillOption,
    bool? defaultValue,
  })  : this.defaultValue = defaultValue ?? false,
        super(key: key);

  final SkillOptionsStruct? skillOption;
  final bool defaultValue;

  @override
  _SkillOptionsCheckComponentWidgetState createState() =>
      _SkillOptionsCheckComponentWidgetState();
}

class _SkillOptionsCheckComponentWidgetState
    extends State<SkillOptionsCheckComponentWidget> {
  late SkillOptionsCheckComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillOptionsCheckComponentModel());

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
      children: [
        Text(
          valueOrDefault<String>(
            widget.skillOption?.optionName,
            'Option ',
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Lato',
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
              ),
        ),
        Switch.adaptive(
          value: _model.switchValue ??= widget.defaultValue,
          onChanged: (newValue) async {
            setState(() => _model.switchValue = newValue!);
          },
          activeColor: FlutterFlowTheme.of(context).primary,
          activeTrackColor: FlutterFlowTheme.of(context).accent1,
          inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
          inactiveThumbColor: FlutterFlowTheme.of(context).secondaryText,
        ),
      ],
    );
  }
}
