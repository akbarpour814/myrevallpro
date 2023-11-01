import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';
export '/backend/firebase_dynamic_links/firebase_dynamic_links.dart'
    show generateCurrentPageLink;

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => _RouteErrorBuilder(
        state: state,
        child: appStateNotifier.showSplashImage
            ? Builder(
                builder: (context) => Container(
                  color: FlutterFlowTheme.of(context).info,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Group_2213.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              )
            : SignInWidget(),
      ),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: FlutterFlowTheme.of(context).info,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Group_2213.png',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : SignInWidget(),
        ),
        FFRoute(
          name: 'SelectCountryLanguage',
          path: '/select-country-language',
          builder: (context, params) => SelectCountryLanguageWidget(),
        ),
        FFRoute(
          name: 'Signup',
          path: '/signup',
          builder: (context, params) => SignupWidget(),
        ),
        FFRoute(
          name: 'PersonalDetails',
          path: '/profile-setup/personal-details',
          builder: (context, params) => PersonalDetailsWidget(),
        ),
        FFRoute(
          name: 'PhoneVerificationPage',
          path: '/phone-verification',
          builder: (context, params) => PhoneVerificationPageWidget(
            phoneNumber: params.getParam('phoneNumber', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Sign-up-Verification-accepted',
          path: '/signUpVerificationAccepted',
          builder: (context, params) => SignUpVerificationAcceptedWidget(),
        ),
        FFRoute(
          name: 'Sign-in-information',
          path: '/signInInformation',
          builder: (context, params) => SignInInformationWidget(),
        ),
        FFRoute(
          name: 'EmailVerificationPage',
          path: '/email-verification',
          builder: (context, params) => EmailVerificationPageWidget(),
        ),
        FFRoute(
          name: 'Sign-in-Verification-accepted',
          path: '/signInVerificationAccepted',
          builder: (context, params) => SignInVerificationAcceptedWidget(),
        ),
        FFRoute(
          name: 'Sign-in',
          path: '/signIn',
          builder: (context, params) => SignInWidget(),
        ),
        FFRoute(
          name: 'Forget-Password-2',
          path: '/forgetPassword2',
          builder: (context, params) => ForgetPassword2Widget(),
        ),
        FFRoute(
          name: 'Forget-Password-3',
          path: '/forgetPassword3',
          builder: (context, params) => ForgetPassword3Widget(),
        ),
        FFRoute(
          name: 'Forget-Password-4',
          path: '/forgetPassword4',
          builder: (context, params) => ForgetPassword4Widget(),
        ),
        FFRoute(
          name: 'Forget-Password-5',
          path: '/forgetPassword5',
          builder: (context, params) => ForgetPassword5Widget(),
        ),
        FFRoute(
          name: 'accepted_New_Password',
          path: '/acceptedNewPassword',
          builder: (context, params) => AcceptedNewPasswordWidget(),
        ),
        FFRoute(
          name: 'welcome',
          path: '/welcome',
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: 'Profile-intersted',
          path: '/profileInterested',
          builder: (context, params) => ProfileInterstedWidget(),
        ),
        FFRoute(
          name: 'Skills-1',
          path: '/skills1',
          builder: (context, params) => Skills1Widget(),
        ),
        FFRoute(
          name: 'Skills-3',
          path: '/skills3',
          builder: (context, params) => Skills3Widget(
            addAnother: params.getParam('addAnother', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Skills-4',
          path: '/skills4',
          builder: (context, params) => Skills4Widget(
            addAnother: params.getParam('addAnother', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Skills_List',
          path: '/skillsList',
          builder: (context, params) => SkillsListWidget(
            isEdit: params.getParam('isEdit', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Contactdata-1',
          path: '/contactdata1',
          builder: (context, params) => Contactdata1Widget(
            taskCreation: params.getParam('taskCreation', ParamType.bool),
            addAnother: params.getParam('addAnother', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Contactdata-2',
          path: '/contactdata2',
          builder: (context, params) => Contactdata2Widget(
            isSignUp: params.getParam('isSignUp', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Contactdata-3',
          path: '/contactdata3',
          builder: (context, params) => Contactdata3Widget(),
        ),
        FFRoute(
          name: 'Contactdata-4',
          path: '/contactdata4',
          builder: (context, params) => Contactdata4Widget(),
        ),
        FFRoute(
          name: 'Contactdata-7',
          path: '/contactdata7',
          builder: (context, params) => Contactdata7Widget(),
        ),
        FFRoute(
          name: 'Contactdata-6',
          path: '/contactdata6',
          builder: (context, params) => Contactdata6Widget(),
        ),
        FFRoute(
          name: 'Contactdata-9',
          path: '/contactdata9',
          builder: (context, params) => Contactdata9Widget(),
        ),
        FFRoute(
          name: 'Education-2',
          path: '/education2',
          builder: (context, params) => Education2Widget(
            isSignUp: params.getParam('isSignUp', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'Profiledetails',
          path: '/profiledetails',
          builder: (context, params) => ProfiledetailsWidget(),
        ),
        FFRoute(
          name: 'Profiledetails2',
          path: '/profiledetails2',
          builder: (context, params) => Profiledetails2Widget(),
        ),
        FFRoute(
          name: 'ShowPlans',
          path: '/showPlans',
          builder: (context, params) => ShowPlansWidget(),
        ),
        FFRoute(
          name: 'SuccessFul',
          path: '/successfull',
          builder: (context, params) => SuccessFulWidget(),
        ),
        FFRoute(
          name: 'Task-1',
          path: '/task1',
          builder: (context, params) => Task1Widget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Select_Address',
          path: '/selectAddress',
          builder: (context, params) => SelectAddressWidget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Calendar',
          path: '/calendar',
          builder: (context, params) => CalendarWidget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Taskertype',
          path: '/taskertype',
          builder: (context, params) => TaskertypeWidget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Taskertype2',
          path: '/taskertype2',
          builder: (context, params) => Taskertype2Widget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Taskertype3',
          path: '/taskertype3',
          builder: (context, params) => Taskertype3Widget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'TaskList',
          path: '/taskList',
          builder: (context, params) => TaskListWidget(),
        ),
        FFRoute(
          name: 'TaskerList',
          path: '/taskerList',
          builder: (context, params) => TaskerListWidget(),
        ),
        FFRoute(
          name: 'inbox',
          path: '/inbox',
          builder: (context, params) => InboxWidget(
            postID: params.getParam('postID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'chat',
          path: '/chat/:room',
          builder: (context, params) => ChatWidget(
            room: params.getParam('room', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'AppointmentList',
          path: '/appointmentList',
          builder: (context, params) => AppointmentListWidget(),
        ),
        FFRoute(
          name: 'On_site_AppointmentDeatels',
          path: '/onSiteAppointmentDeatels',
          builder: (context, params) => OnSiteAppointmentDeatelsWidget(
            appointmentId: params.getParam('appointmentId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'By_Phone_AppointmentDeatels',
          path: '/byPhoneAppointmentDeatels',
          builder: (context, params) => ByPhoneAppointmentDeatelsWidget(
            appointmentId: params.getParam('appointmentId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Online_AppointmentDeatels',
          path: '/onlineAppointmentDeatels',
          builder: (context, params) => OnlineAppointmentDeatelsWidget(
            appointmentId: params.getParam('appointmentId', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'MyPosts',
          path: '/myPosts',
          builder: (context, params) => MyPostsWidget(),
        ),
        FFRoute(
          name: 'MyInbox',
          path: '/myInbox',
          builder: (context, params) => MyInboxWidget(),
        ),
        FFRoute(
          name: 'TaskersDashboard',
          path: '/taskersDashboard',
          builder: (context, params) => TaskersDashboardWidget(),
        ),
        FFRoute(
          name: 'PostersDashboard',
          path: '/postersDashboard',
          builder: (context, params) => PostersDashboardWidget(),
        ),
        FFRoute(
          name: 'MainHomePage',
          path: '/mainHomePage',
          builder: (context, params) => MainHomePageWidget(),
        ),
        FFRoute(
          name: 'add_another_skill',
          path: '/addAnotherSkill',
          builder: (context, params) => AddAnotherSkillWidget(),
        ),
        FFRoute(
          name: 'add_another_skill_2',
          path: '/addAnotherSkill2',
          builder: (context, params) => AddAnotherSkill2Widget(),
        ),
        FFRoute(
          name: 'Add_another_education',
          path: '/addAnotherEducation',
          builder: (context, params) => AddAnotherEducationWidget(
            isSignUp: params.getParam('isSignUp', ParamType.bool),
            education: params.getParam('education', ParamType.JSON),
            addAnother: params.getParam('addAnother', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'TaskerHomePage',
          path: '/taskerHomePage',
          builder: (context, params) => TaskerHomePageWidget(),
        ),
        FFRoute(
          name: 'PosterHomePage',
          path: '/posterHomePage',
          builder: (context, params) => PosterHomePageWidget(),
        ),
        FFRoute(
          name: 'Task-2',
          path: '/task2',
          builder: (context, params) => Task2Widget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Add_another',
          path: '/addAnother',
          builder: (context, params) => AddAnotherWidget(),
        ),
        FFRoute(
          name: 'Categories',
          path: '/categories',
          builder: (context, params) => CategoriesWidget(),
        ),
        FFRoute(
          name: 'KnowledgeBase',
          path: '/knowledgeBase',
          builder: (context, params) => KnowledgeBaseWidget(),
        ),
        FFRoute(
          name: 'MainHomePageForAd',
          path: '/mainHomePageForAd',
          builder: (context, params) => MainHomePageForAdWidget(),
        ),
        FFRoute(
          name: 'scaned_QRCODE',
          path: '/scanedQRCODE',
          builder: (context, params) => ScanedQRCODEWidget(
            appointmentID: params.getParam('appointmentID', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'EmailVerificationPageDeprecated',
          path: '/signup/email-verification',
          builder: (context, params) => EmailVerificationPageDeprecatedWidget(),
        ),
        FFRoute(
          name: 'webHome',
          path: '/webHome',
          builder: (context, params) => WebHomeWidget(),
        ),
        FFRoute(
          name: 'paymentshistory',
          path: '/paymentshistory',
          builder: (context, params) => PaymentshistoryWidget(),
        ),
        FFRoute(
          name: 'issue_list',
          path: '/issueList',
          builder: (context, params) => IssueListWidget(),
        ),
        FFRoute(
          name: 'notification_log',
          path: '/notificationLog',
          builder: (context, params) => NotificationLogWidget(),
        ),
        FFRoute(
          name: 'chat_list',
          path: '/chatList',
          builder: (context, params) => ChatListWidget(
            task: params.getParam('task', ParamType.int),
            myPost: params.getParam('myPost', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'taskstime',
          path: '/taskstime',
          builder: (context, params) => TaskstimeWidget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Rates',
          path: '/rates',
          builder: (context, params) => RatesWidget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'connection',
          path: '/connection',
          builder: (context, params) => ConnectionWidget(),
        ),
        FFRoute(
          name: 'Allinvation',
          path: '/allinvation',
          builder: (context, params) => AllinvationWidget(),
        ),
        FFRoute(
          name: 'AllConnection',
          path: '/allConnection',
          builder: (context, params) => AllConnectionWidget(),
        ),
        FFRoute(
          name: 'AllFollowers',
          path: '/allFollowers',
          builder: (context, params) => AllFollowersWidget(),
        ),
        FFRoute(
          name: 'PublishTask',
          path: '/publishTask',
          builder: (context, params) => PublishTaskWidget(
            id: params.getParam('id', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ID1',
          path: '/id1',
          builder: (context, params) => Id1Widget(
            name: params.getParam('name', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ID2',
          path: '/id2',
          builder: (context, params) => Id2Widget(
            name: params.getParam('name', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ID3',
          path: '/id3',
          builder: (context, params) => Id3Widget(
            name: params.getParam('name', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ID4',
          path: '/id4',
          builder: (context, params) => Id4Widget(
            name: params.getParam('name', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'identification_card',
          path: '/identificationCard',
          builder: (context, params) => IdentificationCardWidget(
            signUp: params.getParam('signUp', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'RateSignUp',
          path: '/user-rate',
          builder: (context, params) => RateSignUpWidget(
            name: params.getParam('name', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'Rates_list',
          path: '/ratesList',
          builder: (context, params) => RatesListWidget(
            isEdit: params.getParam('isEdit', ParamType.bool),
          ),
        ),
        FFRoute(
          name: 'test2',
          path: '/test2',
          builder: (context, params) => Test2Widget(
            task: params.getParam('task', ParamType.int),
            user: params.getParam('user', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'User_profile',
          path: '/userProfile',
          builder: (context, params) => UserProfileWidget(
            id: params.getParam('id', ParamType.String),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class _RouteErrorBuilder extends StatefulWidget {
  const _RouteErrorBuilder({
    Key? key,
    required this.state,
    required this.child,
  }) : super(key: key);

  final GoRouterState state;
  final Widget child;

  @override
  State<_RouteErrorBuilder> createState() => _RouteErrorBuilderState();
}

class _RouteErrorBuilderState extends State<_RouteErrorBuilder> {
  @override
  void initState() {
    super.initState();
    // Handle erroneous links from Firebase Dynamic Links.
    if (widget.state.location.startsWith('/link?request_ip_version')) {
      SchedulerBinding.instance.addPostFrameCallback((_) => context.go('/'));
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
