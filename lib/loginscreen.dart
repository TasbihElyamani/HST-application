//import 'package:app/homescreen.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/FirebaseFirestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  double screenHight = 0;
  double screenWidth = 0;
  Color primary = Colors.white;

  late SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    final bool iskeyboardVisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);

    screenHight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          iskeyboardVisible
              ? SizedBox(
                  height: screenHight / 16,
                )
              : Container(
                  height: screenHight / 2.5,
                  width: screenWidth,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    ),
                  ),
                  child: Center(
                      child: Icon(
                    Icons.lock_clock,
                    color: Colors.white,
                    size: screenWidth / 5,
                  )),
                ),
          Container(
            margin: EdgeInsets.only(
              top: screenHight / 15,
              bottom: screenHight / 20,
            ),
            child: Text(
              "Techno",
              style: TextStyle(
                fontSize: screenWidth / 12,
                fontFamily: "NexaBold",
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(
              horizontal: screenWidth / 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                fieldTitle("User's ID"),
                customField("Enter Your ID", idController, false),
                fieldTitle("Password"),
                customField("Enter Your Password", passController, true),
                // GestureDetector(
                //   onTap: () async {
                //    String id = idController.text.trim();
                //    String password = passController.text.trim();
                //    QuerySnapshot snap = await FirebaseFirestore.instance
                //    .collection("Users").where('id', isEqualTo: id).get()
                //   },
                // )
                GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    String ID = idController.text.trim();
                    String password = passController.text.trim();

                    if (ID.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("user ID is still empty!"),
                      ));
                    } else if (password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Password is still empty!"),
                      ));
                    }
                    // else {
                    //  QuerySnapshot snap = await FirebaseFirestore.instance
                    //       .collection("user")
                    //       .where('id', isEqualTo: ID)
                    //       .get();

                    // try {
                    //   if (password == snap.docs[0]['passwprd']) {
                    // sharedPreferences = await SharedPreferences.getInstance();

                    //  SharedPreferences.setString('user',ID).then(()
                    //  {
                    //      Navigator.pushReplacement(context,
                    //        MaterialPageRoute(builder: (context) => HomeScreen())
                    //       );
                    //  });
                    //    Navigator.pushReplacement(context,
                    //      MaterialPageRoute(builder: (context) => HomeScreen())
                    //      );
                    //   } else {
                    //     ScaffoldMessenger.of(context)
                    //         .showSnackBar(const SnackBar(
                    //       content: Text("Password is not correct!"),
                    //     ));
                    //   }
                    // } catch (e) {
                    //   String error = "";
                    //   print(e.toString());
                    //   if (e.toString() == "Invalid value") {}
                    //   setState(() {
                    //     error = "Email dose not exist";
                    //   });
                    //   } else {
                    //     setState(() {
                    //       String error = "Error occure";
                    //     });
                    //   }
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     content: Text(error),
                    //   ));
                //     }
                 },
                  child: Container(
                    height: 60,
                    width: screenWidth,
                    margin: EdgeInsets.only(top: screenHight / 40),
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                          fontFamily: "NexBold",
                          fontSize: screenWidth / 26,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fieldTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: screenWidth / 26,
          fontFamily: "NexaBold",
        ),
      ),
    );
  }

  Widget customField(
      String hint, TextEditingController controller, bool obscure) {
    return Container(
      width: screenWidth,
      margin: EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: screenWidth / 6,
            child: Icon(
              Icons.security,
              color: primary,
              size: screenWidth / 15,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth / 12),
              child: TextFormField(
                controller: controller,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenHight / 35,
                  ),
                  border: InputBorder.none,
                  hintText: hint,
                ),
                maxLines: 1,
                obscureText: obscure,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
