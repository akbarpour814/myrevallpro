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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'filter_model.dart';
export 'filter_model.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({
    Key? key,
    required this.action,
  }) : super(key: key);

  final Future<dynamic> Function()? action;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  late FilterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterModel());

    _model.expandableController1 = ExpandableController(initialExpanded: false);
    _model.expandableController2 = ExpandableController(initialExpanded: false);
    _model.expandableController3 = ExpandableController(initialExpanded: false);
    _model.expandableController4 = ExpandableController(initialExpanded: false);
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
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 1.0,
        decoration: BoxDecoration(
          color: Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.close_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 26.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 0.0, 32.0, 0.0),
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(0.0, 0.0),
                                        spreadRadius: 1.0,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 5.0, 16.0, 5.0),
                                    child: Container(
                                      width: double.infinity,
                                      color: Colors.white,
                                      child: ExpandableNotifier(
                                        controller:
                                            _model.expandableController1,
                                        child: ExpandablePanel(
                                          header: Text(
                                            'Location',
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: _model.switchValue1!
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .alternate
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          collapsed: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Divider(
                                                thickness: 1.0,
                                                color: Color(0xFFDEDEDE),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Any',
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
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Switch.adaptive(
                                                        value: _model
                                                                .switchValue1 ??=
                                                            FFAppState()
                                                                    .taskFilter
                                                                    .hasAnyLocation()
                                                                ? FFAppState()
                                                                    .taskFilter
                                                                    .anyLocation
                                                                : true,
                                                        onChanged:
                                                            (newValue) async {
                                                          setState(() => _model
                                                                  .switchValue1 =
                                                              newValue!);
                                                          if (newValue!) {
                                                            setState(() {
                                                              FFAppState()
                                                                  .updateTaskFilterStruct(
                                                                (e) => e
                                                                  ..anyLocation =
                                                                      true
                                                                  ..locationFilter =
                                                                      null,
                                                              );
                                                            });
                                                          } else {
                                                            setState(() {
                                                              FFAppState()
                                                                  .updateTaskFilterStruct(
                                                                (e) => e
                                                                  ..anyLocation =
                                                                      false,
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
                                              if (!_model.switchValue1!)
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 41.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0x005E5D5D),
                                                                  ),
                                                                ),
                                                                child: FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future: FFAppState()
                                                                      .myAddresses(
                                                                    requestFn: () =>
                                                                        TaskerpageBackendGroup
                                                                            .myAddressesCall
                                                                            .call(
                                                                      apiGlobalKey:
                                                                          FFAppState()
                                                                              .apiKey,
                                                                      fields:
                                                                          '[\"name\",\"address\",\"latitude\",\"longitude\"]',
                                                                      filters:
                                                                          '[[\"customer_profile\",\"=\",\"${getJsonField(
                                                                        FFAppState()
                                                                            .userProfile,
                                                                        r'''$.data.name''',
                                                                      ).toString()}\"]]',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              35.0,
                                                                          height:
                                                                              35.0,
                                                                          child:
                                                                              SpinKitThreeBounce(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                35.0,
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
                                                                        _model
                                                                            .dropDownValue1 ??= FFAppState()
                                                                                .taskFilter
                                                                                .locationFilter
                                                                                .hasAddressName()
                                                                            ? FFAppState().taskFilter.locationFilter.addressName.toString()
                                                                            : '',
                                                                      ),
                                                                      options: List<
                                                                              String>.from(
                                                                          functions
                                                                              .jsonListToStringList(getJsonField(
                                                                        dropDownMyAddressesResponse
                                                                            .jsonBody,
                                                                        r'''$.data[:].name''',
                                                                        true,
                                                                      ))!),
                                                                      optionLabels:
                                                                          functions
                                                                              .jsonListToStringList(getJsonField(
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
                                                                        _model.selectedAddress = await TaskerpageBackendGroup
                                                                            .getAddressDetailsCall
                                                                            .call(
                                                                          name:
                                                                              _model.dropDownValue1,
                                                                          apiGlobalKey:
                                                                              FFAppState().apiKey,
                                                                        );
                                                                        _shouldSetState =
                                                                            true;
                                                                        if ((_model.selectedAddress?.succeeded ??
                                                                                true) ==
                                                                            true) {
                                                                          setState(
                                                                              () {
                                                                            FFAppState().updateTaskFilterStruct(
                                                                              (e) => e
                                                                                ..anyLocation = false
                                                                                ..updateLocationFilter(
                                                                                  (e) => e
                                                                                    ..address = TaskerpageBackendGroup.getAddressDetailsCall
                                                                                        .address(
                                                                                          (_model.selectedAddress?.jsonBody ?? ''),
                                                                                        )
                                                                                        .toString()
                                                                                    ..latitude = TaskerpageBackendGroup.getAddressDetailsCall.latitude(
                                                                                      (_model.selectedAddress?.jsonBody ?? ''),
                                                                                    )
                                                                                    ..longitude = TaskerpageBackendGroup.getAddressDetailsCall.longitude(
                                                                                      (_model.selectedAddress?.jsonBody ?? ''),
                                                                                    )
                                                                                    ..radius = _model.sliderValue
                                                                                    ..addressName = TaskerpageBackendGroup.getAddressDetailsCall.name(
                                                                                      (_model.selectedAddress?.jsonBody ?? ''),
                                                                                    ),
                                                                                ),
                                                                            );
                                                                          });
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        } else {
                                                                          if (_shouldSetState)
                                                                            setState(() {});
                                                                          return;
                                                                        }

                                                                        if (_shouldSetState)
                                                                          setState(
                                                                              () {});
                                                                      },
                                                                      width:
                                                                          300.0,
                                                                      height: double
                                                                          .infinity,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lato',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            fontSize:
                                                                                14.0,
                                                                          ),
                                                                      hintText:
                                                                          'Please select...',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .tertiary,
                                                                      borderWidth:
                                                                          0.0,
                                                                      borderRadius:
                                                                          2.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FlutterFlowPlacePicker(
                                                          iOSGoogleMapsApiKey:
                                                              'AIzaSyCgpzFUjgw8UZBnXqMU1RwIXgsyX7BRh30',
                                                          androidGoogleMapsApiKey:
                                                              'AIzaSyDwVp7h1uFnc_P0AZt8hfqC3mXN9ljCT80',
                                                          webGoogleMapsApiKey:
                                                              'AIzaSyCyPQNRa7hLuEHr1tggvht9gV5kK1tHjXI',
                                                          onSelect:
                                                              (place) async {
                                                            setState(() => _model
                                                                    .placePickerValue =
                                                                place);
                                                          },
                                                          defaultText:
                                                              'Select Location',
                                                          icon: Icon(
                                                            Icons.place,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 14.0,
                                                          ),
                                                          buttonOptions:
                                                              FFButtonOptions(
                                                            width: 200.0,
                                                            height: 36.0,
                                                            color: Colors.white,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lato',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Flexible(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        16.0),
                                                            child: AutoSizeText(
                                                              _model.placePickerValue
                                                                          .latLng !=
                                                                      null
                                                                  ? _model
                                                                      .placePickerValue
                                                                      .address
                                                                  : 'pleas choose another place !',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lato',
                                                                    fontSize:
                                                                        15.0,
                                                                  ),
                                                              minFontSize: 12.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                  0.0),
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
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  23.0,
                                                                  24.0,
                                                                  23.0,
                                                                  0.0),
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
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Color(
                                                                      0xFF212121),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            ' To 100 km',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Color(
                                                                      0xFF212121),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Slider(
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      inactiveColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      min: 0.0,
                                                      max: 100.0,
                                                      value:
                                                          _model.sliderValue ??=
                                                              valueOrDefault<
                                                                  double>(
                                                        FFAppState()
                                                            .taskFilter
                                                            .locationFilter
                                                            .radius,
                                                        20.0,
                                                      ),
                                                      divisions: 10,
                                                      onChanged: (newValue) {
                                                        setState(() =>
                                                            _model.sliderValue =
                                                                newValue);
                                                      },
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  8.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            '${_model.sliderValue?.toString()} km',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .displaySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Lato',
                                                                  color: Color(
                                                                      0xFF494949),
                                                                  fontSize:
                                                                      13.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 1.0,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 5.0, 16.0, 5.0),
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
                                                color: _model.switchValue2!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 1.0,
                                              color: Color(0xFFDEDEDE),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Any',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .switchValue2 ??=
                                                          FFAppState()
                                                                  .taskFilter
                                                                  .hasAnySkill()
                                                              ? FFAppState()
                                                                  .taskFilter
                                                                  .anySkill
                                                              : true,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .switchValue2 =
                                                            newValue!);
                                                        if (newValue!) {
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskFilterStruct(
                                                              (e) => e
                                                                ..anySkill =
                                                                    true,
                                                            );
                                                          });
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskFilterStruct(
                                                              (e) => e
                                                                ..anySkill =
                                                                    false
                                                                ..skillFilter =
                                                                    null,
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
                                                                width: 35.0,
                                                                height: 35.0,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 35.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final gridViewServiceCategoryListResponse =
                                                              snapshot.data!;
                                                          return Builder(
                                                            builder: (context) {
                                                              final skillCategoryList =
                                                                  getJsonField(
                                                                gridViewServiceCategoryListResponse
                                                                    .jsonBody,
                                                                r'''$.data''',
                                                              ).toList();
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
                                                                      12.0,
                                                                  mainAxisSpacing:
                                                                      6.0,
                                                                  childAspectRatio:
                                                                      4.7,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    skillCategoryList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        skillCategoryListIndex) {
                                                                  final skillCategoryListItem =
                                                                      skillCategoryList[
                                                                          skillCategoryListIndex];
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
                                                                            .updateTaskFilterStruct(
                                                                          (e) => e
                                                                            ..updateSkillFilter(
                                                                              (e) => e
                                                                                ..skillCategoryName = getJsonField(
                                                                                  skillCategoryListItem,
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
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                        border:
                                                                            Border.all(
                                                                          color: FFAppState().taskFilter.skillFilter.skillCategoryName ==
                                                                                  getJsonField(
                                                                                    skillCategoryListItem,
                                                                                    r'''$.name''',
                                                                                  )
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).secondary,
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
                                                                                skillCategoryListItem,
                                                                                r'''$.name''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 17,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: functions.jsonToString(getJsonField(
                                                                                              skillCategoryListItem,
                                                                                              r'''$.name''',
                                                                                            )) ==
                                                                                            FFAppState().taskFilter.skillFilter.skillCategoryName
                                                                                        ? FlutterFlowTheme.of(context).primary
                                                                                        : FlutterFlowTheme.of(context).secondary,
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
                                            if (!_model.switchValue2!)
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
                                            if (!_model.switchValue2!)
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
                                                                .taskFilter
                                                                .skillFilter
                                                                .skillCategoryName,
                                                            'Gardening',
                                                          )}\"]]',
                                                          fields: '[\"name\"]',
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
                                                                width: 35.0,
                                                                height: 35.0,
                                                                child:
                                                                    SpinKitThreeBounce(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 35.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final gridViewGetServicesResponse =
                                                              snapshot.data!;
                                                          return Builder(
                                                            builder: (context) {
                                                              final skillList =
                                                                  getJsonField(
                                                                gridViewGetServicesResponse
                                                                    .jsonBody,
                                                                r'''$.data''',
                                                              ).toList();
                                                              if (skillList
                                                                  .isEmpty) {
                                                                return EmtyContainerWidget(
                                                                  title:
                                                                      'choos a skill category !',
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
                                                                      12.0,
                                                                  mainAxisSpacing:
                                                                      6.0,
                                                                  childAspectRatio:
                                                                      4.7,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    skillList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        skillListIndex) {
                                                                  final skillListItem =
                                                                      skillList[
                                                                          skillListIndex];
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
                                                                            .updateTaskFilterStruct(
                                                                          (e) => e
                                                                            ..updateSkillFilter(
                                                                              (e) => e
                                                                                ..skillName = getJsonField(
                                                                                  skillListItem,
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
                                                                        color: Colors
                                                                            .white,
                                                                        borderRadius:
                                                                            BorderRadius.circular(2.0),
                                                                        border:
                                                                            Border.all(
                                                                          color: functions.jsonToString(getJsonField(
                                                                                    skillListItem,
                                                                                    r'''$.name''',
                                                                                  )) ==
                                                                                  FFAppState().taskFilter.skillFilter.skillName
                                                                              ? FlutterFlowTheme.of(context).primary
                                                                              : FlutterFlowTheme.of(context).secondary,
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
                                                                                skillListItem,
                                                                                r'''$.name''',
                                                                              ).toString().maybeHandleOverflow(
                                                                                    maxChars: 17,
                                                                                    replacement: '…',
                                                                                  ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Lato',
                                                                                    color: functions.jsonToString(getJsonField(
                                                                                              skillListItem,
                                                                                              r'''$.name''',
                                                                                            )) ==
                                                                                            FFAppState().taskFilter.skillFilter.skillName
                                                                                        ? FlutterFlowTheme.of(context).primary
                                                                                        : FlutterFlowTheme.of(context).secondary,
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
                                                if (!_model.switchValue2!)
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
                                                            final skillLevelList =
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
                                                                  skillLevelList
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          8.0),
                                                              itemBuilder: (context,
                                                                  skillLevelListIndex) {
                                                                final skillLevelListItem =
                                                                    skillLevelList[
                                                                        skillLevelListIndex];
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
                                                                                (e) => e..skillLevel = skillLevelListItem,
                                                                              ),
                                                                          );
                                                                        });
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            217.0,
                                                                        height:
                                                                            38.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x00FFFFFF),
                                                                          borderRadius:
                                                                              BorderRadius.circular(2.0),
                                                                          border:
                                                                              Border.all(
                                                                            color: skillLevelListItem == FFAppState().taskFilter.skillFilter.skillLevel
                                                                                ? FlutterFlowTheme.of(context).primary
                                                                                : FlutterFlowTheme.of(context).secondary,
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
                                                                                skillLevelListItem,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Lato',
                                                                                      color: skillLevelListItem == FFAppState().taskFilter.skillFilter.skillLevel ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).secondary,
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
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 1.0,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 5.0, 16.0, 5.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: ExpandableNotifier(
                                      controller: _model.expandableController3,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'Date',
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Lato',
                                                color: _model.switchValue3!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 1.0,
                                              color: Color(0xFFDEDEDE),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 8.0, 0.0, 24.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Any',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .switchValue3 ??=
                                                          FFAppState()
                                                              .taskFilter
                                                              .anyDate,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .switchValue3 =
                                                            newValue!);
                                                        if (newValue!) {
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskFilterStruct(
                                                              (e) => e
                                                                ..anyDate =
                                                                    true,
                                                            );
                                                          });
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskFilterStruct(
                                                              (e) => e
                                                                ..anyDate =
                                                                    false
                                                                ..dateFilter =
                                                                    null,
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
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
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
                                                      onTap: () async {
                                                        final _datePickedDate =
                                                            await showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              getCurrentTimestamp,
                                                          firstDate:
                                                              getCurrentTimestamp,
                                                          lastDate:
                                                              DateTime(2050),
                                                        );

                                                        if (_datePickedDate !=
                                                            null) {
                                                          safeSetState(() {
                                                            _model.datePicked =
                                                                DateTime(
                                                              _datePickedDate
                                                                  .year,
                                                              _datePickedDate
                                                                  .month,
                                                              _datePickedDate
                                                                  .day,
                                                            );
                                                          });
                                                        }
                                                        setState(() {
                                                          FFAppState()
                                                              .updateTaskFilterStruct(
                                                            (e) => e
                                                              ..dateFilter =
                                                                  _model
                                                                      .datePicked
                                                              ..anyDate = false,
                                                          );
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 41.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      2.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      13.0,
                                                                      0.0,
                                                                      11.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .date_range_rounded,
                                                                      color: Color(
                                                                          0xFF212121),
                                                                      size:
                                                                          19.0,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                          'yMMMd',
                                                                          _model
                                                                              .datePicked),
                                                                      'select date',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Lato',
                                                                          color:
                                                                              Color(0xFF3D3D3D),
                                                                          fontSize:
                                                                              12.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF6F6F6),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Container(
                                width: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 0.0),
                                      spreadRadius: 1.0,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 5.0, 16.0, 5.0),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: ExpandableNotifier(
                                      controller: _model.expandableController4,
                                      child: ExpandablePanel(
                                        header: Text(
                                          'Tasker type',
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                                fontFamily: 'Lato',
                                                color: _model.switchValue4!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Divider(
                                              thickness: 1.0,
                                              color: Color(0xFFDEDEDE),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Any tasker',
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, 0.00),
                                                    child: Switch.adaptive(
                                                      value: _model
                                                              .switchValue4 ??=
                                                          FFAppState()
                                                              .taskFilter
                                                              .anytasker,
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                .switchValue4 =
                                                            newValue!);
                                                        if (newValue!) {
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskFilterStruct(
                                                              (e) => e
                                                                ..anytasker =
                                                                    true
                                                                ..taskerTypeFilter =
                                                                    null,
                                                            );
                                                          });
                                                        } else {
                                                          setState(() {
                                                            FFAppState()
                                                                .updateTaskFilterStruct(
                                                              (e) => e
                                                                ..anytasker =
                                                                    false,
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
                                            if (!_model.switchValue4!)
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
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
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Color(
                                                                    0xFF292929),
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
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
                                                            onChanged:
                                                                (val) async {
                                                              setState(() {});
                                                              setState(() {
                                                                FFAppState()
                                                                    .updateTaskFilterStruct(
                                                                  (e) => e
                                                                    ..updateTaskerTypeFilter(
                                                                      (e) => e
                                                                        ..gender = _model.radioButtonValue1 ==
                                                                                'any'
                                                                            ? ''
                                                                            : _model.radioButtonValue1,
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
                                                                        .gender),
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
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            inactiveRadioButtonColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            toggleable: false,
                                                            horizontalAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
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
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Color(
                                                                    0xFF292929),
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              FlutterFlowRadioButton(
                                                            options: [
                                                              '<20',
                                                              '20-40',
                                                              '40>',
                                                              'Dosn\'t matter'
                                                            ].toList(),
                                                            onChanged:
                                                                (val) async {
                                                              setState(() {});
                                                              setState(() {
                                                                FFAppState()
                                                                    .updateTaskFilterStruct(
                                                                  (e) => e
                                                                    ..updateTaskerTypeFilter(
                                                                      (e) => e
                                                                        ..ageRange = _model.radioButtonValue2 ==
                                                                                'Dosn\'t matter'
                                                                            ? ''
                                                                            : _model.radioButtonValue2,
                                                                    ),
                                                                );
                                                              });
                                                            },
                                                            controller: _model
                                                                    .radioButtonValueController2 ??=
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
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            inactiveRadioButtonColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            toggleable: false,
                                                            horizontalAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 25.0,
                                                                0.0, 0.0),
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
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Color(
                                                                    0xFF292929),
                                                                fontSize: 15.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
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
                                                                        .taskFilter
                                                                        .taskerTypeFilter
                                                                        .languages,
                                                              ),
                                                              options: [
                                                                'En',
                                                                'De'
                                                              ],
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                              borderWidth: 0.0,
                                                              borderRadius: 2.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
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
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Insurance',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Color(
                                                                    0xFF292929),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child:
                                                              Switch.adaptive(
                                                            value: _model
                                                                    .switchValue5 ??=
                                                                FFAppState()
                                                                    .taskFilter
                                                                    .taskerTypeFilter
                                                                    .hasInsurance,
                                                            onChanged:
                                                                (newValue) async {
                                                              setState(() =>
                                                                  _model.switchValue5 =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .updateTaskFilterStruct(
                                                                    (e) => e
                                                                      ..updateTaskerTypeFilter(
                                                                        (e) => e
                                                                          ..hasInsurance =
                                                                              true,
                                                                      ),
                                                                  );
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .updateTaskFilterStruct(
                                                                    (e) => e
                                                                      ..updateTaskerTypeFilter(
                                                                        (e) => e
                                                                          ..hasInsurance =
                                                                              !true,
                                                                      ),
                                                                  );
                                                                });
                                                              }
                                                            },
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            activeTrackColor:
                                                                Color(
                                                                    0xFFFAD1C6),
                                                            inactiveTrackColor:
                                                                Color(
                                                                    0xFFECECEC),
                                                            inactiveThumbColor:
                                                                Color(
                                                                    0xFF3D3D3D),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
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
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Color(
                                                                    0xFF292929),
                                                                fontSize: 14.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.00, 0.00),
                                                          child:
                                                              Switch.adaptive(
                                                            value: _model
                                                                    .switchValue6 ??=
                                                                FFAppState()
                                                                    .taskFilter
                                                                    .taskerTypeFilter
                                                                    .hasIdentification,
                                                            onChanged:
                                                                (newValue) async {
                                                              setState(() =>
                                                                  _model.switchValue6 =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .updateTaskFilterStruct(
                                                                    (e) => e
                                                                      ..updateTaskerTypeFilter(
                                                                        (e) => e
                                                                          ..hasIdentification =
                                                                              true,
                                                                      ),
                                                                  );
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .updateTaskFilterStruct(
                                                                    (e) => e
                                                                      ..updateTaskerTypeFilter(
                                                                        (e) => e
                                                                          ..hasIdentification =
                                                                              false,
                                                                      ),
                                                                  );
                                                                });
                                                              }
                                                            },
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            activeTrackColor:
                                                                Color(
                                                                    0xFFFAD1C6),
                                                            inactiveTrackColor:
                                                                Color(
                                                                    0xFFECECEC),
                                                            inactiveThumbColor:
                                                                Color(
                                                                    0xFF3D3D3D),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 0.0),
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
                                                                fontFamily:
                                                                    'Lato',
                                                                color: Color(
                                                                    0xFF212121),
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child:
                                                                FlutterFlowRadioButton(
                                                              options: [
                                                                'Car',
                                                                'Truck',
                                                                'any'
                                                              ].toList(),
                                                              onChanged:
                                                                  (val) async {
                                                                setState(() {});
                                                                setState(() {
                                                                  FFAppState()
                                                                      .updateTaskFilterStruct(
                                                                    (e) => e
                                                                      ..updateTaskerTypeFilter(
                                                                        (e) => e
                                                                          ..driverLicense = _model.radioButtonValue3 == 'any'
                                                                              ? ''
                                                                              : _model.radioButtonValue3,
                                                                      ),
                                                                  );
                                                                });
                                                              },
                                                              controller: _model
                                                                  .radioButtonValueController3 ??= FormFieldController<
                                                                      String>(
                                                                  FFAppState()
                                                                      .taskFilter
                                                                      .taskerTypeFilter
                                                                      .driverLicense),
                                                              optionHeight:
                                                                  35.0,
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
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              inactiveRadioButtonColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              toggleable: false,
                                                              horizontalAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                            ),
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
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 0.0),
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 5.0, 16.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Open tasks only',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: _model.switchValue7!
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.00, 0.00),
                                  child: Switch.adaptive(
                                    value: _model.switchValue7 ??=
                                        FFAppState().taskFilter.onlyOpen,
                                    onChanged: (newValue) async {
                                      setState(() =>
                                          _model.switchValue7 = newValue!);
                                      if (newValue!) {
                                        setState(() {
                                          FFAppState().updateTaskFilterStruct(
                                            (e) => e..onlyOpen = true,
                                          );
                                        });
                                      } else {
                                        setState(() {
                                          FFAppState().updateTaskFilterStruct(
                                            (e) => e..onlyOpen = false,
                                          );
                                        });
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor: Color(0xFFFAD1C6),
                                    inactiveTrackColor: Color(0xFFECECEC),
                                    inactiveThumbColor: Color(0xFF3D3D3D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 0.0),
                        spreadRadius: 2.0,
                      )
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().updateTaskFilterStruct(
                                (e) => e
                                  ..updateTaskerTypeFilter(
                                    (e) => e
                                      ..languages = _model.dropDownValue2
                                      ..hasInsurance = _model.switchValue5
                                      ..hasIdentification = _model.switchValue6,
                                  )
                                  ..anyLocation = _model.switchValue1
                                  ..anyDate = _model.switchValue3
                                  ..anyTaskerGender = _model.switchValue4
                                  ..onlyOpen = _model.switchValue7,
                              );
                            });
                            if (_model.placePickerValue != null) {
                              setState(() {
                                FFAppState().updateTaskFilterStruct(
                                  (e) => e
                                    ..updateLocationFilter(
                                      (e) => e
                                        ..latLng =
                                            _model.placePickerValue.latLng
                                        ..address =
                                            _model.placePickerValue.address
                                        ..radius = _model.sliderValue,
                                    ),
                                );
                              });
                            }
                            _model.updatePage(() {
                              FFAppState().taskSearchString =
                                  functions.convertDataTypeToFilter(
                                      FFAppState().taskFilter)!;
                            });
                            await widget.action?.call();
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 123.0,
                            height: 36.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(1.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Apply Filters',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().update(() {
                              FFAppState().taskFilter =
                                  FilterStruct.fromSerializableMap(jsonDecode(
                                      '{\"anyLocation\":\"true\",\"anySkill\":\"true\",\"anyDate\":\"true\",\"anyTaskerGender\":\"true\",\"onlyOpen\":\"true\",\"anytasker\":\"true\"}'));
                              FFAppState().taskSearchString = '[]';
                            });
                            await widget.action?.call();
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Clear',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Lato',
                                  fontSize: 14.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
