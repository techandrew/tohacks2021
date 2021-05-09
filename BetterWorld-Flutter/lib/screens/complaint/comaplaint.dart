import 'package:muggles/widgets/complaintCard.dart';
import 'package:muggles/widgets/complaintStatusCard.dart';
import 'package:muggles/widgets/customButton.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:muggles/widgets/titleBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

class ComplaintScreen extends StatefulWidget {
  @override
  _ComplaintScreen createState() => _ComplaintScreen();
}

class _ComplaintScreen extends State<ComplaintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(
            boldIndex: 3,
          ),
          Complaint()
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

class Complaint extends StatefulWidget {
  @override
  _ComplaintState createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  List<ComplaintList> complaintList = [];
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
  void initState() {
    super.initState();
    getComaplaintList();
  }

  getComaplaintList() async {
    await FirebaseFirestore.instance
        .collection('complaints')
        .get()
        .then((value) => value.docs.forEach((element) {
              complaintList.add(ComplaintList(
                  accNo: element['account_no'],
                  category: element['category'],
                  geoPoint: element['geo_location'],
                  status: element['status'],
                  desc: element['summary'],
                  timestamp: element['timestamp'],
                  userName: element['user_name']));
            }));
            // complaintList.sort();
    setState(() {});
    print(complaintList);
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
                    ComplaintsStatusCard(),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'Create Comaplaint',
                      width: MediaQuery.of(context).size.width * 0.9,
                      accentColor: Color(primaryColor),
                      onpress: () =>
                          Navigator.pushNamed(context, '/createComplaint'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ComplaintHistoryCard(complaintList: this.complaintList)
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

class ComplaintList {
  final int accNo;
  final String category;
  final GeoPoint geoPoint;
  final int status;
  final String desc;
  final Timestamp timestamp;
  final String userName;
  ComplaintList(
      {this.accNo,
      this.category,
      this.desc,
      this.geoPoint,
      this.status,
      this.timestamp,
      this.userName});

  factory ComplaintList.fromJSON(QueryDocumentSnapshot snapshot) {
    return ComplaintList(
        accNo: snapshot['account_no'],
        category: snapshot['category'],
        geoPoint: snapshot['geo_location'],
        status: snapshot['status'],
        desc: snapshot['summary'],
        timestamp: snapshot['timestamp'],
        userName: snapshot['user_name']);
  }
}
