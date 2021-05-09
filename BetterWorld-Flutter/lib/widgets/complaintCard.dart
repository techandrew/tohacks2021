import 'package:muggles/screens/complaint/comaplaint.dart';
import 'package:flutter/material.dart';

import 'complaintHistoryGenerator.dart';
import 'sectionHeading.dart';

class ComplaintHistoryCard extends StatelessWidget {
  List<ComplaintList> complaintList;
  ComplaintHistoryCard({this.complaintList});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25),
      width: MediaQuery.of(context).size.width - 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: Offset(-6.0, -6.0),
            blurRadius: 16.0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(6.0, 6.0),
            blurRadius: 16.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          SectionHeading(
            title: 'Past Complaints',
          ),
          ComplaintHistoryGenerator(complaintList: this.complaintList)
        ],
      ),
    );
  }
}
