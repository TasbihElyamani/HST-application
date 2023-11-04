//import 'package:app/logic/model/mysql.dart';
// import 'package:app/model/user.dart';
import 'package:app/screen/calendarscreen.dart';
import 'package:app/screen/daterangescreen.dart';
import 'package:app/screen/profilescreen.dart';
import 'package:app/screen/todayscreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import '../screen/todayscreen.dart';
// import '../screen/calendarscreen.dart';
// import '../screen/profilescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //String id = '';
  final items = const [
    Icon(
      Icons.check,
      size: 30,
    ),
    Icon(
      Icons.calendar_month,
      size: 30,
    ),
    Icon(
      Icons.people,
      size: 30,
    ),

    Icon(
      Icons.calendar_today,
      size: 30,
    ),
    // Icon(Icons.search_outlined, size: 30,)
  ];

  int index = 1;
  // var db = new Mysql();
  @override
  void initState() {
    super.initState();

    // getID();
  }

  // void getID() async {
  //   QuerySnapshot snap = await FirebaseFirestore.instance
  //       .collection("user")
  //       .where("id", isEqualTo: User.userID)
  //       .get();
  // }
// @override
//   setState((){
//     user.id = snap.docs[0].id; });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Techno'),
        backgroundColor: Color.fromARGB(255, 148, 205, 230),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color.fromARGB(255, 148, 205, 230),
        items: items,
        index: index,
        onTap: (selctedIndex) {
          setState(() {
            index = selctedIndex;
          });
        },
        height: 70,
        backgroundColor: Colors.transparent,
        animationDuration: const Duration(milliseconds: 300),
        // animationCurve: ,
      ),
      body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: getSelectedWidget(index: index)),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = const TodayScreen();
        break;
      case 1:
        widget = const CalendarScreen();
        break;
      case 2:
        widget = const ProfilScreen();
        break;
      default:
        widget = const Daterangescreen();
        break;
    }
    return widget;
  }
  // Color primary = Colors.green;
  // int _sellelctIndex = 0;
  // int currentIndex = 0;

  // List Screens = [
  //   TodayScreen(),
  //   CalendarScreen(),
  //   ProfilScreen(),
  // ];

  //   int _selectIndex = 0;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // body: IndexedStack(
  //     // index: currentIndex,
  //     //   children: [
  //     //     TodayScreen(),
  //     //     CalendarScreen(),
  //     //     ProfilScreen(),
  //     //   ],
  //     // ),

  //    // body: screens[_index],

  //     bottomNavigationBar: CurvedNavigationBar(
  //       index: _selectIndex ,
  //       // currentIndex: _index,

  //       // onTap: (value) {
  //       //   setState(() {
  //       //     _index = value;
  //       //   });
  //       // },
  //       backgroundColor: Color.fromARGB(255, 99, 235, 90),
  //       color: Colors.lightGreen.shade200,
  //       animationDuration: const Duration(microseconds: 300),
  //       //onTap: (index) {
  //       //print(index);
  //       // },
  //       items: [
  //         Icon(
  //           Icons.home,
  //           color: Colors.white,
  //           size: 40,
  //         ),
  //         Icon(
  //           Icons.calendar_today,
  //           color: Colors.white,
  //           size: 40,
  //         ),
  //         Icon(
  //           Icons.check_sharp,
  //           color: Colors.white,
  //           size: 40,
  //         ),
  //       ],

  //        onTap: (index) {
  //         setState(() {
  //           index = _sellelctIndex;
  //         });
  //       },

  //     ),
  //     body: Screens[_selectIndex],
  //   );
}
