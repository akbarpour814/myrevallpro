import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'addresses_in_list_model.dart';
export 'addresses_in_list_model.dart';

class AddressesInListWidget extends StatefulWidget {
  const AddressesInListWidget({
    Key? key,
    required this.action,
    required this.address,
  }) : super(key: key);

  final Future<dynamic> Function()? action;
  final dynamic address;

  @override
  _AddressesInListWidgetState createState() => _AddressesInListWidgetState();
}

class _AddressesInListWidgetState extends State<AddressesInListWidget> {
  late AddressesInListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddressesInListModel());

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

    return FlutterFlowRadioButton(
      options: ['Konrad-Adenauer-Allee 1144263 Dortmund, \nGermany'].toList(),
      onChanged: (val) async {
        setState(() {});
        await widget.action?.call();
      },
      controller: _model.radioButtonValueController ??=
          FormFieldController<String>(null),
      optionHeight: 45.0,
      textStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Lato',
            color: Color(0xFF212121),
            fontWeight: FontWeight.w500,
          ),
      buttonPosition: RadioButtonPosition.left,
      direction: Axis.vertical,
      radioButtonColor: Color(0xFF211DAF),
      inactiveRadioButtonColor: Color(0xFF3D3D3D),
      toggleable: false,
      horizontalAlignment: WrapAlignment.start,
      verticalAlignment: WrapCrossAlignment.start,
    );
  }
}
