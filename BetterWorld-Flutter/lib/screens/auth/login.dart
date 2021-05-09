import 'package:muggles/widgets/customButton.dart';
import 'package:muggles/widgets/customeInput.dart';
import 'package:muggles/widgets/logo.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:muggles/widgets/title.dart';
import 'package:edge_alert/edge_alert.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool loggingin = false;

  // User loggedInUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: loggingin,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                ),
                MugglesLogo(),
                SizedBox(
                  height: 10,
                ),
                MugglesTitle(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  "Your most energetic companion.".toUpperCase(),
                  style: TextStyle(fontSize: 12, color: Colors.deepPurple),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: 'Enter Phone Number',
                  leading: Icons.phone,
                  obscure: false,
                  keyboard: TextInputType.phone,
                  userTyped: (val) {
                    email = val;
                  },
                ),
                // CustomTextInput(
                //   hintText: 'Password',
                //   leading: Icons.lock,
                //   obscure: true,
                //   userTyped: (val) {
                //     password = val;
                //   },
                // ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                    accentColor: Color(primaryColor),
                    onpress: () async {
                      // TODO: LogIn
                      // if (password != null && email != null) {
                      //   setState(() {
                      //     loggingin = true;
                      //   });
                      //   try {
                      //     final loggedUser =
                      //         await _auth.signInWithEmailAndPassword(
                      //             email: email, password: password);
                      //     if (loggedUser != null) {
                      //       setState(() {
                      //         loggingin = false;
                      //       });
                      //       Navigator.pushNamed(context, '/');
                      //     }
                      //   } catch (e) {
                      //     setState(() {
                      //       loggingin = false;
                      //     });
                      //     EdgeAlert.show(
                      //       context,
                      //       title: 'Login Failed',
                      //       description: e.toString(),
                      //       gravity: EdgeAlert.BOTTOM,
                      //       icon: Icons.error,
                      //       backgroundColor: Color(primaryColor),
                      //     );
                      //   }
                      // } else {
                      //   EdgeAlert.show(
                      //     context,
                      //     title: 'Uh oh!',
                      //     description: 'Please enter the email and password.',
                      //     gravity: EdgeAlert.BOTTOM,
                      //     icon: Icons.error,
                      //     backgroundColor: Color(primaryColor),
                      //   );
                      // }
                      Navigator.pushNamedAndRemoveUntil(context, '/dashboard',
                          (Route<dynamic> route) => false);
                    },
                    text: 'Get OTP',
                    mainColor: Colors.white),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'or',
                  style: TextStyle(color: Color(secondaryColor)),
                ),
                SizedBox(
                  height: 10,
                ),
                // SignInButton(
                //   Buttons.Google,
                //   onPressed: signInToGoogle,
                //   shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(50)),
                //   padding: EdgeInsets.only(
                //     right: 25,
                //     top: 10,
                //     bottom: 10,
                //     left: 30,
                //   ),
                // )
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/deviceSetUp');
                  },
                  child: Text(
                    'set up a new device'.toUpperCase(),
                    style: TextStyle(color: Color(primaryColor), fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
