import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'badge_single_icon_model.dart';
export 'badge_single_icon_model.dart';

class BadgeSingleIconWidget extends StatefulWidget {
  const BadgeSingleIconWidget({
    Key? key,
    required this.appBadge,
    this.customerProfile,
  }) : super(key: key);

  final String? appBadge;
  final String? customerProfile;

  @override
  _BadgeSingleIconWidgetState createState() => _BadgeSingleIconWidgetState();
}

class _BadgeSingleIconWidgetState extends State<BadgeSingleIconWidget> {
  late BadgeSingleIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BadgeSingleIconModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultuhy =
          await TaskerpageBackendGroup.updateCustomerProfileBadgesCall.call(
        customerProfile:
            widget.customerProfile != null && widget.customerProfile != ''
                ? widget.customerProfile
                : getJsonField(
                    FFAppState().userProfile,
                    r'''$.data.name''',
                  ).toString().toString(),
        appBadge: widget.appBadge,
        apiGlobalKey: FFAppState().apiKey,
      );
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

    return Builder(
      builder: (context) {
        if ((_model.apiResultuhy?.succeeded ?? true) &&
            functions.jsonIntToBoolean(
                TaskerpageBackendGroup.updateCustomerProfileBadgesCall.enabled(
              (_model.apiResultuhy?.jsonBody ?? ''),
            ))) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 300),
              fadeOutDuration: Duration(milliseconds: 300),
              imageUrl:
                  '${FFAppState().baseUrl}${TaskerpageBackendGroup.updateCustomerProfileBadgesCall.activeIcon(
                        (_model.apiResultuhy?.jsonBody ?? ''),
                      ).toString()}',
              width: 40.0,
              height: 40.0,
              fit: BoxFit.none,
              errorWidget: (context, error, stackTrace) => Image.asset(
                'assets/images/error_image.jpg',
                width: 40.0,
                height: 40.0,
                fit: BoxFit.none,
              ),
            ),
          );
        } else if ((_model.apiResultuhy?.succeeded ?? true) &&
            !functions.jsonIntToBoolean(
                TaskerpageBackendGroup.updateCustomerProfileBadgesCall.enabled(
              (_model.apiResultuhy?.jsonBody ?? ''),
            ))) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 200),
              fadeOutDuration: Duration(milliseconds: 200),
              imageUrl:
                  '${FFAppState().baseUrl}${TaskerpageBackendGroup.updateCustomerProfileBadgesCall.deactiveIcon(
                        (_model.apiResultuhy?.jsonBody ?? ''),
                      ).toString()}',
              width: 40.0,
              height: 40.0,
              fit: BoxFit.none,
            ),
          );
        } else {
          return Text(
            'Error',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Lato',
                  color: Color(0x0014181B),
                ),
          );
        }
      },
    );
  }
}
