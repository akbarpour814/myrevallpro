import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revallpro/utils/custom_modals.dart';
import 'package:revallpro/utils/extentions.dart';
import 'package:revallpro/utils/local_notification_manager.dart';
import 'package:revallpro/utils/my_navigator.dart';
import 'package:revallpro/utils/user_infos.dart';
import 'package:revallpro/views/auth/signin/signin_screen.dart';
import 'package:revallpro/views/home/text_list_tab/bloc/text_list_bloc.dart';
import 'package:revallpro/views/settings/bloc/sign_out_bloc.dart';
import 'package:revallpro/views/settings/setting_menu.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _repeatSwitch = false;
  bool _randomSwitch = false;
  int _currentRandomCount = 5;
  SignOutBloc _bloc = SignOutBloc();
  bool _inited = false;
  bool _saveLoading = false;

  Future<void> _init() async {
    _repeatSwitch = await UserInfos.isRepeatNotification();
    _randomSwitch = await UserInfos.isRandomNotification();
    _currentRandomCount = await UserInfos.getRandomNotificationCount();
    setState(() {
      _inited = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _bloc = SignOutBloc();
        return _bloc;
      },
      child: BlocListener<SignOutBloc, SignOutState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is SignOutSuccess) {
            MyNavigator.pushAndRemoveUntil(context, SignInScreen());
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Settings',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios_new_rounded)),
            actions: [SettingMenu(bloc: _bloc)],
          ),
          body: !_inited
              ? Center(
                  child: CupertinoActivityIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                )
              : ListView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 24),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Spaced Repetition',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Container(
                            width: 50,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0.1,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  )
                                ]),
                            child: Switch(
                              activeColor: Theme.of(context).primaryColor,
                              activeTrackColor: Colors.white,
                              inactiveThumbColor: Colors.grey.shade400,
                              inactiveTrackColor: Colors.white,
                              trackOutlineColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              splashRadius: 10,
                              value: _repeatSwitch,
                              onChanged: (value) {
                                setState(() => _repeatSwitch = value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.hsb(),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(24, 0, 24, 6.h(context)),
                      child: Text(
                        '''Our app uses the Spaced Repetition method to boost your memory.\nHere's the review schedule:
    1 day after learning: Review.
    3 days later: Review again.
    1 week later: Review once more.
    2 weeks later: Another review.
    1 month later: Review again.
    5 months later: Final review.          
With notifications, our app will remind you when it's time to review, making sure you don't miss a step.''',
                        style: TextStyle(height: 2),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Random Notification',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Container(
                            width: 50,
                            height: 24,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 0.1,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  )
                                ]),
                            child: Switch(
                              activeColor: Theme.of(context).primaryColor,
                              activeTrackColor: Colors.white,
                              inactiveThumbColor: Colors.grey.shade400,
                              inactiveTrackColor: Colors.white,
                              trackOutlineColor:
                                  MaterialStateProperty.all(Colors.transparent),
                              splashRadius: 10,
                              value: _randomSwitch,
                              onChanged: (value) {
                                setState(() => _randomSwitch = value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.hsb(),
                    Divider(
                      color: Colors.grey.shade200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notification per/day',
                            style: TextStyle(
                                color: !_randomSwitch ? Colors.grey : null),
                          ),
                          Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: !_randomSwitch
                                        ? Colors.grey.shade200
                                        : Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .color!)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed:
                                      _currentRandomCount > 1 && _randomSwitch
                                          ? () {
                                              setState(() {
                                                _currentRandomCount--;
                                              });
                                            }
                                          : null,
                                ),
                                Text(
                                  '$_currentRandomCount',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                          height: 0.5,
                                          color: !_randomSwitch
                                              ? Colors.grey
                                              : null),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed:
                                      _currentRandomCount < 5 && _randomSwitch
                                          ? () => setState(() {
                                                _currentRandomCount++;
                                              })
                                          : null,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.h(context).hsb(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                    Size(40.w(context), 40))),
                            onPressed: () async {
                              await _save(context);
                            },
                            child: _saveLoading
                                ? CupertinoActivityIndicator(
                                    color: Colors.white,
                                  )
                                : Text('Save')),
                      ],
                    ),
                    8.hsb(),
                    AnimatedOpacity(
                      opacity: _saveLoading ? 1 : 0,
                      duration: Duration(milliseconds: 250),
                      child: Center(
                          child: Text(
                        'It may take a long time, please wait...',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )),
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> _save(BuildContext context) async {
    if (!_saveLoading) {
      setState(() {
        _saveLoading = true;
      });
      final textListBloc = BlocProvider.of<TextListBloc>(context);
      if (textListBloc.state is TextListLoaded) {
        await UserInfos.setIsRepeatNotification(_repeatSwitch);
        await UserInfos.setIsRandomNotification(_randomSwitch);
        await UserInfos.setRandomNotificationCount(_currentRandomCount);
        final textList = (textListBloc.state as TextListLoaded).textList;
        await localNotificationManager.cancelAll();
        if (_repeatSwitch) {
          for (var element in textList) {
            await localNotificationManager.scheduleShow(
                id: element.key ?? '',
                data: element.title ?? '',
                startTime:
                    element.createAt ?? DateTime.now().toIso8601String());
          }
        }
        if (_randomSwitch) {
          List<String> titleList = textList.map((e) => e.title ?? '').toList();
          List<String> idList = textList.map((e) => e.key ?? '').toList();
          localNotificationManager.deleteAndRandomShow(
              idList: idList, dataList: titleList, withoutDelete: true);
        }
      }
      CustomModal.showSuccess(context, 'Saved successfully');
      setState(() {
        _saveLoading = false;
      });
    }
  }
}
