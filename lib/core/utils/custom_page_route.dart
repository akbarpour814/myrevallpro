import 'package:customer_club/configs/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  // TODO: implement barrierColor
  Color get barrierColor => Colors.white;

  @override
  String? get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorPalette.primaryColor));
    return FadeTransition(
      opacity: animation,
      child: Directionality(
          textDirection:
              Localizations.localeOf(context) == const Locale("fa", "IR")
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          child: child),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}

class CustomPageRoute2 extends MaterialPageRoute {
  CustomPageRoute2({required WidgetBuilder builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => Duration(milliseconds: 700);
}
