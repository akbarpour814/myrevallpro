import 'package:flutter/material.dart';
import 'package:revallpro/gen/assets.gen.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/my_navigator.dart';
import 'package:revallpro/utils/user_infos.dart';
import 'package:revallpro/views/auth/signin/signin_screen.dart';
import 'package:revallpro/views/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? _controllerIcon;

  @override
  void initState() {
    super.initState();
    _controllerIcon = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
    Future.delayed(Duration(seconds: 4)).then((_) => UserInfos.getId().then(
        (value) => MyNavigator.pushReplacement(
            context, value.isNotNullOrEmpty ? HomeScreen() : SignInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PositionedTransition(
            rect: RelativeRectTween(
              begin: RelativeRect.fromLTRB(42, -200, 40, 0),
              end: RelativeRect.fromLTRB(42, 0, 40, 0),
            ).animate(CurvedAnimation(
              parent: _controllerIcon!,
              curve: Curves.linearToEaseOut,
            )),
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Assets.resource.logo1.image(width: 140, height: 140)),
            ),
          ),
        ],
      ),
    );
  }
}
