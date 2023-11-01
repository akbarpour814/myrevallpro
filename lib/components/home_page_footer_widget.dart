import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_footer_model.dart';
export 'home_page_footer_model.dart';

class HomePageFooterWidget extends StatefulWidget {
  const HomePageFooterWidget({Key? key}) : super(key: key);

  @override
  _HomePageFooterWidgetState createState() => _HomePageFooterWidgetState();
}

class _HomePageFooterWidgetState extends State<HomePageFooterWidget> {
  late HomePageFooterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageFooterModel());

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
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 330.0,
          decoration: BoxDecoration(
            color: Color(0xFF494949),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(17.0, 32.0, 17.0, 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'tasker.page',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ],
                ),
                Divider(
                  height: 32.0,
                  thickness: 1.0,
                  color: Color(0xFFB7B7B7),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Countries',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ],
                ),
                Divider(
                  height: 32.0,
                  thickness: 1.0,
                  color: Color(0xFFB7B7B7),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Company',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Icon(
                      Icons.add_rounded,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ],
                ),
                Divider(
                  height: 32.0,
                  thickness: 1.0,
                  color: Color(0xFFB7B7B7),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Mobile app',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lato',
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Icon(
                            Icons.android_outlined,
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ),
                        Icon(
                          Icons.apple_sharp,
                          color: Colors.white,
                          size: 40.0,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 32.0,
                  thickness: 1.0,
                  color: Color(0xFFB7B7B7),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/instagram.png',
                          width: 33.0,
                          height: 26.0,
                          fit: BoxFit.none,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/Group_228.png',
                          width: 33.0,
                          height: 26.0,
                          fit: BoxFit.none,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/Group_229.png',
                          width: 33.0,
                          height: 26.0,
                          fit: BoxFit.none,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/linkedin.png',
                          width: 33.0,
                          height: 26.0,
                          fit: BoxFit.none,
                        ),
                      ),
                    ].divide(SizedBox(width: 30.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 35.0,
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            boxShadow: [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(0.0, 2.0),
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '© 2015 - 2019 tasker.page® Global Inc.',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: Color(0xFF494949),
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
