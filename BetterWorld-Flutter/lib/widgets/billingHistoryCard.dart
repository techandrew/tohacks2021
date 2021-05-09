import 'package:flutter/material.dart';
import 'billingHistorylistGenerator.dart';
import 'sectionHeading.dart';

class BillingHistoryCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:25),
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width-40,
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
          SectionHeading(title: "Billing History",),
          SizedBox(height: 10,),
          BillingHistoryListGenerator(),
        ],
      ),
    );
  }
}