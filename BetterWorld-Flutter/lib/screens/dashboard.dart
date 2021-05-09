import 'package:flutter/material.dart';

import 'drawer.dart';
import 'home.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            DrawerScreen(boldIndex: 1,),
            HomeScreen(),
          ],
        ),
    );
  }
}