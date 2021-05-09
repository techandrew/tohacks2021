import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {

final String title;

SectionHeading({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: 25),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.history,
            color: Color(secondaryColor),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
                color: Color(secondaryColor),
                fontFamily: 'Poppins',
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}