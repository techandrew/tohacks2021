import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String mainTextNormal, mainTextBold, subTextNormal, subTextBold;
  final IconData leadingIcon;
  final bool warning;
  final bool normal;

  StatusCard(
      {this.mainTextNormal = '',
      this.normal = true,
      this.mainTextBold = '',
      this.subTextBold = '',
      this.subTextNormal = '',
      this.leadingIcon,
      this.warning = false});

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: normal ? EdgeInsets.symmetric(horizontal: 20) : null,
      width: normal
          ? MediaQuery.of(context).size.width - 40
          : MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: normal ? Colors.white : Color(primaryColor),
        borderRadius: BorderRadius.circular(20),
        boxShadow: normal
            ? [
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
              ]
            : [],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: warning
                ? normal
                    ? Colors.red
                    : Colors.white
                : normal
                    ? Color(primaryColor)
                    : Colors.white,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: normal ? Colors.white : Color(primaryColor),
              child: Icon(
                leadingIcon,
                size: 30,
                color: warning
                    ? normal
                        ? Colors.red
                        : Colors.white
                    : Color(primaryColor),
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(mainTextNormal,
                      style: TextStyle(
                          fontSize: 18,
                          color: normal ? Colors.grey[700] : Colors.white)),
                  Text(
                    mainTextBold,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: normal ? Color(secondaryColor) : Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    subTextNormal,
                    style: TextStyle(
                      fontSize: 14,
                      color: normal ? Color(secondaryColor) : Colors.white,
                    ),
                  ),
                  Text(
                    subTextBold,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: warning
                          ? normal
                              ? Colors.red
                              : Colors.white
                          : Color(primaryColor),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
