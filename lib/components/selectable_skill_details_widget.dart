import '/backend/schema/structs/index.dart';
import '/components/emty_container_widget.dart';
import '/components/select_skill_level_widget.dart';
import '/components/skill_options_check_component_widget.dart';
import '/components/skill_options_chips_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selectable_skill_details_model.dart';
export 'selectable_skill_details_model.dart';

class SelectableSkillDetailsWidget extends StatefulWidget {
  const SelectableSkillDetailsWidget({
    Key? key,
    required this.customerProfileSkills,
    this.selectedCategoryIndex,
    required this.skillCategory,
    required this.selectedCustomerProfileSkill,
  }) : super(key: key);

  final List<UserServiceStruct>? customerProfileSkills;
  final int? selectedCategoryIndex;
  final SkillCategoryStruct? skillCategory;
  final UserServiceStruct? selectedCustomerProfileSkill;

  @override
  _SelectableSkillDetailsWidgetState createState() =>
      _SelectableSkillDetailsWidgetState();
}

class _SelectableSkillDetailsWidgetState
    extends State<SelectableSkillDetailsWidget> {
  late SelectableSkillDetailsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectableSkillDetailsModel());

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

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            height: 48.0,
            thickness: 1.0,
            indent: 32.0,
            endIndent: 32.0,
            color: Color(0xFFE3E3E3),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 60.0,
                  thickness: 1.0,
                  indent: 32.0,
                  endIndent: 32.0,
                  color: Color(0x615E5D5D),
                ),
                if (false)
                  wrapWithModel(
                    model: _model.selectSkillLevelModel,
                    updateCallback: () => setState(() {}),
                    child: SelectSkillLevelWidget(
                      selectedSkillLevel:
                          widget.selectedCustomerProfileSkill?.skillLevel,
                    ),
                  ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Skill Options',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Lato',
                              color: Color(0xFF292929),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
                if (false)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 20.0, 32.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final skillOptions =
                            widget.skillCategory?.skillOptions?.toList() ?? [];
                        if (skillOptions.isEmpty) {
                          return EmtyContainerWidget(
                            goTo: () async {},
                          );
                        }
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(skillOptions.length,
                              (skillOptionsIndex) {
                            final skillOptionsItem =
                                skillOptions[skillOptionsIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (skillOptionsItem.type == 'Check')
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model
                                          .skillOptionsCheckComponentModels
                                          .getModel(
                                        skillOptionsItem.optionName,
                                        skillOptionsIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: SkillOptionsCheckComponentWidget(
                                        key: Key(
                                          'Keyt3k_${skillOptionsItem.optionName}',
                                        ),
                                        skillOption: skillOptionsItem,
                                        defaultValue: functions.stringToBoolean(
                                            valueOrDefault<String>(
                                          ((widget.customerProfileSkills?[widget
                                                          .selectedCategoryIndex!])
                                                      ?.customerSkillOptions?[
                                                  skillOptionsIndex])
                                              ?.values,
                                          'false',
                                        )),
                                      ),
                                    ),
                                  ),
                                if (skillOptionsItem.type == 'Select')
                                  Expanded(
                                    child: wrapWithModel(
                                      model: _model
                                          .skillOptionsChipsComponentModels
                                          .getModel(
                                        skillOptionsItem.optionName,
                                        skillOptionsIndex,
                                      ),
                                      updateCallback: () => setState(() {}),
                                      child: SkillOptionsChipsComponentWidget(
                                        key: Key(
                                          'Keyai6_${skillOptionsItem.optionName}',
                                        ),
                                        skillOption: skillOptionsItem,
                                        selectedChips:
                                            ((widget.customerProfileSkills?[widget
                                                            .selectedCategoryIndex!])
                                                        ?.customerSkillOptions?[
                                                    skillOptionsIndex])
                                                ?.values,
                                      ),
                                    ),
                                  ),
                              ],
                            );
                          }).divide(SizedBox(height: 8.0)),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ],
      ),
    );
  }
}
