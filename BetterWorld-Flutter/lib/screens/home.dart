import 'package:muggles/widgets/billCard.dart';
import 'package:muggles/widgets/connectionStatusCard.dart';
import 'package:muggles/widgets/listButtons.dart';
import 'package:muggles/widgets/statusCard.dart';
import 'package:muggles/widgets/titleBar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../enums.dart';

double xOffset = 0;
double yOffset = 0;
double scaleFactor = 1;
bool isDrawerOpen = false;
bool isCardFlipped = false;
double wattsconsumed = 7.6;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _auth = FirebaseAuth.instance;
  // User loggedInUser;
  // void getCurrentUser() async {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       // print(loggedInUser.email);
  //       // print(loggedInUser.displayName);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // getCurrentUser();
  }

  cardFlipHandler() {
    setState(() {
      isCardFlipped = !isCardFlipped;
    });
  }

  dashboardSwitchHandler() {
    setState(() {
      if (isDrawerOpen) {
        xOffset = 0;
        scaleFactor = 1;
        yOffset = 0;
        isDrawerOpen = false;
      } else {
        xOffset = MediaQuery.of(context).size.width * 0.6;
        scaleFactor = 0.7;
        yOffset = MediaQuery.of(context).size.height * 0.15;
        isDrawerOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _connectionStatus = Provider.of<ConnectivityStatus>(context);

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          color: Colors.white),
      duration: Duration(milliseconds: 250),
      child: GestureDetector(
        onHorizontalDragStart: (dragdetails) {
          dashboardSwitchHandler();
        },
        child: Material(
          elevation: 10,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          child: Scaffold(
            appBar: TitleBar(
              dashboardSwitcher: dashboardSwitchHandler,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              // margin: EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Hero(
                      tag: 'status',
                      child: _connectionStatus == ConnectivityStatus.Cellular
                          ? StatusCard(
                              mainTextNormal: 'Good Evening, ',
                              mainTextBold: 'User Name!',
                              subTextNormal: 'STATUS : ',
                              subTextBold: 'METER CONNECTED',
                              leadingIcon: Icons.power)
                          : _connectionStatus == ConnectivityStatus.WiFi
                              ? StatusCard(
                                  mainTextNormal: 'Good Evening, ',
                                  mainTextBold: 'User Name!',
                                  subTextNormal: 'STATUS : ',
                                  subTextBold: 'METER CONNECTED',
                                  leadingIcon: Icons.power)
                              : StatusCard(
                                  mainTextNormal: 'Good Evening, ',
                                  mainTextBold: 'User Name!',
                                  subTextNormal: 'STATUS : ',
                                  warning: true,
                                  subTextBold: 'METER DISCONNECTED',
                                  leadingIcon: Icons.warning),
                    ),
                    SizedBox(height: 20),
                    ConnectionStatusCard(),
                    SizedBox(
                      height: 20,
                    ),
                    ListButtons(),
                    SizedBox(
                      height: 20,
                    ),
                    Hero(
                      tag: 'card',
                      child: Container(
                        child: BillCard(
                          creditCardFlip: cardFlipHandler,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
