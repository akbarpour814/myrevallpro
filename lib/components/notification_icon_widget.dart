import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_icon_model.dart';
export 'notification_icon_model.dart';

class NotificationIconWidget extends StatefulWidget {
  const NotificationIconWidget({
    Key? key,
    bool? hasNotification,
  })  : this.hasNotification = hasNotification ?? false,
        super(key: key);

  final bool hasNotification;

  @override
  _NotificationIconWidgetState createState() => _NotificationIconWidgetState();
}

class _NotificationIconWidgetState extends State<NotificationIconWidget> {
  late NotificationIconModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationIconModel());

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
        context.pushNamed('notification_log');
      },
      child: Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: valueOrDefault<Color>(
            widget.hasNotification
                ? FlutterFlowTheme.of(context).primary
                : Color(0x00FFFFFF),
            Color(0x00FFFFFF),
          ),
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.hasNotification
                ? Color(0x00FFFFFF)
                : FlutterFlowTheme.of(context).primary,
            width: 2.0,
          ),
        ),
        child: Icon(
          Icons.notifications_none,
          color: widget.hasNotification
              ? Colors.white
              : FlutterFlowTheme.of(context).primary,
          size: 23.0,
        ),
      ),
    );
  }
}
