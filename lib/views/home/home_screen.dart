import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:revallpro/data/model/text_model.dart';
import 'package:revallpro/gen/fonts.gen.dart';
import 'package:revallpro/utils/assist.dart';
import 'package:revallpro/utils/local_notification_manager.dart';
import 'package:revallpro/utils/my_navigator.dart';
import 'package:revallpro/views/home/add_new_tab/add_new_tab.dart';
import 'package:revallpro/views/home/tag_list_tab/bloc/tag_list_bloc.dart';
import 'package:revallpro/views/home/tag_list_tab/tag_list_tab.dart';
import 'package:revallpro/views/home/text_list_tab/bloc/text_list_bloc.dart';
import 'package:revallpro/views/home/text_list_tab/text_list_tab.dart';
import 'package:revallpro/views/settings/setting_screen.dart';
import 'package:timezone/timezone.dart' as tz;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final GlobalKey<AddNewTabState> _addNewTabStateKey = GlobalKey();
  TextModel? _editTextModel;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        if (_tabController.index != 2) {
          _editTextModel = null;
          FocusManager.instance.primaryFocus?.unfocus();
        } else if (_editTextModel != null &&
            _addNewTabStateKey.currentState != null) {
          _addNewTabStateKey.currentState!.loadEditModel(_editTextModel!);
        }
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _tabController.index == 2
            ? null
            : FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: () {
                  _editTextModel = null;
                  setState(() {});
                  _tabController.animateTo(2);
                },
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 40,
                ),
              ),
        appBar: AppBar(
          title: InkWell(
            onTap: () async {
              TextEditingController textEditingController =
                  TextEditingController();
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () async {
                                  NotificationDetails _platformChannel =
                                      NotificationDetails(
                                          android: AndroidNotificationDetails(
                                              "com.loonieple.loonieple",
                                              'RevAll Pro',
                                              channelDescription:
                                                  'RevAll Pro notification',
                                              importance: Importance.max,
                                              priority: Priority.high,
                                              playSound: true,
                                              category:
                                                  AndroidNotificationCategory
                                                      .alarm,
                                              styleInformation:
                                                  BigTextStyleInformation(
                                                      DateTime.now()
                                                          .toIso8601String()),
                                              largeIcon:
                                                  DrawableResourceAndroidBitmap(
                                                      'mipmap/launcher_icon')),
                                          iOS: DarwinNotificationDetails());
                                  var time = tz.TZDateTime.now(tz.local).add(
                                      Duration(
                                          minutes: int.parse(
                                              textEditingController.text)));
                                  await localNotificationManager
                                      .flutterLocalNotificationsPlugin
                                      .zonedSchedule(0, 'RevAll Pro', 'test',
                                          time, _platformChannel,
                                          uiLocalNotificationDateInterpretation:
                                              UILocalNotificationDateInterpretation
                                                  .absoluteTime,
                                          androidScheduleMode:
                                              AndroidScheduleMode.alarmClock,
                                          payload: 'random#');
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.done))),
                      )
                    ],
                  );
                },
              );
              // localNotificationManager.getAll();
              // var ss = await UserInfos.getInt('lastNotifId');
              // log(ss.toString());
              // log((await UserInfos.getString('bg'))??'');
              // var model = (BlocProvider.of<TextListBloc>(context).state
              //         as TextListLoaded)
              //     .textList
              //     .first;
              // localNotificationManager.show(
              //     title: 'google', payload: '-NfFqwBI2NIsM3tSb3Mx');
            },
            child: Text(
              'RevAll Pro',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  MyNavigator.push(context, SettingScreen());
                },
                icon: Icon(Icons.settings))
          ],
        ),
        body: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverAppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                centerTitle: true,
                title: TextField(
                  controller: _searchController,
                  onChanged: (_) => setState(() {}),
                  style: TextStyle(
                      fontFamily: isPersian(_searchController.text)
                          ? FontFamily.iranSans
                          : null),
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                          padding: const EdgeInsets.only(left: 8),
                          constraints: const BoxConstraints(maxHeight: 30),
                          icon: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, anim) =>
                                  RotationTransition(
                                    turns: child.key == const ValueKey('icon1')
                                        ? Tween<double>(begin: 1, end: 1)
                                            .animate(anim)
                                        : Tween<double>(begin: 0.75, end: 1)
                                            .animate(anim),
                                    child: FadeTransition(
                                        opacity: anim, child: child),
                                  ),
                              child: _searchController.text.isEmpty
                                  ? Icon(CupertinoIcons.search,
                                      key: const ValueKey('icon1'))
                                  : Icon(
                                      Icons.close,
                                      key: const ValueKey('icon2'),
                                    )))),
                ),
                bottom: TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  dividerColor: Theme.of(context).primaryColor.withOpacity(0.0),
                  indicatorWeight: 3,
                  indicatorColor:
                      _editTextModel != null ? Colors.yellow.shade700 : null,
                  tabs: [
                    Tab(
                      child: Text(
                        "Text",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: _tabController.index == 0
                                ? FontWeight.bold
                                : null,
                            color: Theme.of(context).primaryColor.withOpacity(
                                _tabController.index == 0 ? 1 : 0.6)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Tag",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: _tabController.index == 1
                                ? FontWeight.bold
                                : null,
                            color: Theme.of(context).primaryColor.withOpacity(
                                _tabController.index == 1 ? 1 : 0.6)),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Add new",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: _tabController.index == 2
                                ? FontWeight.bold
                                : null,
                            color: _editTextModel != null
                                ? Colors.yellow.shade700
                                : Theme.of(context).primaryColor.withOpacity(
                                    _tabController.index == 2 ? 1 : 0.6)),
                      ),
                    )
                  ],
                )),
            SliverFillRemaining(
              fillOverscroll: true,
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  TextListTab(
                    searchQuery: _searchController.text,
                    onEditPressed: (textModel) async {
                      _editTextModel = textModel;
                      setState(() {});
                      _tabController.animateTo(2);
                    },
                  ),
                  TagListTab(
                    searchQuery: _searchController.text,
                    onEditPressed: (textModel) async {
                      _editTextModel = textModel;
                      setState(() {});
                      _tabController.animateTo(2);
                    },
                  ),
                  AddNewTab(
                    key: _addNewTabStateKey,
                    onTextAdded: () {
                      _tabController.animateTo(0);
                      BlocProvider.of<TextListBloc>(context)
                          .add(TextListLoadEvent());
                      BlocProvider.of<TagListBloc>(context)
                          .add(TagListLoadEvent());
                    },
                  )
                ],
                controller: _tabController,
              ),
            )
          ],
        ));
  }
}
