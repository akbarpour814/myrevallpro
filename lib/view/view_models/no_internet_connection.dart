//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:sizer/sizer.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionState createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: SizedBox(
            width: 5.0.w,
            height: 5.0.w,
            child: Icon(
              Icons.wifi_off_rounded,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Text(
          'لطفاً اتصال اینترنت خود را بررسی کنید.',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
