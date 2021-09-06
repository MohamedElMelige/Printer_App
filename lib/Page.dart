// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// import 'Newpage.dart';
// class Page extends StatefulWidget {
//   @override
//   _PageState createState() => _PageState();
// }

// class _PageState extends State<Page> {
//   void initState(){
//     _fcm.configure(onLaunch: (Map<String, dynamic> message) async {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Newpage(),
//         ),
//       );
//     }, onResume: (Map<String, dynamic> message) async {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Newpage(),
//         ),
//       );
//     }, onMessage: (Map<String, dynamic> message) async {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => Newpage(),
//         ),
//       );
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
