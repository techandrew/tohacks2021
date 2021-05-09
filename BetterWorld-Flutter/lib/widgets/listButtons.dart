import 'package:muggles/helpers/data.dart';
import 'package:flutter/material.dart';

import 'theme.dart';

class ListButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, categories[index]['route']);
            },
            child: Container(
              width: 110,
              // padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
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
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Icon(
                        categories[index]['icon'],
                        size: 42,
                        color: Color(primaryColor),
                      ),
                    ),
                    Text(
                      categories[index]['name'],
                      style:
                          TextStyle(color: Color(primaryColor), fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
