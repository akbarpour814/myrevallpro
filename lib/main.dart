import 'dart:io';
import 'package:customer_club/configs/di.dart';
import 'package:customer_club/configs/theme.dart';
import 'package:customer_club/features/home/presentation/blocs/get_home_data/get_home_data_bloc.dart';
import 'package:customer_club/features/login/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  HttpOverrides.global = MyHttpOverrides();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => GetHomeDataBloc(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AriaCard',
      theme: myTheme(),
      home: const SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
