import 'package:muggles/helpers/data.dart';
import 'package:muggles/screens/complaint/comaplaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:groovin_widgets/groovin_widgets.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'theme.dart';

class ComplaintHistoryGenerator extends StatefulWidget {
  List<ComplaintList> complaintList;
  ComplaintHistoryGenerator({this.complaintList});

  @override
  _ComplaintHistoryGeneratorState createState() =>
      _ComplaintHistoryGeneratorState();
}

class _ComplaintHistoryGeneratorState extends State<ComplaintHistoryGenerator> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height * 0.43,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('complaints').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // List<ComplaintList> list;
              // list = ComplaintList.fromJSON(snapshot.data.data());
              QuerySnapshot querySnapshot = snapshot.data;
              return ListView.builder(
                  itemCount: querySnapshot.docs.length,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    List data = querySnapshot.docs.toList();
                    ComplaintList complaintList =
                        ComplaintList.fromJSON(data[index]);
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: GroovinExpansionTile(
                          boxDecoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                offset: Offset(-3.0, -3.0),
                                blurRadius: 3.0,
                              ),
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(3.0, 3.0),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          leading: Icon(
                            Icons.receipt,
                            color: Color(primaryColor),
                          ),
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Amount No : ',
                                        style: TextStyle(
                                            color: Color(secondaryColor),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        complaintList.accNo.toString(),
                                        style: TextStyle(
                                            color: Color(primaryColor),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Category: ',
                                        style: TextStyle(
                                            color: Color(secondaryColor),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        complaintList.category,
                                        style: TextStyle(
                                            color: Color(primaryColor),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        'Description : ',
                                        style: TextStyle(
                                            color: Color(secondaryColor),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        complaintList.desc,
                                        style: TextStyle(
                                            color: Color(secondaryColor),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        overflow: TextOverflow.fade,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            )
                          ],
                          subtitle: Text(
                            'Click to view complaint details',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Color(secondaryColor),
                            ),
                          ),
                          title: Text(
                            DateFormat.yMMMEd()
                                .format(complaintList.timestamp.toDate())
                                .toString(),
                            style: TextStyle(
                                color: Color(secondaryColor),
                                fontFamily: 'Poppins',
                                fontSize: 17),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
