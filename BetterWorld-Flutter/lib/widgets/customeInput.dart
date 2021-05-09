import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final IconData leading;
  final Function userTyped;
  final bool obscure;
  final bool enabled;
  final int maxLines;
  final TextInputType keyboard;
  final double width;
  CustomTextInput(
      {this.hintText,
      this.leading,
      this.userTyped,
      this.obscure,
      this.enabled = true,
      this.maxLines = 1,
      this.keyboard = TextInputType.text, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.only(left: 10),
      width: width ?? MediaQuery.of(context).size.width * 0.70,
      child: TextField(
        enabled: enabled,
        onChanged: userTyped,
        keyboardType: keyboard,
        onSubmitted: (value) {},
        autofocus: false,
        maxLines: maxLines,
        obscureText: obscure ? true : false,
        decoration: InputDecoration(
          icon: leading != null ? Icon(
            leading,
            color: Color(primaryColor),
          ) : null,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(secondaryColor),
          ),
        ),
      ),
    );
  }
}
