import 'dart:developer' as dvl;
import 'dart:io';
import 'dart:math';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:revallpro/main.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/user_infos.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

LocalNotificationManager localNotificationManager =
    LocalNotificationManager.init();

class LocalNotificationManager {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late InitializationSettings _initSetting;
  bool _forceCanceled = false;
  BehaviorSubject<ReceiveNotification>
      get _didReceiveLocalNotificationSubject =>
          BehaviorSubject<ReceiveNotification>();

  LocalNotificationManager.init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    if (Platform.isIOS) {
      _requestIOSPermission();
    } else if (Platform.isAndroid) {
      _requestAndroidPermission();
    }
    _initialzePlatform();
  }

  _requestIOSPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()!
        .requestPermissions(
            alert: true,
            badge: true,
            sound: true,
            critical: true,
            provisional: true);
  }

  _requestAndroidPermission() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestExactAlarmsPermission();
  }

  _initialzePlatform() async {
    tz.initializeTimeZones();
    var initSettingAndroid =
        AndroidInitializationSettings('mipmap/launcher_icon');
    var initSettingIOS = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
      requestCriticalPermission: true,
      requestProvisionalPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        ReceiveNotification notification = ReceiveNotification(
            id: id,
            title: title ?? '',
            body: body ?? '',
            payload: payload ?? '');
        _didReceiveLocalNotificationSubject.add(notification);
      },
    );
    _initSetting = InitializationSettings(
        android: initSettingAndroid, iOS: initSettingIOS);
    tz.setLocalLocation(
        tz.getLocation(await FlutterTimezone.getLocalTimezone()));
  }

  setOnNotificationReceive(Function onNotificationReceive) {
    _didReceiveLocalNotificationSubject.listen((notification) {
      onNotificationReceive(notification);
    });
  }

  setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(_initSetting,
        onDidReceiveNotificationResponse: (details) {
      onNotificationClick(details.payload);
    }, onDidReceiveBackgroundNotificationResponse: notificationTapBackground);
  }

  Future<List<PendingNotificationRequest>> getAll() async {
    var retList =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    dvl.log('keyvan length is: ${retList.length}');
    return retList;
  }

  Future<void> cancelAll() async {
    _forceCanceled = true;
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  Future<void> cancelById(String id, {bool? isRandom}) async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
        await getAll();
    for (var element in pendingNotificationRequests) {
      //فقط رندوم
      if (isRandom ?? false) {
        if (element.payload.isNotNullOrEmpty &&
            element.payload!.contains('random#') &&
            element.payload!.replaceAll('random#', '') == id) {
          await flutterLocalNotificationsPlugin.cancel(element.id);
        }
        // هم رندوم هم عادی
      } else if (element.payload == id ||
          (element.payload.isNotNullOrEmpty &&
              element.payload!.contains('random#') &&
              element.payload!.replaceAll('random#', '') == id)) {
        await flutterLocalNotificationsPlugin.cancel(element.id);
      }
    }
    // final List<PendingNotificationRequest> ss = await getAll();
    // print(ss);
  }

  Future<void> show({
    required String title,
    required String payload,
  }) async {
    NotificationDetails _platformChannel = NotificationDetails(
        android: AndroidNotificationDetails("com.revallpro.app", 'RevAll Pro',
            channelDescription: 'RevAll Pro notification',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            styleInformation: BigTextStyleInformation(title),
            largeIcon: DrawableResourceAndroidBitmap('mipmap/launcher_icon')),
        iOS: DarwinNotificationDetails());
    int lastNotifId = await UserInfos.getInt('lastNotifId') ?? 0;
    await flutterLocalNotificationsPlugin.show(
        lastNotifId, Platform.isIOS ? title : '', '', _platformChannel,
        payload: payload);
    await UserInfos.setInt('lastNotifId', lastNotifId + 1);
  }

  Future<void> deleteAndRandomShow(
      {required List<String> idList,
      required List<String> dataList,
      bool? withoutDelete}) async {
    try {
      _forceCanceled = false;
      if (idList.isNotEmpty) {
        //حذف نوتیف های رندوم قبلی
        if (!(withoutDelete ?? false)) {
          for (var element in idList) {
            await localNotificationManager.cancelById(element, isRandom: true);
          }
        }
        int lastNotifId = await UserInfos.getInt('lastNotifId') ?? 0;
        int randomCount = await UserInfos.getRandomNotificationCount();
        //برای 30 روز آینده
        for (var i = 0; i < 30; i++) {
          //زمانی که در حین ایجاد نوتیف های رندوم از جای دیگه درخواست کنسل همه ی نوتیف ها بیاد
          if (_forceCanceled) {
            cancelAll();
            return;
          }
          for (var j = 0; j < randomCount; j++) {
            int randomIndex =
                dataList.length == 1 ? 0 : Random().nextInt(dataList.length);
            NotificationDetails _platformChannel = NotificationDetails(
                android: AndroidNotificationDetails(
                    "com.revallpro.app", 'RevAll Pro',
                    channelDescription: 'RevAll Pro notification',
                    importance: Importance.max,
                    priority: Priority.high,
                    playSound: true,
                    category: AndroidNotificationCategory.alarm,
                    styleInformation:
                        BigTextStyleInformation(dataList[randomIndex]),
                    largeIcon:
                        DrawableResourceAndroidBitmap('mipmap/launcher_icon')),
                iOS: DarwinNotificationDetails());
            if (i != 0 ||
                ((j + 1) * 2) <= (24 - tz.TZDateTime.now(tz.local).hour)) {
              // اگر برای روز جاری امکانش نباشد ایگنور میشود
              var time = tz.TZDateTime.now(tz.local).add(Duration(
                  hours: i == 0
                      ? (j + 1) * 2 // برای روز جاری
                      : ((i - 1) * 24) + // برای روز های غیر از فردا
                          (24 -
                              tz.TZDateTime.now(tz.local)
                                  .hour) + //اسکیپ کردن مقدار ساعت جاری تا 24 روز جاری
                          9 + //اسکیپ کردن تا 9 صبح
                          (j * 2))); //هر دو ساعت جلو بردن
              await flutterLocalNotificationsPlugin.zonedSchedule(
                  lastNotifId,
                  Platform.isIOS ? 'RevAll Pro' : '',
                  Platform.isIOS ? dataList[randomIndex] : '',
                  time,
                  _platformChannel,
                  uiLocalNotificationDateInterpretation:
                      UILocalNotificationDateInterpretation.absoluteTime,
                  androidScheduleMode: AndroidScheduleMode.alarmClock,
                  payload: 'random#${idList[randomIndex]}');
              lastNotifId++;
            }
          }
        }
        await UserInfos.setInt('lastNotifId', lastNotifId + 1);
      }
    } catch (e) {
      dvl.log(e.toString());
    }
  }

  Future<void> scheduleShow(
      {required String id,
      required String data,
      required String startTime}) async {
    try {
      int lastNotifId = await UserInfos.getInt('lastNotifId') ?? 0;
      NotificationDetails _platformChannel = NotificationDetails(
          android: AndroidNotificationDetails("com.revallpro.app", 'RevAll Pro',
              channelDescription: 'RevAll Pro notification',
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
              category: AndroidNotificationCategory.alarm,
              styleInformation: BigTextStyleInformation(data),
              largeIcon: DrawableResourceAndroidBitmap('mipmap/launcher_icon')),
          iOS: DarwinNotificationDetails());
      //notif 1 day
      tz.TZDateTime day1Time =
          tz.TZDateTime.parse(tz.local, startTime).add(const Duration(days: 1));
      if (day1Time.compareTo(tz.TZDateTime.now(tz.local)) > 0) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
            lastNotifId,
            Platform.isIOS ? 'RevAll Pro' : '',
            Platform.isIOS ? data : '',
            day1Time,
            _platformChannel,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            androidScheduleMode: AndroidScheduleMode.alarmClock,
            payload: id);
      }
      //notif 3 day
      tz.TZDateTime day3Time =
          tz.TZDateTime.parse(tz.local, startTime).add(const Duration(days: 3));
      if (day3Time.compareTo(tz.TZDateTime.now(tz.local)) > 0) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
            lastNotifId + 1,
            Platform.isIOS ? 'RevAll Pro' : '',
            Platform.isIOS ? data : '',
            day3Time,
            _platformChannel,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            androidScheduleMode: AndroidScheduleMode.alarmClock,
            payload: id);
      }
      //notif 1 week
      tz.TZDateTime week1Time =
          tz.TZDateTime.parse(tz.local, startTime).add(const Duration(days: 7));
      if (week1Time.compareTo(tz.TZDateTime.now(tz.local)) > 0) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
            lastNotifId + 2,
            Platform.isIOS ? 'RevAll Pro' : '',
            Platform.isIOS ? data : '',
            week1Time,
            _platformChannel,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            androidScheduleMode: AndroidScheduleMode.alarmClock,
            payload: id);
      }
      //notif 2 week
      tz.TZDateTime week2Time = tz.TZDateTime.parse(tz.local, startTime)
          .add(const Duration(days: 14));
      if (week2Time.compareTo(tz.TZDateTime.now(tz.local)) > 0) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
            lastNotifId + 3,
            Platform.isIOS ? 'RevAll Pro' : '',
            Platform.isIOS ? data : '',
            week2Time,
            _platformChannel,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            androidScheduleMode: AndroidScheduleMode.alarmClock,
            payload: id);
      }
      //notif 1 month
      tz.TZDateTime month1Time = tz.TZDateTime.parse(tz.local, startTime)
          .add(const Duration(days: 30));
      if (month1Time.compareTo(tz.TZDateTime.now(tz.local)) > 0) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
            lastNotifId + 4,
            Platform.isIOS ? 'RevAll Pro' : '',
            Platform.isIOS ? data : '',
            month1Time,
            _platformChannel,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            androidScheduleMode: AndroidScheduleMode.alarmClock,
            payload: id);
      }
      //notif 5 month
      tz.TZDateTime month5Time = tz.TZDateTime.parse(tz.local, startTime)
          .add(const Duration(days: 150));
      if (month5Time.compareTo(tz.TZDateTime.now(tz.local)) > 0) {
        await flutterLocalNotificationsPlugin.zonedSchedule(
            lastNotifId + 5,
            Platform.isIOS ? 'RevAll Pro' : '',
            Platform.isIOS ? data : '',
            month5Time,
            _platformChannel,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            androidScheduleMode: AndroidScheduleMode.alarmClock,
            payload: id);
      }
      await UserInfos.setInt('lastNotifId', lastNotifId + 6);
    } catch (e) {
      dvl.log(e.toString());
    }
  }
}

@pragma('vm:entry-point')
Future<void> notificationTapBackground(
    NotificationResponse notificationResponse) async {
  notificationPayload.value =
      notificationResponse.payload!.replaceAll('random#', '');
}

class ReceiveNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceiveNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.payload});
}
