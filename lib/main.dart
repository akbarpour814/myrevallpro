//------/dart and flutter packages
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';

//------/packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_value/shared_value.dart';
import 'package:just_audio/just_audio.dart';

//------/model
import '/model/book_introduction.dart';

//------/view/audio_player_models
import '/view/audio_player_models/audio_player_handler.dart';

//------/view/pages/library_page
import '/view/pages/library_page/library_page.dart';

//------/view/pages/login_pages
import '/view/pages/login_pages/splash_page.dart';

//------/view/pages/profile_page
import '/view/pages/profile_page/cart_page.dart';
import '/view/pages/profile_page/purchase_history_page.dart';

//------/view/view_models
import '/view/view_models/player_bottom_navigation_bar.dart';

//-----/global variables
String domain = 'https://kaghazsoti.com/api/';
String storage = 'https://kaghazsoti.com/storage/';
String defaultBanner = 'assets/images/defaultBanner.jpg';
String defaultBookCover = 'assets/images/appLogoForOutApp.png';
String appLogo = 'assets/images/appLogo.jpg';
String appLogoNet = 'https://kaghazsoti.com/img/logo.1e799436.jpeg';
const String fontFamily = 'Vazir';

late SharedPreferences sharedPreferences;
late int resendSms;
late String androidLink;
late String iosLink;
late int userId;
late List<int> libraryId = [];
late List<int> markedBooksId = [];
late List<String> bookCartSlug = [];

PlayerBottomNavigationBar playerBottomNavigationBar =
    const PlayerBottomNavigationBar();

late AudioPlayer audioPlayerWeb = AudioPlayer();
late AudioPlayerHandler audioPlayerHandler;
AudioPlayer demoPlayer = AudioPlayer();

int audiobookInPlayId = -1;
int previousAudiobookInPlayId = -1;
SharedValue<bool> audiobookIsPlaying = SharedValue(value: false);
late BookIntroduction audiobookInPlay;

int demoInPlayId = -1;
SharedValue<bool> demoOfBookIsPlaying = SharedValue(value: false);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    audioPlayerHandler = await AudioService.init(
      builder: () => AudioPlayerHandlerImplements(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: 'com.loonieple.loonieple',
        androidNotificationChannelName: 'Kaz Reader',
        androidNotificationOngoing: true,
      ),
    );
  });

  runApp(
    SharedValue.wrapApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.light);

  const MyApp({Key? key}) : super(key: key);

  final Color _primaryColor = const Color(0xFF005C6B);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (BuildContext context, value, Widget? child) {
            return MaterialApp(
              title: 'کاغذ صوتی',
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [
                Locale('fa', 'IR'),
              ],
              debugShowCheckedModeBanner: false,
              routes: {
                CartPage.routeName: (context) => const CartPage(),
                PurchaseHistoryPage.routeName: (context) =>
                    const PurchaseHistoryPage(),
                MyLibraryPage.routeName: (context) => const MyLibraryPage(),
              },
              theme: _theme(context),
              darkTheme: _darkTheme(context),
              themeMode: value,
              home: const SplashPage(),
            );
          },
        );
      },
    );
  }

  ThemeData _theme(BuildContext context) {
    return ThemeData(
      fontFamily: fontFamily,
      primarySwatch: generateMaterialColor(color: _primaryColor),
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: Colors.white,
      useMaterial3: false,
      dividerColor: _primaryColor,
      appBarTheme: const AppBarTheme(
        toolbarHeight: 56.0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
        ),
      ),
      cardTheme: _cardTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      textSelectionTheme: _textSelectionTheme(),
      outlinedButtonTheme: _outlinedButtonTheme(context),
      dividerTheme: _dividerTheme(),
      canvasColor: Colors.white,
    );
  }

  ThemeData _darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: fontFamily,
      primarySwatch: generateMaterialColor(color: _primaryColor),
      primaryColor: _primaryColor,
      useMaterial3: false,
      scaffoldBackgroundColor: const Color(0xFF171E26),
      dividerColor: _primaryColor,
      appBarTheme: AppBarTheme(
        toolbarHeight: 56.0,
        backgroundColor: _primaryColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontFamily: fontFamily,
        ),
      ),
      cardTheme: _cardTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      textSelectionTheme: _textSelectionTheme(),
      outlinedButtonTheme: _outlinedButtonTheme(context),
      dividerTheme: _dividerTheme(),
      canvasColor: Colors.grey.shade800,
    );
  }

  CardTheme _cardTheme() {
    return const CardTheme(
      shape: Border(
        bottom: BorderSide(
          color: Colors.grey,
          width: 0.4,
        ),
      ),
    );
  }

  InputDecorationTheme _inputDecorationTheme() {
    return InputDecorationTheme(
      helperStyle: TextStyle(color: _primaryColor),
      suffixIconColor: _primaryColor,
      focusColor: _primaryColor.withOpacity(0.6),
      border: _underlineInputBorder(),
      focusedBorder: _underlineInputBorder(),
      disabledBorder: _underlineInputBorder(),
      enabledBorder: _underlineInputBorder(),
      errorBorder: _underlineInputBorder(),
      focusedErrorBorder: _underlineInputBorder(),
    );
  }

  UnderlineInputBorder _underlineInputBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: _primaryColor,
      ),
    );
  }

  TextSelectionThemeData _textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: _primaryColor,
      selectionColor: _primaryColor.withOpacity(0.6),
      selectionHandleColor: _primaryColor,
    );
  }

  OutlinedButtonThemeData _outlinedButtonTheme(BuildContext context) {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(fontFamily: fontFamily)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              18.0,
            ),
            side: BorderSide(
              color: _primaryColor,
            ),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: _primaryColor),
        ),
      ),
    );
  }

  DividerThemeData _dividerTheme() {
    return const DividerThemeData(thickness: 1.0);
  }
}
