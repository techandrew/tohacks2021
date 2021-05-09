// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final text;
  final icon;
  final bool isBold;
  final newroute;
  DrawerItem(
      {@required this.text,
      this.icon,
      this.isBold = false,
      @required this.newroute});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // if (text == 'Logout') {
        //   await FirebaseAuth.instance.signOut();
        //   print('Logged Out');
        // }
        Navigator.pushReplacementNamed(context, newroute);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
