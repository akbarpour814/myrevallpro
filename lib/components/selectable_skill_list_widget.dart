import '/backend/api_requests/api_calls.dart';
import '/components/selectable_box_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'selectable_skill_list_model.dart';
export 'selectable_skill_list_model.dart';

class SelectableSkillListWidget extends StatefulWidget {
  const SelectableSkillListWidget({
    Key? key,
    bool? isMultiple,
    required this.filters,
    this.selectedSkill,
    this.selectedSkillList,
  })  : this.isMultiple = isMultiple ?? false,
        super(key: key);

  final bool isMultiple;
  final String? filters;
  final String? selectedSkill;
  final List<String>? selectedSkillList;

  @override
  _SelectableSkillListWidgetState createState() =>
      _SelectableSkillListWidgetState();
}

class _SelectableSkillListWidgetState extends State<SelectableSkillListWidget> {
  late SelectableSkillListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectableSkillListModel());

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

    return FutureBuilder<ApiCallResponse>(
      future: TaskerpageBackendGroup.getSkillCategoryDetailsCall.call(
        name: widget.filters,
        apiGlobalKey: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primary,
                size: 50.0,
              ),
            ),
          );
        }
        final gridViewGetSkillCategoryDetailsResponse = snapshot.data!;
        return Builder(
          builder: (context) {
            final jsonList = TaskerpageBackendGroup.getSkillCategoryDetailsCall
                    .skills(
                      gridViewGetSkillCategoryDetailsResponse.jsonBody,
                    )
                    ?.toList() ??
                [];
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              scrollDirection: Axis.vertical,
              itemCount: jsonList.length,
              itemBuilder: (context, jsonListIndex) {
                final jsonListItem = jsonList[jsonListIndex];
                return wrapWithModel(
                  model: _model.selectableBoxModels.getModel(
                    getJsonField(
                      jsonListItem,
                      r'''$.skill''',
                    ).toString(),
                    jsonListIndex,
                  ),
                  updateCallback: () => setState(() {}),
                  child: SelectableBoxWidget(
                    key: Key(
                      'Keyy5n_${getJsonField(
                        jsonListItem,
                        r'''$.skill''',
                      ).toString()}',
                    ),
                    label: getJsonField(
                      jsonListItem,
                      r'''$.skill_name''',
                    ).toString(),
                    isActive: widget.isMultiple
                        ? (widget.selectedSkill ==
                            getJsonField(
                              jsonListItem,
                              r'''$.skill''',
                            ))
                        : widget.selectedSkillList!.contains(getJsonField(
                            jsonListItem,
                            r'''$.skill''',
                          ).toString()),
                    value: jsonListItem,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
