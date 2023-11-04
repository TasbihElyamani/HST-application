import 'package:app/model/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreentState();
}

class _CalendarScreentState extends State<CalendarScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  Color primary = Color.fromARGB(255, 10, 3, 3);

  String _month = DateFormat('MMMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 99, 235, 90),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              "ATTENDANCE",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Montserrat",
                fontSize: screenWidth / 16,
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  _month,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "NexaBold",
                    fontSize: screenWidth / 16,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(top: 30),
                child: GestureDetector(
                  onTap: () async {
                    final month = await showMonthYearPicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2099),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: primary,
                              secondary: primary,
                              onSecondary: Colors.white,
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                primary: primary,
                                
                              ),
                            ),
                            textTheme: const TextTheme(
                              headline4: TextStyle(
                                fontFamily: "NexaBold"
                              ), 
                              overline:  TextStyle(
                                fontFamily: "NexaBold"
                              ), 
                              button:  TextStyle(
                                fontFamily: "NexaBold"
                              ), 

                            ),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (month != null) {
                      setState(() {
                        _month = DateFormat('MMM').format(month);
                      });
                    }
                  },
                
                child: Text(
                  "Pick a Date",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "NexaBold",
                    fontSize: screenWidth / 16,
                  ),
                ),
              ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight / 1.45,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("user")
                    .doc(User.userID)
                    .collection("Record")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    final snap = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: snap.length,
                      itemBuilder: (context, index) {
                        return DateFormat('MMMM')
                                    .format(snap[index]['date'].toDate()) ==
                                _month
                            ? Container(
                                margin: const EdgeInsets.only(
                                    top: 12, left: 6, right: 6),
                                height: 150,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(),
                                        decoration: BoxDecoration(
                                          color: primary,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Center(
                                          child: Text(
                                            //   snap[index].[names],
                                            DateFormat('MMM yyyy')
                                                .format(DateTime.now()),
                                            style: TextStyle(
                                              fontFamily: "NexaBold",
                                              fontSize: screenWidth / 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Check In",
                                            style: TextStyle(
                                              fontFamily: "NexaRegular",
                                              fontSize: screenWidth / 20,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            snap[index]['checkIn'],
                                            style: TextStyle(
                                              fontFamily: "NexaBold",
                                              fontSize: screenWidth / 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Check Out",
                                            style: TextStyle(
                                              fontFamily: "NexaRegular",
                                              fontSize: screenWidth / 20,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            snap[index]['checkOut'],
                                            style: TextStyle(
                                              fontFamily: "NexaBold",
                                              fontSize: screenWidth / 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox();
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
          ),
        ]),
      ),
    );
  }
}