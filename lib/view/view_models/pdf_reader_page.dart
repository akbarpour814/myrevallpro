// //------/dart and flutter packages
// import 'package:flutter/material.dart';
//
// //------/packages
// import 'package:ionicons/ionicons.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
//
// //------/controller
// import '/controller/internet_connection.dart';
// import '/controller/load_data_from_api.dart';
//
// //------/main
// import '/main.dart';
//
// // ignore: must_be_immutable
// class PdfReaderPage extends StatefulWidget {
//   late String path;
//   PdfReaderPage({Key? key, required this.path,}) : super(key: key);
//
//   @override
//   _PdfReaderPageState createState() => _PdfReaderPageState();
// }
//
// class _PdfReaderPageState extends State<PdfReaderPage>
//     with InternetConnection, LoadDataFromAPI {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appBar(),
//       body: _body(),
//       bottomNavigationBar: playerBottomNavigationBar,
//     );
//   }
//
//   AppBar _appBar() {
//     return AppBar(
//       automaticallyImplyLeading: false,
//       actions: [
//         InkWell(
//           child: const Padding(
//             padding: EdgeInsets.all(18.0),
//             child: Icon(
//               Ionicons.chevron_back_outline,
//             ),
//           ),
//           onTap: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ],
//     );
//   }
//
//   Widget _body() {
//     return PDF(
//       enableSwipe: true,
//       swipeHorizontal: false,
//       autoSpacing: false,
//       pageFling: false,
//     ).fromUrl(
//       widget.path,
//       errorWidget: (dynamic error) => Center(child: Text(error.toString())),
//     );
//   }
// }
