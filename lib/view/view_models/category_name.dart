//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//------/packages
import 'package:ionicons/ionicons.dart';

// ignore: must_be_immutable
class CategoryName extends StatefulWidget {
  late IconData? iconData;
  late String title;
  late bool lastCategory;
  late Widget page;

  CategoryName({
    Key? key,
    required this.iconData,
    required this.title,
    required this.lastCategory,
    required this.page,
  }) : super(key: key);

  @override
  _CategoryNameState createState() => _CategoryNameState();
}

class _CategoryNameState extends State<CategoryName> {
  @override
  Widget build(BuildContext context) {
    Icon _leading = Icon(
      widget.iconData,
      color: Theme.of(context).primaryColor,
    );
    Text _title = Text(
      widget.title,
    );
    InkWell _trailing = InkWell(
      child: const Icon(
        Ionicons.chevron_back_outline,
      ),
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) {
              return widget.page;
            },
          ),
        );
      },
    );

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (context) {
              return widget.page;
            },
          ),
        );
      },
      child: Card(
        color: Colors.transparent,
        elevation: 0.0,
        shape: widget.lastCategory
            ? const Border()
            : Theme.of(context).cardTheme.shape,
        child: widget.iconData == null
            ? ListTile(
                title: _title,
                trailing: _trailing,
              )
            : ListTile(
                leading: _leading,
                title: _title,
                trailing: _trailing,
              ),
      ),
    );
  }
}
