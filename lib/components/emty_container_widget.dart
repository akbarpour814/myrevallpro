import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'emty_container_model.dart';
export 'emty_container_model.dart';

class EmtyContainerWidget extends StatefulWidget {
  const EmtyContainerWidget({
    Key? key,
    String? title,
    this.goTo,
  })  : this.title = title ?? '',
        super(key: key);

  final String title;
  final Future<dynamic> Function()? goTo;

  @override
  _EmtyContainerWidgetState createState() => _EmtyContainerWidgetState();
}

class _EmtyContainerWidgetState extends State<EmtyContainerWidget> {
  late EmtyContainerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmtyContainerModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.goTo?.call();
      },
      child: Container(
        width: double.infinity,
        height: 230.0,
        decoration: BoxDecoration(
          color: Color(0x00FFFFFF),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/fill-complete-the-blank-information-button-concept-illustration-flat-design-eps10-modern-graphic-element-for-landing-page-empty-state-ui-infographic-icon-vector.jpg',
            ).image,
          ),
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: Color(0x00ACABAB),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                widget.title,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: Color(0xFFCCCCCC),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
