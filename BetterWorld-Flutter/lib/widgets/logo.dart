import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';

class MugglesLogo extends StatelessWidget {
  const MugglesLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Color(primaryColor),
        radius: 74,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 72,
          child: Image.asset(
            'assets/logo.png',
            color: const Color(0XFF4345f4),
            height: 72,
          ),
        ));
  }
}
