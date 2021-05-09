import 'package:muggles/screens/home.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:flutter/material.dart';

import 'title.dart';

class TitleBar extends StatelessWidget with PreferredSizeWidget{
  final Function dashboardSwitcher;
  TitleBar({this.dashboardSwitcher});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: MugglesTitle(),
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
              icon: Icon(isDrawerOpen ? Icons.arrow_back_ios : Icons.menu),
              iconSize: isDrawerOpen ? 28 : 22,
              color: Color(secondaryColor),
              onPressed: dashboardSwitcher,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
