//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:ionicons/ionicons.dart';
import 'package:restart_app/restart_app.dart';

//------/view/pages/profile_page
import '/view/pages/profile_page/about_us_page.dart';
import '/view/pages/profile_page/account_page.dart';
import '/view/pages/profile_page/cart_page.dart';
import '/view/pages/profile_page/contact_us_page.dart';
import '/view/pages/profile_page/frequently_asked_questions_page.dart';
import '/view/pages/profile_page/marked_page.dart';
import '/view/pages/profile_page/password_setting_page.dart';
import '/view/pages/profile_page/purchase_history_page.dart';

//------/view/view_models
import '/view/view_models/category_name.dart';

//------/main
import '/main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: playerBottomNavigationBar,
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const Text('نمایه من'),
      leading: const Icon(
        Ionicons.person_outline,
      ),
    );
  }

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _navigatorToAccountPage(),
          _navigatorToCartPage(),
          _navigatorToPurchaseHistoryPage(),
          _navigatorToMarkedPage(),
          _navigatorToPasswordSettingPage(),
          _navigatorToFrequentlyAskedQuestionsPage(),
          _navigatorToContactUsPage(),
          _navigatorToAboutUsPage(),
          _setThemeMode(),
          _logOut(),
        ],
      ),
    );
  }

  CategoryName _navigatorToAccountPage() {
    return CategoryName(
      iconData: Ionicons.person_outline,
      title: 'نمایش و ویرایش حساب کاربری',
      lastCategory: false,
      page: const AccountPage(),
    );
  }

  CategoryName _navigatorToCartPage() {
    return CategoryName(
      iconData: Ionicons.bag_outline,
      title: 'سبد خرید',
      lastCategory: false,
      page: const CartPage(),
    );
  }

  CategoryName _navigatorToPurchaseHistoryPage() {
    return CategoryName(
      iconData: Ionicons.calendar_outline,
      title: 'تاریخچه خرید',
      lastCategory: false,
      page: const PurchaseHistoryPage(),
    );
  }

  CategoryName _navigatorToMarkedPage() {
    return CategoryName(
      iconData: Ionicons.bookmark_outline,
      title: 'نشان شده ها',
      lastCategory: false,
      page: const MarkedPage(),
    );
  }

  CategoryName _navigatorToPasswordSettingPage() {
    return CategoryName(
      iconData: Ionicons.key_outline,
      title: 'تغییر رمز',
      lastCategory: false,
      page: const PasswordSettingPage(),
    );
  }

  CategoryName _navigatorToFrequentlyAskedQuestionsPage() {
    return CategoryName(
      iconData: Ionicons.help,
      title: 'سوالات متداول',
      lastCategory: false,
      page: const FrequentlyAskedQuestionsPage(),
    );
  }

  CategoryName _navigatorToContactUsPage() {
    return CategoryName(
      iconData: Ionicons.call_outline,
      title: 'تماس با ما',
      lastCategory: false,
      page: const ContactUsPage(),
    );
  }

  CategoryName _navigatorToAboutUsPage() {
    return CategoryName(
      iconData: Ionicons.information_outline,
      title: 'درباره ما',
      lastCategory: false,
      page: const AboutUsPage(),
    );
  }

  Card _setThemeMode() {
    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      child: ListTile(
        leading: Icon(
          MyApp.themeNotifier.value == ThemeMode.light
              ? Ionicons.sunny_outline
              : Ionicons.moon_outline,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          MyApp.themeNotifier.value == ThemeMode.light
              ? 'زمینه تیره'
              : 'زمینه روشن',
        ),
        trailing: Switch(
          onChanged: (value) {
            MyApp.themeNotifier.value =
                MyApp.themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
          },
          value: MyApp.themeNotifier.value == ThemeMode.dark,
          activeColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  InkWell _logOut() {
    return InkWell(
      onTap: () async {
        await sharedPreferences.setBool('firstLogin', true);

        await sharedPreferences.setStringList('bookCartSlug', []);

        Restart.restartApp();
      },
      child: const Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: ListTile(
          leading: Icon(
            Ionicons.exit_outline,
            color: Colors.redAccent,
          ),
          title: Text(
            'خروج از حساب کاربری',
          ),
        ),
      ),
    );
  }
}
