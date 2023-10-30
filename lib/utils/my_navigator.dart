import 'package:flutter/cupertino.dart';

import 'custom_page_route.dart';

class MyNavigator {
  static push(BuildContext context, Widget child) => Navigator.push(
        context,
        CustomPageRoute(child),
      );

  static pushReplacement(BuildContext context, Widget child) =>
      Navigator.pushReplacement(context, CustomPageRoute(child));

  static pushAndRemoveUntil(BuildContext context, Widget child,
          {bool? goFirst}) =>
      Navigator.pushAndRemoveUntil(context, CustomPageRoute(child),
          (Route<dynamic> route) => (goFirst ?? false) ? route.isFirst : false);
}
