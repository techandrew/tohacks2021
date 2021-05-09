import 'package:muggles/widgets/billCard.dart';
import 'package:muggles/widgets/billingHistoryCard.dart';
import 'package:muggles/widgets/statusCard.dart';
import 'package:muggles/widgets/titleBar.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class PayBillsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(
            boldIndex: 2,
          ),
          BillScreen(),
        ],
      ),
    );
  }
}

double xPosition = 0;
double yPosition = 0;
double scaling = 1;
bool isDrawerOpen = false;
bool cardFlipped = false;
double wattsconsumed = 40;

class BillScreen extends StatefulWidget {
  @override
  _BillScreenState createState() => _BillScreenState();
}

class _BillScreenState extends State<BillScreen> {
  dashboardSwitchHandler() {
    setState(() {
      if (isDrawerOpen) {
        xPosition = 0;
        scaling = 1;
        yPosition = 0;
        isDrawerOpen = false;
      } else {
        xPosition = MediaQuery.of(context).size.width * 0.6;
        scaling = 0.7;
        yPosition = MediaQuery.of(context).size.height * 0.15;
        isDrawerOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xPosition, yPosition, 0)
        ..scale(scaling),
      decoration: BoxDecoration(
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          color: Colors.white),
      duration: Duration(milliseconds: 250),
      child: GestureDetector(
        onHorizontalDragStart: (details) {
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
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Hero(
                      tag: 'status',
                      child: Material(
                        type: MaterialType.transparency,
                        child: StatusCard(
                          leadingIcon: Icons.check,
                          mainTextNormal: 'A/C : ',
                          mainTextBold: '300284787',
                          subTextNormal: 'STATUS : ',
                          subTextBold: 'PAID',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BillCard(),
                    SizedBox(
                      height: 30,
                    ),
                    BillingHistoryCard()
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
