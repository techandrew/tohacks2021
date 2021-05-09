import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color accentColor;
  final Color mainColor;
  final String text;
  final Function onpress;
  final double width;
  CustomButton({this.accentColor, this.text, this.mainColor, this.onpress, this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: accentColor,
            ),
            color: mainColor,
            borderRadius: BorderRadius.circular(50)),
        width: width ?? MediaQuery.of(context).size.width * 0.7,
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(color: accentColor),
          ),
        ),
      ),
    );
  }
}
