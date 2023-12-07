//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:pull_to_refresh/pull_to_refresh.dart';

//------/view/view_models
import '/view/view_models/custom_circular_progress_indicator.dart';

//------/main
import '/main.dart';

// ignore: must_be_immutable
class CustomSmartRefresher extends StatefulWidget {
  late RefreshController refreshController;
  late void Function() onRefresh;
  late void Function() onLoading;
  late List<Widget> list;
  late String listType;
  late bool refresh;
  late bool loading;
  late int lastPage;
  late int currentPage;
  late bool dataIsLoading;

  CustomSmartRefresher({
    Key? key,
    required this.refreshController,
    required this.onRefresh,
    required this.onLoading,
    required this.list,
    required this.listType,
    required this.refresh,
    required this.loading,
    required this.lastPage,
    required this.currentPage,
    required this.dataIsLoading,
  }) : super(key: key);

  @override
  _CustomSmartRefresherState createState() => _CustomSmartRefresherState();
}

class _CustomSmartRefresherState extends State<CustomSmartRefresher> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: widget.refreshController,
      onRefresh: widget.loading ? null : widget.onRefresh,
      onLoading: widget.refresh ? null : widget.onLoading,
      enablePullDown: true,
      enablePullUp: true,
      header: MaterialClassicHeader(
        backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
            ? Colors.white
            : Colors.grey.shade800,
      ),
      footer: CustomFooter(
        builder: (BuildContext? context, LoadStatus? mode) {
          Widget bar;

          if ((mode == LoadStatus.idle) &&
              (widget.currentPage == widget.lastPage) &&
              (!widget.dataIsLoading)) {
            bar = Text(
              '${widget.listType} دیگری یافت نشد.',
              style: TextStyle(
                color: Theme.of(context!).primaryColor,
              ),
            );
          } else if (mode == LoadStatus.idle) {
            bar = Text(
              'لطفاً صفحه را بالا بکشید.',
              style: TextStyle(
                color: Theme.of(context!).primaryColor,
              ),
            );
          } else if (mode == LoadStatus.loading) {
            bar = const Center(
              child: CustomCircularProgressIndicator(),
            );
          } else if (mode == LoadStatus.failed) {
            bar = Text(
              'لطفاً دوباره امتحان کنید.',
              style: TextStyle(
                color: Theme.of(context!).primaryColor,
              ),
            );
          } else if (mode == LoadStatus.canLoading) {
            bar = Text(
              'لطفاً صفحه را پایین بکشید.',
              style: TextStyle(
                color: Theme.of(context!).primaryColor,
              ),
            );
          } else {
            bar = Text(
              '${widget.listType} دیگری یافت نشد.',
              style: TextStyle(
                color: Theme.of(context!).primaryColor,
              ),
            );
          }

          return SizedBox(
            height: 55.0,
            child: Center(child: bar),
          );
        },
      ),
      child: ListView(
        children: List<Widget>.generate(
          widget.list.length,
          (index) => widget.list[index],
        ),
      ),
    );
  }
}

mixin Refresher<T extends StatefulWidget> on State<T> {
  late RefreshController refreshController;
  late bool refresh;
  late bool loading;
  late int lastPage;
  late int currentPage;

  @override
  void initState() {
    super.initState();

    refreshController = RefreshController(initialRefresh: false);
    refresh = false;
    loading = false;
    currentPage = 1;
  }

  void onRefresh(Future<dynamic> Function() onRefresh) async {
    try {
      setState(() {
        refresh = loading ? false : true;

        if (refresh) {
          currentPage = 1;

          onRefresh();
        }
      });

      await Future.delayed(const Duration(milliseconds: 1000));

      refreshController.refreshCompleted();
    } catch (e) {
      refreshController.refreshFailed();
    }
  }

  void onLoading(Future<dynamic> Function() onLoading) async {
    try {
      if (currentPage < lastPage) {
        setState(() {
          loading = refresh ? false : true;

          if (loading) {
            currentPage++;

            onLoading();
          }
        });
      }

      await Future.delayed(const Duration(milliseconds: 1000));

      refreshController.loadComplete();
    } catch (e) {
      refreshController.loadFailed();
    }
  }
}
