import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/ad_card_widget.dart';
import '/components/filter_header_widget.dart';
import '/components/main_drawer_widget.dart';
import '/components/tasker_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/search/tasker_filter/tasker_filter_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tasker_list_model.dart';
export 'tasker_list_model.dart';

class TaskerListWidget extends StatefulWidget {
  const TaskerListWidget({Key? key}) : super(key: key);

  @override
  _TaskerListWidgetState createState() => _TaskerListWidgetState();
}

class _TaskerListWidgetState extends State<TaskerListWidget>
    with TickerProviderStateMixin {
  late TaskerListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, -5.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskerListModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitThreeBounce(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFF2F2F2),
        endDrawer: Container(
          width: double.infinity,
          child: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.mainDrawerModel,
              updateCallback: () => setState(() {}),
              child: MainDrawerWidget(),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: wrapWithModel(
                      model: _model.filterHeaderModel,
                      updateCallback: () => setState(() {}),
                      child: Hero(
                        tag: 'filterHeader',
                        transitionOnUserGestures: true,
                        child: Material(
                          color: Colors.transparent,
                          child: FilterHeaderWidget(
                            taskORtasker: 'Tasker',
                            filterAction: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: TaskerFilterWidget(
                                        action: () async {
                                          setState(() => _model
                                              .apiRequestCompleter1 = null);
                                          await _model
                                              .waitForApiRequestCompleted1();
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(
                                  () => _model.updatedTaskerFilter = value));

                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (FFAppState().SortViewTasker)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F6F6),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              32.0, 0.0, 0.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'All',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'Date',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'Relevance',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  'Price',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lato',
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 32.0, 0.0),
                                  child: Text(
                                    'Open task only',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lato',
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 32.0)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    .animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!)
                    .animateOnActionTrigger(
                      animationsMap['rowOnActionTriggerAnimation']!,
                    ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 20.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter1 ??=
                            Completer<ApiCallResponse>()
                              ..complete(TaskerpageBackendGroup
                                  .customerProfileListCall
                                  .call(
                                filters: valueOrDefault<String>(
                                  functions.convertDataTypeToTaskerFilter(
                                      FFAppState().taskerFilter),
                                  '[]',
                                ),
                                apiGlobalKey: FFAppState().apiKey,
                                fields:
                                    '[\"city\",\"country\",\"name\",\"creation\",\"date_of_birth\",\"first_name\",\"last_name\",\"review_average\",\"review_count\",\"avatar\",\"latitude\",\"longitude\"]',
                                orderBy: () {
                                  if (FFAppState().Sort == 'Oldest') {
                                    return 'creation asc';
                                  } else if (FFAppState().Sort == 'Newest') {
                                    return 'creation desc';
                                  } else if (FFAppState().Sort == 'Rating') {
                                    return 'rating_average desc';
                                  } else {
                                    return 'creation desc';
                                  }
                                }(),
                                orFilters: functions.generateQuery(
                                    FFAppState().taskerFilter.searchString,
                                    ((String var1) {
                                      return var1.split(',');
                                    }('first_name,last_name'))
                                        .toList()),
                              )))
                        .future,
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
                      final columnCustomerProfileListResponse = snapshot.data!;
                      return RefreshIndicator(
                        onRefresh: () async {
                          setState(() => _model.apiRequestCompleter1 = null);
                          await _model.waitForApiRequestCompleted1();
                        },
                        child: SingleChildScrollView(
                          primary: false,
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    32.0, 27.0, 32.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.43,
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            Duration(milliseconds: 2000),
                                            () async {
                                              setState(() {
                                                FFAppState()
                                                    .updateTaskerFilterStruct(
                                                  (e) => e
                                                    ..searchString = _model
                                                        .textController.text,
                                                );
                                              });
                                              setState(() => _model
                                                  .apiRequestCompleter2 = null);
                                              await _model
                                                  .waitForApiRequestCompleted2();
                                            },
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium,
                                            hintText: 'search tasker ...',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Lato',
                                                      color: Color(0x53767676),
                                                      fontSize: 13.0,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            prefixIcon: Icon(
                                              Icons.search_sharp,
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                fontSize: 13.0,
                                              ),
                                          validator: _model
                                              .textControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      32.0, 8.0, 32.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState().mapView = false;
                                                });
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                  border: Border.all(
                                                    color: !FFAppState().mapView
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Card View',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: !FFAppState().mapView
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  FFAppState().mapView = true;
                                                });
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 36.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          2.0),
                                                  border: Border.all(
                                                    color: FFAppState().mapView
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      'Map View',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Lato',
                                                            color: FFAppState()
                                                                    .mapView
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            fontSize: 13.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(width: 12.0)),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: wrapWithModel(
                                          model: _model.adCardModel,
                                          updateCallback: () => setState(() {}),
                                          child: AdCardWidget(
                                            position: 'search and filter',
                                          ),
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: (_model.apiRequestCompleter2 ??=
                                                Completer<ApiCallResponse>()
                                                  ..complete(
                                                      TaskerpageBackendGroup
                                                          .customerProfileListCall
                                                          .call(
                                                    filters:
                                                        valueOrDefault<String>(
                                                      functions
                                                          .convertDataTypeToTaskerFilter(
                                                              FFAppState()
                                                                  .taskerFilter),
                                                      '[]',
                                                    ),
                                                    apiGlobalKey:
                                                        FFAppState().apiKey,
                                                    fields:
                                                        '[\"city\",\"country\",\"name\",\"creation\",\"date_of_birth\",\"first_name\",\"last_name\",\"review_average\",\"review_count\",\"avatar\",\"latitude\",\"longitude\"]',
                                                    orderBy: () {
                                                      if (FFAppState().Sort ==
                                                          'Oldest') {
                                                        return 'creation asc';
                                                      } else if (FFAppState()
                                                              .Sort ==
                                                          'Newest') {
                                                        return 'creation desc';
                                                      } else if (FFAppState()
                                                              .Sort ==
                                                          'Rating') {
                                                        return 'rating_average desc';
                                                      } else {
                                                        return 'creation desc';
                                                      }
                                                    }(),
                                                    orFilters:
                                                        functions.generateQuery(
                                                            FFAppState()
                                                                .taskerFilter
                                                                .searchString,
                                                            ((String var1) {
                                                              return var1
                                                                  .split(',');
                                                            }('first_name,last_name'))
                                                                .toList()),
                                                  )))
                                            .future,
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitThreeBounce(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final columnCustomerProfileListResponse =
                                              snapshot.data!;
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (!FFAppState().mapView)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 10.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final taskerList =
                                                            getJsonField(
                                                          columnCustomerProfileListResponse
                                                              .jsonBody,
                                                          r'''$.data''',
                                                        ).toList();
                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              taskerList.length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 16.0),
                                                          itemBuilder: (context,
                                                              taskerListIndex) {
                                                            final taskerListItem =
                                                                taskerList[
                                                                    taskerListIndex];
                                                            return TaskerCardWidget(
                                                              key: Key(
                                                                  'Key1gn_${taskerListIndex}_of_${taskerList.length}'),
                                                              userProfile:
                                                                  taskerListItem,
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                if (FFAppState().mapView)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 24.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 500.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFF6F6F6),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child:
                                                            FlutterFlowGoogleMap(
                                                          controller: _model
                                                              .googleMapsController,
                                                          onCameraIdle:
                                                              (latLng) => _model
                                                                      .googleMapsCenter =
                                                                  latLng,
                                                          initialLocation: _model
                                                                  .googleMapsCenter ??=
                                                              currentUserLocationValue!,
                                                          markers: (functions
                                                                      .jsonListToLatLng(
                                                                          getJsonField(
                                                                    columnCustomerProfileListResponse
                                                                        .jsonBody,
                                                                    r'''$.data''',
                                                                    true,
                                                                  )) ??
                                                                  [])
                                                              .map(
                                                                (marker) =>
                                                                    FlutterFlowMarker(
                                                                  marker
                                                                      .serialize(),
                                                                  marker,
                                                                  () async {
                                                                    await Future.delayed(const Duration(
                                                                        milliseconds:
                                                                            1000));

                                                                    context
                                                                        .pushNamed(
                                                                      'User_profile',
                                                                      queryParameters:
                                                                          {
                                                                        'id':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            columnCustomerProfileListResponse.jsonBody,
                                                                            r'''$.data.name''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                ),
                                                              )
                                                              .toList(),
                                                          markerColor:
                                                              GoogleMarkerColor
                                                                  .violet,
                                                          mapType:
                                                              MapType.normal,
                                                          style: GoogleMapStyle
                                                              .standard,
                                                          initialZoom: 15.0,
                                                          allowInteraction:
                                                              true,
                                                          allowZoom: true,
                                                          showZoomControls:
                                                              false,
                                                          showLocation: true,
                                                          showCompass: false,
                                                          showMapToolbar: false,
                                                          showTraffic: false,
                                                          centerMapOnMarkerTap:
                                                              true,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
