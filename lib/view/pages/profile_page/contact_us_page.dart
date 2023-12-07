//------/dart and flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//------/packages
import 'package:sizer/sizer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

//------/controller
import '/controller/custom_dio.dart';
import '/controller/custom_response.dart';
import '/controller/internet_connection.dart';
import '/controller/load_data_from_api.dart';

//------/model
import '/model/ticket_data.dart';

//------/view/view_models
import '/view/view_models/custom_circular_progress_indicator.dart';
import '/view/view_models/custom_smart_refresher.dart';
import '/view/view_models/custom_snack_bar.dart';
import '/view/view_models/display_of_details.dart';
import '/view/view_models/no_internet_connection.dart';
import '/view/view_models/property.dart';

//------/main
import '/main.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage>
    with InternetConnection, LoadDataFromAPI {
  late TextEditingController _ticketController;
  String? _errorText;
  late List<Topic> _topics;
  String? _topic;
  TicketData? _firstTicket;
  late bool _displayFirstTicket;

  late bool _ticketRegistrationClick;

  @override
  void initState() {
    super.initState();

    _ticketController = TextEditingController();
    _topics = Topic.values;
    _displayFirstTicket = false;

    _ticketRegistrationClick = true;
  }

  Future _initFirstTicket() async {
    customDio = await CustomDio.dio.post('dashboard/tickets');

    if (customDio.statusCode == 200) {
      customResponse = CustomResponse.fromJson(customDio.data);

      setState(() {
        if (customResponse.data['data'].isNotEmpty) {
          _firstTicket = TicketData.fromJson(customResponse.data['data'][0]);
        }

        dataIsLoading = false;
      });
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
      title: const Text('تماس با ما'),
      automaticallyImplyLeading: false,
      leading: const Icon(
        Ionicons.call_outline,
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
    if (dataIsLoading) {
      return FutureBuilder(
        future: _initFirstTicket(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _innerBody();
          } else {
            return Center(child: CustomCircularProgressIndicator());
          }
        },
      );
    } else {
      return _innerBody();
    }
  }

  Widget _innerBody() {
    if (connectionStatus == ConnectivityResult.none) {
      setState(() {
        dataIsLoading = true;
      });

      return const Center(
        child: NoInternetConnection(),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _selectATicketTopic(),
            _ticketTextField(),
            _ticketRegistrationButton(),
            const Divider(
              height: 0.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 5.0.w,
                top: 0.0,
                right: 5.0.w,
                bottom: 16.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            'نظرات شما',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Visibility(
                          visible: customResponse.data['data'].length >= 2,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) {
                                    return TicketsPage();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'نمایش همه',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Divider(
                      height: 0.0,
                    ),
                  ),
                  _firstTicketView(),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Padding _selectATicketTopic() {
    return Padding(
      padding: EdgeInsets.only(
        left: 5.0.w,
        top: 16.0,
        right: 5.0.w,
        bottom: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _topic == null
                    ? 'لطفاً موضوع نظر خود را انتخاب کنید.'
                    : 'موضوع: $_topic',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return WillPopScope(
                          onWillPop: () async => true,
                          child: SimpleDialog(
                            children: List<InkWell>.generate(
                              _topics.length,
                              (index) => InkWell(
                                onTap: () {
                                  setState(() {
                                    _topic = _topics[index].title!;

                                    _errorText = null;
                                  });

                                  Navigator.of(context).pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(_topics[index].title!),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(
                    Ionicons.ellipsis_vertical_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 32.0,
          ),
        ],
      ),
    );
  }

  Padding _ticketTextField() {
    OutlineInputBorder _outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColor,
      ),
      borderRadius: BorderRadius.circular(5.0),
    );

    return Padding(
      padding: EdgeInsets.only(
        left: 5.0.w,
        top: 0.0,
        right: 5.0.w,
        bottom: 16.0,
      ),
      child: TextField(
        controller: _ticketController,
        decoration: InputDecoration(
          errorText: _errorText,
          hintText: 'لطفاً نظر خود را بنویسید.',
          border: _outlineInputBorder,
          focusedBorder: _outlineInputBorder,
          disabledBorder: _outlineInputBorder,
          enabledBorder: _outlineInputBorder,
          errorBorder: _outlineInputBorder,
          focusedErrorBorder: _outlineInputBorder,
        ),
        maxLines: 8,
        cursorColor: Theme.of(context).dividerColor.withOpacity(0.6),
        cursorWidth: 1.0,
        onChanged: (String text) {
          setState(() {
            if (_ticketController.text.isEmpty) {
              _errorText = null;
            } else if (_ticketController.text.length < 3) {
              _errorText = 'نظر شما باید بیش از حرف داشته باشد.';
            } else {
              _errorText = null;
            }
          });
        },
      ),
    );
  }

  Padding _ticketRegistrationButton() {
    return Padding(
      padding:
          EdgeInsets.only(left: 5.0.w, top: 0.0, right: 5.0.w, bottom: 16.0),
      child: SizedBox(
        width: 100.0.w - (2 * 5.0.w),
        child: ElevatedButton.icon(
          onPressed: () {
            setState(() {
              if ((_topic == null) && (_ticketController.text.isEmpty)) {
                _errorText = 'لطفاً نظر خود را به همراه موضوع بنویسید.';
              } else if (_topic == null) {
                _errorText = 'لطفاً موضوع را انتخاب کنید.';
              } else if (_ticketController.text.isEmpty) {
                _errorText = 'لطفاً نظر خود را بنویسید.';
              } else if (_ticketController.text.length < 3) {
                _errorText = 'نظر شما باید بیش از حرف داشته باشد.';
              } else {
                _errorText = null;

                if(_ticketRegistrationClick) {
                  _ticketRegistration();
                }
              }
            });
          },
          label: Text(
            _ticketRegistrationClick ? 'ثبت نظر' : 'لطفاً شکیبا باشید.',
          ),
          icon: Icon(Ionicons.checkmark_outline),
        ),
      ),
    );
  }

  void _ticketRegistration() async {
    setState(() {
      _ticketRegistrationClick = false;
    });

    customDio = await CustomDio.dio.post(
      'dashboard/tickets/store',
      data: {
        'title': _topic,
        'body': _ticketController.text,
      },
    );

    setState(() {
      if (customDio.statusCode == 200) {
        _ticketRegistrationClick = true;

        _topic = null;
        _ticketController = TextEditingController();
        dataIsLoading = true;

        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            context,
            Ionicons.checkmark_done_outline,
            'نظر شما با موفقیت ثبت شد.',
            4,
          ),
        );
      } else {
        _ticketRegistrationClick = true;

        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar(
            context,
            Ionicons.refresh_outline,
            'لطفاً دوباره امتحان کنید.',
            4,
          ),
        );
      }
    });
  }

  Widget _firstTicketView() {
    if (_firstTicket == null) {
      return Column(
        children: [
          SizedBox(
            height: 10.0.h,
          ),
          Text(
            'شما تا کنون نظری به ثبت نرسانده اید.',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: 10.0.h,
          ),
        ],
      );
    } else {
      return TicketView(
        ticketData: _firstTicket!,
        display: _displayFirstTicket,
        onTap: () {
          setState(() {
            _displayFirstTicket = _displayFirstTicket ? false : true;
          });
        },
      );
    }
  }
}

// ignore: must_be_immutable
class TicketsPage extends StatefulWidget {
  const TicketsPage({Key? key}) : super(key: key);

  @override
  _TicketsPageState createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage>
    with InternetConnection, LoadDataFromAPI, Refresher, DisplayOfDetails {
  late List<TicketData> _tickets;
  late List<TicketData> _ticketsTemp;

  @override
  void initState() {
    super.initState();

    _tickets = [];
    _ticketsTemp = [];
  }

  Future _initTickets() async {
    customDio = await CustomDio.dio.post(
      'dashboard/tickets',
      queryParameters: {'page': currentPage},
    );

    if (customDio.statusCode == 200) {
      customResponse = CustomResponse.fromJson(customDio.data);

      lastPage = customResponse.data['last_page'];

      if (currentPage == 1) {
        _ticketsTemp.clear();
      }

      for (Map<String, dynamic> ticket in customResponse.data['data']) {
        _ticketsTemp.add(TicketData.fromJson(ticket));
      }

      setState(() {
        refresh = false;
        loading = false;

        _tickets.clear();
        _tickets.addAll(_ticketsTemp);

        displayOfDetails = List<bool>.generate(
          _tickets.length,
          (index) => false,
        );

        dataIsLoading = false;
      });
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
      title: const Text('نظرات شما'),
      automaticallyImplyLeading: false,
      leading: const Icon(
        Ionicons.call_outline,
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
    if (dataIsLoading) {
      return FutureBuilder(
        future: _initTickets(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return _innerBody();
          } else {
            return Center(child: CustomCircularProgressIndicator());
          }
        },
      );
    } else {
      return _innerBody();
    }
  }

  Widget _innerBody() {
    if (connectionStatus == ConnectivityResult.none) {
      setState(() {
        dataIsLoading = true;
      });

      return const Center(
        child: NoInternetConnection(),
      );
    } else {
      if (_tickets.isEmpty) {
        return const Center(
          child: Text('شما تا کنون نظری به ثبت نرسانده اید.'),
        );
      } else {
        return CustomSmartRefresher(
          refreshController: refreshController,
          onRefresh: () => onRefresh(() => _initTickets()),
          onLoading: () => onLoading(() => _initTickets()),
          list: List<Padding>.generate(
            _tickets.length,
            (index) => Padding(
              padding: EdgeInsets.only(
                left: 5.0.w,
                top: index == 0 ? 16.0 : 0.0,
                right: 5.0.w,
                bottom: index == _tickets.length - 1 ? 0.0 : 16.0,
              ),
              child: TicketView(
                ticketData: _tickets[index],
                display: displayOfDetails[index],
                onTap: () => display(index),
              ),
            ),
          ),
          listType: 'نظر',
          refresh: refresh,
          loading: loading,
          lastPage: lastPage,
          currentPage: currentPage,
          dataIsLoading: dataIsLoading,
        );
      }
    }
  }
}

// ignore: must_be_immutable
class TicketView extends StatefulWidget {
  late TicketData ticketData;
  late bool display;
  late void Function() onTap;

  TicketView({
    Key? key,
    required this.ticketData,
    required this.display,
    required this.onTap,
  }) : super(key: key);

  @override
  _TicketViewState createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 18.0,
        top: 18.0,
        right: 18.0,
        bottom: 8.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        children: [
          Property(
            property: 'موضوع',
            value: widget.ticketData.topic.title!,
            valueInTheEnd: false,
            lastProperty: false,
          ),
          Property(
            property: 'تاریخ ارسال',
            value: widget.ticketData.sentDate,
            valueInTheEnd: false,
            lastProperty: false,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 0.0,
              top: 0.0,
              right: 0.0,
              bottom: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  child: Text('وضعیت:'),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          widget.ticketData.status.title!,
                          style: TextStyle(
                            color: widget.ticketData.status.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.display,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 24.0,
                ),
                Property(
                  property: 'دیدگاه شما',
                  value: '',
                  valueInTheEnd: false,
                  lastProperty: false,
                ),
                Text(
                  '- ${widget.ticketData.text}',
                  textAlign: TextAlign.justify,
                ),
                Visibility(
                  visible: widget.ticketData.status == TicketStatus.answered,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        height: 24.0,
                      ),
                      Property(
                        property: 'پاسخ ما',
                        value: '',
                        valueInTheEnd: false,
                        lastProperty: false,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List<Text>.generate(
                          widget.ticketData.answers.length,
                          (ticketIndex) => Text(
                            '${ticketIndex + 1}- ${widget.ticketData.answers[ticketIndex]}',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 24.0,
          ),
          InkWell(
            onTap: widget.onTap,
            child: Icon(
              widget.display ? Icons.expand_less : Icons.expand_more,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
