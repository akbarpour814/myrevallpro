// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelect extends StatefulWidget {
  const MultiSelect({
    Key? key,
    this.width,
    this.height,
    required this.items,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<String> items;

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  List<String> _selectedItems = [];
  final _multiSelectKey = GlobalKey<FormFieldState<List<String>>>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height,
      child: MultiSelectDialogField(
        items: widget.items
            .map((item) => MultiSelectItem<String>(item, item))
            .toList(),
        initialValue: _selectedItems,
        onConfirm: (values) {
          setState(() {
            _selectedItems = values;
          });
          _multiSelectKey.currentState?.validate();
        },
      ),
    );
  }
}
