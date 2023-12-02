import 'package:app/model/user.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:month_year_picker/month_year_picker.dart';

class TodayScreen extends StatefulWidget {
  const TodayScreen({super.key});

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  double screenWidth = 0;
  double screenHeight = 0;
  Color primary = Colors.white;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                "WELCOME",
                style: GoogleFonts.rubik(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "MR" + User.userID,
                style: GoogleFonts.rubik(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                "Today 's Status",
                style: GoogleFonts.rubik(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                ),
              
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 32),
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(239, 20, 165, 205),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Check In",
                            style: GoogleFonts.playfairDisplay(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                ),
                          ),
                          Text(
                            "09:30",
                              style: GoogleFonts.playfairDisplay(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Check Out",
                            style: GoogleFonts.playfairDisplay(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                ),
                        ),
                        Text(
                          "--/--",
                            style: GoogleFonts.playfairDisplay(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: DateTime.now().day.toString(),
                  style: GoogleFonts.rubik(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                  children: [
                    TextSpan(
                      text: DateFormat('MMMM yyyy').format(DateTime.now()),
                       style: GoogleFonts.playfairDisplay(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    DateFormat('hh:mm:ss:a').format(DateTime.now()),
                    style: GoogleFonts.rubik(
                  fontSize: screenWidth / 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                  ),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();
                  return SlideAction(
                    text: "Slide to Check Out",
                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: screenWidth / 18,
                      fontFamily: "NexaRegular",
                    ),
                    outerColor: Color.fromARGB(239, 20, 165, 205),
                    innerColor: primary,
                    key: key,
                    onSubmit: () async {
                      print(DateFormat('hh: mm').format(DateTime.now()));

                      // QuerySnapshot snap = await FirebaseFirestore.instance
                      //     .collection("user")
                      //     .where('id', isEqualTo: User.userID)
                      //     .get();

                      //  print(snap.docs[0].id);
                      //  print(DateFormat('dd MMMM yyyy').format(DateTime.now()));

                      // DocumentSnapshot snap2 = await FirebaseFirestore.instance
                      //     .collection("user")
                      //     .doc(snap.docs[0].id)
                      //     .collection("Record")
                      //     .doc(
                      //         DateFormat('dd MMMM yyyy').format(DateTime.now()))
                      //     .get();

                      // try {
                      //   // print(snap2['checkIn']);
                      //   String checkIn = snap2['checkIn'];
                      //     await FirebaseFirestore.instance
                      //       .collection("user")
                      //       .doc(snap.docs[0].id)
                      //       .collection("Record")
                      //       .doc(DateFormat('dd MMMM yyyy')
                      //           .format(DateTime.now()))
                      //       .update({
                      //     'checkIn': checkIn,
                      //     'checkOut': DateFormat('hh:mm').format(DateTime.now()),
                      //   });
                      // } catch (e) {
                      //   await FirebaseFirestore.instance
                      //       .collection("user")
                      //       .doc(snap.docs[0].id)
                      //       .collection("Record")
                      //       .doc(DateFormat('dd MMMM yyyy')
                      //           .format(DateTime.now()))
                      //       .set({
                      //     'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
                      //   });
                      // }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
