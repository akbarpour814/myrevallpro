import '/backend/api_requests/api_calls.dart';
import '/components/my_post_card_for_sheet_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'my_posts_sheet_model.dart';
export 'my_posts_sheet_model.dart';

class MyPostsSheetWidget extends StatefulWidget {
  const MyPostsSheetWidget({
    Key? key,
    required this.customerProfile,
  }) : super(key: key);

  final dynamic customerProfile;

  @override
  _MyPostsSheetWidgetState createState() => _MyPostsSheetWidgetState();
}

class _MyPostsSheetWidgetState extends State<MyPostsSheetWidget> {
  late MyPostsSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyPostsSheetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().userFilter = '';
        FFAppState().BargainUserFilter = false;
      });
    });

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
        child: SingleChildScrollView(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(32.0, 32.0, 32.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My posts',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 40.0,
                thickness: 1.0,
                indent: 32.0,
                endIndent: 32.0,
                color: Color(0x615E5D5D),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          32.0, 14.0, 32.0, 20.0),
                      child: FutureBuilder<ApiCallResponse>(
                        future: TaskerpageBackendGroup.myPostsCall.call(
                          apiGlobalKey: FFAppState().apiKey,
                          filters: '[[\"poster\",\"=\",\"${getJsonField(
                            FFAppState().userProfile,
                            r'''$.data.name''',
                          ).toString()}\"]]',
                          fields:
                              '[\"creation\",\"name\",\"docstatus\",\"repeat_type\",\"is_repeatable\",\"skill_name\",\"skill_category_name\",\"city\",\"language\",\"description\"]',
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
                          final listViewMyPostsResponse = snapshot.data!;
                          return Builder(
                            builder: (context) {
                              final userPosts = getJsonField(
                                listViewMyPostsResponse.jsonBody,
                                r'''$.data''',
                              ).toList();
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: userPosts.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 20.0),
                                itemBuilder: (context, userPostsIndex) {
                                  final userPostsItem =
                                      userPosts[userPostsIndex];
                                  return MyPostCardForSheetWidget(
                                    key: Key(
                                        'Key0q0_${userPostsIndex}_of_${userPosts.length}'),
                                    postData: userPostsItem,
                                    customerProfile: widget.customerProfile!,
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
            ],
          ),
        ),
      ),
    );
  }
}
