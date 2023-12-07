//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'dart:io';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/custom_response.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/model
import '/model/text_format.dart';

//------/view/view_models
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/no_internet_connection.dart';

//------/main
import '/main.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with InternetConnection, LoadDataFromAPI {
  late String _whatsappPhoneNumber;
  late String _email;
  late String _websiteAddress;
  late String _textOfShare;
  late String _introductionText;

  Future _initInformation() async {
    customDio = await CustomDio.dio.get('درباره-ما');

    if (customDio.statusCode == 200) {
      _introductionText =
          TextFormat.textFormat(text: customDio.data['data'][0]['content']);

      customDio = await CustomDio.dio.post('admin/info');

      if (customDio.statusCode == 200) {
        customResponse = CustomResponse.fromJson(customDio.data);

        _whatsappPhoneNumber = customResponse.data['admin_mobile_number'];
        _email = customResponse.data['admin_email_address'];
        _websiteAddress = customResponse.data['general_website_url'];

        _textOfShare =
            'بهترین و جدیدترین کتاب های صوتی را با ما بشنوید.\n\nراه های ارتباط با ما:\n\nواتساپ: $_whatsappPhoneNumber\nایمیل: $_email\nوب سایت: $_websiteAddress\n\nدانلود از طریق: \n\nنسخه اندروید: $androidLink\n\nنسخه آی.او.اس: $iosLink';
      }
    }

    return customDio;
  }

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
      title: const Text('درباره ما'),
      automaticallyImplyLeading: false,
      leading: const Icon(
        Ionicons.information_outline,
      ),
      actions: [
        InkWell(
          child: const Padding(
            padding: EdgeInsets.all(18.0),
            child: Icon(
              Ionicons.chevron_back_outline,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _body() {
    return FutureBuilder(
      future: _initInformation(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          return _innerBody();
        } else {
          if (connectionStatus == ConnectivityResult.none) {
            return const Center(
              child: NoInternetConnection(),
            );
          } else {
            return Center(
              child: CustomCircularProgressIndicator(),
            );
          }
        }
      },
    );
  }

  SingleChildScrollView _innerBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 5.0.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _appLogo(),
                Expanded(
                  child: SizedBox(
                    width: 50.0.w,
                    height: 20.0.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'راه های ارتباط با ما:',
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _launcherToWhatsapp(),
                                  _launcherToEmail(),
                                  _launcherToWebsite(),
                                ],
                              ),
                            ],
                          ),
                        ),
                        _share(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _introductionTextWidget(),
          ],
        ),
      ),
    );
  }

  Image _appLogo() {
    return Image.asset(
      appLogo,
      width: 40.0.w,
    );
  }

  Flexible _launcherToWhatsapp() {
    return Flexible(
      child: InkWell(
        onTap: () {
          if (Platform.isAndroid || Platform.isIOS) {
            launch('https://wa.me/$_whatsappPhoneNumber/');
          } else {
            launch('https://api.whatsapp.com/send?phone=$_whatsappPhoneNumber');
          }
        },
        child: Icon(
          Ionicons.logo_whatsapp,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Flexible _launcherToEmail() {
    return Flexible(
      child: InkWell(
        onTap: () {
          launch('mailto:$_email?');
        },
        child: Icon(
          Ionicons.logo_yahoo,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Flexible _launcherToWebsite() {
    return Flexible(
      child: InkWell(
        onTap: () {
          launch(_websiteAddress);
        },
        child: Icon(
          Ionicons.earth_outline,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Flexible _share() {
    return Flexible(
      child: ElevatedButton(
        onPressed: () {
          Share.share(
            _textOfShare,
            subject: 'کاغذ صوتی',
          );
        },
        child: const Text(
          'ما را به اشتراک بگذارید.',
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Padding _introductionTextWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        _introductionText,
        style: const TextStyle(height: 1.7),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
