import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/emty_container_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tasker_filter_model.dart';
export 'tasker_filter_model.dart';

class TaskerFilterWidget extends StatefulWidget {
  const TaskerFilterWidget({
    Key? key,
    required this.action,
  }) : super(key: key);

  final Future<dynamic> Function()? action;

  @override
  _TaskerFilterWidgetState createState() => _TaskerFilterWidgetState();
}

class _TaskerFilterWidgetState extends State<TaskerFilterWidget> {
  late TaskerFilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskerFilterModel());

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
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

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.9,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(2.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 124.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 32.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 5.0, 0.0),
                                  child: Icon(
                                    Icons.filter_list,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 21.0,
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.updatePage(() {
                                      FFAppState().updateTaskerFilterStruct(
                                        (e) => e
                                          ..updateTaskerTypeFilter(
                                            (e) => e
                                              ..hasInsurance =
                                                  _model.switchValue4
                                              ..hasIdentification =
                                                  _model.switchValue5
                                              ..languages =
                                                  _model.dropDownValue2,
                                          )
                                          ..updateLocationFilter(
                                            (e) =>
                                                e..radius = _model.sliderValue,
                                          ),
                                      );
                                    });
                                    if (_model.placePickerValue.latLng !=
                                        null) {
                                      _model.updatePage(() {
                                        FFAppState().updateTaskerFilterStruct(
                                          (e) => e
                                            ..anyLocation = _model.switchValue1
                                            ..updateLocationFilter(
                                              (e) => e
                                                ..latLng = _model
                                                    .placePickerValue.latLng
                                                ..address = _model
                                                    .placePickerValue.address,
                                            ),
                                        );
                                      });
                                    }
                                    _model.customerProfileName =
                                        await TaskerpageBackendGroup
                                            .customerProfileSkillsListCall
                                            .call(
                                      filters: functions
                                          .convertDataTypeToTaskerSkillFilter(
                                              FFAppState()
                                                  .taskerFilter
                                                  .skillFilter),
                                      fields: '[\"customer_profile\"]',
                                      apiGlobalKey: FFAppState().apiKey,
                                    );
                                    if ((_model
                                            .customerProfileName?.succeeded ??
                                        true)) {
                                      _model.updatePage(() {
                                        FFAppState().updateTaskerFilterStruct(
                                          (e) => e
                                            ..names = functions
                                                .jsonListToStringList(
                                                    TaskerpageBackendGroup
                                                        .customerProfileSkillsListCall
                                                        .customerProfileList(
                                                          (_model.customerProfileName
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )
                                                        ?.toList())!
                                                .toList(),
                                        );
                                      });
                                    }
                                    Navigator.pop(
                                        context, FFAppState().taskerFilter);
                                    await widget.action?.call();

                                    setState(() {});
                                  },
                                  child: Text(
                                    'Apply Filter',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: Colors.black,
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().update(() {
                                  FFAppState().taskerFilter = TaskerFilterStruct
                                      .fromSerializableMap(jsonDecode(
                                          '{\"anyLocation\":\"true\",\"anySkill\":\"true\",\"anyTaskerGender\":\"true\",\"names\":\"[]\",\"anytasker\":\"true\"}'));
                                });
                                Navigator.pop(context);
                                await widget.action?.call();
                              },
                              child: Text(
                                'Clear All',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      color: Color(0xFFE23C12),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 48.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFACABAB),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: ExpandableNotifier(
                                  controller: _model.expandableController1,
                                  child: ExpandablePanel(
                                    header: Text(
                                      'Location',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF5450E2),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    collapsed: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Any',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              Color(0xFF292929),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Switch.adaptive(
                                                  value: _model.switchValue1 ??=
                                                      FFAppState()
                                                          .taskerFilter
                                                          .anyLocation,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.switchValue1 =
                                                            newValue!);
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  activeTrackColor:
                                                      Color(0xFFFAD1C6),
                                                  inactiveTrackColor:
                                                      Color(0xFFECECEC),
                                                  inactiveThumbColor:
                                                      Color(0xFF3D3D3D),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!_model.switchValue1!)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {},
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 41.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            border: Border.all(
                                                              color: Color(
                                                                  0xFF5E5D5D),
                                                            ),
                                                          ),
                                                          child: FutureBuilder<
                                                              ApiCallResponse>(
                                                            future: TaskerpageBackendGroup
                                                                .myAddressesCall
                                                                .call(
                                                              fields:
                                                                  '[\"name\",\"latitude\",\"longitude\",\"address\"]',
                                                              filters:
                                                                  '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                                FFAppState()
                                                                    .userProfile,
                                                                r'''$.data.name''',
                                                              ).toString()}\"]]',
                                                              apiGlobalKey:
                                                                  FFAppState()
                                                                      .apiKey,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitThreeBounce(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final dropDownMyAddressesResponse =
                                                                  snapshot
                                                                      .data!;
                                                              return FlutterFlowDropDown<
                                                                  String>(
                                                                controller: _model
                                                                        .dropDownValueController1 ??=
                                                                    FormFieldController<
                                                                        String>(
                                                                  _model.dropDownValue1 ??= FFAppState()
                                                                      .taskerFilter
                                                                      .locationFilter
                                                                      .addressName
                                                                      .toString(),
                                                                ),
                                                                options: List<
                                                                        String>.from(
                                                                    functions
                                                                        .jsonListToStringList(
                                                                            getJsonField(
                                                                  dropDownMyAddressesResponse
                                                                      .jsonBody,
                                                                  r'''$.data[:].name''',
                                                                  true,
                                                                ))!),
                                                                optionLabels: functions
                                                                    .jsonListToStringList(
                                                                        getJsonField(
                                                                  dropDownMyAddressesResponse
                                                                      .jsonBody,
                                                                  r'''$.data[:].address''',
                                                                  true,
                                                                ))!,
                                                                onChanged:
                                                                    (val) async {
                                                                  setState(() =>
                                                                      _model.dropDownValue1 =
                                                                          val);
                                                                  var _shouldSetState =
                                                                      false;
                                                                  _model.addressDetails =
                                                                      await TaskerpageBackendGroup
                                                                          .getAddressDetailsCall
                                                                          .call(
                                                                    name: _model
                                                                        .dropDownValue1,
                                                                    apiGlobalKey:
                                                                        FFAppState()
                                                                            .apiKey,
                                                                  );
                                                                  _shouldSetState =
                                                                      true;
                                                                  if ((_model
                                                                          .addressDetails
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .updateTaskerFilterStruct(
                                                                        (e) => e
                                                                          ..anyLocation =
                                                                              false
                                                                          ..updateLocationFilter(
                                                                            (e) => e
                                                                              ..addressName = TaskerpageBackendGroup.getAddressDetailsCall.longitude(
                                                                                (_model.addressDetails?.jsonBody ?? ''),
                                                                              )
                                                                              ..latitude = TaskerpageBackendGroup.getAddressDetailsCall.latitude(
                                                                                (_model.addressDetails?.jsonBody ?? ''),
                                                                              )
                                                                              ..longitude = TaskerpageBackendGroup.getAddressDetailsCall.longitude(
                                                                                (_model.addressDetails?.jsonBody ?? ''),
                                                                              )
                                                                              ..address = TaskerpageBackendGroup.getAddressDetailsCall
                                                                                  .address(
                                                                                    (_model.addressDetails?.jsonBody ?? ''),
                                                                                  )
                                                                                  .toString(),
                                                                          ),
                                                                      );
                                                                    });
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      setState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  if (_shouldSetState)
                                                                    setState(
                                                                        () {});
                                                                },
                                                                width: 300.0,
                                                                height: 50.0,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                hintText:
                                                                    'Please select...',
                                                                icon: Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                borderWidth:
                                                                    2.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isSearchable:
                                                                    false,
                                                                isMultiSelect:
                                                                    false,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    FlutterFlowPlacePicker(
                                                      iOSGoogleMapsApiKey:
                                                          'AIzaSyCgpzFUjgw8UZBnXqMU1RwIXgsyX7BRh30',
                                                      androidGoogleMapsApiKey:
                                                          'AIzaSyDwVp7h1uFnc_P0AZt8hfqC3mXN9ljCT80',
                                                      webGoogleMapsApiKey:
                                                          'AIzaSyCyPQNRa7hLuEHr1tggvht9gV5kK1tHjXI',
                                                      onSelect: (place) async {
                                                        setState(() => _model
                                                                .placePickerValue =
                                                            place);
                                                      },
                                                      defaultText:
                                                          'Select Location',
                                                      icon: Icon(
                                                        Icons.place,
                                                        color:
                                                            Color(0xFF5450E2),
                                                        size: 16.0,
                                                      ),
                                                      buttonOptions:
                                                          FFButtonOptions(
                                                        width: 200.0,
                                                        height: 40.0,
                                                        color: Colors.white,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Color(
                                                                      0xFF5450E2),
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFF5450E2),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Text(
                                                  _model
                                                      .placePickerValue.address,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        fontSize: 15.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Distance',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF212121),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        23.0, 20.0, 23.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'From 0 km',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF212121),
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Text(
                                                      ' To 100 km',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF212121),
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Slider(
                                                activeColor: Color(0xFF5450E2),
                                                inactiveColor:
                                                    Color(0xFFADB5FC),
                                                min: 0.0,
                                                max: 100.0,
                                                value: _model.sliderValue ??=
                                                    FFAppState()
                                                        .taskerFilter
                                                        .locationFilter
                                                        .radius,
                                                divisions: 10,
                                                onChanged: (newValue) {
                                                  setState(() => _model
                                                      .sliderValue = newValue);
                                                },
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${_model.sliderValue?.toString()} km',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              Color(0xFF494949),
                                                          fontSize: 13.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 40.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFACABAB),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: ExpandableNotifier(
                                  controller: _model.expandableController2,
                                  child: ExpandablePanel(
                                    header: Text(
                                      'Category',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF5450E2),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    collapsed: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Any',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              Color(0xFF292929),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Switch.adaptive(
                                                  value: _model.switchValue2 ??=
                                                      FFAppState()
                                                          .taskerFilter
                                                          .anySkill,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.switchValue2 =
                                                            newValue!);
                                                    if (newValue!) {
                                                      setState(() {
                                                        FFAppState()
                                                            .updateTaskerFilterStruct(
                                                          (e) => e
                                                            ..anySkill = true,
                                                        );
                                                      });
                                                    } else {
                                                      setState(() {
                                                        FFAppState()
                                                            .updateTaskerFilterStruct(
                                                          (e) => e
                                                            ..anySkill = false,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  activeTrackColor:
                                                      Color(0xFFFAD1C6),
                                                  inactiveTrackColor:
                                                      Color(0xFFECECEC),
                                                  inactiveThumbColor:
                                                      Color(0xFF3D3D3D),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!_model.switchValue2!)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future: TaskerpageBackendGroup
                                                            .serviceCategoryListCall
                                                            .call(
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final gridViewServiceCategoryListResponse =
                                                              snapshot.data!;
                                                          return Builder(
                                                            builder: (context) {
                                                              final serviceCategoryList =
                                                                  TaskerpageBackendGroup
                                                                          .serviceCategoryListCall
                                                                          .serviceCategoryList(
                                                                            gridViewServiceCategoryListResponse.jsonBody,
                                                                          )
                                                                          ?.toList() ??
                                                                      [];
                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      16.0,
                                                                  mainAxisSpacing:
                                                                      8.0,
                                                                  childAspectRatio:
                                                                      4.7,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    serviceCategoryList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        serviceCategoryListIndex) {
                                                                  final serviceCategoryListItem =
                                                                      serviceCategoryList[
                                                                          serviceCategoryListIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .updateTaskerFilterStruct(
                                                                          (e) => e
                                                                            ..anySkill =
                                                                                false
                                                                            ..updateSkillFilter(
                                                                              (e) => e
                                                                                ..skillCategoryName = getJsonField(
                                                                                  serviceCategoryListItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                            ),
                                                                        );
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FFAppState().taskerFilter.skillFilter.skillCategoryName ==
                                                                                getJsonField(
                                                                                  serviceCategoryListItem,
                                                                                  r'''$.name''',
                                                                                )
                                                                            ? Color(0xFF5450E2)
                                                                            : Color(0x00FFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        border:
                                                                            Border.all(
                                                                          color: FFAppState().taskerFilter.skillFilter.skillCategoryName ==
                                                                                  getJsonField(
                                                                                    serviceCategoryListItem,
                                                                                    r'''$.name''',
                                                                                  )
                                                                              ? Color(0xFF5450E2)
                                                                              : Color(0xFF5E5D5D),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                serviceCategoryListItem,
                                                                                r'''$.name''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 17,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FFAppState().taskerFilter.skillFilter.skillCategoryName ==
                                                                                            getJsonField(
                                                                                              serviceCategoryListItem,
                                                                                              r'''$.name''',
                                                                                            )
                                                                                        ? Colors.white
                                                                                        : Color(0xFF5E5D5D),
                                                                                    fontSize: 13.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Skills',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .displaySmall
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Colors.black,
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 24.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: FutureBuilder<
                                                          ApiCallResponse>(
                                                        future:
                                                            TaskerpageBackendGroup
                                                                .getServicesCall
                                                                .call(
                                                          category:
                                                              '[[\"skill_category_name\",\"=\",\"${valueOrDefault<String>(
                                                            FFAppState()
                                                                .taskerFilter
                                                                .skillFilter
                                                                .skillCategoryName,
                                                            'Gardening',
                                                          )}\"]]',
                                                          fields:
                                                              '[\"name\",\"skill_name\"]',
                                                          apiGlobalKey:
                                                              FFAppState()
                                                                  .apiKey,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final gridViewGetServicesResponse =
                                                              snapshot.data!;
                                                          return Builder(
                                                            builder: (context) {
                                                              final servicesList =
                                                                  getJsonField(
                                                                gridViewGetServicesResponse
                                                                    .jsonBody,
                                                                r'''$.data''',
                                                              ).toList();
                                                              if (servicesList
                                                                  .isEmpty) {
                                                                return EmtyContainerWidget(
                                                                  title:
                                                                      'Choose skill category !',
                                                                  goTo:
                                                                      () async {},
                                                                );
                                                              }
                                                              return GridView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      2,
                                                                  crossAxisSpacing:
                                                                      16.0,
                                                                  mainAxisSpacing:
                                                                      8.0,
                                                                  childAspectRatio:
                                                                      4.7,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    servicesList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        servicesListIndex) {
                                                                  final servicesListItem =
                                                                      servicesList[
                                                                          servicesListIndex];
                                                                  return InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        FFAppState()
                                                                            .updateTaskerFilterStruct(
                                                                          (e) => e
                                                                            ..updateSkillFilter(
                                                                              (e) => e
                                                                                ..skillName = getJsonField(
                                                                                  servicesListItem,
                                                                                  r'''$.name''',
                                                                                ).toString(),
                                                                            ),
                                                                        );
                                                                      });
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FFAppState().taskerFilter.skillFilter.skillName ==
                                                                                getJsonField(
                                                                                  servicesListItem,
                                                                                  r'''$.name''',
                                                                                )
                                                                            ? Color(0xFF5450E2)
                                                                            : Color(0x00FFFFFF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        border:
                                                                            Border.all(
                                                                          color: FFAppState().taskerFilter.skillFilter.skillName ==
                                                                                  getJsonField(
                                                                                    servicesListItem,
                                                                                    r'''$.name''',
                                                                                  )
                                                                              ? Color(0xFF5450E2)
                                                                              : Color(0xFF5E5D5D),
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              getJsonField(
                                                                                servicesListItem,
                                                                                r'''$.skill_name''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 17,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: FFAppState().taskerFilter.skillFilter.skillName ==
                                                                                            getJsonField(
                                                                                              servicesListItem,
                                                                                              r'''$.name''',
                                                                                            )
                                                                                        ? Colors.white
                                                                                        : Color(0xFF5E5D5D),
                                                                                    fontSize: 13.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              ListView(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Garden Care Skill level',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    24.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final skillLevelsList =
                                                                functions
                                                                    .returnSkillLevelEnums()
                                                                    .toList();
                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  skillLevelsList
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          8.0),
                                                              itemBuilder: (context,
                                                                  skillLevelsListIndex) {
                                                                final skillLevelsListItem =
                                                                    skillLevelsList[
                                                                        skillLevelsListIndex];
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          FFAppState()
                                                                              .updateTaskFilterStruct(
                                                                            (e) => e
                                                                              ..updateSkillFilter(
                                                                                (e) => e..skillLevel = skillLevelsListItem,
                                                                              ),
                                                                          );
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            217.0,
                                                                        height:
                                                                            36.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color: skillLevelsListItem == FFAppState().taskFilter.skillFilter.skillLevel
                                                                              ? Color(0xFF5450E2)
                                                                              : Color(0x00FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color: skillLevelsListItem == FFAppState().taskFilter.skillFilter.skillLevel
                                                                                ? Color(0x005450E2)
                                                                                : Color(0xFF5450E2),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              15.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                skillLevelsListItem,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: skillLevelsListItem == FFAppState().taskFilter.skillFilter.skillLevel ? Colors.white : Color(0xFF5E5D5D),
                                                                                      fontSize: 13.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 40.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFACABAB),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                color: Colors.white,
                                child: ExpandableNotifier(
                                  controller: _model.expandableController3,
                                  child: ExpandablePanel(
                                    header: Text(
                                      'Tasker type',
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Color(0xFF5450E2),
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    collapsed: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    expanded: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Any tasker',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Lato',
                                                          color:
                                                              Color(0xFF292929),
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.00, 0.00),
                                                child: Switch.adaptive(
                                                  value: _model.switchValue3 ??=
                                                      FFAppState()
                                                          .taskerFilter
                                                          .anytasker,
                                                  onChanged: (newValue) async {
                                                    setState(() =>
                                                        _model.switchValue3 =
                                                            newValue!);
                                                    if (newValue!) {
                                                      setState(() {
                                                        FFAppState()
                                                            .updateTaskerFilterStruct(
                                                          (e) => e
                                                            ..anytasker = true,
                                                        );
                                                      });
                                                    } else {
                                                      setState(() {
                                                        FFAppState()
                                                            .updateTaskerFilterStruct(
                                                          (e) => e
                                                            ..anytasker = false,
                                                        );
                                                      });
                                                    }
                                                  },
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  activeTrackColor:
                                                      Color(0xFFFAD1C6),
                                                  inactiveTrackColor:
                                                      Color(0xFFECECEC),
                                                  inactiveThumbColor:
                                                      Color(0xFF3D3D3D),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (!_model.switchValue3!)
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 25.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Tasker gender',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF292929),
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          FlutterFlowRadioButton(
                                                        options: [
                                                          'Male',
                                                          'Female',
                                                          'any'
                                                        ].toList(),
                                                        onChanged: (val) async {
                                                          setState(() {});
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskerFilterStruct(
                                                              (e) => e
                                                                ..updateTaskerTypeFilter(
                                                                  (e) => e
                                                                    ..gender = _model.radioButtonValue1 ==
                                                                            'any'
                                                                        ? ''
                                                                        : _model
                                                                            .radioButtonValue1,
                                                                ),
                                                            );
                                                          });
                                                        },
                                                        controller: _model
                                                                .radioButtonValueController1 ??=
                                                            FormFieldController<
                                                                    String>(
                                                                FFAppState()
                                                                    .taskFilter
                                                                    .taskerTypeFilter
                                                                    .ageRange),
                                                        optionHeight: 35.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        buttonPosition:
                                                            RadioButtonPosition
                                                                .left,
                                                        direction:
                                                            Axis.vertical,
                                                        radioButtonColor:
                                                            Color(0xFF211DAF),
                                                        inactiveRadioButtonColor:
                                                            Color(0xFF3D3D3D),
                                                        toggleable: false,
                                                        horizontalAlignment:
                                                            WrapAlignment.start,
                                                        verticalAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 25.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Tasker age',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF292929),
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          FlutterFlowRadioButton(
                                                        options: [
                                                          '<20',
                                                          '20 - 40',
                                                          '40>',
                                                          'Dosn\'t matter'
                                                        ].toList(),
                                                        onChanged: (val) async {
                                                          setState(() {});
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskerFilterStruct(
                                                              (e) => e
                                                                ..updateTaskerTypeFilter(
                                                                  (e) => e
                                                                    ..ageRange = _model.radioButtonValue2 ==
                                                                            'Dosn\'t matter'
                                                                        ? ''
                                                                        : _model
                                                                            .radioButtonValue2,
                                                                ),
                                                            );
                                                          });
                                                        },
                                                        controller: _model
                                                                .radioButtonValueController2 ??=
                                                            FormFieldController<
                                                                    String>(
                                                                FFAppState()
                                                                    .taskerFilter
                                                                    .taskerTypeFilter
                                                                    .ageRange),
                                                        optionHeight: 35.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        buttonPosition:
                                                            RadioButtonPosition
                                                                .left,
                                                        direction:
                                                            Axis.vertical,
                                                        radioButtonColor:
                                                            Color(0xFF211DAF),
                                                        inactiveRadioButtonColor:
                                                            Color(0xFF3D3D3D),
                                                        toggleable: false,
                                                        horizontalAlignment:
                                                            WrapAlignment.start,
                                                        verticalAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Languages',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF292929),
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 10.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    1.0,
                                                                    0.0,
                                                                    1.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownValueController2 ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.dropDownValue2 ??=
                                                                FFAppState()
                                                                    .taskerFilter
                                                                    .taskerTypeFilter
                                                                    .languages,
                                                          ),
                                                          options: ['En', 'De'],
                                                          onChanged: (val) =>
                                                              setState(() =>
                                                                  _model.dropDownValue2 =
                                                                      val),
                                                          width: 300.0,
                                                          height: 41.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    color: Color(
                                                                        0xFF5E5D5D),
                                                                    fontSize:
                                                                        13.0,
                                                                  ),
                                                          hintText:
                                                              'Please select...',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              Color(0xFF5E5D5D),
                                                          borderWidth: 0.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      4.0,
                                                                      16.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Identified',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF292929),
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .switchValue4 ??=
                                                            FFAppState()
                                                                .taskerFilter
                                                                .taskerTypeFilter
                                                                .hasIdentification,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .switchValue4 =
                                                              newValue!);
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        activeTrackColor:
                                                            Color(0xFFFAD1C6),
                                                        inactiveTrackColor:
                                                            Color(0xFFECECEC),
                                                        inactiveThumbColor:
                                                            Color(0xFF3D3D3D),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Insured',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF292929),
                                                            fontSize: 14.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .switchValue5 ??=
                                                            FFAppState()
                                                                .taskerFilter
                                                                .taskerTypeFilter
                                                                .hasInsurance,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .switchValue5 =
                                                              newValue!);
                                                        },
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        activeTrackColor:
                                                            Color(0xFFFAD1C6),
                                                        inactiveTrackColor:
                                                            Color(0xFFECECEC),
                                                        inactiveThumbColor:
                                                            Color(0xFF3D3D3D),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 24.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Driver‘s license',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: Color(
                                                                0xFF212121),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child:
                                                          FlutterFlowRadioButton(
                                                        options: [
                                                          'Car',
                                                          'Truck',
                                                          'any'
                                                        ].toList(),
                                                        onChanged: (val) async {
                                                          setState(() {});
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskerFilterStruct(
                                                              (e) => e
                                                                ..updateTaskerTypeFilter(
                                                                  (e) => e
                                                                    ..driverLicense = _model.radioButtonValue3 ==
                                                                            'any'
                                                                        ? ''
                                                                        : _model
                                                                            .radioButtonValue3,
                                                                ),
                                                            );
                                                          });
                                                        },
                                                        controller: _model
                                                                .radioButtonValueController3 ??=
                                                            FormFieldController<
                                                                    String>(
                                                                FFAppState()
                                                                    .taskerFilter
                                                                    .taskerTypeFilter
                                                                    .driverLicense),
                                                        optionHeight: 35.0,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        buttonPosition:
                                                            RadioButtonPosition
                                                                .left,
                                                        direction:
                                                            Axis.vertical,
                                                        radioButtonColor:
                                                            Color(0xFF211DAF),
                                                        inactiveRadioButtonColor:
                                                            Color(0xFF3D3D3D),
                                                        toggleable: false,
                                                        horizontalAlignment:
                                                            WrapAlignment.start,
                                                        verticalAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    theme: ExpandableThemeData(
                                      tapHeaderToExpand: true,
                                      tapBodyToExpand: false,
                                      tapBodyToCollapse: false,
                                      headerAlignment:
                                          ExpandablePanelHeaderAlignment.center,
                                      hasIcon: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 40.0,
                        indent: 32.0,
                        endIndent: 32.0,
                        color: Color(0xFFACABAB),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
