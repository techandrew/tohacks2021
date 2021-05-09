
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

import 'statusCard.dart';
import 'theme.dart';

class ComplaintsStatusCard extends StatelessWidget {
  const ComplaintsStatusCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(1),
            offset: Offset(-1.0, -1.0),
            blurRadius: 50.0,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            offset: Offset(1.0, 1.0),
            blurRadius: 50.0,
          ),
        ],
      ),
      child: SlimyCard(
        color: Color(primaryColor),
        width: MediaQuery.of(context).size.width * 0.95,
        topCardHeight: 150,
        bottomCardHeight: 150,
        borderRadius: 15,
        bottomCardWidget: Container(
          padding: EdgeInsets.only(left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Category : ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Text(
                    'Power Issues',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Message : ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Text(
                    'Power gone from past 3 hours',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 14),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Response : ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Text(
                    'Awaiting..',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
        topCardWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: MediaQuery.of(context).size.width),
            StatusCard(
              normal: false,
              warning: true,
              leadingIcon: Icons.info,
              mainTextNormal: 'Issue ID :  ',
              mainTextBold: '00784',
              subTextNormal: 'STATUS : ',
              subTextBold: 'IN PROGRESS',
            ),
          ],
        ),
        slimeEnabled: true,
      ),
    );
  }
}
