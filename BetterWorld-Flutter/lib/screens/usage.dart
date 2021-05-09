import 'package:muggles/widgets/connectionStatusCard.dart';
import 'package:muggles/widgets/statusCard.dart';
import 'package:muggles/widgets/theme.dart';
import 'package:muggles/widgets/titleBar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'dart:math';
import 'drawer.dart';

class UsageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          DrawerScreen(
            boldIndex: 4,
          ),
          Usage(),
        ],
      ),
    );
  }
}

double xOffset = 0;
double yOffset = 0;
double scaleFactor = 1;
bool isDrawerOpen = false;
bool isCardFlipped = false;
double wattsconsumed = 40;

class Usage extends StatefulWidget {
  final List<Color> availableColors = [
    Colors.blue[100],
    Colors.blue[300]
    // Colors.deepPurple[100],
    // Colors.blueGrey[100],
    // Colors.grey[200]
  ];
  @override
  _UsageState createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  Color barBackgroundColor = Colors.white;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex;

  bool isPlaying = true;
  // final _auth = FirebaseAuth.instance;
  // // User loggedInUser;
  // void getCurrentUser() async {
  //   try {
  //     final user = _auth.currentUser;
  //     if (user != null) {
  //       loggedInUser = user;
  //       // print(loggedInUser.email);
  //       // print(loggedInUser.displayName);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  _animationStop() {
    setState(() {
      isPlaying = false;
      barBackgroundColor = Colors.lightBlue[100];
    });
  }

  animationTimer() {
    Timer(Duration(seconds: 2), _animationStop);
  }

  @override
  void initState() {
    super.initState();
    animationTimer();
    refreshState();
    // getCurrentUser();
  }

  dashboardSwitchHandler() {
    setState(() {
      if (isDrawerOpen) {
        xOffset = 0;
        scaleFactor = 1;
        yOffset = 0;
        isDrawerOpen = false;
      } else {
        xOffset = MediaQuery.of(context).size.width * 0.6;
        scaleFactor = 0.7;
        yOffset = MediaQuery.of(context).size.height * 0.15;
        isDrawerOpen = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      decoration: BoxDecoration(
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          color: Colors.white),
      duration: Duration(milliseconds: 250),
      child: GestureDetector(
        onHorizontalDragStart: (dragdetails) {
          dashboardSwitchHandler();
        },
        child: Material(
          color: Colors.white,
          elevation: 10,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
          child: Scaffold(
            appBar: TitleBar(
              dashboardSwitcher: dashboardSwitchHandler,
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Hero(
                      tag: 'status',
                      child: Material(
                          child: StatusCard(
                              subTextNormal: 'Power Usage : ',
                              subTextBold: 'Normal',
                              mainTextNormal: 'This Month : ',
                              mainTextBold: '89.3 kWh',
                              leadingIcon: Icons.show_chart)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ConnectionStatusCard(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 35, right: 35, top: 30, bottom: 20),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
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
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20.0, left: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Last 7 Days',
                                      style: TextStyle(
                                          color: Color(primaryColor),
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'in kWh',
                                      style: TextStyle(
                                          color: Color(secondaryColor),
                                          fontFamily: 'Poppins',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  tooltip: 'Refresh Stats',
                                  icon: Icon(
                                      isPlaying ? Icons.sync : Icons.refresh),
                                  color: Color(secondaryColor),
                                  iconSize: 30,
                                  onPressed: () {
                                    animationTimer();
                                    refreshState();
                                    setState(() {
                                      isPlaying = !isPlaying;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          BarChart(
                            isPlaying ? randomData() : mainBarData(),
                            swapAnimationDuration: animDuration,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

// BAR CHART

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = const Color(primaryColor),
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: [isTouched ? Color(secondaryColor) : barColor],
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 10,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 7, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5.4, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.90, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 6, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 8, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Color(secondaryColor),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
              }
              return BarTooltipItem(weekDay + '\n' + (rod.y - 1).toString(),
                  TextStyle(fontFamily: 'Poppins', color: Colors.white));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) {
            return TextStyle(
                color: Color(secondaryColor),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 15);
          },
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          // textStyle: TextStyle(
          //     color: Colors.white,
          //     fontFamily: 'Poppins',
          //     fontWeight: FontWeight.w600,
          //     fontSize: 14),
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              case 5:
                return 'S';
              case 6:
                return 'S';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                    Random().nextInt(widget.availableColors.length)]);
          default:
            return null;
        }
      }),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      refreshState();
    }
  }
}
