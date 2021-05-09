import 'package:muggles/widgets/customButton.dart';
import 'package:muggles/widgets/customeInput.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:muggles/widgets/titleBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../drawer.dart';

double xPosition = 0;
double yPosition = 0;
double scaling = 1;
bool isDrawerOpen = false;
bool cardFlipped = false;
double wattsconsumed = 40;

class CreateComplaint extends StatefulWidget {
  @override
  _CreateComplaintState createState() => _CreateComplaintState();
}

class _CreateComplaintState extends State<CreateComplaint> {
  String desc, category = "Select the category";
  bool loader = false;
  
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
    return Scaffold(
        body: Stack(
      children: <Widget>[
        DrawerScreen(
          boldIndex: 3,
        ),
        AnimatedContainer(
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          CustomTextInput(
                            hintText: '300284947',
                            // leading: Icons.person,
                            obscure: false,
                            enabled: false,
                            width: MediaQuery.of(context).size.width * 0.9,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: DropdownButtonFormField<String>(
                                value: category,
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                                items: <String>[
                                  'Select the category',
                                  'Power Outrage',
                                  'Critical Failure',
                                  'Incorrect Readings'
                                ].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  category = val;
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomTextInput(
                            hintText: 'Enter Complaint Description',
                            // leading: Icons.edit,
                            obscure: false,
                            maxLines: 6,
                            width: MediaQuery.of(context).size.width * 0.9,
                            userTyped: (val) {
                              desc = val;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          loader
                              ? CircularProgressIndicator()
                              : CustomButton(
                                  accentColor: Color(primaryColor),
                                  text: 'Post Complaint',
                                  onpress: () async {
                                    setState(() {
                                      loader = true;
                                    });
                                    await FirebaseFirestore.instance
                                        .collection('complaints')
                                        .doc()
                                        .set({
                                      'account_no': 300284947,
                                      'category': category,
                                      'geo_location':
                                          GeoPoint(30.792182, 76.76609),
                                      'status': 0,
                                      'timestamp': Timestamp.now(),
                                      'user_name': 'User Name',
                                      'summary': desc
                                    }).then((value) => setState(() {
                                              loader = false;
                                              Navigator.pop(context);
                                            }));
                                  },
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
