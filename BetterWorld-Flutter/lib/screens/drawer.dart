import 'package:muggles/widgets/drawerItem.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  final int boldIndex;
  DrawerScreen({this.boldIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      width: MediaQuery.of(context).size.width,
      color: Color(primaryColor),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DrawerItem(
                  text: 'Dashboard',
                  icon: Icons.dashboard,
                  isBold: boldIndex == 1 ? true : false,
                  newroute: '/dashboard',
                ),
                DrawerItem(
                  text: 'Pay Bills',
                  icon: Icons.receipt,
                  isBold: boldIndex == 2 ? true : false,
                  newroute: '/bill',
                ),
                DrawerItem(
                  text: 'Complaints',
                  icon: Icons.warning,
                  isBold: boldIndex == 3 ? true : false,
                  newroute: '/complaints',
                ),
                DrawerItem(
                  text: 'View Usage',
                  icon: Icons.assignment,
                  isBold: boldIndex == 4 ? true : false,
                  newroute: '/usage',
                ),
                DrawerItem(
                  text: 'Bored?',
                  icon: Icons.videogame_asset,
                  isBold: boldIndex == 6 ? true : false,
                  newroute: '/game',
                ),
                DrawerItem(
                  text: 'Settings',
                  icon: Icons.settings,
                  isBold: boldIndex == 7 ? true : false,
                  newroute: '/',
                ),
                DrawerItem(
                  text: 'Logout',
                  icon: Icons.exit_to_app,
                  isBold: boldIndex == 7 ? true : false,
                  newroute: '/auth',
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Made with ♥ by',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    Text(
                      'Bachmanity Insanity',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
