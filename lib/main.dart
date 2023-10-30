import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revallpro/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:revallpro/notification.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/local_notification_manager.dart';
import 'package:revallpro/utils/theme.dart';
import 'package:revallpro/views/home/add_new_tab/hashtag_auto_complate/bloc/hashtag_auto_complate_bloc.dart';
import 'package:revallpro/views/home/tag_list_tab/bloc/tag_list_bloc.dart';
import 'package:revallpro/views/home/text_list_tab/bloc/text_list_bloc.dart';
import 'package:revallpro/views/splash_screen.dart';
import 'di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HashtagAutoComplateBloc>(
      create: (context) => HashtagAutoComplateBloc(),
    ),
    BlocProvider<TextListBloc>(
      create: (context) => TextListBloc(),
    ),
    BlocProvider<TagListBloc>(
      create: (context) => TagListBloc(),
    )
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

ValueNotifier<String?> notificationPayload = ValueNotifier(null);

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    final firebaseMessaging = FCM();

    firebaseMessaging.setNotifications();
    localNotificationManager.setOnNotificationClick((String payload) {
      try {
        notificationPayload.value = payload.replaceAll('random#', '');
      } catch (e) {
        print(e);
      }
    });
    localNotificationManager.flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails()
        .then((value) {
      if (value != null &&
          value.didNotificationLaunchApp &&
          value.notificationResponse!.payload.isNotNullOrEmpty) {
        notificationPayload.value = value.notificationResponse!.payload!.replaceAll('random#', '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RevAll Pro',
      debugShowCheckedModeBanner: false,
      theme: myTheme(),
      home: SplashScreen(),
    );
  }
}
