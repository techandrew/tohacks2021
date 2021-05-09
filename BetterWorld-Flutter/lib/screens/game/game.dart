import 'package:muggles/widgets/theme.dart';
import 'package:muggles/widgets/titleBar.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';
import 'circle.dart';
import 'cross.dart';
import 'difficultLevelDialog.dart';
import 'twoPlayerGame.dart';

class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(
            boldIndex: 6,
          ),
          GamePage(),
        ],
      ),
    );
  }
}

double xOffset = 0;
double yOffset = 0;
double scaleFactor = 1;
bool isDrawerOpen = false;

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          color: Colors.white),
      child: GestureDetector(
        onHorizontalDragStart: (dragdetails) {
          dashboardSwitchHandler();
        },
        child: Material(
          color: Colors.white,
          elevation: 10,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          child: Scaffold(
            appBar: TitleBar(
              dashboardSwitcher: dashboardSwitchHandler,
            ),
            body: Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: Cross(),
                            ),
                            SizedBox(
                              width: 110.0,
                              height: 110.0,
                              child: Circle(),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 110.0,
                              height: 110.0,
                              child: Circle(),
                            ),
                            SizedBox(
                              width: 100.0,
                              height: 100.0,
                              child: Cross(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: 'Tic ',
                                style: TextStyle(
                                  color: Color(primaryColor),
                                  fontSize: 32.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Tac ',
                                style: TextStyle(
                                  color: Color(secondaryColor),
                                  fontSize: 38.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: 'Toe',
                                style: TextStyle(
                                  color: Color(primaryColor),
                                  fontSize: 32.0,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: GestureDetector(
                            onTap: () => showDialog(
                                context: context,
                                builder: (context) => DifficultyLevelDialog()),
                            child: Material(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(primaryColor),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    'Single Player',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TwoPlayerGame(),
                              ),
                            ),
                            child: Material(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(secondaryColor),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text(
                                    'Multi Player',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 18),
                                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}
