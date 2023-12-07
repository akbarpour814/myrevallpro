//------/dart and flutter packages
import 'package:flutter/material.dart';

//------/packages
import 'package:ionicons/ionicons.dart';

//------/model
import '/model/category.dart';

//------/view/pages/category_page
import '/view/pages/category_page/subcategory_books_page.dart';

//------/view/view_models
import '/view/view_models/category_name.dart';

//------/main
import '/main.dart';

// ignore: must_be_immutable
class SubcategoriesPage extends StatefulWidget {
  late IconData iconData;
  late String title;
  late List<Subcategory> subcategories;

  SubcategoriesPage({
    Key? key,
    required this.iconData,
    required this.title,
    required this.subcategories,
  }) : super(key: key);

  @override
  _SubcategoriesPageState createState() => _SubcategoriesPageState();
}

class _SubcategoriesPageState extends State<SubcategoriesPage> {
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
      title: Text(widget.title),
      automaticallyImplyLeading: false,
      leading: Icon(
        widget.iconData,
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

  SingleChildScrollView _body() {
    return SingleChildScrollView(
      child: Column(
        children: List<CategoryName>.generate(
          widget.subcategories.length,
          (index) => CategoryName(
            iconData: null,
            title: widget.subcategories[index].name,
            lastCategory: false,
            page: SubcategoryBooksPage(
              subcategory: widget.subcategories[index],
            ),
          ),
        ),
      ),
    );
  }
}
