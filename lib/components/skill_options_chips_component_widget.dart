import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'skill_options_chips_component_model.dart';
export 'skill_options_chips_component_model.dart';

class SkillOptionsChipsComponentWidget extends StatefulWidget {
  const SkillOptionsChipsComponentWidget({
    Key? key,
    required this.skillOption,
    this.selectedChips,
  }) : super(key: key);

  final SkillOptionsStruct? skillOption;
  final String? selectedChips;

  @override
  _SkillOptionsChipsComponentWidgetState createState() =>
      _SkillOptionsChipsComponentWidgetState();
}

class _SkillOptionsChipsComponentWidgetState
    extends State<SkillOptionsChipsComponentWidget> {
  late SkillOptionsChipsComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SkillOptionsChipsComponentModel());

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              valueOrDefault<String>(
                widget.skillOption?.optionName,
                'Option Name',
              ),
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lato',
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlutterFlowChoiceChips(
                  options: functions
                      .convertStringToListOfString2(widget.skillOption?.values)!
                      .map((label) => ChipData(label))
                      .toList(),
                  onChanged: (val) =>
                      setState(() => _model.choiceChipsValues = val),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Colors.white,
                          fontSize: 12.0,
                        ),
                    iconColor: Colors.white,
                    iconSize: 18.0,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Color(0xFFD4D4D4),
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Lato',
                          color: Color(0xFF5450E2),
                          fontSize: 12.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).alternate,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 12.0,
                  multiselect: true,
                  initialized: _model.choiceChipsValues != null,
                  alignment: WrapAlignment.center,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    widget.selectedChips == null || widget.selectedChips == ''
                        ? []
                        : functions
                            .convertStringToListOfString2(widget.selectedChips),
                  ),
                  wrapped: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
